using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class home : System.Web.UI.Page
    {
        private Function func;

        public home()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckCookies();
                lblStudent.Text = func.IsExist("SELECT COUNT(Name) FROM Registration WHERE Type='Student'");
                lblTeacher.Text = func.IsExist("SELECT COUNT(Name) FROM Registration WHERE Type='Teacher'");
                lblApplication.Text = func.IsExist("SELECT COUNT(RegistrationId) FROM Application WHERE Status='A'");
                Load();
            }
        }
        private void Load()
        {
            func.LoadGrid(gridTeacher, $@"SELECT        Registration.RegistrationId, Registration.Name, Registration.Email, Registration.MobileNo,  Registration.Type, Registration.Picture, Registration.Designation,  Registration.Department,
                         Registration.FreeScheduleFrom, Registration.FreeScheduleTo, Registration.IdNo, Registration.Status, Registration.InTime
FROM            Registration  WHERE Registration.Type='{ddlType.SelectedItem.ToString()}' AND Registration.Status='W' ORDER BY Registration.RegistrationId ASC");
        }
        protected void ddlType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.Text == "Teacher")
            {
                Load();
            }
            else if (ddlType.Text == "Student")
            {
                func.LoadGrid(gridTeacher, $@"SELECT        Registration.RegistrationId, Registration.Name, Registration.Email, Registration.MobileNo,  Registration.Type, Registration.Picture, Registration.Designation,  Registration.Department,
                         Registration.FreeScheduleFrom, Registration.FreeScheduleTo, Registration.IdNo, Registration.Status, Registration.InTime
FROM            Registration WHERE Registration.Type='{ddlType.SelectedItem.ToString()}' AND Registration.Status='W' ORDER BY Registration.RegistrationId ASC");
            }
            else if (ddlType.Text == "Coordinator")
            {
                func.LoadGrid(gridTeacher, $@"SELECT        Registration.RegistrationId, Registration.Name, Registration.Email, Registration.MobileNo,  Registration.Type, Registration.Picture, Registration.Designation,  Registration.Department,
                         Registration.FreeScheduleFrom, Registration.FreeScheduleTo, Registration.IdNo, Registration.Status, '' AS Department, Registration.InTime
FROM            Registration WHERE Registration.Type='{ddlType.SelectedItem.ToString()}' AND Registration.Status='W' ORDER BY Registration.RegistrationId ASC");
            }
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
        public string Exist(string dept)
        {
            if (dept == "")
            {
                return "Not Required";
            }
            else
            {
                return dept;
            }
        }
        protected void lnkAccpet_OnClick(object sender, EventArgs e)
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

        protected void lnkReject_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField regId = (HiddenField)linkButton.Parent.FindControl("HiddenField1");
            Label lblEmail = (Label)linkButton.Parent.FindControl("lblEmail");
            bool a = func.Execute($@"DELETE FROM Registration WHERE RegistrationId='{regId.Value}'");
            if (a)
            {
                bool mail = func.SendEmail("pciuprojectthesis@gmail.com", lblEmail.Text, "Registration", @"<div style='padding: 10px 20px;text-align: center;border:1px solid gainsboro;'>
        <img src='http://www.portcity.edu.bd/img/Header%20Logo_PCIU-LOGO.png' alt='logo' style='width: 125px;height:125px;'>
        <h3>Hello,</h2>
        <p style='font-size: 18px;'>Your account has been rejected by admin.<br><br>Thank you.</p>
    </div>", "tom&jerry");
                if (mail)
                {
                    func.PopAlert(this, "Registration canceled successfully");
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Failed to approve");
                }
            }
            else
            {
                func.PopAlert(this, "Failed to cancel");
            }
        }

        protected void gridTeacher_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridTeacher.PageIndex = e.NewPageIndex;
            Load();
        }
    }
}