
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class Notice : System.Web.UI.Page
    {
        private Function func;
        public Notice()
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
            func.LoadGrid(gridNotice, $@"SELECT        NoticeId, Title, Description, NoticeTime, RegistrationId,COALESCE(NULLIF(Path,''), 'No Attachment Added') Path
FROM            Notice ORDER BY NoticeId DESC");
        }
        protected void gridNotice_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridNotice.PageIndex = e.NewPageIndex;
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
    }
}