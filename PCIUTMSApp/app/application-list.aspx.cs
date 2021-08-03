using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class application_list : System.Web.UI.Page
    {
        private Function func;

        public application_list()
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
            func.LoadGrid(gridApplication, $"SELECT * FROM APplication WHERE StudentId='{func.UserIdCookie()}'");
        }
        protected void gridCoordinate_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridApplication.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void gridCoordinate_OnRowDataBound(object sender, GridViewRowEventArgs e)
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
    }
}