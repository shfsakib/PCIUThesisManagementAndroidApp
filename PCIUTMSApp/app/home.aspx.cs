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
            func=Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblStudent.Text = func.IsExist("SELECT COUNT(Name) FROM Registration WHERE Type='Student'");
                lblTeacher.Text = func.IsExist("SELECT COUNT(Name) FROM Registration WHERE Type='Teacher'");
            }
        }
    }
}