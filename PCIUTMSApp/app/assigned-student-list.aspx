<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="assigned-student-list.aspx.cs" Inherits="PCIUTMSApp.app.assigned_student_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 card card-body">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Assigned Student List</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:DropDownList ID="ddlStudent" AutoPostBack="True" OnSelectedIndexChanged="ddlStudent_OnSelectedIndexChanged" CssClass="form-control select2" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-md-12 table-responsive" style="margin-top: 20px;">
                <asp:GridView ID="gridAssign" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridAssign_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Student Found" AllowPaging="True" PageSize="30" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Student_Name">
                            <ItemTemplate>
                                <asp:Label ID="lblSNm" runat="server" Text='<%#Eval("StudentName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student_Id">
                            <ItemTemplate>
                                <asp:Label ID="lblSId" runat="server" Text='<%#Eval("StuId")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Picture">
                            <ItemTemplate>
                                <asp:Image runat="server" Style="width: 75px; height: 75px" ImageUrl='<%#Image(Eval("Picture").ToString())%>'></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a class="btn btn-success btn-block" href='<%#"tel:"+Eval("MobileNo") %>'><i class="fas fa-phone-alt"></i></a>
                                <a class="btn btn-warning btn-block" href='<%#"mailto:"+Eval("Email") %>'><i class="fas fa-envelope"></i></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
