<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="teachers-info.aspx.cs" Inherits="PCIUTMSApp.app.teachers_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-header">
        <h3>Teacher List</h3>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive" style="margin-top: 10px;">
            <asp:GridView ID="gridTeacher" Width="100%" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridTeacher_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Teacher Info Found" AllowPaging="True" PageSize="30" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-12 text-center">
                                    <asp:Image runat="server" Style="width: 75px; height: 75px; border-radius: 50%;" ImageUrl='<%#Image(Eval("Picture").ToString())%>'></asp:Image>
                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%#Eval("RegistrationId")%>' />

                                </div>
                                <div class="col-12" style="padding: 20px;">
                                    <h3>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Name")%>'></asp:Label></h3>
                                    <p>
                                        <asp:Label ID="Label11" runat="server" Text='<%#Eval("Designation")%>'></asp:Label>
                                    </p>
                                    <p>
                                        Free Schedule:                                   
                                        <asp:Label ID="Label8" runat="server" Text='<%#Time(Eval("FreeScheduleFrom").ToString())+" - "+Time(Eval("FreeScheduleTo").ToString())%>'></asp:Label>
                                    </p>
                                    <p class="d-flex">
                                        <a href='<%#"tel:"+Eval("MobileNo")%>' class="btn btn-success"><i class="fas fa-phone-alt"></i></a>
                                        <a href='<%#"mailto:"+Eval("Email")%>' class="btn btn-warning"><i class="fas fa-envelope"></i></a>
                                    </p>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </div>
</asp:Content>
