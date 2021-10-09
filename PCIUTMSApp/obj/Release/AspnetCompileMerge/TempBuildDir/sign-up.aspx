<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign-up.aspx.cs" Inherits="PCIUTMSApp.sign_up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="/Link/tpms.png" type="image/gif" sizes="16x16" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback" />
    <!-- Font Awesome -->
    <script src="Link/font-awesome.js"></script>
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="/Link/log-in/plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="/Link/log-in/dist/css/adminlte.min.css" />
</head>
<body class="hold-transition register-page">
    <div class="register-box">
        <div class="register-logo">
            <a href="#"><b>TP</b>MS</a>
        </div>

        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">
                    <h3>Sign up</h3>
                </p>

                <form id="form1" runat="server">
                    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
                        <div class="wrapper wrapper--w680">
                            <div class="">
                                <div class="row">
                                    <div class="col-12">
                                        <label class="label">Name</label>
                                        <asp:TextBox ID="txtName" runat="server" autocomplete="off" class="form-control" placeholder="Enter your full name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label class="label">Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" autocomplete="off" class="form-control w-100" placeholder="example@example.com"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label class="label">Mobile no.</label>
                                        <asp:TextBox ID="txtMobile" runat="server" autocomplete="off" class="form-control w-100" placeholder="01XXXXXXXXX"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <label class="label">Type</label>
                                        <asp:DropDownList ID="ddlType" AutoPostBack="True" OnSelectedIndexChanged="ddlType_OnSelectedIndexChanged" class="form-control w-100" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Teacher</asp:ListItem>
                                            <asp:ListItem>Coordinator</asp:ListItem>
                                            <asp:ListItem>Student</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <asp:Panel ID="teacherPanel" Visible="False" runat="server">
                                    <div class="row">
                                        <div class="col-12">
                                            <label class="label">Department</label>
                                            <asp:DropDownList ID="ddlDepartment" class="form-control w-100" runat="server">
                                                <asp:ListItem>Select</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-12">
                                            <label class="label">Designation</label>
                                            <asp:TextBox ID="txtDesignation" runat="server" autocomplete="off" class="form-control w-100" placeholder="Lecturer, Sr. Lecturer"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label class="label">Free Schedule</label>
                                            <asp:TextBox ID="txtTimeFrom" runat="server" TextMode="Time" autocomplete="off" class="form-control w-100" placeholder="XXXXX"></asp:TextBox>
                                        </div>
                                        <div class="col-12">
                                            <label class="label">&nbsp;</label>
                                            <asp:TextBox ID="txtTimeTo" runat="server" TextMode="Time" autocomplete="off" class="form-control w-100" placeholder="XXXXX"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label class="label">Id No.</label>
                                            <asp:TextBox ID="txtTeacherId" runat="server" autocomplete="off" class="form-control w-100" placeholder="XXX XXX XXX"></asp:TextBox>
                                        </div>

                                    </div>

                                </asp:Panel>
                                <asp:Panel ID="studentPanel" Visible="False" runat="server">
                                    <div class="row">
                                        <div class="col-12">
                                            <label class="label">Department</label>
                                            <asp:DropDownList ID="ddlStudentDepartment" class="form-control w-100 select2" runat="server">
                                                <asp:ListItem>Select</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-12">
                                            <label class="label">Id No.</label>
                                            <asp:TextBox ID="txtStdntId" runat="server" autocomplete="off" class="form-control w-100" placeholder="XXX XXX XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-12">
                                            <label class="label">Program</label>
                                            <asp:DropDownList ID="ddlProgram" class="form-control" runat="server">
                                                <asp:ListItem>--Select Program--</asp:ListItem>
                                                <asp:ListItem>Bachelor</asp:ListItem>
                                                <asp:ListItem>Masters</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="coordinatePanel" Visible="False" runat="server">
                                    <div class="row">
                                        <div class="col-12">
                                            <label class="label">Id No.</label>
                                            <asp:TextBox ID="txtCOId" runat="server" autocomplete="off" class="form-control w-100" placeholder="XXX XXX XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-12">
                                            <label class="label">Designation</label>
                                            <asp:TextBox ID="txtCoDesignation" runat="server" autocomplete="off" class="form-control w-100" placeholder="Lecturer, Sr. Lecturer, Chairman"></asp:TextBox>

                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="row">
                                    <div class="col-12">
                                        <label class="label">Upload Picture</label>
                                        <asp:FileUpload ID="filePic" accept="image/*" runat="server" CssClass="form-control" onchange="ImagePreview(this)" />
                                    </div>
                                    <div class="col-12">
                                        <label class="label"></label>
                                        <asp:Image ID="imgPic" Style="border: 1px solid #d3d3d3; border-radius: 5px; width: 150px; height: 150px; margin-top: 5px;" ImageUrl="/Link/user.png" runat="server" />
                                    </div>
                                    <div class="col-12">
                                        <label class="label">Password</label>
                                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server" autocomplete="off" class="form-control w-100 h-50" placeholder="*********" MaxLength="20"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="p-t-15">
                                    <button id="btnSave" class="btn btn-primary mt-2" runat="server" onserverclick="btnSave_OnServerClick" type="submit">Sign up</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
                <a href="log-in.aspx" class="text-center">I already have an account</a>
            </div>
            <!-- /.form-box -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.register-box -->

    <!-- jQuery -->
    <script src="/Link/log-in/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/Link/log-in/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/Link/log-in/dist/js/adminlte.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <link href="/Link/select2.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {
            $('.select2').select2({
                closeOnSelect: false
            });
        });
    </script>

    <link href="Link/Date-Picker.css" rel="stylesheet" />
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgPic.ClientID%>').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>
    <script>
        $(document).ready(function () {
            if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {

            } else {
                alert('You are not allowed to open this app in browser');
                location.href = 'http://google.it';
            }
        });
        function pageLoad() {
            if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {

            } else {
                alert('You are not allowed to open this app in browser');
                location.href = 'http://google.it';
            }
        }
    </script>
</body>
</html>
