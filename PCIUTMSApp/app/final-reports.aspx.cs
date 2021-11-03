using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class final_reports : System.Web.UI.Page
    {
        private Function func;

        public final_reports()
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
            func.LoadGrid(gridReport, $@"SELECT        ReportId, RegistrationId, Topic, About, Attachment, UploadTime, Type
FROM            Report ORDER BY ReportId DESC");
        }
        protected void gridReport_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridReport.PageIndex = e.NewPageIndex;
            Load();
        }
        public string Path(string path)
        {
            if (path == "No Attachment Added")
            {
                return path;
            }
            else
            {
                return "Attachment";
            }
        }

        protected void ddlType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedIndex > 0)
            {
                func.LoadGrid(gridReport, $@"SELECT        ReportId, RegistrationId, Topic, About, Attachment, UploadTime, Type
FROM            Report WHERE Type='{ddlType.SelectedValue}' ORDER BY ReportId DESC");
            }
            else
            {
                Load();
            }
        }
    }
}