using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class update_department : System.Web.UI.Page
    {
        private Function func;

        public update_department()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["DId"] == null)
                {
                    Response.Redirect("/app/department-list.aspx");
                }
                Load();
            }
        }
        private void Load()
        {
            txtDepartmentName.Text =
                func.IsExist(
                    $@"SELECT DepartmentName from DepartmentInfo Where DepartmentId='{Request.QueryString["DId"]}'");
        }
        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            if (txtDepartmentName.Text == "")
            {
                func.PopAlert(this, "Department name is required");
            }
            else
            {
                bool ans =
                    func.Execute(
                        $@"UPDATE DepartmentInfo SET DepartmentName='{txtDepartmentName.Text}' WHERE DepartmentId='{
                            Request.QueryString["DId"]}'");
                if (ans)
                {
                    txtDepartmentName.Text = "";
                    func.AlertWithRedirect(this,"Department updated successfully","/app/department-list.aspx");
                }
                else
                {
                    func.PopAlert(this, "Department updation failed");
                }
            }
        }
    }
}