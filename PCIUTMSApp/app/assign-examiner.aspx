<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="assign-examiner.aspx.cs" Inherits="PCIUTMSApp.app.assign_examiner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Assign Examiner</h1>
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
                 <asp:Button ID="btnAssign" CssClass="btn btn-primary btn-block" OnClick="btnAssign_OnClick" runat="server" Text="Assign" />
            </div>
            <div class="col-md-12" style="padding-top: 20px">
                <asp:DropDownList ID="ddlSearch" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="ddlSearch_OnSelectedIndexChanged" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-md-12 table-responsive" style="padding-top: 20px">
                <asp:GridView ID="gridAssign" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridAssign_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Found" AllowPaging="True" PageSize="30" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Supervisor_Name">
                            <ItemTemplate>
                                <asp:Label ID="lblSNm" runat="server" Text='<%#Eval("ExaminerName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supervisor_Id">
                            <ItemTemplate>
                                <asp:Label ID="lblSId" runat="server" Text='<%#Eval("ExmnrId")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student_Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("StudentName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student_Id">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("StuId")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assign_Time">
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("AssignId")%>' />
                                <asp:Label ID="lblTime" runat="server" Text='<%#Eval("AssignTime")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkUpdate" class="btn btn-primary btn-block" OnClick="lnkUpdate_OnClick" runat="server"><i class="fas fa-edit fa-lg"></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkRemove" class="btn btn-danger btn-block" OnClick="lnkRemove_OnClick" runat="server"><i class="fas fa-trash-alt fa-lg"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
