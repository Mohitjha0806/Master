<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="AddNewEmployee.aspx.cs" Inherits="AddNewEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        fieldset {
            border: 1px solid black;
            border-radius: 0.5rem;
            padding: 0.5rem 2rem 0.5rem 2rem;
            width: auto;
            border-color: #717FF5;
        }

        legend {
            border-color: #b65fc3e4;
            border-radius: 0.5rem;
            padding: 0.3rem 0.5rem;
            border: 1px solid #717FF5;
            color: #717FF5;
            width: auto;
            margin-top: -2%;
            float: initial;
            font-size: 15px;
            font-weight: 600;






            
        }
    </style>
    <main id="main" class="main">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h1>Ragister Employee</h1>
                </div>
                <div class="card-body py-3">
                    <fieldset>
                        <legend>Fill Employee Details
                        </legend>
                        <from class="form-control py-2">
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating ">
                                        <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="8" class="form-control fw-semibold" ID="txtEmpID" Style="border-color: #717FF5;" placeholder="Registration Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Registration Number" for="floatingInput">Employee ID</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmpID" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Employee ID" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmpID" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlDepartment" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Department" Value="0" />
                                        <asp:ListItem Text="Finance" Value="1" />
                                        <asp:ListItem Text="IT" Value="2" />
                                        <asp:ListItem Text="HR" Value="3" />
                                        <asp:ListItem Text="Menufacture" Value="4" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlDepartment" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlEmployeePosition" InitialValue="0" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Position" Value="0" />
                                        <asp:ListItem Text="Manager" Value="1" />
                                        <asp:ListItem Text="Assistant Manager" Value="2" />
                                        <asp:ListItem Text="Team Leader" Value="3" />
                                        <asp:ListItem Text="Executive" Value="4" />
                                        <asp:ListItem Text="Shift Incharge" Value="5" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlEmployeePosition" runat="server" Display="Dynamic" />
                                </div>



                            </div>
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" Style="border-color: #717FF5;" ID="TxtEmpName" placeholder="Enter Company Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="TxtCompanyName">Employee Full Name</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtEmpName" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Valid Name" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtEmpName" ValidationExpression="^[A-Za-z]+$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" MaxLength="10" class="form-control fw-semibold" ID="txtEmployeeContectNum" placeholder="Contact Person Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Employee Contact Number</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmployeeContectNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Number" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtEmployeeContectNum" ValidationExpression="^[6-9]{1}[0-9]{9}$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" class="form-control fw-semibold" ID="txtEmployeeContectEmail" placeholder="Contact Person Email" />
                                        <label runat="server" text="Contact Email" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Employee Contact Email</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeContectEmail" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ErrorMessage="Enter valid Email" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeContectEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 ">
                                <div class="col-md-4">
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="txtEmployeeDOB">Date of Birth</label>
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" CssClass="form-control fw-semibold py-3 mt-1" TextMode="Date" Style="font-size: 0.8rem; border-color: #717FF5;" Placeholder="Date of Birth" ID="txtEmployeeDOB" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" Placeholder="none" ControlToValidate="txtEmployeeDOB" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="txtEmployeeDOB">Date of Joining</label>
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" CssClass="form-control fw-semibold py-3 mt-1" TextMode="Date" Style="font-size: 0.8rem; border-color: #717FF5;" Placeholder="Date of Joining" ID="txtEmployeeDOJ" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" Placeholder="none" ControlToValidate="txtEmployeeDOJ" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="txtEmployeeDOB">Working Shift</label>
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" ID="DropDownList2" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Shift" Value="0" />
                                        <asp:ListItem Text="Day" Value="1" />
                                        <asp:ListItem Text="Night" Value="2" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlCompanyCity" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>

                            </div>


                            <div class="row mt-3 ">
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-select form-control fw-semibold py-3 mt-1" ID="ddlEmployeeGender" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Gender" Value="0" />
                                        <asp:ListItem Text="Male" Value="1" />
                                        <asp:ListItem Text="Female" Value="2" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlEmployeeGender" InitialValue="0" runat="server" Display="Dynamic" />

                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" Style="font-size: 0.8rem; border-color: #717FF5;" ID="ddlCompanystate" runat="server">
                                        <asp:ListItem Text="Select State" Value="0" />
                                        <asp:ListItem Text="Madhya Pradesh" />
                                        <asp:ListItem Text="Utter Pradesh" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlCompanystate" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" ID="ddlCompanyCity" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select City" Value="0" />
                                        <asp:ListItem Text="Bhopal" />
                                        <asp:ListItem Text="Lakhnow" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlCompanyCity" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>

                            </div>
                            <div class="row mt-3">
                                <div class="col-md-8">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" class="form-control fw-semibold" MaxLength="250" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" ID="txtEmployeeAddress" placeholder="Enter Employee Address" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="floatingInput">Enter Employee Address</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="txtEmployeeAddress" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ErrorMessage="Enter valid CTC" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeAddress" ValidationExpression="^[a-zA-Z0-9-]+$" runat="server" Display="Dynamic" />
                                    </div>


                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" class="form-control fw-semibold" MaxLength="10" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" ID="txtEmployeeCTC" placeholder="Enter Company Address" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="txtEmployeeCTC">Enter Employee CTC</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="txtEmployeeCTC" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ErrorMessage="Enter valid CTC" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtEmployeeCTC" ValidationExpression="^[a-zA-Z0-9\s,.'-]{3,}$" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-2">
                                    <asp:Button runat="server" class="btn btn-success fw-semibold py-2 px-5" Text="Save" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button runat="server" class="btn btn-outline-danger fw-semibold  py-2 px-4 ml-3" Text="Reset" />
                                </div>
                            </div>
                        </from>
                    </fieldset>
                </div>
            </div>
        </div>
    </main>


</asp:Content>

