<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="teacher-list.aspx.cs" Inherits="PCIUTMSApp.app.teacher_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-header">
        <h3>Teacher List</h3>
    </div>
    <div class="col-md-12">
        <div class="row">
            <div class="col-xs-4 col-lg-4">
                <asp:DropDownList ID="ddlType" AutoPostBack="True" OnSelectedIndexChanged="ddlType_OnSelectedIndexChanged" class="form-control wd" runat="server">
                    <asp:ListItem Value="A">Active</asp:ListItem>
                    <asp:ListItem Value="I">Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-xs-8 col-lg-4">
                <asp:DropDownList ID="ddlTeacher" AutoPostBack="True" OnSelectedIndexChanged="ddlTeacher_OnSelectedIndexChanged" class="form-control select2 wd" runat="server">
                    <asp:ListItem Value="A">--SEARCH TEACHER--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                <asp:GridView ID="gridTeacher" Width="100%" class="table table-hover table-bordered table-striped" OnRowDataBound="gridTeacher_OnRowDataBound" OnPageIndexChanging="gridTeacher_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Teacher Info Found" AllowPaging="True" PageSize="30" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="University_Id">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("IdNo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teacher_Name">
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("RegistrationId")%>' />
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MobileNo">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("MobileNo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Department">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Designation">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%#Eval("Designation")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Free_Schedule">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("FreeScheduleFrom")+" - "+Eval("FreeScheduleTo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Picture">
                            <ItemTemplate>
                                <asp:Image runat="server" Style="width: 75px; height: 75px" ImageUrl='<%#Image(Eval("Picture").ToString())%>'></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnActive" class="btn btn-primary mt-1" OnClick="lnActive_OnClick" runat="server" title="Make Active"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkInactive" class="btn btn-danger mt-1" OnClick="lnkInactive_OnClick" runat="server" title="Make Inactive"><i class="fas fa-times fa-lg"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
     
</asp:Content>
