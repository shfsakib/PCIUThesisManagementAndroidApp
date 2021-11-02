using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class examiner_profile : System.Web.UI.Page
    {
        private Function func;

        public examiner_profile()
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
            string ExaminerId =
                func.IsExist($@"SELECT ExaminerId From AssignExaminer WHERE RegistrationId='{func.UserIdCookie()}'");
            if (ExaminerId != "")
            {
                profileImage.ImageUrl =
                    func.IsExist($@"SELECT Picture FROM Registration WHERE RegistrationId='{ExaminerId}'");
                nameLabel.Text =
                    func.IsExist($@"SELECT Name FROM Registration WHERE RegistrationId='{ExaminerId}'");
                btnCall.HRef = "tel:" +
                               func.IsExist($@"SELECT MobileNo FROM Registration WHERE RegistrationId='{ExaminerId}'");
                btnMail.HRef = "mailto:" +
                               func.IsExist($@"SELECT Email FROM Registration WHERE RegistrationId='{ExaminerId}'");
                
            }
            else
            {
                func.AlertWithRedirect(this, "You are not assigned to any Examiner yet", "/log-in.aspx");
            }
        }
    }
}