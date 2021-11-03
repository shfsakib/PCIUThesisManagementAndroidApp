<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="final-reports.aspx.cs" Inherits="PCIUTMSApp.app.final_reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 card card-body">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Final Report</h1>
            </div>

            <div class="col-md-12">
                
            <asp:DropDownList ID="ddlType" AutoPostBack="True" OnSelectedIndexChanged="ddlType_OnSelectedIndexChanged" class="form-control" runat="server">
                <asp:ListItem>Select Type</asp:ListItem>
                <asp:ListItem Value="Project">Project</asp:ListItem>
                <asp:ListItem Value="Thesis">Thesis</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="col-md-12 mt-4 table-responsive" style="padding-top: 20px; margin-top: 20px;">
                <asp:GridView ID="gridReport" Width="100%" Style="background: gainsboro;" class="table table-hover table-bordered table-striped" OnPageIndexChanging="gridReport_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Found" AllowPaging="True" PageSize="30" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Title">
                            <ItemTemplate>
                                <asp:HiddenField ID="noticeId" Value='<%#Eval("ReportId") %>' runat="server" />
                                <h3>
                                    <asp:Label ID="lblSNm" runat="server" Text='<%#Eval("Topic")%>'></asp:Label></h3>
                                <p><%#Eval("About")%></p>
                                <p>
                                    Attachment: 
                                <a id="lblPath" runat="server" href='<%#Eval("Attachment")%>'><%#Path(Eval("Attachment").ToString())%></a>
                                </p>
                                <p>
                                    Upload Time:
                                <asp:Label ID="lblTime" runat="server" Text='<%#Eval("UploadTime")%>'></asp:Label>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
