using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class upload_final_report : System.Web.UI.Page
    {
        private Function func;

        public upload_final_report()
        {
            func=Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ExaminerId =
                    func.IsExist($@"SELECT ExaminerId From AssignExaminer WHERE RegistrationId='{func.UserIdCookie()}'");
                if (ExaminerId == "")
                {
                    Response.Redirect("/app/home.aspx");
                }

                Load();
            }
        }
        private void Load()
        {
            func.LoadGrid(gridReport, $@"SELECT        ReportId, RegistrationId, Topic, About, Attachment, UploadTime, Type
FROM            Report WHERE RegistrationId='{func.UserIdCookie()}' ORDER BY ReportId DESC");
        }
        protected void btnUpload_OnClick(object sender, EventArgs e)
        {
            if (txtTitle.Text == "")
            {
                func.PopAlert(this, "Title is required");
            }
            else if (txtDescription.Text == "")
            {
                func.PopAlert(this, "Description is required");
            }
            else
            {
                Random random = new Random();
                string ran = random.Next(1111, 999999).ToString();
                string path = "";
                if (fileAttach.HasFile)
                {
                    string ipath = Server.MapPath("/Attachment/") + ran + fileAttach.FileName;
                    fileAttach.PostedFile.SaveAs(ipath);
                    path = "/Attachment/" + ran + fileAttach.FileName;
                }

                bool ans = func.Execute(
                    $@"INSERT INTO Report(RegistrationId,Topic,About,Attachment,UploadTime,Type) VALUES('{func.UserIdCookie()}','{txtTitle.Text}','{txtDescription.Text}','{path}','{func.Date()}','{ddlType.SelectedValue}')");
                if (ans)
                {

                    func.PopAlert(this, "Report uploaded successfully");
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Failed to upload");
                }
            }
        }
        public string Path(string path)
        {
            if (path == "No Attachment Added")
            {
                return path;
            }
            else
            {
                return "Attachment";
            }
        }
        protected void gridReport_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gridReport.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            
        }
    }
}