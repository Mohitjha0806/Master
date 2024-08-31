<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error404.aspx.cs" Inherits="Error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 - Page Not Found</title>
    <link href="assets/bootstrap.min.css" rel="stylesheet" />
    <script src="assets/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            text-align: center;
            color: #333;
            padding: 50px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;


        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

            a:hover {
                text-decoration: underline;
            }
    </style>
</head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <div class="container ">
            <p class="fs-1 text-center text-warning">We have a problum.</p>
            <h1 style="font-size: 15rem; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" class="text-center display-1 fw-bold text-light">404</h1>
            <p class=" display-6 text-warning">Page not found.</p>
            <a href="LoginPage.aspx">Go back to the homepage</a>
        </div>
    </form>
</body>
</html>
