<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="CompanyDetail.aspx.cs" Inherits="CompanyDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            font-size: 1rem;
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
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h1 class="fw-semibold">Register Your Company</h1>
                </div>
                <div class="card-body py-3">
                    <fieldset>
                        <legend class="fw-semibold">Required Details
                        </legend>
                        <form class="form-control py-2">
                            <div class="row mt-3">
                                <div class="col-md-4 mt-md-5">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" class="form-control fw-semibold" Style="border-color: #717FF5;" ID="TxtCompanyName"
                                            placeholder="Enter Company Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Name" for="TxtCompanyName">Enter Company Name</label>
                                    </div>
                                     <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtCompanyName" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Name" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="TxtCompanyName" ValidationExpression="^[A-Za-z]+$" runat="server" Display="Dynamic" />
                                </div>
                            

                                <div class="col-md-4 mt-md-5">
                                    <div class="form-floating ">
                                        <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="4" class="form-control fw-semibold" ID="txtCompanyRagistrationNum"
                                            Style="border-color: #717FF5;" placeholder="Registration Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Registration Number" for="floatingInput">Company Registration Number</label>
                                    </div>
                                     <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyRagistrationNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid 4 Digit Registration Number" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyRagistrationNum" ValidationExpression="^[0-9]{4}$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4 mt-md-5">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3" ID="ddlIndustry" Style="font-size: 0.8rem; border-color: #717FF5;" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="Select Industry" Value="0" />

                                    </asp:DropDownList>
                                     <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;" ControlToValidate="ddlIndustry"
                                        InitialValue="0" runat="server" Display="Dynamic" />
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" class="form-control fw-semibold border-1"
                                            MaxLength="50" ID="txtCompanyContectPersonName" placeholder="Contact Person Name" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Contact Person Name</label>
                                    </div>
                                      <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonName" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Name" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonName" ValidationExpression="^[A-Za-z]+(?: [A-Za-z]+)*$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" MaxLength="10" class="form-control fw-semibold"
                                            ID="txtCompanyContectPersonNum" placeholder="Contact Person Number" />
                                        <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" for="floatingInput">Contact Person Number</label>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonNum" runat="server" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ErrorMessage="Enter valid Number" ForeColor="Red" Style="font-size: 0.8rem;"
                                        ControlToValidate="txtCompanyContectPersonNum" ValidationExpression="^[6-9]{1}[0-9]{9}$" runat="server" Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" TextMode="SingleLine" Style="font-size: 0.8rem; border-color: #717FF5;" class="form-control fw-semibold"
                                            ID="txtCompanyContectPersonEmail" placeholder="Contact Person Email" />
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
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1" Style="font-size: 0.8rem; border-color: #717FF5;" ID="ddlCompanyState" runat="server"
                                        OnSelectedIndexChanged="ddlCompanyState_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select State" Value="0" />
                                    </asp:DropDownList>

                                     <asp:RequiredFieldValidator ErrorMessage="Required"
                                        ForeColor="Red"
                                        Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlCompanyState"
                                        InitialValue="0"
                                        runat="server"
                                        Display="Dynamic" />
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList CssClass="form-control form-select fw-semibold py-3 mt-1"
                                        ID="ddlCompanyCity"
                                        Style="font-size: 0.8rem; border-color: #717FF5;"
                                        runat="server">
                                        <asp:ListItem Text="Select City" Value="0" />

                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="Required"
                                        ForeColor="Red"
                                        Style="font-size: 0.8rem;"
                                        ControlToValidate="ddlCompanyCity"
                                        InitialValue="0"
                                        runat="server"
                                        Display="Dynamic" />
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
                            <div class="row-md-3 mt-3">
                                <asp:Button runat="server" class="btn btn-success fw-semibold py-2 px-5" ID="btnRegistrainSubmit" Text="Submit" OnClick="btnRegistrainSubmit_Click" />
                                <asp:Button runat="server" class="btn btn-outline-danger fw-semibold  py-2 px-4 ml-3" Text="Reset" />
                            </div>
                        </form>
                    </fieldset>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h1 class="fw-semibold">Company Details</h1>
                </div>
                <div class="card-body py-1">
                    <fieldset class="table-responsive-md table-responsive">
                        <legend class="fw-semibold">All Companies</legend>
                        <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" CssClass="table table-bordered table-hover bordered border-dark-subtle px-3" DataKeyNames="ID" OnRowCommand="GridView1_RowCommand">
                            <Columns>

                                <asp:TemplateField Visible="false" HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("ID") %>' runat="server" ID="glblID" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Company Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyName")%>' runat="server" ID="glblCompanyName" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Company Registration Number">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyRegistrationNumber")%>' runat="server" ID="glblCompanyRegistrationNumber" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Company Industry">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyIndustry")%>' runat="server" ID="glblCompanyIndustry" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  --%>
                             <asp:TemplateField HeaderText="Company Person Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyPersonName")%>' runat="server" ID="glblCompanyPersonName" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Company Person Numbar">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyPersonNumber")%>' runat="server" ID="glblCompanyPersonNumbar" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Company Person Email">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyPersonEmailID")%>' runat="server" ID="glblCompanyPersonEmail" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                               <asp:TemplateField HeaderText="Company State">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyState")%>' runat="server" ID="glblCompanyState" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Company City">
                                    <ItemTemplate>
                                        <asp:Label Text='<%#Eval("CompanyCity")%>' runat="server" ID="glblCompanyCity" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField Visible="false" HeaderText="Company Adderss">
                                    <ItemTemplate>
                                        <asp:Label CssClass="form-label" Text='<%#Eval("CompanyAddress")%>' runat="server" ID="glblCompanyAdderss" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Update/Delete">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-6 ">
                                                <asp:Button Text="Update" CssClass="btn btn-warning btn-sm" runat="server" CommandName="UpdateRecord" CommandArgument='<%#Eval("ID")%>' />
                                            </div>
                                            <br />
                                            <br />
                                            <div class="col-md-6">
                                                <asp:Button Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="DeleteRecord" runat="server" CommandArgument='<%#Eval("ID")%>' />
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

