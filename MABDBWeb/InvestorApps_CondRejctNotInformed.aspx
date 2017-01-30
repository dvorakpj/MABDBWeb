<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorApps_CondRejctNotInformed.aspx.cs" Inherits="MABDBWeb.InvestorApps_CondRejctNotInformed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataInvestorAppsCreditRejectedNotInformed" TypeName="DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter" UpdateMethod="Update">
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
            <asp:BoundField DataField="InvestorApplication_Gender" HeaderText="InvestorApplication_Gender" SortExpression="InvestorApplication_Gender" />
            <asp:BoundField DataField="Primary_IncomeMoAT" HeaderText="Primary_IncomeMoAT" SortExpression="Primary_IncomeMoAT" />
            <asp:BoundField DataField="Other_IncomeMoAT" HeaderText="Other_IncomeMoAT" SortExpression="Other_IncomeMoAT" />
            <asp:BoundField DataField="HouseholdIncomeGrossPA" HeaderText="HouseholdIncomeGrossPA" SortExpression="HouseholdIncomeGrossPA" />
            <asp:BoundField DataField="LookingLocation" HeaderText="LookingLocation" SortExpression="LookingLocation" />
            <asp:BoundField DataField="FoundLocation" HeaderText="FoundLocation" SortExpression="FoundLocation" />
            <asp:BoundField DataField="Property_Street1" HeaderText="Property_Street1" SortExpression="Property_Street1" />
            <asp:BoundField DataField="Property_Street2" HeaderText="Property_Street2" SortExpression="Property_Street2" />
            <asp:BoundField DataField="Property_Vendor" HeaderText="Property_Vendor" SortExpression="Property_Vendor" />
            <asp:BoundField DataField="EstSpend" HeaderText="EstSpend" SortExpression="EstSpend" />
            <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" SortExpression="EntryDate" />
            <asp:BoundField DataField="Primary_DOB" HeaderText="Primary_DOB" SortExpression="Primary_DOB" />
            <asp:BoundField DataField="CreatedUTC" HeaderText="CreatedUTC" SortExpression="CreatedUTC" />
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
            <asp:BoundField DataField="Other_Res_PostCode" HeaderText="Other_Res_PostCode" SortExpression="Other_Res_PostCode" />
            <asp:BoundField DataField="Other_Res_State" HeaderText="Other_Res_State" SortExpression="Other_Res_State" />
            <asp:BoundField DataField="Other_Res_Country" HeaderText="Other_Res_Country" SortExpression="Other_Res_Country" />
            <asp:BoundField DataField="Other_CurrResidStatus" HeaderText="Other_CurrResidStatus" SortExpression="Other_CurrResidStatus" />
            <asp:BoundField DataField="PrimPrev_Res_Street1" HeaderText="PrimPrev_Res_Street1" SortExpression="PrimPrev_Res_Street1" />
            <asp:BoundField DataField="PrimPrev_Res_Street2" HeaderText="PrimPrev_Res_Street2" SortExpression="PrimPrev_Res_Street2" />
            <asp:BoundField DataField="Primary_Res_Suburb" HeaderText="Primary_Res_Suburb" SortExpression="Primary_Res_Suburb" />
            <asp:BoundField DataField="PrimPrev_Res_PostCode" HeaderText="PrimPrev_Res_PostCode" SortExpression="PrimPrev_Res_PostCode" />
            <asp:BoundField DataField="PrimPrev_Res_State" HeaderText="PrimPrev_Res_State" SortExpression="PrimPrev_Res_State" />
            <asp:BoundField DataField="PrimPrev_Res_Country" HeaderText="PrimPrev_Res_Country" SortExpression="PrimPrev_Res_Country" />
            <asp:BoundField DataField="OthPrev_Res_Street1" HeaderText="OthPrev_Res_Street1" SortExpression="OthPrev_Res_Street1" />
            <asp:BoundField DataField="OthPrev_Res_Street2" HeaderText="OthPrev_Res_Street2" SortExpression="OthPrev_Res_Street2" />
            <asp:BoundField DataField="OthPrev_Res_PostCode" HeaderText="OthPrev_Res_PostCode" SortExpression="OthPrev_Res_PostCode" />
            <asp:BoundField DataField="OthPrev_Res_State" HeaderText="OthPrev_Res_State" SortExpression="OthPrev_Res_State" />
            <asp:BoundField DataField="OthPrev_Res_Country" HeaderText="OthPrev_Res_Country" SortExpression="OthPrev_Res_Country" />
            <asp:BoundField DataField="Other_PrevResStatus" HeaderText="Other_PrevResStatus" SortExpression="Other_PrevResStatus" />
            <asp:BoundField DataField="Other_CurrOccupType" HeaderText="Other_CurrOccupType" SortExpression="Other_CurrOccupType" />
            <asp:BoundField DataField="Primary_CompRole" HeaderText="Primary_CompRole" SortExpression="Primary_CompRole" />
            <asp:BoundField DataField="RentPM" HeaderText="RentPM" SortExpression="RentPM" />
            <asp:BoundField DataField="Property_Suburb" HeaderText="Property_Suburb" SortExpression="Property_Suburb" />
            <asp:BoundField DataField="CompanyABN" HeaderText="CompanyABN" SortExpression="CompanyABN" />
            <asp:BoundField DataField="Other_Res_Street1" HeaderText="Other_Res_Street1" SortExpression="Other_Res_Street1" />
            <asp:BoundField DataField="Primary_YrsCurrAddr" HeaderText="Primary_YrsCurrAddr" SortExpression="Primary_YrsCurrAddr" />
            <asp:BoundField DataField="CondDecisionBy" HeaderText="CondDecisionBy" SortExpression="CondDecisionBy" />
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="Property_PostCode" HeaderText="Property_PostCode" SortExpression="Property_PostCode" />
            <asp:BoundField DataField="AppliedLimit" HeaderText="AppliedLimit" SortExpression="AppliedLimit" />
            <asp:BoundField DataField="CondCreditDecisionDate" HeaderText="CondCreditDecisionDate" SortExpression="CondCreditDecisionDate" />
            <asp:BoundField DataField="CondCreditDecision" HeaderText="CondCreditDecision" SortExpression="CondCreditDecision" />
            <asp:BoundField DataField="CondCreditDecisionBy" HeaderText="CondCreditDecisionBy" SortExpression="CondCreditDecisionBy" />
        </Columns>
    </asp:GridView>
</asp:Content>
