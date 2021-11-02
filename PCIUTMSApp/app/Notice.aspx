<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="notice.aspx.cs" Inherits="PCIUTMSApp.app.Notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 card card-body">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Notice</h1>
            </div>
        </div>
        <div class="col-md-12 mt-4 p-0 table-responsive" style="padding:0px 0 0 0; margin-top: 20px;">
            <asp:GridView ID="gridNotice" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridNotice_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Notice Found" AllowPaging="True" PageSize="30" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:HiddenField ID="noticeId" Value='<%#Eval("NoticeId") %>' runat="server" />
                            <h3>
                                <asp:Label ID="lblSNm" runat="server" Text='<%#Eval("Title")%>'></asp:Label></h3>
                            <p><%#Eval("Description")%></p>
                            <p>
                                Attachment: 
                                <a id="lblPath" runat="server" href='<%#Eval("Path")%>'><%#Path(Eval("Path").ToString())%></a>
                            </p>
                            <p>
                                Post Time:
    <asp:Label ID="lblTime" runat="server" Text='<%#Eval("NoticeTime")%>'></asp:Label>

                            </p>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
