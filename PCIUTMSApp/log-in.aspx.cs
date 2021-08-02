using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp
{
    public partial class log_in : System.Web.UI.Page
    {
        private Function func;
        private HttpCookie cookie = Function.GetCookie();
        public log_in()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (cookie != null)
            {
                Response.Redirect("/app/home.aspx");
            }
            else
            {
                txtEmail.Focus();
            }

        }

        protected void btnLogin_OnServerClick(object sender, EventArgs e)
        {
            if (txtEmail.Value == "")
            {
                func.PopAlert(this, "Email is required");
            }
            else if (!func.EmailValidation(txtEmail.Value))
            {
                func.PopAlert(this, "Enter valid email");
            }
            else if (txtPass.Value == "")
            {
                func.PopAlert(this, "Password is required");
            }
            else
            {
                string password =
                    func.IsExist(
                        $"SELECT Password FROM Registration WHERE Email='{txtEmail.Value}' AND Password='{txtPass.Value}' AND Status='A' COLLATE Latin1_General_CS_AI");
                if (password == txtPass.Value.Trim())
                {
                    HttpCookie cookie = Function.CreateCookie();
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    HttpContext.Current.Response.Cookies.Add(cookie);
                    cookie["Name"] = func.IsExist($"SELECT Name FROM Registration WHERE Email='{txtEmail.Value}'");
                    cookie["Type"] = func.IsExist($"SELECT Type FROM Registration WHERE Email='{txtEmail.Value}'");
                    cookie["UserId"] =
                        func.IsExist($"SELECT RegistrationId FROM Registration WHERE Email='{txtEmail.Value}'");
                    cookie["Email"] = func.IsExist($"SELECT Email FROM Registration WHERE Email='{txtEmail.Value}'");
                    cookie["Picture"] = func.IsExist($"SELECT Picture FROM Registration WHERE Email='{txtEmail.Value}'");
                    cookie["Mobile"] = func.IsExist($"SELECT MobileNo FROM Registration WHERE Email='{txtEmail.Value}'");
                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);
                    if (cookie["Type"] != "")
                    {
                        Response.Redirect("/app/home.aspx");
                    }
                }
                else
                {
                    func.PopAlert(this, "Please enter valid email or password");
                }
            }
        }

        protected void lnkForgot_OnClick(object sender, EventArgs e)
        {
            if (txtEmail.Value == "")
            {
                func.PopAlert(this, "Type your email first, then click on forgot password");
            }
            else
            {
                string pass = func.IsExist($"SELECT Password FROM Registration WHERE Email='{txtEmail.Value}'");
                if (pass == "")
                {
                    func.PopAlert(this, "Email id does not exist");

                }
                else
                {
                    bool ans = func.SendEmail("pciuprojectthesis@gmail.com", txtEmail.Value, "Reset Passowrd", @"<div style='padding: 10px 20px;text-align: center;border:1px solid gainsboro;'>
        <img src='http://www.portcity.edu.bd/img/Header%20Logo_PCIU-LOGO.png' alt='logo' style='width: 125px;height:125px;'>
        <h3>Hello,</h2>
        <p style='font-size: 18px;'>Your password is " + pass + @".<br><br>Thank you.</p>
    </div>", "tom&jerry");
                    if (ans)
                    {
                        func.PopAlert(this, "Password has been sent to your email address.");
                    }
                }
            }
        }
    }
}