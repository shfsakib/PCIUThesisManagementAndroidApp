<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PCIUTMSApp.app.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-header">
        <h3>Dashboard</h3>
    </div>
    <div class="col-md-12">

        <div class="card card-body">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-blue"><i class="fas fa-book"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Total Final Report</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblReport" runat="server" Text="Label"></asp:Label></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-12">
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

                <div class="col-md-3 col-sm-6 col-xs-12">
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
                <div class="col-md-3 col-sm-6 col-xs-12">
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
        </div>
    </div>
</asp:Content>
