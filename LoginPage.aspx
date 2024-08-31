<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Master</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="assets/bootstrap.bundle.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        .welcomeBlack {
            background-color: #000000;
            color: #ffffff;
        }

        .welcome-section {
            background-color: #000;
            color: #fff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            text-align: center;
        }
    </style>
    <link href="assets/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="LoginContainer" class="container-fluid p-0 m-0">
            <div class="row p-0 m-0">
                <div class="welcomeBlack d-flex align-items-center justify-content-center col-md-6 p-0 m-0">
                    <div class="col-md-6 welcome-section">
                        <div>
                            <h1 class="display-4 fw-bold">Welcome</h1>
                            <br />
                            <br />
                            <h6 class="lead fw-semibold">We are delighted to have you here. Explore our features, learn more about us, and stay connected.</h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 p-0 py-5 m-0 d-flex align-items-center justify-content-center ">
                    <div class="card w-75 ">
                        <div style="background-color: #ffffff;" class="card-header">
                            <h1 class="text-center fw-bold">Log In</h1>
                        </div>
                        <div class="card-body border-2 py-5 px-4">
                            <div class="form-floating mb-3">
                                <asp:TextBox TextMode="Email" class="form-control" ID="floatingInput" placeholder="name@example.com" runat="server" />
                                <label runat="server" for="floatingPassword">Email address</label>
                            </div>
                            <div class="form-floating">
                                <asp:TextBox runat="server" type="password" TextMode="Password" class="form-control" ID="floatingPassword" placeholder="Password" />
                                <label runat="server" for="floatingPassword">Password</label>
                            </div>
                            <div class="row mt-2">
                                <asp:Button ID="btnForget" runat="server" Text="Forgot Password?" Style="border: none; background-color: #ffffff; color: #000000;"
                                    Font-Underline="true" PostBackUrl="~/Error404.aspx" CssClass="fw-semibold text-start" OnClick="btnHaveAccount_Click" AutoPostBack="true" />
                            </div>
                        </div>
                        <div style="background-color: #ffffff;" class="card-footer">
                            <div class="row-md-6 py-2 gap-3 d-flex justify-content-center">
                                <asp:Button Text="Login" ID="btnLogin1" CssClass="btn btn-dark px-5 py-2 fw-semibold" PostBackUrl="HomePage.aspx" runat="server" />
                                <asp:Button PostBackUrl="LoginPAge.aspx" ID="btnHaveAccount" runat="server" Text="Ragister Now" Style="border: none; background-color: #ffffff; color: #000000;"
                                    Font-Underline="true" CssClass="button-hover fw-semibold " OnClick="btnHaveAccount_Click" AutoPostBack="true" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div runat="server" id="SignupContainer" visible="false" class="container-fluid p-0 m-0">
            <div class="row p-0 m-0">
                <div class="col-md-6 p-0 m-0 py-5 d-flex align-items-center justify-content-center ">
                    <div class="card w-75 ">
                        <div style="background-color: #ffffff;" class="card-header">
                            <h1 class="text-center fw-bold">Ragister Here!</h1>
                        </div>
                        <div class="card-body border-2 py-5 px-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox class="form-control" ID="txtFname" placeholder="name@example.com" runat="server" />
                                        <label runat="server" for="floatingPassword">First Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox class="form-control" ID="txtLname" placeholder="name@example.com" runat="server" />
                                        <label runat="server" for="floatingPassword">Last Name</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <asp:TextBox TextMode="Phone" class="form-control" ID="TextBox1" placeholder="Enter Mobile Number" runat="server" />
                                <label runat="server" for="floatingPassword">Mobile Number</label>
                            </div>
                            <div class="form-floating mb-3">
                                <asp:TextBox TextMode="Email" class="form-control" ID="txtEmail" placeholder="name@example.com" runat="server" />
                                <label runat="server" for="floatingPassword">Email address</label>
                            </div>
                            <div class="form-floating">
                                <asp:TextBox runat="server" TextMode="Password" class="form-control" ID="txtPassword" placeholder="Password" />
                                <label runat="server" for="floatingPassword">Password</label>
                            </div>
                        </div>
                        <div style="background-color: #ffffff;" class="card-footer">
                            <div class="row-md-6 py-2 gap-3 d-flex justify-content-center">
                                <asp:Button Text="Sign Up" ID="btnSignup" CssClass="btn btn-dark px-5 py-2 fw-semibold" PostBackUrl="~/LoginPage.aspx" OnClick="btnSignup_Click" runat="server" AutoPostBack="true" />
                                <asp:Button Text="Have account" ID="btnLogin" Style="border: none; background-color: #ffffff; color: #000000;" Font-Underline="true"
                                    CssClass="linkButton fw-semibold" runat="server" OnClick="btnLogin_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="welcomeBlack d-flex align-items-center justify-content-center col-md-6 p-0 m-0">
                    <div class="col-md-6 welcome-section">
                        <div>
                            <h1 class="display-4 fw-bold">Welcome</h1>
                            <br />
                            <br />
                            <h6 class="lead fw-semibold">We are delighted to have you here. Explore our features, learn more about us, and stay connected.</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
