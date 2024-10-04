<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="ComplaintPage.aspx.cs" Inherits="Compalint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid p-0">
        <div class="card">
            <div class="card-header">
                <div runat="server" class="container alert alert-success alert-dismissible fade show py-2" role="alert" id="lblComplaintSuccessMsg" visible="false">
                    <strong>&nbsp; &nbsp; &nbsp;Complaint Register Sussessfully.</strong>
                    <button type="button" class="btn-close py-2  mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div runat="server" class="container alert alert-warning alert-dismissible fade show py-2" role="alert" id="lblComplaintErrorMsg" visible="false">
                    <strong>&nbsp; &nbsp; &nbsp;We Have Tot This Employee ID. Try Again</strong>
                    <button type="button" class="btn-close py-2 mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="card-header">
                    <h1>Complaint From</h1>
                </div>
                <div class="card-body py-3">

                    <fieldset class="py-4">
                        <legend>Complaint</legend>

                        <div class="row mt-3">
                            <div class="col-md-4 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="Date" class="form-control fw-semibold" ID="txtComplaintDate"
                                        Style="border-color: #717FF5;" placeholder="Complaint Date" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Date" for="floatingInput">Complaint Date</label>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="Time" class="form-control fw-semibold" ID="txtComplaintTime"
                                        Style="border-color: #717FF5;" placeholder="Complaint Time" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Time" for="floatingInput">Complaint Time</label>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <asp:DropDownList CssClass="form-control form-select fw-semibold " ID="ddlComplaintType" Style="font-size: 0.8rem; border-color: #717FF5; padding: 1.15rem 0.8rem;"
                                    runat="server">
                                    <asp:ListItem Text="Complaint Type" Value="0" />
                                    <asp:ListItem Text="Miss Behave" Value="1" />
                                    <asp:ListItem Text="Pressreese" Value="2" />
                                    <asp:ListItem Text="Harmsment" Value="2" />
                                    <asp:ListItem Text="Other" Value="2" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" ID="txtComplaintAgainstID"
                                        Style="border-color: #717FF5;" placeholder="Employee ID" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Time" for="floatingInput">Complaint Against Employee ID</label>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" ID="txtComplainerFirstName"
                                        Style="border-color: #717FF5;" placeholder="First Name" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Date" for="floatingInput">Your First Name</label>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" ID="txtComplainerLastName"
                                        Style="border-color: #717FF5;" placeholder="Last Name" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Time" for="floatingInput">Your Last Name</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="Phone" MaxLength="10" class="form-control fw-semibold" ID="txtComplainerPhone"
                                        Style="border-color: #717FF5;" placeholder="Phone Number" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Date" for="floatingInput">Phone Number</label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="Email" MaxLength="24" class="form-control fw-semibold" ID="txtComplainerEmail"
                                        Style="border-color: #717FF5;" placeholder="Last Name" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Time" for="floatingInput">Email</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col mb-3">
                                <div class="form-floating">
                                    <asp:TextBox runat="server" TextMode="MultiLine" MaxLength="300" class="form-control fw-semibold" ID="txtAddress"
                                        Style="border-color: #717FF5;" placeholder="Enter Address" />
                                    <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Complaint Time" for="floatingInput">Please describe the Complaint in detail</label>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4 d-flex align-items-start">
                            <div class="col-md-4 ">
                                <asp:Button runat="server" ID="btnSaveEmployeeRegistration" class="btn btn-success fw-semibold py-2 px-5" Text="Save" ValidationGroup="SubmitGroup" OnClick="btnSaveEmployeeRegistration_Click" />
                                <asp:Button runat="server" class="btn btn-outline-danger fw-semibold  py-2 px-4 ml-3" Text="Reset" />

                            </div>
                        </div>
                    </fieldset>


                </div>
            </div>
        </div>
    </div>
</asp:Content>

