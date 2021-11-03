<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="upload-final-report.aspx.cs" Inherits="PCIUTMSApp.app.upload_final_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 card card-body">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Upload Final Report</h1>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                Project / Thesis Title:
        <asp:TextBox ID="txtTitle" placeholder="Project / Thesis Title" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-12">
                Description:
        <asp:TextBox ID="txtDescription" TextMode="MultiLine" Height="100px" placeholder="Description" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-12">
                Attachment:
               <asp:FileUpload ID="fileAttach" accept=".txt,.zip,.rar,.doc,.docx,.pdf,.xlsx,.xls,.ppt,.pptx" runat="server"></asp:FileUpload>
            </div>
            <div class="col-md-12">
                Type:
                <asp:DropDownList ID="ddlType" class="form-control"  runat="server">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem Value="Project">Project</asp:ListItem>
                    <asp:ListItem Value="Thesis">Thesis</asp:ListItem>
                </asp:DropDownList>
                </div>
            <div class="col-md-12 pt-2">
                &nbsp;
        <asp:Button ID="btnUpload" CssClass="btn btn-primary btn-block" OnClick="btnUpload_OnClick" runat="server" Text="Upload" />
            </div>
        </div>
        <div class="col-md-12 mt-4 table-responsive" style="padding-top: 20px; margin-top: 20px;">
            <asp:GridView ID="gridReport" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridReport_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Found" AllowPaging="True" PageSize="30" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:HiddenField ID="noticeId" Value='<%#Eval("ReportId") %>' runat="server" />
                            <h3>
                                <asp:Label ID="lblSNm" runat="server" Text='<%#Eval("Topic")%>'></asp:Label></h3>
                            <p><%#Eval("About")%></p>
                            <p>
                                Attachment: 
                                <a id="lblPath" runat="server" href='<%#Eval("Attachment")%>'><%#Path(Eval("Attachment").ToString())%></a>
                            </p>
                            <p>
                                Upload Time:
                                <asp:Label ID="lblTime" runat="server" Text='<%#Eval("UploadTime")%>'></asp:Label>
                            </p>
                            <p>
                                <asp:LinkButton ID="lnkRemove" class="btn btn-danger btn-block" OnClick="lnkRemove_OnClick" runat="server"><i class="fas fa-trash-alt fa-lg"></i></asp:LinkButton>
                            </p>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
