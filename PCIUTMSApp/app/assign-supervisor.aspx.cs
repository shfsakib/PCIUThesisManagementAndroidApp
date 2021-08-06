using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class assign_supervisor : System.Web.UI.Page
    {
        private Function func;

        public assign_supervisor()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.BindDropDown(ddlTeacher, "Select Supervisor", $@"SELECT NAME+' | '+IdNo Name,RegistrationId Id FROM Registration WHERE Type='Teacher' ORDER BY Name ASC");
                func.BindDropDown(ddlStudent, "Select Student", $@"SELECT        Application.StudentId ID, Registration.Name +' | '+ Registration.Email NAME
FROM            Application INNER JOIN
                         Registration ON Application.StudentId = Registration.RegistrationId WHERE Application.Status='A' AND  Registration.Type='Student' ORDER BY Name ASC");
                func.BindDropDown(ddlSearch, "Search By Student", $@"SELECT NAME+' | '+IdNo Name,RegistrationId Id FROM Registration WHERE Type='Student' ORDER BY Name ASC");
                Load();
            }
        }

        private void Load()
        {
            func.LoadGrid(gridAssign, $@"SELECT        AssignSupervisor.AssignId, AssignSupervisor.SupervisorId, AssignSupervisor.StudentId, AssignSupervisor.Status, AssignSupervisor.AssignTime, Registration.Name AS SupervisorName, Registration.IdNo AS SupId, 
                         Registration_1.Name AS StudentName, Registration_1.IdNo AS StuId
FROM            AssignSupervisor INNER JOIN
                         Registration ON AssignSupervisor.SupervisorId = Registration.RegistrationId INNER JOIN
                         Registration AS Registration_1 ON AssignSupervisor.StudentId = Registration_1.RegistrationId ORDER BY AssignSupervisor.AssignTime DESC");
        }

        private bool IsStudentExist(string studentId)
        {
            bool ans = false;
            string x = func.IsExist($@"SELECT StudentId From AssignSupervisor WHERE StudentId='{studentId}'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        protected void btnAssign_OnClick(object sender, EventArgs e)
        {
            if (ddlTeacher.SelectedIndex <= 0)
            {
                func.PopAlert(this, "Please choose an supervisor first");
            }
            else if (ddlStudent.SelectedIndex <= 0)
            {
                func.PopAlert(this, "Please choose an student first");
            }
            else if (IsStudentExist(ddlStudent.SelectedValue))
            {
                func.PopAlert(this, "This student already assign to this supervisor");
            }
            else
            {
                bool ans =
                    func.Execute(
                        $@"INSERT INTO AssignSupervisor(SupervisorId,StudentId,Status,AssignTime) VALUES('{ddlTeacher.SelectedValue}','{ddlStudent.SelectedValue}','A','{func.Date()}')");
                if (ans)
                {
                    func.PopAlert(this, "Supervisor assigned successfully");
                    ddlStudent.SelectedIndex = ddlTeacher.SelectedIndex = -1;
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Failed to assign supervisor");
                }
            }
        }

        protected void gridAssign_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridAssign.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            HiddenField assignId = (HiddenField)lnk.Parent.FindControl("HiddenField1");
            Response.Redirect("/app/update-assign.aspx?id=" + assignId.Value);
        }

        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            HiddenField assignId = (HiddenField)lnk.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"DELETE FROM AssignSupervisor WHERE AssignId='{assignId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Assigned data removed successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Failed to remove");
            }
        }

        protected void ddlSearch_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSearch.SelectedIndex != -1)
            {
                func.LoadGrid(gridAssign, $@"SELECT        AssignSupervisor.AssignId, AssignSupervisor.SupervisorId, AssignSupervisor.StudentId, AssignSupervisor.Status, AssignSupervisor.AssignTime, Registration.Name AS SupervisorName, Registration.IdNo AS SupId, 
                         Registration_1.Name AS StudentName, Registration_1.IdNo AS StuId
FROM            AssignSupervisor INNER JOIN
                         Registration ON AssignSupervisor.SupervisorId = Registration.RegistrationId INNER JOIN
                         Registration AS Registration_1 ON AssignSupervisor.StudentId = Registration_1.RegistrationId WHERE AssignSupervisor.StudentId='{ddlSearch.SelectedValue}' ORDER BY AssignSupervisor.AssignTime DESC");

            }
            else
            {
                Load();
            }
        }
    }
}