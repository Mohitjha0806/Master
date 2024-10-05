<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="ComplaintDeskPage.aspx.cs" Inherits="ComplaintDeskPage" %>

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
                <h1 class="fw-semibold fs-3">Register Your Company</h1>
            </div>
            <div class="card-body p-0">
                <fieldset class="py-3 mt-3">
                    <legend class="fw-semibold">Required Details
                    </legend>
                    <div class="row py-2">
                        <form3 class="form-control table-responsive-md table-responsive">
                            <asp:GridView ID="GridViewComplaintDesk" CssClass="table table-bordered table-hover w-100 bg-transparent  text-nowrap" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("ID") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Complaint Date">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("ComplaintDate") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Complaint Type">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("ComplaintType") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Complaint Against Employee ID">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("ComplaintAgainstEmployeeID") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Your First Name">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("YourFirstName") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Your Last Name">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("YourLastName") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Phone Number">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("PhoneNumber") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("Email") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Complaint Discription">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%# Eval("Address") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </form3>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>

