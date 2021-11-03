using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class teachers_info : System.Web.UI.Page
    {
        private Function func;

        public teachers_info()
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
FROM            Registration  WHERE Registration.Type='Teacher' AND Registration.Status='A' ORDER BY Registration.RegistrationId ASC");
           
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

        public string Time(string time)
        {
            if (time!="")
            {
                return Convert.ToDateTime(time).ToString("hh:mm tt");
            }
            else
            {
                return time;
            }
        }
    }
}