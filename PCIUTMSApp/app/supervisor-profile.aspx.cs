using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class supervisor_profile : System.Web.UI.Page
    {
        private Function func;

        public supervisor_profile()
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
            string supervisorId =
                func.IsExist($@"SELECT SupervisorId From AssignSupervisor WHERE RegistrationId='{func.UserIdCookie()}'");
            if (supervisorId != "")
            {
                profileImage.ImageUrl =
                      func.IsExist($@"SELECT Picture FROM Registration WHERE RegistrationId='{supervisorId}'");
                nameLabel.Text =
                  func.IsExist($@"SELECT Name FROM Registration WHERE RegistrationId='{supervisorId}'");
                btnCall.HRef = "tel:" +
                  func.IsExist($@"SELECT MobileNo FROM Registration WHERE RegistrationId='{supervisorId}'");
                btnMail.HRef = "mailto:" +
                  func.IsExist($@"SELECT Email FROM Registration WHERE RegistrationId='{supervisorId}'");
                btnGroup.HRef = func.IsExist($@"SELECT GroupLink FROM Registration WHERE RegistrationId='{supervisorId}'");

            }
            else
            {
                func.AlertWithRedirect(this,"You are not assigned to any supervisor yet","/log-in.aspx");
            }
        }
    }
}