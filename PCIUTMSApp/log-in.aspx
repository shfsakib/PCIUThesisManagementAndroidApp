<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log-in.aspx.cs" Inherits="PCIUTMSApp.log_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in</title>
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
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>TP</b>MS</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in</p>

                <form runat="server">
                    <div class="input-group mb-3">
                        <input type="email" runat="server" id="txtEmail" autocomplete="off" class="form-control" placeholder="Email" />
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" runat="server" id="txtPass" autocomplete="off" class="form-control" placeholder="Password" />
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- /.col -->
                        <div class="col-12">
                            <button type="submit" runat="server" id="btnLogin" onserverclick="btnLogin_OnServerClick" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>

                    <!-- /.social-auth-links -->

                    <p class="mb-1">
                        <asp:LinkButton ID="lnkForgot" runat="server" OnClick="lnkForgot_OnClick">I forgot my password</asp:LinkButton>
                    </p>
                    <p class="mb-0">
                        <a href="sign-up.aspx" class="text-center">Register here</a>
                    </p>
                    
                </form>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="/Link/log-in/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/Link/log-in/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/Link/log-in/dist/js/adminlte.min.js"></script>
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
