using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class student_progress_report : System.Web.UI.Page
    {
        private Function func;

        public student_progress_report()
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
            func.LoadGrid(gridReport, $@"SELECT        Resource.ResourceId, Resource.Title, Resource.Path, Resource.Description, Resource.SendTime, Resource.RegistrationId, Resource.SupervisorId, Registration.Name, Registration.Email, Registration.MobileNo, 
                         Registration.Picture,Registration.IdNo
FROM            Resource INNER JOIN
                         Registration ON Resource.RegistrationId = Registration.RegistrationId WHERE Resource.SupervisorId='{func.UserIdCookie()}' ORDER BY Resource.ResourceId DESC");
            func.BindDropDown(ddlStudent, "Select Student", $@"SELECT  AssignSupervisor.RegistrationId Id,  Registration.Name +' | '+ Registration.Email NAME
FROM            AssignSupervisor INNER JOIN
                         Registration ON AssignSupervisor.RegistrationId = Registration.RegistrationId WHERE Registration.Type='Student' AND AssignSupervisor.SupervisorId='{func.UserIdCookie()}' ORDER BY AssignSupervisor.RegistrationId DESC");

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

        protected void gridReport_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridReport.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void ddlStudent_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStudent.SelectedIndex > 0)
            {
                func.LoadGrid(gridReport, $@"SELECT        Resource.ResourceId, Resource.Title, Resource.Path, Resource.Description, Resource.SendTime, Resource.RegistrationId, Resource.SupervisorId, Registration.Name, Registration.Email, Registration.MobileNo, 
                         Registration.Picture,Registration.IdNo
FROM            Resource INNER JOIN
                         Registration ON Resource.RegistrationId = Registration.RegistrationId WHERE Resource.SupervisorId='{func.UserIdCookie()}' AND Resource.RegistrationId='{ddlStudent.SelectedValue}' ORDER BY Resource.ResourceId DESC");

            }
            else
            {
                Load();
            }
        }
    }
}