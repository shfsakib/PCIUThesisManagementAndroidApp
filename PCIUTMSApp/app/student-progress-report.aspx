<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="student-progress-report.aspx.cs" Inherits="PCIUTMSApp.app.student_progress_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 card card-body">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Send Progress</h1>
            </div>
        </div>
        <div class="col-12 p-3">
            <asp:DropDownList ID="ddlStudent" AutoPostBack="True" OnSelectedIndexChanged="ddlStudent_OnSelectedIndexChanged" CssClass="form-control select2" runat="server">
            </asp:DropDownList>
        </div>
        <div class="col-md-12 mt-4 table-responsive" style="padding-top: 20px; margin-top: 20px;">
            <asp:GridView ID="gridReport" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridReport_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Found" AllowPaging="True" PageSize="30" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="University_Id">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%#Eval("IdNo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student_Name">
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("RegistrationId")%>' />
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture">
                        <ItemTemplate>
                            <asp:Image runat="server" Style="width: 75px; height: 75px" ImageUrl='<%#Image(Eval("Picture").ToString())%>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:HiddenField ID="resourceId" Value='<%#Eval("ResourceId") %>' runat="server" />
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
                    <asp:TemplateField HeaderText="Sent_Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("SendTime")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <a href='<%#"tel:"+Eval("MobileNo")%>' class="btn btn-success"><i class="fas fa-phone-alt"></i></a>
                            <a href='<%#"tel:"+Eval("Email")%>' class="btn btn-warning"><i class="fas fa-envelope"></i></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
