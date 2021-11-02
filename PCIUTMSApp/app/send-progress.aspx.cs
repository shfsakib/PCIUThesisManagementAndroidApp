
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class send_progress : System.Web.UI.Page
    {
        private Function func; 
        public send_progress()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 ViewState["supervisorId"] =
                      func.IsExist($@"SELECT SupervisorId From AssignSupervisor WHERE RegistrationId='{func.UserIdCookie()}'");
                if (ViewState["supervisorId"].ToString() == "")
                {
                    func.AlertWithRedirect(this, "You are not assigned to any supervisor yet", "/log-in.aspx");
                }

                Load();
            }

        }

        private void Load()
        {
            func.LoadGrid(gridReport,$@"SELECT * FROM Resource WHERE RegistrationId='{func.UserIdCookie()}' ORDER BY ResourceId DESC");
        }
        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            if (txtTitle.Text == "")
            {
                func.PopAlert(this, "Title is required");
            }
            else if (txtDescription.Text == "")
            {
                func.PopAlert(this, "Description is required");
            }
            else if (!fileAttach.HasFile)
            {
                func.PopAlert(this, "Attachment is required");
            }
            else
            {
                Random random = new Random();
                string ran = random.Next(1111, 999999).ToString();
                string path = "";
                if (fileAttach.HasFile)
                {
                    string imagePath = Server.MapPath("/Attachment/") + ran + fileAttach.FileName;
                    fileAttach.PostedFile.SaveAs(imagePath);
                    path = "/Attachment/" + ran + fileAttach.FileName;
                }

                bool ans = func.Execute(
                    $@"INSERT INTO Resource(Title,Path,Description,SendTime,RegistrationId,SupervisorId) VALUES('{txtTitle.Text}','{path}','{txtDescription.Text}','{func.Date()}','{func.UserIdCookie()}','{ViewState["supervisorId"].ToString()}')");
                if (ans)
                {
                    string email =
                        func.IsExist($@"SELECT Email From Registration WHERE RegistrationId='{ViewState["supervisorId"].ToString()}'");

                    bool result = func.SendEmail("pciuprojectthesis@gmail.com", email, "Progress Report", @"<div style='padding: 10px 20px;text-align: center;border:1px solid gainsboro;'>
        <img src='http://www.portcity.edu.bd/img/Header%20Logo_PCIU-LOGO.png' alt='logo' style='width: 125px;height:125px;'>
        <h3>Hello Teacher,</h2>
        <p style='font-size: 18px;'>You have a progress report from your student. Please check it.<br><br>Thank you.</p>
    </div>", "tom&jerry");
                    if (result)
                    {
                        func.PopAlert(this, "Report sent successfully");
                        Load();
                    }
                }
                else
                {
                    func.PopAlert(this, "Failed to send report");
                }
            }
        }

        protected void gridReport_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridReport.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton) sender;
            HiddenField resourceId = (HiddenField) linkButton.Parent.FindControl("resourceId");
            bool ans = func.Execute($"DELETE FROM Resource WHERE resourceId='{resourceId.Value}'");
            if (ans)
            {
                func.PopAlert(this,"Resource removed successfully");
                Load();
            }
            else
            {
                func.PopAlert(this,"Failed to remove");
            }
        }
    }
}