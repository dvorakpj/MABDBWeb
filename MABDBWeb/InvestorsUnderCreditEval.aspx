﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorsUnderCreditEval.aspx.cs" Inherits="MABDBWeb.InvestorsUnderCreditEval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="InvUnderCrEval">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:HyperLinkField AccessibleHeaderText="Action" DataNavigateUrlFormatString="InvestorDetail.aspx?Id={0}" HeaderText="Action" Target="_self" Text="Detail" />
            <asp:BoundField DataField="MAInvestorId" HeaderText="MAInvestorId" SortExpression="MAInvestorId" />
            <asp:BoundField DataField="InvestorApplicationId" HeaderText="InvestorApplicationId" SortExpression="InvestorApplicationId" />
            <asp:BoundField DataField="PrimaryInvestorID" HeaderText="PrimaryInvestorID" SortExpression="PrimaryInvestorID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="PersonalSalutation" HeaderText="PersonalSalutation" SortExpression="PersonalSalutation" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="OtherNames" HeaderText="OtherNames" SortExpression="OtherNames" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Superfund-Trust_Name" HeaderText="Superfund-Trust_Name" SortExpression="Superfund-Trust_Name" />
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Res_UnitNum" HeaderText="Res_UnitNum" SortExpression="Res_UnitNum" />
            <asp:BoundField DataField="Res_Street1" HeaderText="Res_Street1" SortExpression="Res_Street1" />
            <asp:BoundField DataField="Res_Street2" HeaderText="Res_Street2" SortExpression="Res_Street2" />
            <asp:BoundField DataField="Res_Street3" HeaderText="Res_Street3" SortExpression="Res_Street3" />
            <asp:BoundField DataField="Res_Street4" HeaderText="Res_Street4" SortExpression="Res_Street4" />
            <asp:BoundField DataField="Res_Street5" HeaderText="Res_Street5" SortExpression="Res_Street5" />
            <asp:BoundField DataField="Res_Postcode" HeaderText="Res_Postcode" SortExpression="Res_Postcode" />
            <asp:BoundField DataField="Res_Suburb" HeaderText="Res_Suburb" SortExpression="Res_Suburb" />
            <asp:BoundField DataField="Res_City" HeaderText="Res_City" SortExpression="Res_City" />
            <asp:BoundField DataField="Res_State" HeaderText="Res_State" SortExpression="Res_State" />
            <asp:BoundField DataField="Res_Country" HeaderText="Res_Country" SortExpression="Res_Country" />
            <asp:BoundField DataField="Bill_UnitNum" HeaderText="Bill_UnitNum" SortExpression="Bill_UnitNum" />
            <asp:BoundField DataField="Bill_Street1" HeaderText="Bill_Street1" SortExpression="Bill_Street1" />
            <asp:BoundField DataField="Bill_Street2" HeaderText="Bill_Street2" SortExpression="Bill_Street2" />
            <asp:BoundField DataField="Bill_Street3" HeaderText="Bill_Street3" SortExpression="Bill_Street3" />
            <asp:BoundField DataField="Bill_Street4" HeaderText="Bill_Street4" SortExpression="Bill_Street4" />
            <asp:BoundField DataField="Bill_Street5" HeaderText="Bill_Street5" SortExpression="Bill_Street5" />
            <asp:BoundField DataField="Bill_Postcode" HeaderText="Bill_Postcode" SortExpression="Bill_Postcode" />
            <asp:BoundField DataField="Bill_Suburb" HeaderText="Bill_Suburb" SortExpression="Bill_Suburb" />
            <asp:BoundField DataField="Bill_City" HeaderText="Bill_City" SortExpression="Bill_City" />
            <asp:BoundField DataField="Bill_State" HeaderText="Bill_State" SortExpression="Bill_State" />
            <asp:BoundField DataField="Bill_Country" HeaderText="Bill_Country" SortExpression="Bill_Country" />
            <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
            <asp:BoundField DataField="PhoneMobile" HeaderText="PhoneMobile" SortExpression="PhoneMobile" />
            <asp:BoundField DataField="PhoneHome" HeaderText="PhoneHome" SortExpression="PhoneHome" />
            <asp:BoundField DataField="PhoneWork" HeaderText="PhoneWork" SortExpression="PhoneWork" />
            <asp:BoundField DataField="PhoneOther" HeaderText="PhoneOther" SortExpression="PhoneOther" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="EmailOther" HeaderText="EmailOther" SortExpression="EmailOther" />
            <asp:BoundField DataField="ContactComments" HeaderText="ContactComments" SortExpression="ContactComments" />
            <asp:BoundField DataField="AssquireStatus" HeaderText="AssquireStatus" SortExpression="AssquireStatus" />
            <asp:BoundField DataField="AppliedDate" HeaderText="AppliedDate" SortExpression="AppliedDate" />
            <asp:BoundField DataField="AssquireApprovedDate" HeaderText="AssquireApprovedDate" SortExpression="AssquireApprovedDate" />
            <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
            <asp:BoundField DataField="Updated" HeaderText="Updated" SortExpression="Updated" />
            <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
            <asp:BoundField DataField="Gender1" HeaderText="Gender1" SortExpression="Gender1" />
            <asp:BoundField DataField="ABN" HeaderText="ABN" SortExpression="ABN" />
            <asp:BoundField DataField="ACN" HeaderText="ACN" SortExpression="ACN" />
            <asp:BoundField DataField="FaxNo" HeaderText="FaxNo" SortExpression="FaxNo" />
            <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
            <asp:BoundField DataField="AppliedPrtyVal" HeaderText="AppliedPrtyVal" SortExpression="AppliedPrtyVal" />
            <asp:BoundField DataField="CreditDecisionDate" HeaderText="CreditDecisionDate" SortExpression="CreditDecisionDate" />
            <asp:BoundField DataField="AssquireApprovedPrtyVal" HeaderText="AssquireApprovedPrtyVal" SortExpression="AssquireApprovedPrtyVal" />
            <asp:BoundField DataField="CreditDecisionBy" HeaderText="CreditDecisionBy" SortExpression="CreditDecisionBy" />
            <asp:BoundField DataField="CreditDecision" HeaderText="CreditDecision" SortExpression="CreditDecision" />
            <asp:BoundField DataField="CreditDecisionComments" HeaderText="CreditDecisionComments" SortExpression="CreditDecisionComments" />
            <asp:BoundField DataField="CreditDecisionInformed" HeaderText="CreditDecisionInformed" SortExpression="CreditDecisionInformed" />
            <asp:BoundField DataField="CreditDecisionInformedBy" HeaderText="CreditDecisionInformedBy" SortExpression="CreditDecisionInformedBy" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="InvUnderCrEval" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetInvUnderCrEvalDataBy" TypeName="DataUtils.InvestorDSTableAdapters.InvestorTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_MAInvestorId" Type="String" />
            <asp:Parameter Name="Original_InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="Original_PrimaryInvestorID" Type="Int32" />
            <asp:Parameter Name="Original_Title" Type="String" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
            <asp:Parameter Name="Original_OtherNames" Type="String" />
            <asp:Parameter Name="Original_LastName" Type="String" />
            <asp:Parameter Name="p2" Type="String" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_ABN" Type="String" />
            <asp:Parameter Name="Original_ACN" Type="String" />
            <asp:Parameter Name="Original_DOB" Type="DateTime" />
            <asp:Parameter Name="Original_Gender" Type="String" />
            <asp:Parameter Name="Original_Res_UnitNum" Type="String" />
            <asp:Parameter Name="Original_Res_Street1" Type="String" />
            <asp:Parameter Name="Original_Res_Street2" Type="String" />
            <asp:Parameter Name="Original_Res_Street3" Type="String" />
            <asp:Parameter Name="Original_Res_Street4" Type="String" />
            <asp:Parameter Name="Original_Res_Street5" Type="String" />
            <asp:Parameter Name="Original_Res_Postcode" Type="Int16" />
            <asp:Parameter Name="Original_Res_Suburb" Type="String" />
            <asp:Parameter Name="Original_Res_City" Type="String" />
            <asp:Parameter Name="Original_Res_State" Type="String" />
            <asp:Parameter Name="Original_Res_Country" Type="String" />
            <asp:Parameter Name="Original_Bill_UnitNum" Type="String" />
            <asp:Parameter Name="Original_Bill_Street1" Type="String" />
            <asp:Parameter Name="Original_Bill_Street2" Type="String" />
            <asp:Parameter Name="Original_Bill_Street3" Type="String" />
            <asp:Parameter Name="Original_Bill_Street4" Type="String" />
            <asp:Parameter Name="Original_Bill_Street5" Type="String" />
            <asp:Parameter Name="Original_Bill_Postcode" Type="String" />
            <asp:Parameter Name="Original_Bill_Suburb" Type="String" />
            <asp:Parameter Name="Original_Bill_City" Type="String" />
            <asp:Parameter Name="Original_Bill_State" Type="String" />
            <asp:Parameter Name="Original_Bill_Country" Type="String" />
            <asp:Parameter Name="Original_Comments" Type="String" />
            <asp:Parameter Name="Original_PhoneMobile" Type="String" />
            <asp:Parameter Name="Original_PhoneHome" Type="String" />
            <asp:Parameter Name="Original_PhoneWork" Type="String" />
            <asp:Parameter Name="Original_PhoneOther" Type="String" />
            <asp:Parameter Name="Original_FaxNo" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
            <asp:Parameter Name="Original_EmailOther" Type="String" />
            <asp:Parameter Name="Original_Website" Type="String" />
            <asp:Parameter Name="Original_ContactComments" Type="String" />
            <asp:Parameter Name="Original_AssquireStatus" Type="String" />
            <asp:Parameter Name="Original_AppliedDate" Type="DateTime" />
            <asp:Parameter Name="Original_AppliedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="Original_CreditDecisionDate" Type="DateTime" />
            <asp:Parameter Name="Original_AssquireApprovedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="Original_CreditDecisionBy" Type="String" />
            <asp:Parameter Name="Original_CreditDecision" Type="String" />
            <asp:Parameter Name="Original_CreditDecisionComments" Type="String" />
            <asp:Parameter Name="Original_CreditDecisionInformed" Type="DateTime" />
            <asp:Parameter Name="Original_CreditDecisionInformedBy" Type="String" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MAInvestorId" Type="String" />
            <asp:Parameter Name="InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="PrimaryInvestorID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="OtherNames" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="p1" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ABN" Type="String" />
            <asp:Parameter Name="ACN" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Res_UnitNum" Type="String" />
            <asp:Parameter Name="Res_Street1" Type="String" />
            <asp:Parameter Name="Res_Street2" Type="String" />
            <asp:Parameter Name="Res_Street3" Type="String" />
            <asp:Parameter Name="Res_Street4" Type="String" />
            <asp:Parameter Name="Res_Street5" Type="String" />
            <asp:Parameter Name="Res_Postcode" Type="Int16" />
            <asp:Parameter Name="Res_Suburb" Type="String" />
            <asp:Parameter Name="Res_City" Type="String" />
            <asp:Parameter Name="Res_State" Type="String" />
            <asp:Parameter Name="Res_Country" Type="String" />
            <asp:Parameter Name="Bill_UnitNum" Type="String" />
            <asp:Parameter Name="Bill_Street1" Type="String" />
            <asp:Parameter Name="Bill_Street2" Type="String" />
            <asp:Parameter Name="Bill_Street3" Type="String" />
            <asp:Parameter Name="Bill_Street4" Type="String" />
            <asp:Parameter Name="Bill_Street5" Type="String" />
            <asp:Parameter Name="Bill_Postcode" Type="String" />
            <asp:Parameter Name="Bill_Suburb" Type="String" />
            <asp:Parameter Name="Bill_City" Type="String" />
            <asp:Parameter Name="Bill_State" Type="String" />
            <asp:Parameter Name="Bill_Country" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="PhoneMobile" Type="String" />
            <asp:Parameter Name="PhoneHome" Type="String" />
            <asp:Parameter Name="PhoneWork" Type="String" />
            <asp:Parameter Name="PhoneOther" Type="String" />
            <asp:Parameter Name="FaxNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="EmailOther" Type="String" />
            <asp:Parameter Name="Website" Type="String" />
            <asp:Parameter Name="ContactComments" Type="String" />
            <asp:Parameter Name="AssquireStatus" Type="String" />
            <asp:Parameter Name="AppliedDate" Type="DateTime" />
            <asp:Parameter Name="AppliedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="CreditDecisionDate" Type="DateTime" />
            <asp:Parameter Name="AssquireApprovedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="CreditDecisionBy" Type="String" />
            <asp:Parameter Name="CreditDecision" Type="String" />
            <asp:Parameter Name="CreditDecisionComments" Type="String" />
            <asp:Parameter Name="CreditDecisionInformed" Type="DateTime" />
            <asp:Parameter Name="CreditDecisionInformedBy" Type="String" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="Updated" Type="DateTime" />
            <asp:Parameter Name="UpdatedBy" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MAInvestorId" Type="String" />
            <asp:Parameter Name="InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="PrimaryInvestorID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="OtherNames" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="p1" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ABN" Type="String" />
            <asp:Parameter Name="ACN" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Res_UnitNum" Type="String" />
            <asp:Parameter Name="Res_Street1" Type="String" />
            <asp:Parameter Name="Res_Street2" Type="String" />
            <asp:Parameter Name="Res_Street3" Type="String" />
            <asp:Parameter Name="Res_Street4" Type="String" />
            <asp:Parameter Name="Res_Street5" Type="String" />
            <asp:Parameter Name="Res_Postcode" Type="Int16" />
            <asp:Parameter Name="Res_Suburb" Type="String" />
            <asp:Parameter Name="Res_City" Type="String" />
            <asp:Parameter Name="Res_State" Type="String" />
            <asp:Parameter Name="Res_Country" Type="String" />
            <asp:Parameter Name="Bill_UnitNum" Type="String" />
            <asp:Parameter Name="Bill_Street1" Type="String" />
            <asp:Parameter Name="Bill_Street2" Type="String" />
            <asp:Parameter Name="Bill_Street3" Type="String" />
            <asp:Parameter Name="Bill_Street4" Type="String" />
            <asp:Parameter Name="Bill_Street5" Type="String" />
            <asp:Parameter Name="Bill_Postcode" Type="String" />
            <asp:Parameter Name="Bill_Suburb" Type="String" />
            <asp:Parameter Name="Bill_City" Type="String" />
            <asp:Parameter Name="Bill_State" Type="String" />
            <asp:Parameter Name="Bill_Country" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="PhoneMobile" Type="String" />
            <asp:Parameter Name="PhoneHome" Type="String" />
            <asp:Parameter Name="PhoneWork" Type="String" />
            <asp:Parameter Name="PhoneOther" Type="String" />
            <asp:Parameter Name="FaxNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="EmailOther" Type="String" />
            <asp:Parameter Name="Website" Type="String" />
            <asp:Parameter Name="ContactComments" Type="String" />
            <asp:Parameter Name="AssquireStatus" Type="String" />
            <asp:Parameter Name="AppliedDate" Type="DateTime" />
            <asp:Parameter Name="AppliedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="CreditDecisionDate" Type="DateTime" />
            <asp:Parameter Name="AssquireApprovedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="CreditDecisionBy" Type="String" />
            <asp:Parameter Name="CreditDecision" Type="String" />
            <asp:Parameter Name="CreditDecisionComments" Type="String" />
            <asp:Parameter Name="CreditDecisionInformed" Type="DateTime" />
            <asp:Parameter Name="CreditDecisionInformedBy" Type="String" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="Updated" Type="DateTime" />
            <asp:Parameter Name="UpdatedBy" Type="DateTime" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_MAInvestorId" Type="String" />
            <asp:Parameter Name="Original_InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="Original_PrimaryInvestorID" Type="Int32" />
            <asp:Parameter Name="Original_Title" Type="String" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
            <asp:Parameter Name="Original_OtherNames" Type="String" />
            <asp:Parameter Name="Original_LastName" Type="String" />
            <asp:Parameter Name="p2" Type="String" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_ABN" Type="String" />
            <asp:Parameter Name="Original_ACN" Type="String" />
            <asp:Parameter Name="Original_DOB" Type="DateTime" />
            <asp:Parameter Name="Original_Gender" Type="String" />
            <asp:Parameter Name="Original_Res_UnitNum" Type="String" />
            <asp:Parameter Name="Original_Res_Street1" Type="String" />
            <asp:Parameter Name="Original_Res_Street2" Type="String" />
            <asp:Parameter Name="Original_Res_Street3" Type="String" />
            <asp:Parameter Name="Original_Res_Street4" Type="String" />
            <asp:Parameter Name="Original_Res_Street5" Type="String" />
            <asp:Parameter Name="Original_Res_Postcode" Type="Int16" />
            <asp:Parameter Name="Original_Res_Suburb" Type="String" />
            <asp:Parameter Name="Original_Res_City" Type="String" />
            <asp:Parameter Name="Original_Res_State" Type="String" />
            <asp:Parameter Name="Original_Res_Country" Type="String" />
            <asp:Parameter Name="Original_Bill_UnitNum" Type="String" />
            <asp:Parameter Name="Original_Bill_Street1" Type="String" />
            <asp:Parameter Name="Original_Bill_Street2" Type="String" />
            <asp:Parameter Name="Original_Bill_Street3" Type="String" />
            <asp:Parameter Name="Original_Bill_Street4" Type="String" />
            <asp:Parameter Name="Original_Bill_Street5" Type="String" />
            <asp:Parameter Name="Original_Bill_Postcode" Type="String" />
            <asp:Parameter Name="Original_Bill_Suburb" Type="String" />
            <asp:Parameter Name="Original_Bill_City" Type="String" />
            <asp:Parameter Name="Original_Bill_State" Type="String" />
            <asp:Parameter Name="Original_Bill_Country" Type="String" />
            <asp:Parameter Name="Original_Comments" Type="String" />
            <asp:Parameter Name="Original_PhoneMobile" Type="String" />
            <asp:Parameter Name="Original_PhoneHome" Type="String" />
            <asp:Parameter Name="Original_PhoneWork" Type="String" />
            <asp:Parameter Name="Original_PhoneOther" Type="String" />
            <asp:Parameter Name="Original_FaxNo" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
            <asp:Parameter Name="Original_EmailOther" Type="String" />
            <asp:Parameter Name="Original_Website" Type="String" />
            <asp:Parameter Name="Original_ContactComments" Type="String" />
            <asp:Parameter Name="Original_AssquireStatus" Type="String" />
            <asp:Parameter Name="Original_AppliedDate" Type="DateTime" />
            <asp:Parameter Name="Original_AppliedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="Original_CreditDecisionDate" Type="DateTime" />
            <asp:Parameter Name="Original_AssquireApprovedPrtyVal" Type="Decimal" />
            <asp:Parameter Name="Original_CreditDecisionBy" Type="String" />
            <asp:Parameter Name="Original_CreditDecision" Type="String" />
            <asp:Parameter Name="Original_CreditDecisionComments" Type="String" />
            <asp:Parameter Name="Original_CreditDecisionInformed" Type="DateTime" />
            <asp:Parameter Name="Original_CreditDecisionInformedBy" Type="String" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
