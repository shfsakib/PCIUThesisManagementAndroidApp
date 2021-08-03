using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class update_assign : System.Web.UI.Page
    {
        private Function func;

        public update_assign()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"]==null)
                {
                    Response.Redirect("/log-in.aspx");
                }
                func.BindDropDown(ddlTeacher, "Select Supervisor", $@"SELECT NAME+' | '+IdNo Name,RegistrationId Id FROM Registration WHERE Type='Teacher' ORDER BY Name ASC");
                func.BindDropDown(ddlStudent, "Select Student", $@"SELECT NAME+' | '+IdNo Name,RegistrationId Id FROM Registration WHERE Type='Student' ORDER BY Name ASC");
                Load();
            }
        }

        private void Load()
        {
            ddlStudent.SelectedValue =
                func.IsExist($@"SELECT StudentId From AssignSupervisor WHERE AssignId='{Request.QueryString["id"]}'");
            ddlTeacher.SelectedValue=
                func.IsExist($@"SELECT SupervisorId From AssignSupervisor WHERE AssignId='{Request.QueryString["id"]}'");

        }

        protected void btnUpdateAssign_OnClick(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            bool ans =
                func.Execute(
                    $@"UPDATE AssignSupervisor SET SupervisorId='{ddlTeacher.SelectedValue}',StudentId='{ddlStudent.SelectedValue}' WHERE AssignId='{id}'");
            if (ans)
            {
                func.AlertWithRedirect(this,"Updated successfully","/app/assign-supervisor.aspx");
            }
            else
            {
                func.PopAlert(this,"Failed to update");
            }
        }
    }
}