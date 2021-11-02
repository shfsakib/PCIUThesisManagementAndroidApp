
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class assign_examiner : System.Web.UI.Page
    {
        private Function func;

        public assign_examiner()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.BindDropDown(ddlTeacher, "Select Examiner", $@"SELECT NAME+' | '+IdNo Name,RegistrationId Id FROM Registration WHERE Type='Teacher' ORDER BY Name ASC");
                func.BindDropDown(ddlStudent, "Select Student", $@"SELECT        Application.RegistrationId ID, Registration.Name +' | '+ Registration.Email NAME
FROM            Application INNER JOIN
                         Registration ON Application.RegistrationId = Registration.RegistrationId WHERE Application.Status='A' AND  Registration.Type='Student' ORDER BY Name ASC");
                func.BindDropDown(ddlSearch, "Search By Student", $@"SELECT NAME+' | '+IdNo Name,RegistrationId Id FROM Registration WHERE Type='Student' ORDER BY Name ASC");
                Load();
            }
        }

        private void Load()
        {
            func.LoadGrid(gridAssign, $@"SELECT        AssignExaminer.AssignId, AssignExaminer.ExaminerId, AssignExaminer.RegistrationId, AssignExaminer.Status, AssignExaminer.AssignTime, Registration.Name AS ExaminerName, Registration.IdNo AS ExmnrId, 
                         Registration_1.Name AS StudentName, Registration_1.IdNo AS StuId
FROM            AssignExaminer INNER JOIN
                         Registration ON AssignExaminer.ExaminerId = Registration.RegistrationId INNER JOIN
                         Registration AS Registration_1 ON AssignExaminer.RegistrationId = Registration_1.RegistrationId ORDER BY AssignExaminer.AssignTime DESC");
        }
        private bool IsStudentExist(string RegistrationId)
        {
            bool ans = false;
            string x = func.IsExist($@"SELECT RegistrationId From AssignExaminer WHERE RegistrationId='{RegistrationId}'");
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
                func.PopAlert(this, "Please choose an Examiner first");
            }
            else if (ddlStudent.SelectedIndex <= 0)
            {
                func.PopAlert(this, "Please choose an student first");
            }
            else if (IsStudentExist(ddlStudent.SelectedValue))
            {
                func.PopAlert(this, "This student already assign to this Examiner");
            }
            else
            {
                bool ans =
                    func.Execute(
                        $@"INSERT INTO AssignExaminer(ExaminerId,RegistrationId,Status,AssignTime) VALUES('{ddlTeacher.SelectedValue}','{ddlStudent.SelectedValue}','A','{func.Date()}')");
                if (ans)
                {
                    func.PopAlert(this, "Examiner assigned successfully");
                    ddlStudent.SelectedIndex = ddlTeacher.SelectedIndex = -1;
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Failed to assign Examiner");
                }
            }
        }

        protected void ddlSearch_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSearch.SelectedIndex != -1)
            {
                func.LoadGrid(gridAssign, $@"SELECT        AssignExaminer.AssignId, AssignExaminer.ExaminerId, AssignExaminer.RegistrationId, AssignExaminer.Status, AssignExaminer.AssignTime, Registration.Name AS ExaminerName, Registration.IdNo AS ExmnrId, 
                         Registration_1.Name AS StudentName, Registration_1.IdNo AS StuId
FROM            AssignExaminer INNER JOIN
                         Registration ON AssignExaminer.ExaminerId = Registration.RegistrationId INNER JOIN
                         Registration AS Registration_1 ON AssignExaminer.RegistrationId = Registration_1.RegistrationId  WHERE AssignExaminer.RegistrationId='{ddlSearch.SelectedValue}' ORDER BY AssignExaminer.AssignTime DESC");

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

        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            HiddenField assignId = (HiddenField)lnk.Parent.FindControl("HiddenField1");
            Response.Redirect("/app/update-examiner.aspx?id=" + assignId.Value);
        }

        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            HiddenField assignId = (HiddenField)lnk.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"DELETE FROM AssignExaminer WHERE AssignId='{assignId.Value}'");
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
    }
}