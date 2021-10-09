<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="supervisor-profile.aspx.cs" Inherits="PCIUTMSApp.app.supervisor_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h3>Supervisor Profile</h3>
    </section>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="text-align: center">
                <asp:Image ID="profileImage" runat="server" ImageUrl="/Link/user.png" class="rounded-circle" Width="150px" Height="150px" alt="profile_image" Style="border: 1px solid black; border-radius: 50%;" />
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="text-align: center">
                <br />
                <asp:Label ID="nameLabel" runat="server" Style="font-family: comic sans ms; font-size: 20px;" Text="Label"></asp:Label>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center" style="margin-top: 20px;">
                <a class="btn btn-success" runat="server" id="btnCall"><i class="fas fa-phone-alt fa-lg"></i>&nbsp;Call</a>                
                <a class="btn btn-warning" runat="server" id="btnMail"><i class="fas fa-envelope fa-lg"></i>&nbsp;Mail</a>
                <a class="btn btn-primary" runat="server" id="btnGroup"><i class="fas fa-users fa-lg"></i>&nbsp;Group Link</a>
            </div>
        </div>
    </div>
</asp:Content>
