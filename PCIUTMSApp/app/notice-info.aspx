<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="notice-info.aspx.cs" Inherits="PCIUTMSApp.app.notice_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 card card-body">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Notice</h1>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                Title:
            <asp:TextBox ID="txtTitle" placeholder="Notice Title" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-12">
                Description:
            <asp:TextBox ID="txtDescription" TextMode="MultiLine" Height="100px" placeholder="Description" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-12">
                Attachment:
            <asp:FileUpload ID="fileAttach" accept=".txt,.zip,.rar,.doc,.docx,.pdf,.xlsx,.xls,.ppt,.pptx" runat="server"></asp:FileUpload>
            </div>
            <div class="col-md-12 pt-2">
                &nbsp;
            <asp:Button ID="btnSend" CssClass="btn btn-primary btn-block" OnClick="btnSend_OnClick" runat="server" Text="Send" />
            </div>
        </div>
        <div class="col-md-12 mt-4 table-responsive" style="padding-top: 20px; margin-top: 20px;">
            <asp:GridView ID="gridNotice" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridNotice_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Notice Found" AllowPaging="True" PageSize="30" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:HiddenField ID="noticeId" Value='<%#Eval("NoticeId") %>' runat="server" />
                            <asp:Label ID="lblSNm" runat="server" Text='<%#Eval("Title")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lblSId" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Attachment">
                        <ItemTemplate>
                            <a id="lblPath" runat="server" href='<%#Eval("Path")%>'><%#Eval("Path")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Notice_Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("NoticeTime")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" class="btn btn-danger btn-block" OnClick="lnkRemove_OnClick" runat="server"><i class="fas fa-trash-alt fa-lg"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
