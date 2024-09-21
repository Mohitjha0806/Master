<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="AddNewEmployee.aspx.cs" Inherits="AddNewEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="check-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
        </symbol>
        <symbol id="info-fill" viewBox="0 0 16 16">
            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
        </symbol>
        <symbol id="exclamation-triangle-fill" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </symbol>
    </svg>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        fieldset {
            border: 1px solid #007bff;
            border-radius: 0.5rem;
            padding: 0.5rem 2rem;
            width: auto;
            border-color: #007bff;
            background-color: #f8f9fa;
        }

        legend {
            border-color: #007bff;
            border-radius: 0.5rem;
            padding: 0.3rem 0.5rem;
            border: 1px solid #007bff;
            color: #007bff;
            width: auto;
            margin-top: -2%;
            float: initial;
            font-size: 0.8rem;
            font-weight: 600;
            background-color: white;
        }

        .form-control {
            border-color: #007bff;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

            .btn-success:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }

        .btn-outline-danger {
            border-color: #dc3545;
            color: #dc3545;
        }

            .btn-outline-danger:hover {
                background-color: #dc3545;
                color: #fff;
            }

        .form-floating label {
            font-size: 0.8rem;
        }

        .form-floating .form-control {
            font-size: 0.8rem;
        }

        .required-field-validator {
            font-size: 0.8rem;
        }

        .text-center {
            text-align: center;
        }

        .mt-3 {
            margin-top: 1rem;
        }

        .mt-4 {
            margin-top: 1.5rem;
        }
    </style>
    <main id="main" class="main">
        <div class="container-fluid ">
            <div class="card">
                <div class="card-header">
                    <h1 class="fw-semibold">Register Employees</h1>
                </div>
                <div class="card-body py-3">

                    <fieldset class="py-4">
                        <legend class="fw-semibold">Required Details
                        </legend>
                        <from class="form-control py-3">

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="4" class="form-control fw-semibold" ID="txtCompanyRagistrationNum"
                                            Style="border-color: #717FF5;" placeholder="Registration Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Registration Number" for="floatingInput">Company Registration Number</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="SubmitGroup" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyRagistrationNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid 4 Digit Registration Number" ValidationGroup="SubmitGroup" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyRagistrationNum" ValidationExpression="^[0-9]{4}$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating ">
                                        <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="8" class="form-control fw-semibold" ID="txtEmpID" Style="border-color: #717FF5;" placeholder="Registration Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Employee ID" for="floatingInput">Employee ID</label>
                                    </div>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmpID" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ValidationGroup="SubmitGroup" ErrorMessage="Enter valid Employee ID" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmpID" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <%--<label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="lblEmployeeShift">Working Shift</label>--%>
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" ID="ddlEmployeeShift" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Shift" Value="0" />
                                        <asp:ListItem Text="Day" Value="1" />
                                        <asp:ListItem Text="Night" Value="2" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlEmployeeShift" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>






                            </div>
                            <div class="row mt-2 ">
                                <div class="col-md-4">
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Employee Position" for="lblEmployeeDepartment">Employee Department</label>
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlEmployeeDepartment"
                                        Style="font-size: 0.8rem; border-color: #717FF5; margin-top: 0.3rem;" runat="server"
                                        OnSelectedIndexChanged="ddlEmployeeDepartment_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlEmployeeDepartment"
                                        InitialValue="0" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Employee Position" for="lblddlEmployeePosition">Employee Position</label>
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlEmployeePosition"
                                        Style="font-size: 0.8rem; margin-top: 0.3rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Position" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlEmployeePosition" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>

                                <div class="col-md-4">
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Date of Joining" for="lblEmployeeDOJ">Date of Joining</label>
                                    <div class="form-floating" style="margin-top: 0.3rem;">
                                        <asp:TextBox runat="server" CssClass="form-control fw-semibold py-2" TextMode="Date" Style="font-size: 0.8rem; border-color: #717FF5;" Placeholder="Date of Joining" ID="txtEmployeeDOJ" />
                                    </div>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" Placeholder="none" ControlToValidate="txtEmployeeDOJ" runat="server" Display="Dynamic" />
                                </div>





                            </div>
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" Style="border-color: #717FF5;" ID="txtEmpName" placeholder="Enter Company Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="TxtCompanyName">Employee Full Name</label>
                                    </div>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtEmpName" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ValidationGroup="SubmitGroup" ErrorMessage="Enter valid Valid Name" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtEmpName" ValidationExpression="^[A-Za-z]+(?: [A-Za-z]+)*$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" MaxLength="10" class="form-control fw-semibold" ID="txtEmployeeContectNum" placeholder="Contact Person Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Employee Contact Number</label>
                                    </div>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmployeeContectNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ValidationGroup="SubmitGroup" ErrorMessage="Enter valid Number" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmployeeContectNum" ValidationExpression="^[6-9]{1}[0-9]{9}$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" class="form-control fw-semibold" ID="txtEmployeeContectEmail" placeholder="Contact Person Email" />
                                        <label runat="server" text="Contact Email" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Employee Contact Email</label>
                                        <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeContectEmail" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ValidationGroup="SubmitGroup" ErrorMessage="Enter valid Email" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeContectEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 ">
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-select form-control fw-semibold py-3 mt-1" ID="ddlEmployeeGender" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Gender" Value="0" />
                                        <asp:ListItem Text="Male" Value="1" />
                                        <asp:ListItem Text="Female" Value="2" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlEmployeeGender" InitialValue="0" runat="server" Display="Dynamic" />

                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1"
                                        Style="font-size: 0.8rem; border-color: #717FF5;"
                                        ID="ddlEmployeeState"
                                        runat="server"
                                        AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlEmployeeState_SelectedIndexChanged">
                                        <asp:ListItem Text="Select State" Value="0" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required"
                                        ForeColor="Red"
                                        Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlEmployeeState"
                                        InitialValue="0"
                                        runat="server"
                                        Display="Dynamic" />
                                </div>

                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1"
                                        ID="ddlEmployeeCity"
                                        Style="font-size: 0.8rem; border-color: #717FF5;"
                                        runat="server">
                                        <asp:ListItem Text="Select City" Value="0" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlEmployeeCity" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>


                            </div>
                            <div class="row mt-3">
                                <div class="col-md-8">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" class="form-control fw-semibold" MaxLength="250" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" ID="txtEmployeeAddress" placeholder="Enter Employee Address" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="floatingInput">Enter Employee Address</label>
                                        <asp:RequiredFieldValidator ValidationGroup="SubmitGroup" ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="txtEmployeeAddress" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ValidationGroup="SubmitGroup" ErrorMessage="Enter valid Address" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeAddress" ValidationExpression="^[a-zA-Z0-9\s,.-]{10,300}$" runat="server" Display="Dynamic" />
                                    </div>


                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" class="form-control fw-semibold" MaxLength="10" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" ID="txtEmployeeCTC" placeholder="Enter Company Address" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="txtEmployeeCTC">Enter Employee CTC</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ValidationGroup="SubmitGroup" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="txtEmployeeCTC" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ErrorMessage="Enter valid CTC" ValidationGroup="SubmitGroup" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeCTC" ValidationExpression="^(?:[1-9][0-9]{0,6}|9[0-9]{6})(?:\.[0-9]{1,2})?$" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4 d-flex align-items-start">
                                <div class="col-md-4 ">
                                    <asp:Button runat="server" ID="btnSaveEmployeeRegistration" class="btn btn-success fw-semibold py-2 px-5" Text="Save" ValidationGroup="SubmitGroup" OnClick="btnSaveEmployeeRegistration_Click" AutoPostBacck="true" />
                                    <asp:Button runat="server" class="btn btn-outline-danger fw-semibold  py-2 px-4 ml-3" Text="Reset" />
                                </div>
                                <div class="col-md-8 align-items-center">
                                    <div class="alert alert-success py-2 " ValidationGroup="SubmitGroup" runat="server" id="lblAlertMsgSuccess" visible="false" role="alert">
                                        <asp:Label ID="lblErrorMsg1" runat="server" Text="" />
                                    </div>
                                    <div class="alert alert-danger py-2" ValidationGroup="SubmitGroup" runat="server" id="lblAlertMsgError" visible="false" role="alert">
                                        <asp:Label ID="lblErrorMsg2" runat="server" Text="" />
                                    </div>

                                </div>

                            </div>
                        </from>
                    </fieldset>

                </div>
            </div>
        </div>
    </main>

</asp:Content>

