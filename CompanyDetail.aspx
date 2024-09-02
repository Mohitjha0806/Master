<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="CompanyDetail.aspx.cs" Inherits="CompanyDetail" %>

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
                    <h1>Ragister Your Company</h1>
                </div>
                <div class="card-body py-3">
                    <fieldset>
                        <legend>Fill Details
                        </legend>
                        <from class="form-control py-2">
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" Style="border-color: #717FF5;" ID="floatingInput" placeholder="Enter Company Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.9rem;" text="Company Name" for="floatingInput">Enter Company Name</label>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" ID="TextBox1" Style="border-color: #717FF5;" placeholder="Registration Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.9rem;" text="Company Registration Number" for="floatingInput">Company Registration Number</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" Style="font-size: 0.9rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Industry" Value="0" />
                                        <asp:ListItem Text="Madhya Pradesh" />
                                        <asp:ListItem Text="Utter Pradesh" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.9rem; border-color: #717FF5;" class="form-control fw-semibold border-1" ID="TextBox2" placeholder="Contact Person Name" />
                                        <label runat="server" class="fw-semibold" text="Company Registration Number" style="font-size: 0.9rem;" for="floatingInput">Contact Person Name</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.9rem; border-color: #717FF5;" class="form-control fw-semibold" ID="TextBox3" placeholder="Contact Person Number" />
                                        <label runat="server" class="fw-semibold" text="Company Registration Number" style="font-size: 0.9rem;" for="floatingInput">Contact Person Number</label>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.9rem; border-color: #717FF5;" class="form-control fw-semibold" ID="TextBox4" placeholder="Contact Person Email" />
                                        <label runat="server" text="Contact Email" class="fw-semibold" style="font-size: 0.9rem;" for="floatingInput">Contact Person Email</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 ">
                                <div class="col-md-4">
                                    <asp:Label Text="Country" CssClass="form-label fw-semibold" runat="server" />
                                    <asp:DropDownList CssClass="form-select form-control fw-semibold py-3 mt-1" Style="font-size: 0.9rem; border-color: #717FF5;" runat="server" Enabled="false">
                                        <asp:ListItem Text="India" Value="0" />

                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label Text="State" CssClass="form-label fw-semibold" runat="server" />
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" Style="font-size: 0.9rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select State" Value="0" />
                                        <asp:ListItem Text="Madhya Pradesh" />
                                        <asp:ListItem Text="Utter Pradesh" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label Text="City" CssClass="form-label  fw-semibold" Style="font-size: 0.9rem;" runat="server" />
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" Style="font-size: 0.9rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select City" Value="0" />
                                        <asp:ListItem Text="Bhopal" />
                                        <asp:ListItem Text="Lakhnow" />
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" class="form-control fw-semibold" TextMode="MultiLine" Style="font-size: 0.9rem; border-color: #717FF5;" Rows="2" ID="TextBox5" placeholder="Enter Company Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.9rem;" text="Company Name" for="floatingInput">Enter Company Name</label>
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

