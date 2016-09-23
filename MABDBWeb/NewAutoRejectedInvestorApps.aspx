<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewAutoRejectedInvestorApps.aspx.cs" Inherits="MABDBWeb.NewAutoRejectedInvestorApps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [vw_NewInvestorAppAutoRejectedNotInformed]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="App Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:HyperLinkField HeaderText="Hyprelink" Text="Detail" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/InvestorApplicationDetail.aspx?Id={0}" />
            <asp:CommandField AccessibleHeaderText="Detail" ButtonType="Button" EditText="Detail" HeaderText="Detail" ShowEditButton="True" />
            <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" SortExpression="EntryDate" />
            <asp:BoundField DataField="ApplicantType" HeaderText="App Type" SortExpression="ApplicantType" />
            <asp:BoundField DataField="Primary_FirstName" HeaderText="Primary - First Name" SortExpression="Primary_FirstName" />
            <asp:BoundField DataField="Primary_OtherNames" HeaderText="Primary - Other Names" SortExpression="Primary_OtherNames" />
            <asp:BoundField DataField="Primary_LastName" HeaderText="Primary - Last Name" SortExpression="Primary_LastName" />
            <asp:BoundField DataField="Primary_DOB" HeaderText="Primary_DOB" SortExpression="Primary_DOB" />
            <asp:BoundField DataField="Primary_Gender" HeaderText="Primary_Gender" SortExpression="Primary_Gender" />
            <asp:BoundField DataField="Other_FirstName" HeaderText="Other - First Name" SortExpression="Other_FirstName" />
            <asp:BoundField DataField="Other_OtherNames" HeaderText="Other - Other Names" SortExpression="Other_OtherNames" />
            <asp:BoundField DataField="Other_LastName" HeaderText="Other - Last Name" SortExpression="Other_LastName" />
            <asp:BoundField DataField="Other_DOB" HeaderText="Other - DOB" SortExpression="Other_DOB" />
            <asp:BoundField DataField="Other_Gender" HeaderText="Other - Gender" SortExpression="Other_Gender" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="CondApproved" HeaderText="CondApproved" SortExpression="CondApproved" />
            <asp:BoundField DataField="CondApprovedBy" HeaderText="CondApprovedBy" SortExpression="CondApprovedBy" />
            <asp:BoundField DataField="HasReqestedPriority" HeaderText="HasReqestedPriority" SortExpression="HasReqestedPriority" />
            <asp:BoundField DataField="AutoRejected" HeaderText="AutoRejected" SortExpression="AutoRejected" />
            <asp:BoundField DataField="AutoRejecetedBy" HeaderText="AutoRejecetedBy" SortExpression="AutoRejecetedBy" />
            <asp:BoundField DataField="AutoRejectedInformed" HeaderText="AutoRejectedInformed" SortExpression="AutoRejectedInformed" />
            <asp:BoundField DataField="AutoRejectedInformedBy" HeaderText="AutoRejectedInformedBy" SortExpression="AutoRejectedInformedBy" />
            <asp:BoundField DataField="AutoAccepted" HeaderText="AutoAccepted" SortExpression="AutoAccepted" />
            <asp:BoundField DataField="AutoAcceptedBy" HeaderText="AutoAcceptedBy" SortExpression="AutoAcceptedBy" />
            <asp:BoundField DataField="AutoAcceptedInformed" HeaderText="AutoAcceptedInformed" SortExpression="AutoAcceptedInformed" />
            <asp:BoundField DataField="AutoAcceptedInformedBy" HeaderText="AutoAcceptedInformedBy" SortExpression="AutoAcceptedInformedBy" />
        </Columns>
    </asp:GridView>
</asp:Content>
