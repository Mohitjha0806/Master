<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="ChangeDepartmentTitles.aspx.cs" Inherits="ChangeDepartmentTitles" %>

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
                    <h1>Add Departments or Title</h1>
                </div>
                <div class="card-body py-3">
                    <fieldset>
                        <legend>Department & Titles
                        </legend>
                        <div class="row mt-3">

                            <div class="col-md-6">
                                <div class="form-floating ">
                                    <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="30" class="form-control fw-semibold" ID="txtChnageDepartment" Style="border-color: #717FF5;" placeholder="Registration Number" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Department Name" for="txtChnageDepartment">Department</label>
                                </div>
                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                    ControlToValidate="txtChnageDepartment" runat="server" Display="Dynamic" />
                                <asp:RegularExpressionValidator ErrorMessage="Enter valid Department" ForeColor="Red" Style="font-size: 0.8rem;"
                                    ControlToValidate="txtChnageDepartment" ValidationExpression="^[A-Za-z]" runat="server" Display="Dynamic" />
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating ">
                                    <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="30" class="form-control fw-semibold" ID="txtChnageDesignation" Style="border-color: #717FF5;"
                                        placeholder="Registration Number" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Designation "
                                        for="txtChnageTitle">
                                        Designation
                                    </label>
                                </div>
                                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                    ControlToValidate="txtChnageDesignation" runat="server" Display="Dynamic" />
                                <asp:RegularExpressionValidator ErrorMessage="Enter valid Designation " ForeColor="Red" Style="font-size: 0.8rem;"
                                    ControlToValidate="txtChnageDesignation" ValidationExpression="^[A-Za-z]" runat="server" Display="Dynamic" />
                            </div>



                        </div>
                        <div class="row mt-4">
                            <div class="col-md-4">
                                <asp:Button runat="server" class="btn btn-success fw-semibold py-2 px-4" Text="Submit" />
                                <asp:Button runat="server" class="btn btn-outline-danger fw-semibold py-2 px-3" Text="Reset" />
                            </div>

                        </div>
                    </fieldset>
                    <br />

                </div>
            </div>
        </div>
    </main>
</asp:Content>

