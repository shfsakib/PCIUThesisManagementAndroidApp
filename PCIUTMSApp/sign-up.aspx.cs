using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp
{
    public partial class sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_OnServerClick(object sender, EventArgs e)
        {

        }

        protected void ddlType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.Text == "Teacher")
            {
                teacherPanel.Visible = true;
                studentPanel.Visible = false;
                coordinatePanel.Visible = false;
                ddlDepartment.Focus();
            }
            else if (ddlType.Text == "Student")
            {
                teacherPanel.Visible = false;
                studentPanel.Visible = true;
                coordinatePanel.Visible = false;
                ddlStudentDepartment.Focus();

            }
            else if (ddlType.Text == "Coordinator")
            {
                teacherPanel.Visible = false;
                studentPanel.Visible = false;
                coordinatePanel.Visible = true;
                txtCOId.Focus();
            }
            else
            {
                teacherPanel.Visible = false;
                studentPanel.Visible = false;
                coordinatePanel.Visible = false;
            }
        }
    }
}