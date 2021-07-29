using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class department_list : System.Web.UI.Page
    {
        private Function func;

        public department_list()
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
            func.LoadGrid(gridDepartment, @"SELECT * FROM DepartmentInfo ORDER BY DepartmentName ASC");
        }
        private bool IsDapartmentExist(string department)
        {
            bool a = false;
            string x = func.IsExist($"SELECT DepartmentName FROM DepartmentInfo WHERE DepartmentName='{department}'");
            if (x != "")
            {
                a = true;
            }
            return a;
        }
        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (txtDepartmentName.Text == "")
            {
                func.PopAlert(this, "Department name is required");
            }
            else if (IsDapartmentExist(txtDepartmentName.Text))
            {
                func.PopAlert(this, "Department name already exist");

            }
            else
            {
                bool ans =
                    func.Execute($@"INSERT INTO DepartmentInfo(DepartmentName,InTime) VALUES('{txtDepartmentName.Text}','{func.Date()}')");
                if (ans)
                {
                    func.PopAlert(this, "Department saved successfully");
                    txtDepartmentName.Text = "";
                    Load();
                }
                else
                {
                    func.PopAlert(this, "Department save failed");
                }
            }
        }

        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField deptId = (HiddenField)linkButton.Parent.FindControl("HiddenField1");
            Response.Redirect("/app/update-department.aspx?DId=" + deptId.Value);
        }

        protected void gridDepartment_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDepartment.PageIndex = e.NewPageIndex;
            Load();
        }
    }
}