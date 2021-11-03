using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCIUTMSApp.app
{
    public partial class notice_info : System.Web.UI.Page
    {
        private Function func;
        public notice_info()
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
        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            if (txtTitle.Text == "")
            {
                func.PopAlert(this, "Title is required");
            }
            else if (txtDescription.Text == "")
            {
                func.PopAlert(this, "Description is required");
            } 
            else
            {
                Random random = new Random();
                string ran = random.Next(1111, 999999).ToString();
                string path = "";
                if (fileAttach.HasFile)
                {
                    string imagePath = Server.MapPath("/Attachment/") + ran + fileAttach.FileName;
                    fileAttach.PostedFile.SaveAs(imagePath);
                    path = "/Attachment/" + ran + fileAttach.FileName;
                }

                bool ans = func.Execute(
                    $@"INSERT INTO Notice(Title,Description,NoticeTime,RegistrationId,Path) VALUES('{txtTitle.Text}','{txtDescription.Text}','{func.Date()}','{func.UserIdCookie()}','{path}')"); 
                if (ans)
                {
                    
                        func.PopAlert(this, "Notice added successfully");
                        Load(); 
                }
                else
                {
                    func.PopAlert(this, "Failed to add notice");
                }
            }
        }

        protected void gridNotice_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridNotice.PageIndex = e.NewPageIndex;
            Load();
        }
        
        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField noticeId = (HiddenField)linkButton.Parent.FindControl("noticeId");
            bool ans = func.Execute($"DELETE FROM Notice WHERE noticeId='{noticeId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Notice removed successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Failed to remove");
            }
        }
    }
}