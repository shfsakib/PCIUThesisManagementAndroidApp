using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp
{
    public partial class root : System.Web.UI.MasterPage
    {
        private Function func;

        public root()
        {
            func=Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckCookies();
                func.CheckStatus("Registration", "RegistrationId");
            }
        }
        public string GetImage(string link)
        {
            if (link == "")
            {
                return "../Link/tpms.png";
            }
            else
            {
                return link;
            }
        }
        public string GetName(string link)
        {
            if (link == "")
            {
                return "Hello User";
            }
            else
            {
                return link;
            }
        }

        protected void lnkLogOut_OnClick(object sender, EventArgs e)
        {
            func.Logout();
        }
    }
}