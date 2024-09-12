<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="ChnageCompanyAddress.aspx.cs" Inherits="ChnageCompanyAddress" %>

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
                    <h1>Change Compnay Address</h1>
                </div>
                <div class="card-body py-3">
                    <fieldset>
                        <legend>Add New Locations
                        </legend>
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
                                <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlEmployeeDepartment"
                                    Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                    <asp:ListItem Text="Select Department" Value="0" />
                                    <asp:ListItem Text="Finance" Value="1" />
                                    <asp:ListItem Text="IT" Value="2" />
                                    <asp:ListItem Text="HR" Value="3" />
                                    <asp:ListItem Text="Menufacture" Value="4" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                    ControlToValidate="ddlEmployeeDepartment"
                                    InitialValue="0" runat="server" Display="Dynamic" />
                            </div>

                            <div class="col-md-4">
                                <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlEmployeePosition"
                                    Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                    <asp:ListItem Text="Select Position" Value="0" />
                                    <asp:ListItem Text="Manager" Value="1" />
                                    <asp:ListItem Text="Assistant Manager" Value="2" />
                                    <asp:ListItem Text="Team Leader" Value="3" />
                                    <asp:ListItem Text="Executive" Value="4" />
                                    <asp:ListItem Text="Shift Incharge" Value="5" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                    ControlToValidate="ddlEmployeePosition" InitialValue="0" runat="server" Display="Dynamic" />
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
                    </fieldset>
                    <br />
                </div>
            </div>
        </div>
    </main>
</asp:Content>

