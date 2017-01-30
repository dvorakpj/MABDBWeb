<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorApps_CondAccNotInformed.aspx.cs" Inherits="MABDBWeb.InvestorApps_CondAccNotInformed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataInvAppsCondAccNotInformed" TypeName="DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_RowVersion" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ApplicantType" Type="String" />
            <asp:Parameter Name="Primary_Title" Type="String" />
            <asp:Parameter Name="Primary_FirstName" Type="String" />
            <asp:Parameter Name="Primary_OtherNames" Type="String" />
            <asp:Parameter Name="Primary_LastName" Type="String" />
            <asp:Parameter Name="Primary_AUCitizenStat" Type="String" />
            <asp:Parameter Name="Primary_Dependants" Type="Byte" />
            <asp:Parameter Name="Other_Title" Type="String" />
            <asp:Parameter Name="Other_FirstName" Type="String" />
            <asp:Parameter Name="Other_OtherNames" Type="String" />
            <asp:Parameter Name="Other_LastName" Type="String" />
            <asp:Parameter Name="Other_DOB" Type="DateTime" />
            <asp:Parameter Name="Other_Gender" Type="String" />
            <asp:Parameter Name="Other_AUCitizenStat" Type="String" />
            <asp:Parameter Name="Other_Dependants" Type="Byte" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Primary_Res_Street1" Type="String" />
            <asp:Parameter Name="Primary_Res_Street2" Type="String" />
            <asp:Parameter Name="Primary_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="Primary_Res_Suburb" Type="String" />
            <asp:Parameter Name="Primary_Res_State" Type="String" />
            <asp:Parameter Name="Primary_Res_Country" Type="String" />
            <asp:Parameter Name="Primary_CurrResidStatus" Type="String" />
            <asp:Parameter Name="PrevResStatus" Type="String" />
            <asp:Parameter Name="CurrOccupType" Type="String" />
            <asp:Parameter Name="CurrEmploymentStatus" Type="String" />
            <asp:Parameter Name="IsSmoker" Type="String" />
            <asp:Parameter Name="HasPrivateHealthIns" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter DbType="DateTimeOffset" Name="Modified" />
            <asp:Parameter Name="InvestorApplicant_AssquireInvestor" Type="Int32" />
            <asp:Parameter Name="InvestorApplication_Gender" Type="Int32" />
            <asp:Parameter Name="Primary_IncomeMoAT" Type="String" />
            <asp:Parameter Name="Other_IncomeMoAT" Type="String" />
            <asp:Parameter Name="HouseholdIncomeGrossPA" Type="String" />
            <asp:Parameter Name="LookingLocation" Type="String" />
            <asp:Parameter Name="FoundLocation" Type="String" />
            <asp:Parameter Name="Property_Street1" Type="String" />
            <asp:Parameter Name="Property_Street2" Type="String" />
            <asp:Parameter Name="Property_Suburb" Type="String" />
            <asp:Parameter Name="Property_Vendor" Type="String" />
            <asp:Parameter Name="EstSpend" Type="String" />
            <asp:Parameter Name="EntryDate" Type="DateTime" />
            <asp:Parameter Name="Primary_DOB" Type="DateTime" />
            <asp:Parameter Name="CreatedUTC" Type="DateTime" />
            <asp:Parameter Name="CondCreditDecisionDate" Type="DateTime" />
            <asp:Parameter Name="Property_PostCode" Type="Int16" />
            <asp:Parameter Name="Property_State" Type="String" />
            <asp:Parameter Name="Property_Country" Type="String" />
            <asp:Parameter Name="Property_AgentDetails" Type="String" />
            <asp:Parameter Name="HasAgreedPrivacy" Type="String" />
            <asp:Parameter Name="Primary_Gender" Type="String" />
            <asp:Parameter Name="DesiredPropertyAddr" Type="String" />
            <asp:Parameter Name="Primary_MaritalStats" Type="String" />
            <asp:Parameter Name="Other_MaritalStats" Type="String" />
            <asp:Parameter Name="Other_Email" Type="String" />
            <asp:Parameter Name="Primary_HomePhone" Type="String" />
            <asp:Parameter Name="Other_HomePhone" Type="String" />
            <asp:Parameter Name="Other_Mobile" Type="String" />
            <asp:Parameter Name="Primary_PassportNo" Type="String" />
            <asp:Parameter Name="Other_PassportNo" Type="String" />
            <asp:Parameter Name="Primary_PassportCountry" Type="String" />
            <asp:Parameter Name="Other_PassportCountry" Type="String" />
            <asp:Parameter Name="Primary_DriversLicenceNo" Type="String" />
            <asp:Parameter Name="Other_DriversLicenceNo" Type="String" />
            <asp:Parameter Name="Primary_DriversLicenceState" Type="String" />
            <asp:Parameter Name="Other_DriversLicenceState" Type="String" />
            <asp:Parameter Name="Other_Res_Street2" Type="String" />
            <asp:Parameter Name="Other_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="Other_Res_State" Type="String" />
            <asp:Parameter Name="Other_Res_Country" Type="String" />
            <asp:Parameter Name="Other_Res_Suburb" Type="String" />
            <asp:Parameter Name="Other_CurrResidStatus" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Street1" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Street2" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Suburb" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="PrimPrev_Res_State" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Country" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Street1" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Street2" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Suburb" Type="String" />
            <asp:Parameter Name="OthPrev_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="OthPrev_Res_State" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Country" Type="String" />
            <asp:Parameter Name="Other_PrevResStatus" Type="String" />
            <asp:Parameter Name="Other_CurrOccupType" Type="String" />
            <asp:Parameter Name="Primary_BusIncomeAPAYGTaxPA" Type="String" />
            <asp:Parameter Name="Other_BusIncomeAPAYGTaxPA" Type="String" />
            <asp:Parameter Name="Primary_OtherIncomePA" Type="String" />
            <asp:Parameter Name="Other_OtherIncomePA" Type="String" />
            <asp:Parameter Name="Primary_OtherIncomeType" Type="String" />
            <asp:Parameter Name="Other_OtherIncomeType" Type="String" />
            <asp:Parameter Name="Primary_HomeLoanList" Type="String" />
            <asp:Parameter Name="Other_HomeLoanList" Type="String" />
            <asp:Parameter Name="Primary_CreditCardList" Type="String" />
            <asp:Parameter Name="Other_CreditCardList" Type="String" />
            <asp:Parameter Name="RentPM" Type="String" />
            <asp:Parameter Name="Primary_PropertyAssetsList" Type="String" />
            <asp:Parameter Name="Other_PropertyAssetsList" Type="String" />
            <asp:Parameter Name="Primary_PersonalLoansList" Type="String" />
            <asp:Parameter Name="Other_PersonalLoansList" Type="String" />
            <asp:Parameter Name="Primary_OtherAssetsList" Type="String" />
            <asp:Parameter Name="Other_OtherAssetsList" Type="String" />
            <asp:Parameter Name="Primary_OtherLiabilitiesList" Type="String" />
            <asp:Parameter Name="Other_OtherLiabilitiesList" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="TransactionId" Type="String" />
            <asp:Parameter Name="SourceURL" Type="String" />
            <asp:Parameter Name="Other_Res_Street1" Type="String" />
            <asp:Parameter Name="CondDecisionBy" Type="String" />
            <asp:Parameter Name="HasReqestedPriority" Type="String" />
            <asp:Parameter Name="HasAgreedPACLicence" Type="String" />
            <asp:Parameter Name="EntryId" Type="Int32" />
            <asp:Parameter Name="Primary_YrsCurrAddr" Type="String" />
            <asp:Parameter Name="Other_YrsCurrAddr" Type="String" />
            <asp:Parameter Name="Other_YrsPrevAddr" Type="String" />
            <asp:Parameter Name="YrsPrevAddr" Type="String" />
            <asp:Parameter Name="YrsCurrEmployer" Type="String" />
            <asp:Parameter Name="YrsPrevEmployer" Type="String" />
            <asp:Parameter Name="AppliedLimit" Type="Decimal" />
            <asp:Parameter Name="AutoRejected" Type="DateTime" />
            <asp:Parameter Name="AutoRejectedBy" Type="String" />
            <asp:Parameter Name="AutoAccepted" Type="DateTime" />
            <asp:Parameter Name="AutoAcceptedBy" Type="String" />
            <asp:Parameter Name="HasReadPO6" Type="String" />
            <asp:Parameter Name="CondCreditDecision" Type="String" />
            <asp:Parameter Name="CondCreditDecisionInformed" Type="DateTime" />
            <asp:Parameter Name="CondCreditDecisionInformedBy" Type="String" />
            <asp:Parameter Name="CondCreditDecisionBy" Type="String" />
            <asp:Parameter Name="AppAckLetterSent" Type="DateTime" />
            <asp:Parameter Name="AppAckLetterSentBy" Type="String" />
            <asp:Parameter Name="ApplicantsNotes" Type="String" />
            <asp:Parameter Name="CondDecisionOfficeNotes" Type="String" />
            <asp:Parameter Name="IsCompany" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="CompanyABN" Type="String" />
            <asp:Parameter Name="CompanyACN" Type="String" />
            <asp:Parameter Name="Primary_CompRole" Type="String" />
            <asp:Parameter Name="Property_LoanOutstanding" Type="Decimal" />
            <asp:Parameter Name="Property_Deposit" Type="Decimal" />
            <asp:Parameter Name="Broker" Type="String" />
            <asp:Parameter Name="BrokerDetails" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ApplicantType" Type="String" />
            <asp:Parameter Name="Primary_Title" Type="String" />
            <asp:Parameter Name="Primary_FirstName" Type="String" />
            <asp:Parameter Name="Primary_OtherNames" Type="String" />
            <asp:Parameter Name="Primary_LastName" Type="String" />
            <asp:Parameter Name="Primary_AUCitizenStat" Type="String" />
            <asp:Parameter Name="Primary_Dependants" Type="Byte" />
            <asp:Parameter Name="Other_Title" Type="String" />
            <asp:Parameter Name="Other_FirstName" Type="String" />
            <asp:Parameter Name="Other_OtherNames" Type="String" />
            <asp:Parameter Name="Other_LastName" Type="String" />
            <asp:Parameter Name="Other_DOB" Type="DateTime" />
            <asp:Parameter Name="Other_Gender" Type="String" />
            <asp:Parameter Name="Other_AUCitizenStat" Type="String" />
            <asp:Parameter Name="Other_Dependants" Type="Byte" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Primary_Res_Street1" Type="String" />
            <asp:Parameter Name="Primary_Res_Street2" Type="String" />
            <asp:Parameter Name="Primary_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="Primary_Res_Suburb" Type="String" />
            <asp:Parameter Name="Primary_Res_State" Type="String" />
            <asp:Parameter Name="Primary_Res_Country" Type="String" />
            <asp:Parameter Name="Primary_CurrResidStatus" Type="String" />
            <asp:Parameter Name="PrevResStatus" Type="String" />
            <asp:Parameter Name="CurrOccupType" Type="String" />
            <asp:Parameter Name="CurrEmploymentStatus" Type="String" />
            <asp:Parameter Name="IsSmoker" Type="String" />
            <asp:Parameter Name="HasPrivateHealthIns" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter DbType="DateTimeOffset" Name="Modified" />
            <asp:Parameter Name="InvestorApplicant_AssquireInvestor" Type="Int32" />
            <asp:Parameter Name="InvestorApplication_Gender" Type="Int32" />
            <asp:Parameter Name="Primary_IncomeMoAT" Type="String" />
            <asp:Parameter Name="Other_IncomeMoAT" Type="String" />
            <asp:Parameter Name="HouseholdIncomeGrossPA" Type="String" />
            <asp:Parameter Name="LookingLocation" Type="String" />
            <asp:Parameter Name="FoundLocation" Type="String" />
            <asp:Parameter Name="Property_Street1" Type="String" />
            <asp:Parameter Name="Property_Street2" Type="String" />
            <asp:Parameter Name="Property_Suburb" Type="String" />
            <asp:Parameter Name="Property_Vendor" Type="String" />
            <asp:Parameter Name="EstSpend" Type="String" />
            <asp:Parameter Name="EntryDate" Type="DateTime" />
            <asp:Parameter Name="Primary_DOB" Type="DateTime" />
            <asp:Parameter Name="CreatedUTC" Type="DateTime" />
            <asp:Parameter Name="CondCreditDecisionDate" Type="DateTime" />
            <asp:Parameter Name="Property_PostCode" Type="Int16" />
            <asp:Parameter Name="Property_State" Type="String" />
            <asp:Parameter Name="Property_Country" Type="String" />
            <asp:Parameter Name="Property_AgentDetails" Type="String" />
            <asp:Parameter Name="HasAgreedPrivacy" Type="String" />
            <asp:Parameter Name="Primary_Gender" Type="String" />
            <asp:Parameter Name="DesiredPropertyAddr" Type="String" />
            <asp:Parameter Name="Primary_MaritalStats" Type="String" />
            <asp:Parameter Name="Other_MaritalStats" Type="String" />
            <asp:Parameter Name="Other_Email" Type="String" />
            <asp:Parameter Name="Primary_HomePhone" Type="String" />
            <asp:Parameter Name="Other_HomePhone" Type="String" />
            <asp:Parameter Name="Other_Mobile" Type="String" />
            <asp:Parameter Name="Primary_PassportNo" Type="String" />
            <asp:Parameter Name="Other_PassportNo" Type="String" />
            <asp:Parameter Name="Primary_PassportCountry" Type="String" />
            <asp:Parameter Name="Other_PassportCountry" Type="String" />
            <asp:Parameter Name="Primary_DriversLicenceNo" Type="String" />
            <asp:Parameter Name="Other_DriversLicenceNo" Type="String" />
            <asp:Parameter Name="Primary_DriversLicenceState" Type="String" />
            <asp:Parameter Name="Other_DriversLicenceState" Type="String" />
            <asp:Parameter Name="Other_Res_Street2" Type="String" />
            <asp:Parameter Name="Other_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="Other_Res_State" Type="String" />
            <asp:Parameter Name="Other_Res_Country" Type="String" />
            <asp:Parameter Name="Other_Res_Suburb" Type="String" />
            <asp:Parameter Name="Other_CurrResidStatus" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Street1" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Street2" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Suburb" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="PrimPrev_Res_State" Type="String" />
            <asp:Parameter Name="PrimPrev_Res_Country" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Street1" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Street2" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Suburb" Type="String" />
            <asp:Parameter Name="OthPrev_Res_PostCode" Type="Int16" />
            <asp:Parameter Name="OthPrev_Res_State" Type="String" />
            <asp:Parameter Name="OthPrev_Res_Country" Type="String" />
            <asp:Parameter Name="Other_PrevResStatus" Type="String" />
            <asp:Parameter Name="Other_CurrOccupType" Type="String" />
            <asp:Parameter Name="Primary_BusIncomeAPAYGTaxPA" Type="String" />
            <asp:Parameter Name="Other_BusIncomeAPAYGTaxPA" Type="String" />
            <asp:Parameter Name="Primary_OtherIncomePA" Type="String" />
            <asp:Parameter Name="Other_OtherIncomePA" Type="String" />
            <asp:Parameter Name="Primary_OtherIncomeType" Type="String" />
            <asp:Parameter Name="Other_OtherIncomeType" Type="String" />
            <asp:Parameter Name="Primary_HomeLoanList" Type="String" />
            <asp:Parameter Name="Other_HomeLoanList" Type="String" />
            <asp:Parameter Name="Primary_CreditCardList" Type="String" />
            <asp:Parameter Name="Other_CreditCardList" Type="String" />
            <asp:Parameter Name="RentPM" Type="String" />
            <asp:Parameter Name="Primary_PropertyAssetsList" Type="String" />
            <asp:Parameter Name="Other_PropertyAssetsList" Type="String" />
            <asp:Parameter Name="Primary_PersonalLoansList" Type="String" />
            <asp:Parameter Name="Other_PersonalLoansList" Type="String" />
            <asp:Parameter Name="Primary_OtherAssetsList" Type="String" />
            <asp:Parameter Name="Other_OtherAssetsList" Type="String" />
            <asp:Parameter Name="Primary_OtherLiabilitiesList" Type="String" />
            <asp:Parameter Name="Other_OtherLiabilitiesList" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="TransactionId" Type="String" />
            <asp:Parameter Name="SourceURL" Type="String" />
            <asp:Parameter Name="Other_Res_Street1" Type="String" />
            <asp:Parameter Name="CondDecisionBy" Type="String" />
            <asp:Parameter Name="HasReqestedPriority" Type="String" />
            <asp:Parameter Name="HasAgreedPACLicence" Type="String" />
            <asp:Parameter Name="EntryId" Type="Int32" />
            <asp:Parameter Name="Primary_YrsCurrAddr" Type="String" />
            <asp:Parameter Name="Other_YrsCurrAddr" Type="String" />
            <asp:Parameter Name="Other_YrsPrevAddr" Type="String" />
            <asp:Parameter Name="YrsPrevAddr" Type="String" />
            <asp:Parameter Name="YrsCurrEmployer" Type="String" />
            <asp:Parameter Name="YrsPrevEmployer" Type="String" />
            <asp:Parameter Name="AppliedLimit" Type="Decimal" />
            <asp:Parameter Name="AutoRejected" Type="DateTime" />
            <asp:Parameter Name="AutoRejectedBy" Type="String" />
            <asp:Parameter Name="AutoAccepted" Type="DateTime" />
            <asp:Parameter Name="AutoAcceptedBy" Type="String" />
            <asp:Parameter Name="HasReadPO6" Type="String" />
            <asp:Parameter Name="CondCreditDecision" Type="String" />
            <asp:Parameter Name="CondCreditDecisionInformed" Type="DateTime" />
            <asp:Parameter Name="CondCreditDecisionInformedBy" Type="String" />
            <asp:Parameter Name="CondCreditDecisionBy" Type="String" />
            <asp:Parameter Name="AppAckLetterSent" Type="DateTime" />
            <asp:Parameter Name="AppAckLetterSentBy" Type="String" />
            <asp:Parameter Name="ApplicantsNotes" Type="String" />
            <asp:Parameter Name="CondDecisionOfficeNotes" Type="String" />
            <asp:Parameter Name="IsCompany" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="CompanyABN" Type="String" />
            <asp:Parameter Name="CompanyACN" Type="String" />
            <asp:Parameter Name="Primary_CompRole" Type="String" />
            <asp:Parameter Name="Property_LoanOutstanding" Type="Decimal" />
            <asp:Parameter Name="Property_Deposit" Type="Decimal" />
            <asp:Parameter Name="Broker" Type="String" />
            <asp:Parameter Name="BrokerDetails" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_RowVersion" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="ApplicantType" HeaderText="Type" SortExpression="ApplicantType" />
            <asp:BoundField DataField="Primary_FirstName" HeaderText="Primary - First Name" SortExpression="Primary_FirstName" />
            <asp:BoundField DataField="Primary_OtherNames" HeaderText="Primary - Other Names" SortExpression="Primary_OtherNames" />
            <asp:BoundField DataField="Primary_LastName" HeaderText="Primary - Last Name" SortExpression="Primary_LastName" />
            <asp:BoundField DataField="Primary_DOB" HeaderText="Primary - DOB" SortExpression="Primary_DOB" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="Primary_HomePhone" HeaderText="Primary - Home Phone" SortExpression="Primary_HomePhone" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
            <asp:BoundField DataField="Primary_Res_Street1" HeaderText="Primary - Street1" SortExpression="Primary_Res_Street1" />
            <asp:BoundField DataField="Primary_Res_Street2" HeaderText="Primary - Street2" SortExpression="Primary_Res_Street2" />
            <asp:BoundField DataField="Primary_Res_State" HeaderText="Primary - State" SortExpression="Primary_Res_State" />
            <asp:BoundField DataField="Other_FirstName" HeaderText="Other - First Name" SortExpression="Other_FirstName" />
            <asp:BoundField DataField="Other_OtherNames" HeaderText="Other - Other Names" SortExpression="Other_OtherNames" />
            <asp:BoundField DataField="CompanyABN" HeaderText="CompanyABN" SortExpression="CompanyABN" />
            <asp:BoundField DataField="Other_LastName" HeaderText="Other - Last Name" SortExpression="Other_LastName" />
            <asp:BoundField DataField="Other_DOB" HeaderText="Other - DOB" SortExpression="Other_DOB" />
            <asp:BoundField DataField="Other_Email" HeaderText="Other - Email" SortExpression="Other_Email" />
            <asp:BoundField DataField="Other_Mobile" HeaderText="Other - Mobile" SortExpression="Other_Mobile" />
            <asp:BoundField DataField="Property_Street1" HeaderText="Property Street1" SortExpression="Property_Street1" />
            <asp:BoundField DataField="Property_Street2" HeaderText="Property Street2" SortExpression="Property_Street2" />
            <asp:BoundField DataField="Property_Suburb" HeaderText="Property Suburb" SortExpression="Property_Suburb" />
            <asp:BoundField DataField="Property_State" HeaderText="Property State" SortExpression="Property_State" />
            <asp:BoundField DataField="EstSpend" HeaderText="EstSpend" SortExpression="EstSpend" />
            <asp:BoundField DataField="EntryDate" HeaderText="Applied Date" SortExpression="EntryDate" />
            <asp:BoundField DataField="Other_HomePhone" HeaderText="Other - HomePhone" SortExpression="Other_HomePhone" />
            <asp:BoundField DataField="EntryId" HeaderText="EntryId" SortExpression="EntryId" />
            <asp:BoundField DataField="PrimPrev_Res_Suburb" HeaderText="PrimPrev_Res_Suburb" SortExpression="PrimPrev_Res_Suburb" />
            <asp:BoundField DataField="OthPrev_Res_Suburb" HeaderText="OthPrev_Res_Suburb" SortExpression="OthPrev_Res_Suburb" />
            <asp:BoundField DataField="Property_PostCode" HeaderText="Property_PostCode" SortExpression="Property_PostCode" />
            <asp:BoundField DataField="InvestorApplicant_AssquireInvestor" HeaderText="InvestorApplicant_AssquireInvestor" SortExpression="InvestorApplicant_AssquireInvestor" />
            <asp:BoundField DataField="CondCreditDecisionDate" HeaderText="CondCreditDecisionDate" SortExpression="CondCreditDecisionDate" />
            <asp:BoundField DataField="AppliedLimit" HeaderText="AppliedLimit" SortExpression="AppliedLimit" />
            <asp:BoundField DataField="CondCreditDecision" HeaderText="CondCreditDecision" SortExpression="CondCreditDecision" />
            <asp:BoundField DataField="CondCreditDecisionBy" HeaderText="CondCreditDecisionBy" SortExpression="CondCreditDecisionBy" />
            <asp:BoundField DataField="AppAckLetterSent" HeaderText="AppAckLetterSent" SortExpression="AppAckLetterSent" />
        </Columns>
    </asp:GridView>
</asp:Content>
