using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class teacher_list : System.Web.UI.Page
    {
        private Function func;

        public teacher_list()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load();
            }
        }
        private void Load()
        {
            func.LoadGrid(gridTeacher, $@"SELECT        Registration.RegistrationId, Registration.Name, Registration.Email, Registration.MobileNo,  Registration.Type, Registration.Picture, Registration.Designation, Registration.Department,
                         Registration.FreeScheduleFrom, Registration.FreeScheduleTo, Registration.IdNo, Registration.Status, Registration.InTime
FROM            Registration  WHERE Registration.Type='Teacher' AND Registration.Status='{ddlType.SelectedValue}' ORDER BY Registration.RegistrationId ASC");
            func.BindDropDown(ddlTeacher, "Search teacher", $@"SELECT Name,RegistrationId Id FROM Registration WHERE Status='{ddlType.SelectedValue}' AND Type='Teacher' ORDER BY Name ASC");

        }
        protected void gridTeacher_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridTeacher.PageIndex = e.NewPageIndex;
            Load();
        }

        public string Image(string img)
        {
            if (img == "")
            {
                return "/Link/user.png";
            }
            else
            {
                return img;
            }
        }

        protected void ddlType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Load();
        }

        protected void gridTeacher_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkAccept = (LinkButton)e.Row.FindControl("lnActive");
                LinkButton lnkInactive = (LinkButton)e.Row.FindControl("lnkInactive");
                if (ddlType.SelectedValue == "A")
                {
                    lnkAccept.Visible = false;
                    lnkInactive.Visible = true;
                }
                else
                {
                    lnkAccept.Visible = true;
                    lnkInactive.Visible = false;
                }
            }
        }

        protected void lnActive_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField regId = (HiddenField)linkButton.Parent.FindControl("HiddenField1");
            Label lblEmail = (Label)linkButton.Parent.FindControl("lblEmail");
            bool a = func.Execute($@"UPDATE Registration SET Status='A' WHERE RegistrationId='{regId.Value}'");
            if (a)
            {
                bool mail = func.SendEmail("pciuprojectthesis@gmail.com", lblEmail.Text, "Registration", @"<div style='padding: 10px 20px;text-align: center;border:1px solid gainsboro;'>
        <img src='http://www.portcity.edu.bd/img/Header%20Logo_PCIU-LOGO.png' alt='logo' style='width: 125px;height:125px;'>
        <h3>Hello,</h2>
        <p style='font-size: 18px;'>Your account has been approved by admin.<br><br>Thank you.</p>
    </div>", "tom&jerry");
                if (mail)
                {
                    func.PopAlert(this, "Registration approved successfully");
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Failed to approve");
                }
            }
            else
            {
                func.PopAlert(this, "Failed to approve");
            }
        }

        protected void lnkInactive_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField regId = (HiddenField)linkButton.Parent.FindControl("HiddenField1");
            Label lblEmail = (Label)linkButton.Parent.FindControl("lblEmail");
            bool a = func.Execute($@"UPDATE Registration SET Status='I' WHERE RegistrationId='{regId.Value}'");
            if (a)
            {
                bool mail = func.SendEmail("pciuprojectthesis@gmail.com", lblEmail.Text, "Registration", @"<div style='padding: 10px 20px;text-align: center;border:1px solid gainsboro;'>
        <img src='http://www.portcity.edu.bd/img/Header%20Logo_PCIU-LOGO.png' alt='logo' style='width: 125px;height:125px;'>
        <h3>Hello,</h2>
        <p style='font-size: 18px;'>Your account has been approved by admin.<br><br>Thank you.</p>
    </div>", "tom&jerry");
                if (mail)
                {
                    func.PopAlert(this, "Registration inactivate successfully");
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Failed to inactivate");
                }
            }
            else
            {
                func.PopAlert(this, "Failed to inactivate");
            }
        }

        protected void ddlTeacher_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTeacher.SelectedIndex!=-1)
            {
                func.LoadGrid(gridTeacher, $@"SELECT        Registration.RegistrationId, Registration.Name, Registration.Email, Registration.MobileNo,  Registration.Type, Registration.Picture, Registration.Designation, 
                         Registration.FreeScheduleFrom, Registration.FreeScheduleTo, Registration.IdNo, Registration.Status, Registration.InTime
FROM            Registration INNER JOIN
                         DepartmentInfo ON Registration.DepartmentId = DepartmentInfo.DepartmentId WHERE Registration.Type='Teacher' AND Registration.Status='{ddlType.SelectedValue}' AND registration.registrationid='{ddlTeacher.SelectedValue}' ORDER BY Registration.RegistrationId ASC");

            }
            else
            {
                Load();
            }
        }
    }
}