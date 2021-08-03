<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="all-application.aspx.cs" Inherits="PCIUTMSApp.app.all_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Application List</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12" style="padding-bottom: 5px;">
                <asp:DropDownList ID="ddlStatus" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_OnSelectedIndexChanged" CssClass="form-control" runat="server">
                    <asp:ListItem Value="I">Pending</asp:ListItem>
                    <asp:ListItem Value="A">Approved</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-xs-6">
                <asp:DropDownList ID="ddlProgram" AutoPostBack="True" OnSelectedIndexChanged="ddlProgram_OnSelectedIndexChanged" CssClass="form-control" runat="server">
                    <asp:ListItem>Bachelor</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-xs-6">
                <asp:DropDownList ID="ddlType" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlType_OnSelectedIndexChanged" runat="server">
                    <asp:ListItem>Before Assign</asp:ListItem>
                    <asp:ListItem>Proposal</asp:ListItem>
                    <asp:ListItem>Final</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlTypeMsc" Visible="False" CssClass="form-control" runat="server">
                    <asp:ListItem>Before Assign</asp:ListItem>
                    <asp:ListItem>Proposal</asp:ListItem>
                    <asp:ListItem>Second Demo</asp:ListItem>
                    <asp:ListItem>Final</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-xs-12" style="padding-top:5px;">
                <asp:DropDownList ID="ddlStudent" AutoPostBack="True" OnSelectedIndexChanged="ddlStudent_OnSelectedIndexChanged" CssClass="form-control select2" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-lg-12 justify-content-center table-responsive" style="margin-top: 30px; padding-top: 20px;">
                <asp:GridView ID="gridApplication" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridApplication_OnPageIndexChanging" OnRowDataBound="gridApplication_OnRowDataBound" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Application Found" AllowPaging="True" PageSize="30" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Student_Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student_Id">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("IdNo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Program">
                            <ItemTemplate>
                                <asp:Label ID="lblProgram" runat="server" Text='<%#Eval("Program")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Application_Type">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("Type")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Application_Time">
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("ApplicationId")%>' />
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("ApplicationTime")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnActive" class="btn btn-primary btn-block" OnClick="lnActive_OnClick" runat="server"><i class="fas fa-eye fa-lg"></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkAccept" class="btn btn-success btn-block" OnClick="lnkAccept_OnClick" runat="server"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkInactive" class="btn btn-danger btn-block" OnClick="lnkInactive_OnClick" runat="server"><i class="fas fa-trash-alt fa-lg"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="modal-bg" id="modalBg" runat="server" visible="False">
            <div class="content-div">
                <div class="row">
                    <div class="col-xs-6 text-left pt-4">
                        <asp:LinkButton ID="lnkClose" runat="server" OnClick="lnkClose_OnClick" Style="color: #495057"><i class="fas fa-times fa-lg"></i></asp:LinkButton>
                    </div>
                    <div class="col-xs-6 text-right">
                        <a class="btn btn-default print">Print</a>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-12" style="padding: 15px;">
                        <div id="content" runat="server"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .modal-bg {
            background: rgba(0, 0, 0, 0.7);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            height: 100vh;
            overflow-y: auto;
            padding: 20px;
        }

        .content-div {
            width: 100%;
            max-width: 650px;
            height: auto;
            min-height: 300px;
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            position: relative;
            top: 20px;
            margin-bottom: 20px;
            left: 50%;
            transform: translate(-50%, 0);
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.print').click(function () {
                var printContents = document.getElementById("ContentPlaceHolder1_content").innerHTML;

                var originalContents = document.body.innerHTML;
                document.body.innerHTML = printContents;
                window.print();
                // document.body.innerHTML = originalContents;
                location.replace('/app/all-application.aspx');
            });
        });

    </script>
</asp:Content>
