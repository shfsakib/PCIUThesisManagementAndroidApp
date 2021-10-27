using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class assigned_student_list : System.Web.UI.Page
    {
        private Function func;

        public assigned_student_list()
        {
            func=Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.BindDropDown(ddlStudent, "Select Student", $@"SELECT  AssignSupervisor.RegistrationId Id,  Registration.Name +' | '+ Registration.Email NAME
FROM            AssignSupervisor INNER JOIN
                         Registration ON AssignSupervisor.RegistrationId = Registration.RegistrationId WHERE Registration.Type='Student' AND AssignSupervisor.SupervisorId='{func.UserIdCookie()}' ORDER BY AssignSupervisor.RegistrationId DESC");
                Load();
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
        private new void Load()
        {
            func.LoadGrid(gridAssign, $@"SELECT        AssignSupervisor.AssignId, AssignSupervisor.SupervisorId, AssignSupervisor.RegistrationId, AssignSupervisor.Status, AssignSupervisor.AssignTime, Registration.Name AS StudentName, Registration.Email, Registration.MobileNo, 
                         Registration.IdNo AS StuId,Registration.Picture
FROM            AssignSupervisor INNER JOIN
                         Registration ON AssignSupervisor.RegistrationId = Registration.RegistrationId WHERE AssignSupervisor.SupervisorId='{func.UserIdCookie()}' ORDER BY Registration.IdNo DESC");
        }
        protected void ddlStudent_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStudent.SelectedIndex<-0)
            {
                func.LoadGrid(gridAssign, $@"SELECT        AssignSupervisor.AssignId, AssignSupervisor.SupervisorId, AssignSupervisor.RegistrationId, AssignSupervisor.Status, AssignSupervisor.AssignTime, Registration.Name AS StudentName, Registration.Email, Registration.MobileNo, 
                         Registration.IdNo AS RegistrationId
FROM            AssignSupervisor INNER JOIN
                         Registration ON AssignSupervisor.RegistrationId = Registration.RegistrationId WHERE AssignSupervisor.SupervisorId='{func.UserIdCookie()}' AND AssignSupervisor.RegistrationId='{ddlStudent.SelectedValue}' ORDER BY Registration.IdNo DESC");
            }
            else
            {
                Load();
            } 
        }

        protected void gridAssign_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridAssign.PageIndex = e.NewPageIndex;
            Load();
        }
    }
}