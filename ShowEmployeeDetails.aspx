<%@ Page Title="" Language="C#" MasterPageFile="~/CommonPage.master" AutoEventWireup="true" CodeFile="ShowEmployeeDetails.aspx.cs" Inherits="ShowEmployeeDetails" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card">
        <div runat="server" class="card-header">
            <hr class="w-auto py-2" />
            <h1 class="fw-semibold fs-3">Find Employee By CRN</h1>
        </div>
        <div class="card-body">
            <div class="row-md-2 mt-3">
                <div class="col-md-4">
                    <div class="mb-3">

                        <div class="form-floating">
                            <asp:TextBox runat="server" TextMode="SingleLine" MaxLength="4" class="form-control fw-semibold" ID="txtCompanyRegistrationNumber"
                                Style="border-color: #717FF5;" placeholder="Registration Number" />
                            <label runat="server" class="fw-semibold" style="font-size: 0.8rem;" text="Company Registration Number" for="floatingInput">Enter Company Registration Number</label>
                        </div>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="mb-3">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="True" CssClass="table table-bordered table-striped">
                </asp:GridView>
            </div>
        </div>
    <div runat="server" class="card-header">
        <hr class="w-auto py-2" />
        <h1 class="fw-semibold fs-3">Employee Details</h1>
    </div>
    <div runat="server" class="card-body py-3">
        <fieldset class="py-3">
            <legend class="fw-semibold">Employees</legend>
            <div class="row py-2">
                <form2 class="form-control table-responsive-md table-responsive">
                    <asp:GridView runat="server" ID="GridEmployeeData" AutoGenerateColumns="false" CssClass="table table-bordered table-hover w-100 bg-transparent">
                        <Columns>
                            <asp:TemplateField Visible="false" HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%#Eval("ID") %>' runat="server" ID="glblID" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" HeaderText="CRN">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%#Eval("CompanyRegistrationNumber")%>' runat="server" ID="glblCompanyRegistrationNumber" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="true" HeaderStyle-CssClass="text-center text-nowrap" HeaderText="EmployeeID">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 text-nowrap" Text='<%#Eval("EmployeeID")%>' runat="server" ID="glblEmployeeID" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Select Employee Department">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("SelectEmployeeDepartment")%>' runat="server" ID="glblSelectEmployeeDepartment" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Select Employee Position">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("SelectEmployeePosition")%>' runat="server" ID="SelectEmployeePosition" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Date Of Joining">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("DateOfJJoining")%>' runat="server" ID="glblDateOfJJoining" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Employee Full Name">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("EmployeeFullName")%>' runat="server" ID="glblEmployeeFullName" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Employee Number">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("EmployeeNumber")%>' runat="server" ID="glblEmployeeNumber" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Employee Email">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("EmployeeEmail")%>' runat="server" ID="glblEmployeeEmail" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" Visible="false" HeaderText="Select Employee Gender">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("SelectEmployeeGender")%>' runat="server" ID="glblSelectEmployeeGender" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" Visible="false" HeaderText="Select Employee State">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("SelectEmployeeState")%>' runat="server" ID="glblSelectEmployeeState" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" Visible="false" HeaderText="Select Employee City">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("SelectEmployeeCity")%>' runat="server" ID="glblSelectEmployeeCity" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" Visible="false" HeaderText="Employee Address">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("EmployeeAddress")%>' runat="server" ID="glblEmployeeAddress" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" Visible="false" HeaderText="Employee CTC">
                                <ItemTemplate>
                                    <asp:Label CssClass="d-flex justify-content-center align-items-center px-2" Text='<%#Eval("EmployeeCTC")%>' runat="server" ID="glblEmployeeCTC" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-CssClass="text-center text-nowrap" HeaderText="Update/Delete">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:Button Text="Update" CssClass="btn btn-warning btn-sm me-2" runat="server" CommandName="UpdateRecord" CommandArgument='<%#Eval("ID")%>' IsPostBack="true" />
                                        <asp:Button Text="Delete" CssClass="btn btn-danger btn-sm ms-2" runat="server" CommandName="DeleteRecord" CommandArgument='<%#Eval("ID")%>' IsPostBack="true" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                        </Columns>
                    </asp:GridView>
                </form2>
            </div>

        </fieldset>
    </div>
    </div>

</asp:Content>

