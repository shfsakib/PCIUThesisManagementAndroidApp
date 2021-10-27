using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class profile : System.Web.UI.Page
    {
        private Function func;

        public profile()
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
            
            ViewState["picture"] =
                  func.IsExist($@"SELECT Picture FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            profileImage.ImageUrl = ViewState["picture"].ToString();
            nameLabel.Text = txtName.Text =
                func.IsExist($@"SELECT Name FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            lblEmail.Text = txtEmail.Text =
                func.IsExist($@"SELECT Email FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            lblMobile.Text = txtMobile.Text =
                func.IsExist($@"SELECT MobileNo FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            if (func.TypeCookie() != "Coordinator")
            {
                lblDepartment.Text =
                     func.IsExist($@"SELECT Department FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
                
            }
            if (func.TypeCookie().ToString() == "Teacher")
            {
                lblDesignation.Text = txtDesignation.Text =
                 func.IsExist($@"SELECT Designation FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");

                lblGroupLink.Text = txtGroupLink.Text =
                func.IsExist($@"SELECT GroupLink FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
                lblSchedule.Text =
                func.IsExist($@"SELECT FreeScheduleFrom FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'") + " - " +
                func.IsExist($@"SELECT FreeScheduleTo FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
                txtTimeFrom.Text =
                 func.IsExist($@"SELECT FreeScheduleFrom FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
                txtTimeTo.Text =
                 func.IsExist($@"SELECT FreeScheduleTo FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");

            }
            if (func.TypeCookie() == "Student")
            {
                lblProgram.Text = ddlProgram.SelectedValue =
                             func.IsExist($@"SELECT Program FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            }
            lblIdNo.Text = txtId.Text =
                             func.IsExist($@"SELECT IdNo FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            txtPass.Text =
                             func.IsExist($@"SELECT Password FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");

        }
        protected void btnEdit_OnServerClick(object sender, EventArgs e)
        {
            if (func.TypeCookie() == "Coordinator")
            {
                VisibleCo(false, true);
            }
            else if (func.TypeCookie() == "Teacher")
            {
                VisibleTeacher(false, true);
            }
            else
            {
                VisibleStudent(false, true);
            }
        }

        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            if (func.TypeCookie() == "Student")
            {
                bool ans = func.Execute($@"UPDATE Registration SET Name='{txtName.Text}',Email='{txtEmail.Text}',MobileNo='{txtMobile.Text}',Picture='{ViewState["picture"]}',IdNo='{txtId.Text}',Password='{txtPass.Text}',Program='{ddlProgram.SelectedValue}' WHERE RegistrationId='{func.UserIdCookie()}'");
                if (ans)
                {
                    func.Logout();
                }
                else
                {
                    func.PopAlert(this, "failed to update");
                }
            }
            else if (func.TypeCookie() == "Teacher")
            {
                bool ans = func.Execute($@"UPDATE Registration SET Name='{txtName.Text}',Email='{txtEmail.Text}',MobileNo='{txtMobile.Text}',Picture='{ViewState["picture"]}',Designation='{txtDesignation.Text}',FreeScheduleFrom='{txtTimeFrom.Text}',FreeScheduleTo='{txtTimeTo.Text}',IdNo='{txtId.Text}',Password='{txtPass.Text}',GroupLink='{txtGroupLink.Text}',Program='{ddlProgram.SelectedValue}' WHERE RegistrationId='{func.UserIdCookie()}'");
                if (ans)
                {
                    func.Logout();
                }
                else
                {
                    func.PopAlert(this, "failed to update");
                }
            }
            else
            {
                bool ans = func.Execute($@"UPDATE Registration SET Name='{txtName.Text}',Email='{txtEmail.Text}',MobileNo='{txtMobile.Text}',Picture='{ViewState["picture"]}',IdNo='{txtId.Text}',Password='{txtPass.Text}' WHERE RegistrationId='{func.UserIdCookie()}'");
                if (ans)
                {
                    func.Logout();
                }
                else
                {
                    func.PopAlert(this, "failed to update");
                }
            }
        }

        private new void VisibleCo(bool label, bool tools)
        {
            nameLabel.Visible = lblMobile.Visible = lblEmail.Visible = lblIdNo.Visible = lblPass.Visible = btnEdit.Visible = label;
            fileProfile.Visible = txtName.Visible = txtEmail.Visible = txtMobile.Visible = txtId.Visible = txtPass.Visible = lnkUpdate.Visible = tools;
        }
        private new void VisibleTeacher(bool label, bool tools)
        {
            nameLabel.Visible = lblMobile.Visible = lblIdNo.Visible = lblEmail.Visible = lblPass.Visible = btnEdit.Visible =  lblDesignation.Visible = lblGroupLink.Visible = lblSchedule.Visible = label;
            fileProfile.Visible = txtName.Visible = txtEmail.Visible = txtMobile.Visible = txtId.Visible = txtPass.Visible = lnkUpdate.Visible =  txtDesignation.Visible = txtGroupLink.Visible = txtTimeFrom.Visible = txtTimeTo.Visible = tools;
        }
        private new void VisibleStudent(bool label, bool tools)
        {
            nameLabel.Visible = lblMobile.Visible = lblEmail.Visible = lblIdNo.Visible = lblPass.Visible = btnEdit.Visible =  lblProgram.Visible = label;
            fileProfile.Visible = txtName.Visible = txtEmail.Visible = txtMobile.Visible = txtId.Visible = txtPass.Visible = lnkUpdate.Visible = ddlProgram.Visible = tools;
        }
    }
}