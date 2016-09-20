﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewAutoRejectedInvestorApps.aspx.cs" Inherits="MABDBWeb.NewAutoRejectedInvestorApps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [vw_NewInvestorAppAutoAcceptedNotInformed]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="ApplicantType" HeaderText="ApplicantType" SortExpression="ApplicantType" />
            <asp:BoundField DataField="Primary_FirstName" HeaderText="Primary_FirstName" SortExpression="Primary_FirstName" />
            <asp:BoundField DataField="Primary_OtherNames" HeaderText="Primary_OtherNames" SortExpression="Primary_OtherNames" />
            <asp:BoundField DataField="Primary_LastName" HeaderText="Primary_LastName" SortExpression="Primary_LastName" />
            <asp:BoundField DataField="Primary_AUCitizenStat" HeaderText="Primary_AUCitizenStat" SortExpression="Primary_AUCitizenStat" />
            <asp:BoundField DataField="Primary_Dependants" HeaderText="Primary_Dependants" SortExpression="Primary_Dependants" />
            <asp:BoundField DataField="Other_FirstName" HeaderText="Other_FirstName" SortExpression="Other_FirstName" />
            <asp:BoundField DataField="Other_OtherNames" HeaderText="Other_OtherNames" SortExpression="Other_OtherNames" />
            <asp:BoundField DataField="Other_LastName" HeaderText="Other_LastName" SortExpression="Other_LastName" />
            <asp:BoundField DataField="Other_DOB" HeaderText="Other_DOB" SortExpression="Other_DOB" />
            <asp:BoundField DataField="Other_Gender" HeaderText="Other_Gender" SortExpression="Other_Gender" />
            <asp:BoundField DataField="Other_AUCitizenStat" HeaderText="Other_AUCitizenStat" SortExpression="Other_AUCitizenStat" />
            <asp:BoundField DataField="Other_Dependants" HeaderText="Other_Dependants" SortExpression="Other_Dependants" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="Primary_Res_Street1" HeaderText="Primary_Res_Street1" SortExpression="Primary_Res_Street1" />
            <asp:BoundField DataField="Primary_Res_Street2" HeaderText="Primary_Res_Street2" SortExpression="Primary_Res_Street2" />
            <asp:BoundField DataField="Primary_Res_City" HeaderText="Primary_Res_City" SortExpression="Primary_Res_City" />
            <asp:BoundField DataField="Primary_Res_PostCode" HeaderText="Primary_Res_PostCode" SortExpression="Primary_Res_PostCode" />
            <asp:BoundField DataField="Primary_Res_State" HeaderText="Primary_Res_State" SortExpression="Primary_Res_State" />
            <asp:BoundField DataField="Primary_Res_Country" HeaderText="Primary_Res_Country" SortExpression="Primary_Res_Country" />
            <asp:BoundField DataField="Primary_CurrResidStatus" HeaderText="Primary_CurrResidStatus" SortExpression="Primary_CurrResidStatus" />
            <asp:BoundField DataField="PrevResStatus" HeaderText="PrevResStatus" SortExpression="PrevResStatus" />
            <asp:BoundField DataField="CurrOccupType" HeaderText="CurrOccupType" SortExpression="CurrOccupType" />
            <asp:BoundField DataField="CurrEmploymentStatus" HeaderText="CurrEmploymentStatus" SortExpression="CurrEmploymentStatus" />
            <asp:BoundField DataField="IsSmoker" HeaderText="IsSmoker" SortExpression="IsSmoker" />
            <asp:BoundField DataField="HasPrivateHealthIns" HeaderText="HasPrivateHealthIns" SortExpression="HasPrivateHealthIns" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
            <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" />
            <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" />
            <asp:BoundField DataField="InvestorApplicant_AssquireInvestor" HeaderText="InvestorApplicant_AssquireInvestor" SortExpression="InvestorApplicant_AssquireInvestor" />
            <asp:BoundField DataField="InvestorApplication_Gender" HeaderText="InvestorApplication_Gender" SortExpression="InvestorApplication_Gender" />
            <asp:BoundField DataField="Primary_IncomeMoAT" HeaderText="Primary_IncomeMoAT" SortExpression="Primary_IncomeMoAT" />
            <asp:BoundField DataField="Other_IncomeMoAT" HeaderText="Other_IncomeMoAT" SortExpression="Other_IncomeMoAT" />
            <asp:BoundField DataField="HouseholdIncomeGrossPA" HeaderText="HouseholdIncomeGrossPA" SortExpression="HouseholdIncomeGrossPA" />
            <asp:BoundField DataField="LookingLocation" HeaderText="LookingLocation" SortExpression="LookingLocation" />
            <asp:BoundField DataField="FoundLocation" HeaderText="FoundLocation" SortExpression="FoundLocation" />
            <asp:BoundField DataField="Property_Street1" HeaderText="Property_Street1" SortExpression="Property_Street1" />
            <asp:BoundField DataField="Property_Street2" HeaderText="Property_Street2" SortExpression="Property_Street2" />
            <asp:BoundField DataField="Property_City" HeaderText="Property_City" SortExpression="Property_City" />
            <asp:BoundField DataField="Property_Vendor" HeaderText="Property_Vendor" SortExpression="Property_Vendor" />
            <asp:BoundField DataField="EstSpend" HeaderText="EstSpend" SortExpression="EstSpend" />
            <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" SortExpression="EntryDate" />
            <asp:BoundField DataField="Primary_DOB" HeaderText="Primary_DOB" SortExpression="Primary_DOB" />
            <asp:BoundField DataField="CreatedUTC" HeaderText="CreatedUTC" SortExpression="CreatedUTC" />
            <asp:BoundField DataField="CondApproved" HeaderText="CondApproved" SortExpression="CondApproved" />
            <asp:BoundField DataField="Property_PostCode" HeaderText="Property_PostCode" SortExpression="Property_PostCode" />
            <asp:BoundField DataField="Property_State" HeaderText="Property_State" SortExpression="Property_State" />
            <asp:BoundField DataField="Property_Country" HeaderText="Property_Country" SortExpression="Property_Country" />
            <asp:BoundField DataField="Property_AgentDetails" HeaderText="Property_AgentDetails" SortExpression="Property_AgentDetails" />
            <asp:BoundField DataField="HasAgreedPrivacy" HeaderText="HasAgreedPrivacy" SortExpression="HasAgreedPrivacy" />
            <asp:BoundField DataField="Primary_Gender" HeaderText="Primary_Gender" SortExpression="Primary_Gender" />
            <asp:BoundField DataField="DesiredPropertyAddr" HeaderText="DesiredPropertyAddr" SortExpression="DesiredPropertyAddr" />
            <asp:BoundField DataField="Primary_MaritalStats" HeaderText="Primary_MaritalStats" SortExpression="Primary_MaritalStats" />
            <asp:BoundField DataField="Other_MaritalStats" HeaderText="Other_MaritalStats" SortExpression="Other_MaritalStats" />
            <asp:BoundField DataField="Other_Email" HeaderText="Other_Email" SortExpression="Other_Email" />
            <asp:BoundField DataField="Primary_HomePhone" HeaderText="Primary_HomePhone" SortExpression="Primary_HomePhone" />
            <asp:BoundField DataField="Other_HomePhone" HeaderText="Other_HomePhone" SortExpression="Other_HomePhone" />
            <asp:BoundField DataField="Other_Mobile" HeaderText="Other_Mobile" SortExpression="Other_Mobile" />
            <asp:BoundField DataField="Primary_PassportNo" HeaderText="Primary_PassportNo" SortExpression="Primary_PassportNo" />
            <asp:BoundField DataField="Other_PassportNo" HeaderText="Other_PassportNo" SortExpression="Other_PassportNo" />
            <asp:BoundField DataField="Primary_PassportCountry" HeaderText="Primary_PassportCountry" SortExpression="Primary_PassportCountry" />
            <asp:BoundField DataField="Other_PassportCountry" HeaderText="Other_PassportCountry" SortExpression="Other_PassportCountry" />
            <asp:BoundField DataField="Primary_DriversLicenceNo" HeaderText="Primary_DriversLicenceNo" SortExpression="Primary_DriversLicenceNo" />
            <asp:BoundField DataField="Other_DriversLicenceNo" HeaderText="Other_DriversLicenceNo" SortExpression="Other_DriversLicenceNo" />
            <asp:BoundField DataField="Primary_DriversLicenceState" HeaderText="Primary_DriversLicenceState" SortExpression="Primary_DriversLicenceState" />
            <asp:BoundField DataField="Other_DriversLicenceState" HeaderText="Other_DriversLicenceState" SortExpression="Other_DriversLicenceState" />
            <asp:BoundField DataField="Other_Res_Street2" HeaderText="Other_Res_Street2" SortExpression="Other_Res_Street2" />
            <asp:BoundField DataField="Other_Res_City" HeaderText="Other_Res_City" SortExpression="Other_Res_City" />
            <asp:BoundField DataField="Other_Res_PostCode" HeaderText="Other_Res_PostCode" SortExpression="Other_Res_PostCode" />
            <asp:BoundField DataField="Other_Res_State" HeaderText="Other_Res_State" SortExpression="Other_Res_State" />
            <asp:BoundField DataField="Other_Res_Country" HeaderText="Other_Res_Country" SortExpression="Other_Res_Country" />
            <asp:BoundField DataField="Other_CurrResidStatus" HeaderText="Other_CurrResidStatus" SortExpression="Other_CurrResidStatus" />
            <asp:BoundField DataField="PrimPrev_Res_Street1" HeaderText="PrimPrev_Res_Street1" SortExpression="PrimPrev_Res_Street1" />
            <asp:BoundField DataField="PrimPrev_Res_Street2" HeaderText="PrimPrev_Res_Street2" SortExpression="PrimPrev_Res_Street2" />
            <asp:BoundField DataField="PrimPrev_Res_City" HeaderText="PrimPrev_Res_City" SortExpression="PrimPrev_Res_City" />
            <asp:BoundField DataField="PrimPrev_Res_PostCode" HeaderText="PrimPrev_Res_PostCode" SortExpression="PrimPrev_Res_PostCode" />
            <asp:BoundField DataField="PrimPrev_Res_State" HeaderText="PrimPrev_Res_State" SortExpression="PrimPrev_Res_State" />
            <asp:BoundField DataField="PrimPrev_Res_Country" HeaderText="PrimPrev_Res_Country" SortExpression="PrimPrev_Res_Country" />
            <asp:BoundField DataField="OthPrev_Res_Street1" HeaderText="OthPrev_Res_Street1" SortExpression="OthPrev_Res_Street1" />
            <asp:BoundField DataField="OthPrev_Res_Street2" HeaderText="OthPrev_Res_Street2" SortExpression="OthPrev_Res_Street2" />
            <asp:BoundField DataField="OthPrev_Res_City" HeaderText="OthPrev_Res_City" SortExpression="OthPrev_Res_City" />
            <asp:BoundField DataField="OthPrev_Res_PostCode" HeaderText="OthPrev_Res_PostCode" SortExpression="OthPrev_Res_PostCode" />
            <asp:BoundField DataField="OthPrev_Res_State" HeaderText="OthPrev_Res_State" SortExpression="OthPrev_Res_State" />
            <asp:BoundField DataField="OthPrev_Res_Country" HeaderText="OthPrev_Res_Country" SortExpression="OthPrev_Res_Country" />
            <asp:BoundField DataField="Other_PrevResStatus" HeaderText="Other_PrevResStatus" SortExpression="Other_PrevResStatus" />
            <asp:BoundField DataField="Other_CurrOccupType" HeaderText="Other_CurrOccupType" SortExpression="Other_CurrOccupType" />
            <asp:BoundField DataField="Primary_BusIncomeAPAYGTaxPA" HeaderText="Primary_BusIncomeAPAYGTaxPA" SortExpression="Primary_BusIncomeAPAYGTaxPA" />
            <asp:BoundField DataField="Other_BusIncomeAPAYGTaxPA" HeaderText="Other_BusIncomeAPAYGTaxPA" SortExpression="Other_BusIncomeAPAYGTaxPA" />
            <asp:BoundField DataField="Primary_OtherIncomePA" HeaderText="Primary_OtherIncomePA" SortExpression="Primary_OtherIncomePA" />
            <asp:BoundField DataField="Other_OtherIncomePA" HeaderText="Other_OtherIncomePA" SortExpression="Other_OtherIncomePA" />
            <asp:BoundField DataField="Primary_OtherIncomeType" HeaderText="Primary_OtherIncomeType" SortExpression="Primary_OtherIncomeType" />
            <asp:BoundField DataField="Other_OtherIncomeType" HeaderText="Other_OtherIncomeType" SortExpression="Other_OtherIncomeType" />
            <asp:BoundField DataField="Primary_HomeLoanList" HeaderText="Primary_HomeLoanList" SortExpression="Primary_HomeLoanList" />
            <asp:BoundField DataField="Other_HomeLoanList" HeaderText="Other_HomeLoanList" SortExpression="Other_HomeLoanList" />
            <asp:BoundField DataField="Primary_CreditCardList" HeaderText="Primary_CreditCardList" SortExpression="Primary_CreditCardList" />
            <asp:BoundField DataField="Other_CreditCardList" HeaderText="Other_CreditCardList" SortExpression="Other_CreditCardList" />
            <asp:BoundField DataField="RentPM" HeaderText="RentPM" SortExpression="RentPM" />
            <asp:BoundField DataField="Primary_PropertyAssets" HeaderText="Primary_PropertyAssets" SortExpression="Primary_PropertyAssets" />
            <asp:BoundField DataField="Other_PropertyAssets" HeaderText="Other_PropertyAssets" SortExpression="Other_PropertyAssets" />
            <asp:BoundField DataField="Primary_PersonalLoansList" HeaderText="Primary_PersonalLoansList" SortExpression="Primary_PersonalLoansList" />
            <asp:BoundField DataField="Other_PersonalLoansList" HeaderText="Other_PersonalLoansList" SortExpression="Other_PersonalLoansList" />
            <asp:BoundField DataField="Primary_OtherAssetsList" HeaderText="Primary_OtherAssetsList" SortExpression="Primary_OtherAssetsList" />
            <asp:BoundField DataField="Other_OtherAssetsList" HeaderText="Other_OtherAssetsList" SortExpression="Other_OtherAssetsList" />
            <asp:BoundField DataField="Primary_OtherLiabilitiesList" HeaderText="Primary_OtherLiabilitiesList" SortExpression="Primary_OtherLiabilitiesList" />
            <asp:BoundField DataField="Other_OtherLiabilitiesList" HeaderText="Other_OtherLiabilitiesList" SortExpression="Other_OtherLiabilitiesList" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="TransactionId" HeaderText="TransactionId" SortExpression="TransactionId" />
            <asp:BoundField DataField="SourceURL" HeaderText="SourceURL" SortExpression="SourceURL" />
            <asp:BoundField DataField="Other_Res_Street1" HeaderText="Other_Res_Street1" SortExpression="Other_Res_Street1" />
            <asp:BoundField DataField="CondApprovedBy" HeaderText="CondApprovedBy" SortExpression="CondApprovedBy" />
            <asp:BoundField DataField="HasReqestedPriority" HeaderText="HasReqestedPriority" SortExpression="HasReqestedPriority" />
            <asp:BoundField DataField="HasAgreedPACLicence" HeaderText="HasAgreedPACLicence" SortExpression="HasAgreedPACLicence" />
            <asp:BoundField DataField="EntryId" HeaderText="EntryId" SortExpression="EntryId" />
            <asp:BoundField DataField="Primary_YrsCurrAddr" HeaderText="Primary_YrsCurrAddr" SortExpression="Primary_YrsCurrAddr" />
            <asp:BoundField DataField="Other_YrsCurrAddr" HeaderText="Other_YrsCurrAddr" SortExpression="Other_YrsCurrAddr" />
            <asp:BoundField DataField="Other_YrsPrevAddr" HeaderText="Other_YrsPrevAddr" SortExpression="Other_YrsPrevAddr" />
            <asp:BoundField DataField="YrsPrevAddr" HeaderText="YrsPrevAddr" SortExpression="YrsPrevAddr" />
            <asp:BoundField DataField="YrsCurrEmployer" HeaderText="YrsCurrEmployer" SortExpression="YrsCurrEmployer" />
            <asp:BoundField DataField="YrsPrevEmployer" HeaderText="YrsPrevEmployer" SortExpression="YrsPrevEmployer" />
            <asp:BoundField DataField="AutoRejected" HeaderText="AutoRejected" SortExpression="AutoRejected" />
            <asp:BoundField DataField="AutoRejectedInformed" HeaderText="AutoRejectedInformed" SortExpression="AutoRejectedInformed" />
            <asp:BoundField DataField="AutoRejecetedBy" HeaderText="AutoRejecetedBy" SortExpression="AutoRejecetedBy" />
            <asp:BoundField DataField="AutoRejectedInformedBy" HeaderText="AutoRejectedInformedBy" SortExpression="AutoRejectedInformedBy" />
            <asp:BoundField DataField="AutoAccepted" HeaderText="AutoAccepted" SortExpression="AutoAccepted" />
            <asp:BoundField DataField="AutoAcceptedBy" HeaderText="AutoAcceptedBy" SortExpression="AutoAcceptedBy" />
            <asp:BoundField DataField="AutoAcceptedInformed" HeaderText="AutoAcceptedInformed" SortExpression="AutoAcceptedInformed" />
            <asp:BoundField DataField="AutoAcceptedInformedBy" HeaderText="AutoAcceptedInformedBy" SortExpression="AutoAcceptedInformedBy" />
        </Columns>
    </asp:GridView>
</asp:Content>
