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
                        <legend>Fill Company Details
                        </legend>
                        <from class="form-control py-2">
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" Style="border-color: #717FF5;" ID="TxtCompanyName" placeholder="Enter Company Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="TxtCompanyName">Enter Company Name</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtCompanyName" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Name" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtCompanyName" ValidationExpression="^[A-Za-z]+$" runat="server" Display="Dynamic" />
                                </div>


                                <div class="col-md-4">
                                    <div class="form-floating ">
                                        <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="8" class="form-control fw-semibold" ID="txtCompanyRagistrationNum" Style="border-color: #717FF5;" placeholder="Registration Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Registration Number" for="floatingInput">Company Registration Number</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyRagistrationNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Registration Number" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyRagistrationNum" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlIndustry" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server">
                                        <asp:ListItem Text="Select Industry" Value="0" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="1" />
                                        <asp:ListItem Text="Utter Pradesh" Value="2" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlIndustry" InitialValue="0" runat="server" Display="Dynamic" />
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" class="form-control fw-semibold border-1" MaxLength="50" ID="txtCompanyContectPersonName" placeholder="Contact Person Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Contact Person Name</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonName" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Name" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonName" ValidationExpression="^[A-Za-z]+(?: [A-Za-z]+)*$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" MaxLength="10" class="form-control fw-semibold" ID="txtCompanyContectPersonNum" placeholder="Contact Person Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Contact Person Number</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Number" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonNum" ValidationExpression="^[6-9]{1}[0-9]{9}$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" class="form-control fw-semibold" ID="txtCompanyContectPersonEmail" placeholder="Contact Person Email" />
                                        <label runat="server" text="Contact Email" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Contact Person Email</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtCompanyContectPersonEmail" runat="server" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ErrorMessage="Enter valid Email" ForeColor="Red" Style="font-size: 0.8rem;"
                                            ControlToValidate="txtCompanyContectPersonEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" runat="server" Display="Dynamic" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 ">
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-select form-control fw-semibold py-3 mt-1" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server" Enabled="false">
                                        <asp:ListItem Text="India" Value="0" />
                                    </asp:DropDownList>

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
                                <div class="col-md-12">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" class="form-control fw-semibold" MaxLength="250" TextMode="MultiLine" Style="font-size: 0.8rem; border-color: #717FF5;" Rows="2" ID="txtCompanyAddress" placeholder="Enter Company Address" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="floatingInput">Enter Company Address</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="txtCompanyAddress" runat="server" Display="Dynamic" />
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

