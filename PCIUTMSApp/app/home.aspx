<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PCIUTMSApp.app.home" %>

<%@ Import Namespace="PCIUTMSApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-header">
        <h3>Dashboard</h3>
    </div>
    <div class="col-md-12">
        <div class="card card-body">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="info-box">
                        <span class="info-box-icon bg-blue"><i class="fas fa-book"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">Final Report</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblReport" runat="server" Text="Label"></asp:Label></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="info-box">
                        <span class="info-box-icon bg-red"><i class="fas fa-graduation-cap"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">Students</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblStudent" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->

                <!-- fix for small devices only -->
                <div class="clearfix visible-sm-block"></div>

                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="info-box">
                        <span class="info-box-icon bg-green"><i class="fas fa-user-tie"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">Teachers</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblTeacher" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="info-box">
                        <span class="info-box-icon bg-yellow"><i class="fas fa-envelope"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">Applications</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblApplication" runat="server" Text="Label"></asp:Label>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
            </div>
            <% HttpCookie cookie = Function.GetCookie();%>
            <% if (cookie["Type"].ToString() == "Coordinator")
               { %>
            <div class="row">
                <div class="col-lg-4">
                    <asp:DropDownList ID="ddlType" AutoPostBack="True" OnSelectedIndexChanged="ddlType_OnSelectedIndexChanged" class="form-control w-100" runat="server">
                        <asp:ListItem>Teacher</asp:ListItem>
                        <asp:ListItem>Coordinator</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                    <asp:GridView ID="gridTeacher" Width="100%" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridTeacher_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Pending Request Found" AllowPaging="True" PageSize="30" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="University_Id">
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%#Eval("IdNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
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
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("Type")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department">
                                <ItemTemplate>
                                    <asp:Label ID="Label72" runat="server" Text='<%#Exist(Eval("Department").ToString())%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Picture">
                                <ItemTemplate>
                                    <asp:Image runat="server" Style="width: 75px; height: 75px" ImageUrl='<%#Image(Eval("Picture").ToString())%>'></asp:Image>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkAccpet" class="btn btn-primary mt-1" OnClick="lnkAccpet_OnClick" runat="server" title="Accpet"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkReject" class="btn btn-danger mt-1" OnClick="lnkReject_OnClick" runat="server" title="Reject"><i class="fas fa-times fa-lg"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>
