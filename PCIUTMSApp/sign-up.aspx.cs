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
        private Function func;

        public sign_up()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtName.Focus();
                LoadDropdown();
            }
        }
        private void LoadDropdown()
        {
            func.BindDropDown(ddlDepartment, "Select", $"SELECT DepartmentId Id,DepartmentName Name FROM DepartmentInfo ORDER BY DepartmentName ASC");
            func.BindDropDown(ddlStudentDepartment, "Select", $"SELECT DepartmentId Id,DepartmentName Name FROM DepartmentInfo ORDER BY DepartmentName ASC");

        }
        private bool IsEmail(string email)
        {
            bool a = false;
            string x = func.IsExist($"SELECT Email FROM Registration WHERE Email='{email}'");
            if (x != "")
            {
                a = true;
            }
            return a;
        }
        private bool IsNumber(string number)
        {
            bool a = false;
            string x = func.IsExist($"SELECT MobileNo FROM Registration WHERE MobileNo='{number}'");
            if (x != "")
            {
                a = true;
            }
            return a;
        }
        private bool IsId(string id)
        {
            bool a = false;
            string x = func.IsExist($"SELECT IdNo FROM Registration WHERE IdNo='{id}'");
            if (x != "")
            {
                a = true;
            }
            return a;
        }
        protected void btnSave_OnServerClick(object sender, EventArgs e)
        {
            bool a = false;
            if (txtName.Text == "")
            {
                func.PopAlert(this, "Name is required");
            }
            else if (txtEmail.Text == "")
            {
                func.PopAlert(this, "Email is required");
            }
            else if (txtMobile.Text == "")
            {
                func.PopAlert(this, "Mobile no is required");
            }

            else if (ddlType.Text == "Select")
            {
                func.PopAlert(this, "Type is required");
            }
            else if (txtPass.Text == "")
            {
                func.PopAlert(this, "Password is required");
            }
            else if (IsEmail(txtEmail.Text))
            {
                func.PopAlert(this, "Email id already exist");

            }
            else if (IsNumber(txtMobile.Text))
            {
                func.PopAlert(this, "Mobile no already exist");
            }
            else
            {
                ViewState["RegId"] = func.GenerateId("Select Max(RegistrationId) FROM Registration");
                string pic = "";
                if (filePic.HasFile)
                {
                    string imagePath = Server.MapPath("/photos/") + ViewState["RegId"].ToString() + ".png";
                    filePic.PostedFile.SaveAs(imagePath);
                    pic = "/photos/" + ViewState["RegId"].ToString() + ".png";
                }

                if (ddlType.Text == "Teacher")
                {
                    if (ddlDepartment.SelectedIndex == -1)
                    {
                        func.PopAlert(this, "Department is required");
                    }
                    else if (IsId(txtTeacherId.Text))
                    {
                        func.PopAlert(this, "Teacher id is required");

                    }
                    a = func.Execute(
                        $@"INSERT INTO Registration(RegistrationId,Name,Email,MobileNo,Type,Picture,DepartmentId,Designation,FreeScheduleFrom,FreeScheduleTo,IdNo,Password,Status,InTime,GroupLink) VALUES('{ViewState["RegId"]}','{txtName.Text}','{txtEmail.Text}','{txtMobile.Text}','{ddlType.SelectedItem.ToString()}','{pic}','{ddlDepartment.SelectedValue}','{txtDesignation.Text}','{txtTimeFrom.Text}','{txtTimeTo.Text}','{txtTeacherId.Text}','{txtPass.Text}','W','{func.Date()}','')");
                    if (a)
                    {
                        func.AlertWithRedirect(this, "Registered successfully, Please wait for account approval by admin","/log-in.aspx");
                       
                        Refresh();
                    }
                    else
                    {
                        func.PopAlert(this, "Registration failed");
                    }
                }
                else if (ddlType.Text == "Student")
                {
                    if (ddlStudentDepartment.SelectedIndex == -1)
                    {
                        func.PopAlert(this, "Department is required");
                    }
                    else if (IsId(txtStdntId.Text))
                    {
                        func.PopAlert(this, "Student id is required");
                    }
                    a = func.Execute(
                        $@"INSERT INTO Registration(RegistrationId,Name,Email,MobileNo,Type,Picture,DepartmentId,Designation,FreeScheduleFrom,FreeScheduleTo,IdNo,Password,Status,InTime,GroupLink) VALUES('{ViewState["RegId"]}','{txtName.Text}','{txtEmail.Text}','{txtMobile.Text}','{ddlType.SelectedItem.ToString()}','{pic}','{ddlStudentDepartment.SelectedValue}','','','','{txtStdntId.Text}','{txtPass.Text}','W','{func.Date()}','')");
                    if (a)
                    {
                        func.AlertWithRedirect(this, "Registered successfully, Please wait for account approval by admin", "/log-in.aspx");
                        Refresh();
                    }
                    else
                    {
                        func.PopAlert(this, "Registration failed");
                    }
                }
                else if (ddlType.Text == "Coordinator")
                {
                    if (IsId(txtCOId.Text))
                    {
                        func.PopAlert(this, "Coordinator id is required");
                    }
                    a = func.Execute(
                        $@"INSERT INTO Registration(RegistrationId,Name,Email,MobileNo,Type,Picture,DepartmentId,Designation,FreeScheduleFrom,FreeScheduleTo,IdNo,Password,Status,InTime,GroupLink) VALUES('{ViewState["RegId"]}','{txtName.Text}','{txtEmail.Text}','{txtMobile.Text}','{ddlType.SelectedItem.ToString()}','{pic}','','{txtDesignation.Text}','','','{txtCOId.Text}','{txtPass.Text}','W','{func.Date()}','')");
                    if (a)
                    {
                        func.AlertWithRedirect(this, "Registered successfully, Please wait for account approval by admin", "/log-in.aspx");
                        Refresh();
                    }
                    else
                    {
                        func.PopAlert(this, "Registration failed");
                    }
                }

            }
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
        private void Refresh()
        {
            txtName.Text =
                txtEmail.Text =
                    txtMobile.Text =

                                txtTeacherId.Text =
                                    txtDesignation.Text =
                                        txtTimeFrom.Text =
                                            txtTimeTo.Text = txtStdntId.Text = txtCOId.Text = txtCoDesignation.Text = "";
            ddlType.SelectedIndex =
                ddlDepartment.SelectedIndex = ddlStudentDepartment.SelectedIndex = -1;
        }
    }
}