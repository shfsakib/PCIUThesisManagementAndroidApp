<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="update-assign.aspx.cs" Inherits="PCIUTMSApp.app.update_assign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Update Supervisor</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                Teacher Info
                <asp:DropDownList ID="ddlTeacher" CssClass="form-control select2" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-md-12">
                Student Info
                <asp:DropDownList ID="ddlStudent" CssClass="form-control select2" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-md-12 pt-2">
                &nbsp;
                 <asp:Button ID="btnUpdateAssign" CssClass="btn btn-primary btn-block" OnClick="btnUpdateAssign_OnClick" runat="server" Text="Update" />
            </div>
        </div>
    </div>
</asp:Content>
