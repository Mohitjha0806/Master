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
    <form id="form1" runat="server" name="myForm">
        <div runat="server" id="LoginContainer" class="container-fluid p-0 m-0">
            <div class="row p-0 m-0">
                <div class="welcomeBlack d-flex align-items-center justify-content-center col-md-6 p-0 m-0">
                    <div class="col-md-6 welcome-section">
                        <div>
                            <h1 class="display-4 fw-bold">Welcome</h1>
                            <br />
                            <br />
                            <h6 class="lead fw-semibold">"Welcome to PMS, your partner in optimizing production efficiency. Streamline operations, monitor progress, and achieve excellence with us.".</h6>
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
                                <asp:TextBox TextMode="Email" class="form-control fw-semibold border-dark" ID="floatingInput" placeholder="name@example.com" runat="server" />
                                <label runat="server" style="font-size: 0.8rem;" class="fw-semibold" for="floatingPassword">Email address</label>
                            </div>
                            <div class="form-floating">
                                <asp:TextBox runat="server" type="password" TextMode="Password " class="form-control border-dark" ID="floatingPassword" placeholder="Password" />
                                <label runat="server" style="font-size: 0.8rem;" class="fw-semibold" for="floatingPassword">Password</label>
                            </div>
                            <div class="row mt-2">
                                <asp:Button ID="btnForget" runat="server" Text="Forgot Password?" Style="border: none; background-color: #ffffff; color: #000000;"
                                    Font-Underline="true" PostBackUrl="~/Error404.aspx" CssClass="fw-semibold text-start" />
                            </div>
                        </div>
                        <div style="background-color: #ffffff;" class="card-footer">
                            <div class="row-md-6 py-2 gap-3 d-flex justify-content-center">
                                <asp:Button Text="Login" ID="btnLogin1" CssClass="btn btn-dark px-5 py-2 fw-semibold" PostBackUrl="Dashboard.aspx" runat="server" />
                                <asp:Button PostBackUrl="LoginPAge.aspx" ID="btnRegister" runat="server" Text="Ragister Now" Style="border: none; background-color: #ffffff; color: #000000;"
                                    Font-Underline="true" CssClass="button-hover fw-semibold " OnClick="btnRegister_Click" AutoPostBack="true" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div runat="server" id="SignupContainer" visible="false" class="container-fluid p-0 m-0">
            <div class="row p-0 m-0">
                <div class="col-md-6 p-0 m-0 py-3 d-flex align-items-center justify-content-center ">
                    <div class="card w-75 ">
                        <div style="background-color: #ffffff;" class="card-header">
                            <h1 class="text-center fw-bold">Ragister Here!</h1>
                        </div>
                        <div class="card-body border-2 py-5 px-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox MaxLength="15" class="form-control fw-semibold border-1 border-dark" ID="txtFname" Style="font-size: 0.8rem;" placeholder="First Name" runat="server" onblur="validationFname()" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" id="lblFname" for="floatingPassword">First Name</label>
                                    </div>
                                    <label id="ElblFname" style="font-size: 0.8rem;" class="text-danger fw-semibold mt-0"></label>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox MaxLength="15" class="form-control  fw-semibold border-1 border-dark" ID="txtLname" Style="font-size: 0.8rem;" placeholder="Last Name" runat="server" onblur="validationLname()" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingPassword">Last Name</label>
                                    </div>
                                    <label id="ElblLname" style="font-size: 0.8rem;" class="text-danger fw-semibold mt-0"></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox TextMode="Phone" MaxLength="10" class="form-control fw-semibold border-1 border-dark" ID="txtPhone" Style="font-size: 0.8rem;" placeholder="Enter Mobile Number" runat="server" onblur="validationPhone()" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingPassword">Mobile Number</label>
                                    </div>
                                    <label id="ElblPhone" style="font-size: 0.8rem;" class="text-danger fw-semibold mt-0"></label>
                                </div>
                                <div class="col-md-6">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 border-1 border-dark" ID="ddlCategory" Style="font-size: 0.8rem;" runat="server" onblur="validationCategory()">
                                        <asp:ListItem Text="Select Category" Value="0" />
                                        <asp:ListItem Text="Employeer" />
                                        <asp:ListItem Text="Employee" />
                                    </asp:DropDownList>
                                    <label id="lblddlCategory" style="font-size: 0.8rem;" class="text-danger fw-semibold mb-1"></label>
                                </div>


                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <asp:TextBox TextMode="Email" MaxLength="24" class="form-control fw-semibold border-1 border-dark" Style="font-size: 0.8rem;" ID="txtEmail"
                                            placeholder="name@example.com" runat="server" onblur="validationEmail()" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingPassword">Email address</label>
                                    </div>
                                    <label id="ElblEmail" style="font-size: 0.8rem;" class="text-danger fw-semibold"></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" MaxLength="16" TextMode="Password" class="form-control fw-semibold border-1 border-dark" ID="txtPassword" placeholder="Password" onblur="validationPasswrd()" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingPassword">Password</label>
                                    </div>
                                    <label id="ElblPassword" style="font-size: 0.8rem;" class="text-danger fw-semibold"></label>
                                </div>
                            </div>
                        </div>
                        <div style="background-color: #ffffff;" class="card-footer">
                            <div class="row-md-6 py-2 gap-3 d-flex justify-content-center">

                                <asp:Button Text="Sign Up" ID="btnSignup" CssClass="btn btn-dark px-5 py-2 fw-semibold" runat="server"
                                    OnClick="btnSignup_Click" onsubmit="return validationForm();" OnClientClick="return validationForm();" CausesValidation="true" />


                                <asp:Button Text="Have account" ID="btnHaveAccount" Style="border: none; background-color: #ffffff; color: #000000;"
                                    Font-Underline="true" CssClass="linkButton fw-semibold" runat="server"
                                    OnClick="btnHaveAccount_Click" />

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
                            <h6 class="lead fw-semibold">"Welcome to PMS, your partner in optimizing production efficiency. Streamline operations, monitor progress, and achieve excellence with us.".</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>



        function validationFname() {
            let fname = document.getElementById("<%= txtFname.ClientID %>").value;
            let fnameRegex = /^[A-Za-z]+$/;
            if (fname === "") {
                document.getElementById("ElblFname").innerHTML = "Requried";
            } else if (!fnameRegex.test(fname)) {
                document.getElementById("ElblFname").innerHTML = "Please enter a valid name";
            }
            else {
                document.getElementById("ElblFname").innerHTML = "";
            }
        }

        function validationLname() {
            let lname = document.getElementById("<%= txtLname.ClientID %>").value;
            let lnameRegex = /^[A-Za-z]+$/;
            if (lname === "") {
                document.getElementById("ElblLname").innerHTML = "Requried";
            } else if (!lnameRegex.test(lname)) {
                document.getElementById("ElblLname").innerHTML = "Please enter a valid name";
            }
            else {
                document.getElementById("ElblLname").innerHTML = "";
            }
        }

        function validationPhone() {
            let phone = document.getElementById("<%= txtPhone.ClientID%>").value;
            let regexPhone = /^[6-9]{1}[0-9]{9}$/;

            if (phone === "") {
                document.getElementById("ElblPhone").innerHTML = "Requried";
            } else if (!regexPhone.test(phone)) {
                document.getElementById("ElblPhone").innerHTML = "Please enter a valid number"
            }
            else {
                document.getElementById("ElblPhone").innerHTML = ""
            }
        }

        function validationCategory() {
            let Category = document.getElementById("<%=ddlCategory.ClientID%>").value;

            if (Category === "0") {
                document.getElementById("lblddlCategory").innerHTML = "Pleace Select Category";
            } else {
                document.getElementById("lblddlCategory").innerHTML = "";
            }
        }

        function validationEmail() {
            let email = document.getElementById("<%=txtEmail.ClientID%>").value;
            let RegexEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;

            if (email === "") {
                document.getElementById("ElblEmail").innerHTML = "Requried";
            }
            else if (!RegexEmail.test(email)) {
                document.getElementById("ElblEmail").innerHTML = "Please Enter Valid Email";
            }
            else {
                document.getElementById("ElblEmail").innerHTML = "";
            }
        }

        function validationPasswrd() {
            let password = document.getElementById("<%=txtPassword.ClientID%>").value;
            let regexPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

            if (password === "") {
                document.getElementById("ElblPassword").innerHTML = "Required";
            }
            else if (!regexPassword.test(password)) {
                document.getElementById("ElblPassword").innerHTML = "Password must include A-Z, a-z, 0-9, and special characters";
            }
            else {
                document.getElementById("ElblPassword").innerHTML = "";
            }
        }


        function validationForm() {
            validationFname();
            validationLname();
            validationPhone();
            validationCategory();
            validationEmail();
            validationPasswrd();

            let errorMessages = [
                document.getElementById("ElblFname").innerHTML,
                document.getElementById("ElblLname").innerHTML,
                document.getElementById("ElblPhone").innerHTML,
                document.getElementById("lblddlCategory").innerHTML,
                document.getElementById("ElblEmail").innerHTML,
                document.getElementById("ElblPassword").innerHTML
            ];

            for (let i = 0; i < errorMessages.length; i++) {
                if (errorMessages[i] !== "") {
                    alert("Please fill the empty field in the form before submitting.");
                    return false;
                }
            }
            return true;
        }





    </script>
</body>
</html>
