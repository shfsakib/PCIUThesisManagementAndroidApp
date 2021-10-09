<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="department-list.aspx.cs" Inherits="PCIUTMSApp.app.department_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="content-header">
        <h3>Department Info</h3>
    </div>
    <div class="col-md-12">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4 justify-content-center">
               <span class="h4">Department Name</span>
                <asp:TextBox ID="txtDepartmentName" class="form-control" autocomplete="off" placeholder="CSE,EEE etc" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-4"></div>
        </div>
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4 justify-content-center">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_OnClick" class="btn btn-primary" style="margin-top: 5px;" autocomplete="off" Text="Save Department" />
            </div>
            <div class="col-lg-4"></div>
        </div>
        <div class="row card card-body" style="padding-top: 15px;">
            <div class="col-lg-2"></div>
            <div class="col-lg-8 justify-content-center table-responsive">
                <asp:GridView ID="gridDepartment" Width="100%" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridDepartment_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Department Found" AllowPaging="True" PageSize="30" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Department_Name">
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("DepartmentId")%>' />
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("DepartmentName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkUpdate" class="btn btn-primary mt-1" OnClick="lnkUpdate_OnClick" runat="server" title="Update"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-lg-2"></div>
        </div>
    </div>
</asp:Content>
