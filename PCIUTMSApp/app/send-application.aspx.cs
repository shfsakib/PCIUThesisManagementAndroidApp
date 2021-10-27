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
        private Function func;

        public send_application()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblProgram.Text = func.IsExist($"SELECT Program FROM Registration WHERE RegistrationId='{func.UserIdCookie()}'");
            }
        }

        protected void lnkItalic_OnClick(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, Page.GetType(), "editor", "document.execCommand('italic',false,null);", true);
        }
        private bool IsSend(string program, string type)
        {
            bool ans = false;
            string x =
                func.IsExist(
                    $"SELECT Program FROM Application WHERE Program='{lblProgram.Text}' AND RegistrationId='{func.UserIdCookie()}' AND Type='{type}'");

            if (x != "")
            {
                ans = true;
            }
            return ans;
        }

        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            string type = "";
            if (lblProgram.Text == "Bachelor")
            {
                if (ddlType.SelectedIndex == -1)
                {
                    func.PopAlert(this, "Please choose an application type");
                }
                type = ddlType.Text;
            }
            if (lblProgram.Text == "Masters")
            {
                if (ddlTypeMSC.SelectedIndex == -1)
                {
                    func.PopAlert(this, "Please choose an application type");
                }
                type = ddlTypeMSC.Text;

            }
            else
            {
                if (IsSend(lblProgram.Text, type))
                {
                    func.PopAlert(this, "Application already sent for " + type);
                    return;

                }
                else
                {
                    bool ans =
                        func.Execute(
                            $@"INSERT INTO Application(Program,Type,Status,RegistrationId,ApplicationText,ApplicationTime) VALUES('{
                                lblProgram.Text}','{type}','I','{func.UserIdCookie()}','{editor1.InnerText}','{
                                func.Date()}')");
                    if (ans)
                    {
                        func.AlertWithRedirect(this, "Application sent successfully", "/app/home.aspx");
                        ddlType.SelectedIndex = ddlTypeMSC.SelectedIndex = -1;
                    }
                    else
                    {
                        func.PopAlert(this, "Failed to sent application");
                    }
                }
            }
        }
    }
}