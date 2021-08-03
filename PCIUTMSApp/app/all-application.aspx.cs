using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class all_application : System.Web.UI.Page
    {
        private Function func;

        public all_application()
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
            func.LoadGrid(gridApplication, $@"SELECT        Application.ApplicationId, Application.Program, Application.Type, Application.Status, Application.StudentId, Application.ApplicationText, Application.ApplicationTime, Registration.Name, Registration.IdNo
FROM            Application INNER JOIN
                         Registration ON Application.StudentId = Registration.RegistrationId WHERE Application.Status='{ddlStatus.SelectedValue}' AND Application.Program='{ddlProgram.SelectedValue}' AND Application.Type='{ddlType.SelectedValue}' ORDER BY ApplicationId ASC");
            func.BindDropDown(ddlStudent, "Search Student", $@"SELECT    TOP 1000    Application.StudentId Id, Registration.Name +' | '+ Registration.IdNo NAME
FROM            Application INNER JOIN
                         Registration ON Application.StudentId = Registration.RegistrationId WHERE Application.Status='{ddlStatus.SelectedValue}' AND Application.Program='{ddlProgram.SelectedValue}' AND Application.Type='{ddlType.SelectedValue}' ORDER BY Id DESC");
        }
        protected void gridApplication_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridApplication.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void gridApplication_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lnActive_OnClick(object sender, EventArgs e)
        {
            LinkButton link = (LinkButton)sender;
            HiddenField applicationId = (HiddenField)link.Parent.FindControl("HiddenField1");
            content.InnerHtml = func.IsExist($@"SELECT ApplicationText FROM Application WHERE ApplicationId='{applicationId.Value}'");
            modalBg.Visible = true;
        }

        protected void lnkInactive_OnClick(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            HiddenField applicationId = (HiddenField)lnk.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"DELETE FROM Application WHERE ApplicationId='{applicationId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Application removed successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Failed to remove");
            }
        }

        protected void lnkClose_OnClick(object sender, EventArgs e)
        {
            modalBg.Visible = false;
        }

        protected void lnkAccept_OnClick(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            HiddenField applicationId = (HiddenField)lnk.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"UPDATE Application SET Status='A' WHERE ApplicationId='{applicationId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Application accepted successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Failed to accept");
            }
        }

        protected void ddlProgram_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProgram.SelectedItem.ToString() == "Bachelor")
            {
                ddlType.Visible = true;
                ddlTypeMsc.Visible = false;

            }
            else
            {
                ddlType.Visible = false;
                ddlTypeMsc.Visible = true;
            }
            Load();
        }

        protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Load();
        }

        protected void ddlType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Load();
        }

        protected void ddlStudent_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStudent.SelectedIndex != -1)
            {
                func.LoadGrid(gridApplication, $@"SELECT        Application.ApplicationId, Application.Program, Application.Type, Application.Status, Application.StudentId, Application.ApplicationText, Application.ApplicationTime, Registration.Name, Registration.IdNo
FROM            Application INNER JOIN
                         Registration ON Application.StudentId = Registration.RegistrationId WHERE Application.StudentId='{ddlStudent.SelectedValue}' AND Application.Status='{ddlStatus.SelectedValue}' AND Application.Program='{ddlProgram.SelectedValue}' AND Application.Type='{ddlType.SelectedValue}' ORDER BY ApplicationId ASC");
            }
            else
            {
                Load();
            }
        }
    }
}