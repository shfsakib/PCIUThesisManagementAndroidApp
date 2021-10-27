<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="PCIUTMSApp.app.profile" %>

<%@ Import Namespace="PCIUTMSApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h3>Profile</h3>
    </section>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="text-align: center">
                <asp:Image ID="profileImage" runat="server" ImageUrl="/Link/user.png" class="rounded-circle" Width="150px" Height="150px" alt="profile_image" Style="border: 1px solid black; border-radius: 50%;" />
                <br />
                <asp:FileUpload ID="fileProfile" onchange="ImagePreview(this)" Visible="False" accept=".png,.jpg,.jpeg" runat="server" />
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="text-align: center">
                <br />
                <asp:Label ID="nameLabel" runat="server" Style="font-family: comic sans ms; font-size: 20px;" Text="Label"></asp:Label>
                <asp:TextBox ID="txtName" CssClass="form-control wd" Visible="False" placeholder="Enter Full Name" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="text-align: center">
                <br />
                <a id="btnEdit" runat="server" class="btn btn-primary" style="color: white;" title="Edit" onserverclick="btnEdit_OnServerClick"><i class="fas fa-edit"></i>&nbsp;&nbsp;Edit Profile</a>
                <asp:LinkButton ID="lnkUpdate" Visible="False" CssClass="btn btn-success" OnClick="lnkUpdate_OnClick" runat="server"><i class="fas fa-check"></i>&nbsp;&nbsp;Update</asp:LinkButton>
                <br />
            </div>
            <div class="col-md-4"></div>
        </div>
        <hr />
        <div class="row">
            <div class="col-xs-4">Email :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="form-control wd" Visible="False" autocomplete="off" placeholder="name@example.com" runat="server"></asp:TextBox>

            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">
                Mobile No. :
            </div>
            <div class="col-xs-8">
                <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txtMobile" CssClass="form-control wd" Visible="False" autocomplete="off" placeholder="01XXXXXXXXX" runat="server"></asp:TextBox>
            </div>
        </div>
        <% Function func = Function.GetInstance();
            if (func.TypeCookie() != "Coordinator")
            { %>
        <div class="row" id="userDiv" runat="server">
            <div class="col-xs-4">Department :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label>
                
            </div>
        </div>
        <% } %>
        <%if (func.TypeCookie().ToString() == "Teacher")
            { %>
        <div class="row" id="Div1" runat="server">
            <div class="col-xs-4">Designation :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblDesignation" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txtDesignation" runat="server" Visible="False" autocomplete="off" class="form-control w-100" placeholder="Lecturer, Sr. Lecturer"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">Group Link :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblGroupLink" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txtGroupLink" runat="server" Visible="False" autocomplete="off" class="form-control w-100" placeholder="Enter group link"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">Free Schedule  :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblSchedule" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txtTimeFrom" runat="server" Visible="False" TextMode="Time" autocomplete="off" class="form-control w-50" placeholder="XXXXX"></asp:TextBox>
                <asp:TextBox ID="txtTimeTo" runat="server" Visible="False" TextMode="Time" autocomplete="off" class="form-control w-50" placeholder="XXXXX"></asp:TextBox>
            </div>
        </div>
        <% } %>
        <% if (func.TypeCookie() == "Student")
            { %>
        <div class="row">

            <div class="col-xs-4">Program :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblProgram" runat="server" Text=""></asp:Label>
                <asp:DropDownList ID="ddlProgram" class="form-control" Visible="False" runat="server">
                    <asp:ListItem>--Select Program--</asp:ListItem>
                    <asp:ListItem>Bachelor</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <% } %>
        <div class="row">
            <div class="col-xs-4">Id No :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblIdNo" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txtId" runat="server" Visible="False" autocomplete="off" class="form-control w-100" placeholder="XXX XXX XXX"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">Password :</div>
            <div class="col-xs-8">
                <asp:Label ID="lblPass" runat="server" Text="********"></asp:Label>
                <asp:TextBox ID="txtPass" CssClass="form-control wd" Visible="False" placeholder="Enter Password" autocomplete="off" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=profileImage.ClientID%>').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>
</asp:Content>
