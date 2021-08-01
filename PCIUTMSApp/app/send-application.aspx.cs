using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class send_application : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkItalic_OnClick(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this,Page.GetType(),"editor", "document.execCommand('italic',false,null);",true);
        }
    }
}