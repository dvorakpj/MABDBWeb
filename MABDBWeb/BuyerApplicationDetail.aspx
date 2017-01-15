<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyerApplicationDetail.aspx.cs" Inherits="MABDBWeb.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">&nbsp;<asp:Label ID="lblCondDecLbl" runat="server" Text="Conditional Decision:" Visible="False"></asp:Label>
    <asp:Label ID="lblCondApproved" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="lblCondDecInformedLbl" runat="server" Text="Conditional Decision Sent:" Visible="False"></asp:Label>
    <asp:Label ID="lblCondDecInformed" runat="server" Visible="False"></asp:Label>
<br />
<asp:DetailsView ID="DetailsView1" runat="server" DataKeyNames="Id" DataSourceID="BuyerApplicationDSDataSource1" Height="50px" Width="125px">
    <Fields>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="ApplicantType" HeaderText="Type" SortExpression="ApplicantType" />
        <asp:BoundField DataField="Primary_FirstName" HeaderText="Primary - First Name" SortExpression="Primary_FirstName" />
        <asp:BoundField DataField="Primary_OtherNames" HeaderText="Primary - Other Names" SortExpression="Primary_OtherNames" />
        <asp:BoundField DataField="Primary_LastName" HeaderText="Primary - Last Name" SortExpression="Primary_LastName" />
        <asp:BoundField DataField="Primary_AUCitizenStat" HeaderText="Primary - AU Citizen" SortExpression="Primary_AUCitizenStat" />
        <asp:BoundField DataField="Primary_Dependants" HeaderText="Primary - Dependants" SortExpression="Primary_Dependants" />
        <asp:BoundField DataField="Primary_DOB" HeaderText="Primary - DOB" SortExpression="Primary_DOB" />
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
        <asp:BoundField DataField="Primary_Res_Suburb" HeaderText="Primary_Res_Suburb" SortExpression="Primary_Res_Suburb" />
        <asp:BoundField DataField="Primary_Res_State" HeaderText="Primary_Res_State" SortExpression="Primary_Res_State" />
        <asp:BoundField DataField="Primary_Res_Country" HeaderText="Primary_Res_Country" SortExpression="Primary_Res_Country" />
        <asp:BoundField DataField="Primary_CurrResidStatus" HeaderText="Primary_CurrResidStatus" SortExpression="Primary_CurrResidStatus" />
        <asp:BoundField DataField="Primary_YrsCurrAddr" HeaderText="Primary_YrsCurrAddr" SortExpression="Primary_YrsCurrAddr" />
        <asp:BoundField DataField="Other_Res_Street1" HeaderText="Other_Res_Street1" SortExpression="Other_Res_Street1" />
        <asp:BoundField DataField="Other_Res_Street2" HeaderText="Other_Res_Street2" SortExpression="Other_Res_Street2" />
        <asp:BoundField DataField="Other_Res_PostCode" HeaderText="Other_Res_PostCode" SortExpression="Other_Res_PostCode" />
        <asp:BoundField DataField="Other_Res_State" HeaderText="Other_Res_State" SortExpression="Other_Res_State" />
        <asp:BoundField DataField="Other_Res_Country" HeaderText="Other_Res_Country" SortExpression="Other_Res_Country" />
        <asp:BoundField DataField="Other_Res_Suburb" HeaderText="Other_Res_Suburb" SortExpression="Other_Res_Suburb" />
        <asp:BoundField DataField="Other_YrsCurrAddr" HeaderText="Other_YrsCurrAddr" SortExpression="Other_YrsCurrAddr" />
        <asp:BoundField DataField="PrevResStatus" HeaderText="PrevResStatus" SortExpression="PrevResStatus" />
        <asp:BoundField DataField="CurrOccupType" HeaderText="CurrOccupType" SortExpression="CurrOccupType" />
        <asp:BoundField DataField="CurrEmploymentStatus" HeaderText="CurrEmploymentStatus" SortExpression="CurrEmploymentStatus" />
        <asp:BoundField DataField="CurrJobTitle" HeaderText="CurrJobTitle" SortExpression="CurrJobTitle" />
        <asp:BoundField DataField="CurrEmployerName" HeaderText="CurrEmployerName" SortExpression="CurrEmployerName" />
        <asp:BoundField DataField="YrsCurrEmployer" HeaderText="YrsCurrEmployer" SortExpression="YrsCurrEmployer" />
        <asp:BoundField DataField="PrevJobTitle" HeaderText="PrevJobTitle" SortExpression="PrevJobTitle" />
        <asp:BoundField DataField="PrevEmployerName" HeaderText="PrevEmployerName" SortExpression="PrevEmployerName" />
        <asp:BoundField DataField="YrsPrevEmployer" HeaderText="YrsPrevEmployer" SortExpression="YrsPrevEmployer" />
        <asp:BoundField DataField="Other_CurrOccupType" HeaderText="Other_CurrOccupType" SortExpression="Other_CurrOccupType" />
        <asp:BoundField DataField="Other_CurrEmploymentStatus" HeaderText="Other_CurrEmploymentStatus" SortExpression="Other_CurrEmploymentStatus" />
        <asp:BoundField DataField="Other_JobTitle" HeaderText="Other_JobTitle" SortExpression="Other_JobTitle" />
        <asp:BoundField DataField="Other_CurrEmployerName" HeaderText="Other_CurrEmployerName" SortExpression="Other_CurrEmployerName" />
        <asp:BoundField DataField="Other_YrsCurrEmployer" HeaderText="Other_YrsCurrEmployer" SortExpression="Other_YrsCurrEmployer" />
        <asp:BoundField DataField="Other_PrevJobTitle" HeaderText="Other_PrevJobTitle" SortExpression="Other_PrevJobTitle" />
        <asp:BoundField DataField="Other_PrevEmployerName" HeaderText="Other_PrevEmployerName" SortExpression="Other_PrevEmployerName" />
        <asp:BoundField DataField="Other_YrsPrevEmployer" HeaderText="Other_YrsPrevEmployer" SortExpression="Other_YrsPrevEmployer" />
        <asp:BoundField DataField="IsSmoker" HeaderText="IsSmoker" SortExpression="IsSmoker" />
        <asp:BoundField DataField="HasPrivateHealthIns" HeaderText="HasPrivateHealthIns" SortExpression="HasPrivateHealthIns" />
        <asp:BoundField DataField="ReasonNoPHI" HeaderText="ReasonNoPHI" SortExpression="ReasonNoPHI" />
        <asp:BoundField DataField="HealthSelfRating" HeaderText="HealthSelfRating" SortExpression="HealthSelfRating" />
        <asp:BoundField DataField="RefusedHICover" HeaderText="RefusedHICover" SortExpression="RefusedHICover" />
        <asp:BoundField DataField="ReasonRefusedHI" HeaderText="ReasonRefusedHI" SortExpression="ReasonRefusedHI" />
        <asp:BoundField DataField="Other_IsSmoker" HeaderText="Other_IsSmoker" SortExpression="Other_IsSmoker" />
        <asp:BoundField DataField="Other_HasPrivateHealthIns" HeaderText="Other_HasPrivateHealthIns" SortExpression="Other_HasPrivateHealthIns" />
        <asp:BoundField DataField="Other_ReasonNoPHI" HeaderText="Other_ReasonNoPHI" SortExpression="Other_ReasonNoPHI" />
        <asp:BoundField DataField="Other_RefusedHICover" HeaderText="Other_RefusedHICover" SortExpression="Other_RefusedHICover" />
        <asp:BoundField DataField="Other_ReasonRefusedHI" HeaderText="Other_ReasonRefusedHI" SortExpression="Other_ReasonRefusedHI" />
        <asp:BoundField DataField="Other_HealthSelfRating" HeaderText="Other_HealthSelfRating" SortExpression="Other_HealthSelfRating" />
        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
        <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" />
        <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" />
        <asp:BoundField DataField="Primary_IncomeMoAT" HeaderText="Primary_IncomeMoAT" SortExpression="Primary_IncomeMoAT" />
        <asp:BoundField DataField="Other_IncomeMoAT" HeaderText="Other_IncomeMoAT" SortExpression="Other_IncomeMoAT" />
        <asp:BoundField DataField="HouseholdIncomeGrossPA" HeaderText="HouseholdIncomeGrossPA" SortExpression="HouseholdIncomeGrossPA" />
        <asp:BoundField DataField="LookingLocation" HeaderText="LookingLocation" SortExpression="LookingLocation" />
        <asp:BoundField DataField="FoundLocation" HeaderText="FoundLocation" SortExpression="FoundLocation" />
        <asp:BoundField DataField="Property_Street1" HeaderText="Property_Street1" SortExpression="Property_Street1" />
        <asp:BoundField DataField="Property_Street2" HeaderText="Property_Street2" SortExpression="Property_Street2" />
        <asp:BoundField DataField="Property_Suburb" HeaderText="Property_Suburb" SortExpression="Property_Suburb" />
        <asp:BoundField DataField="Property_PostCode" HeaderText="Property_PostCode" SortExpression="Property_PostCode" />
        <asp:BoundField DataField="Property_State" HeaderText="Property_State" SortExpression="Property_State" />
        <asp:BoundField DataField="Property_Country" HeaderText="Property_Country" SortExpression="Property_Country" />
        <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" SortExpression="PropertyID" />
        <asp:BoundField DataField="EstSpend" HeaderText="EstSpend" SortExpression="EstSpend" />
        <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" SortExpression="EntryDate" />
        <asp:BoundField DataField="EntryId" HeaderText="EntryId" SortExpression="EntryId" />
        <asp:BoundField DataField="EntryUserId" HeaderText="EntryUserId" SortExpression="EntryUserId" />
        <asp:BoundField DataField="CreatedUTC" HeaderText="CreatedUTC" SortExpression="CreatedUTC" />
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
        <asp:BoundField DataField="Other_CurrResidStatus" HeaderText="Other_CurrResidStatus" SortExpression="Other_CurrResidStatus" />
        <asp:BoundField DataField="PrimPrev_Res_Street1" HeaderText="PrimPrev_Res_Street1" SortExpression="PrimPrev_Res_Street1" />
        <asp:BoundField DataField="PrimPrev_Res_Street2" HeaderText="PrimPrev_Res_Street2" SortExpression="PrimPrev_Res_Street2" />
        <asp:BoundField DataField="PrimPrev_Res_Suburb" HeaderText="PrimPrev_Res_Suburb" SortExpression="PrimPrev_Res_Suburb" />
        <asp:BoundField DataField="PrimPrev_Res_PostCode" HeaderText="PrimPrev_Res_PostCode" SortExpression="PrimPrev_Res_PostCode" />
        <asp:BoundField DataField="PrimPrev_Res_State" HeaderText="PrimPrev_Res_State" SortExpression="PrimPrev_Res_State" />
        <asp:BoundField DataField="PrimPrev_Res_Country" HeaderText="PrimPrev_Res_Country" SortExpression="PrimPrev_Res_Country" />
        <asp:BoundField DataField="OthPrev_Res_Street1" HeaderText="OthPrev_Res_Street1" SortExpression="OthPrev_Res_Street1" />
        <asp:BoundField DataField="OthPrev_Res_Street2" HeaderText="OthPrev_Res_Street2" SortExpression="OthPrev_Res_Street2" />
        <asp:BoundField DataField="OthPrev_Res_Suburb" HeaderText="OthPrev_Res_Suburb" SortExpression="OthPrev_Res_Suburb" />
        <asp:BoundField DataField="OthPrev_Res_PostCode" HeaderText="OthPrev_Res_PostCode" SortExpression="OthPrev_Res_PostCode" />
        <asp:BoundField DataField="OthPrev_Res_State" HeaderText="OthPrev_Res_State" SortExpression="OthPrev_Res_State" />
        <asp:BoundField DataField="OthPrev_Res_Country" HeaderText="OthPrev_Res_Country" SortExpression="OthPrev_Res_Country" />
        <asp:BoundField DataField="Other_PrevResStatus" HeaderText="Other_PrevResStatus" SortExpression="Other_PrevResStatus" />
        <asp:BoundField DataField="Other_YrsPrevAddr" HeaderText="Other_YrsPrevAddr" SortExpression="Other_YrsPrevAddr" />
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
        <asp:BoundField DataField="Primary_PersonalLoansList" HeaderText="Primary_PersonalLoansList" SortExpression="Primary_PersonalLoansList" />
        <asp:BoundField DataField="Other_PersonalLoansList" HeaderText="Other_PersonalLoansList" SortExpression="Other_PersonalLoansList" />
        <asp:BoundField DataField="Primary_OtherAssetsList" HeaderText="Primary_OtherAssetsList" SortExpression="Primary_OtherAssetsList" />
        <asp:BoundField DataField="Other_OtherAssetsList" HeaderText="Other_OtherAssetsList" SortExpression="Other_OtherAssetsList" />
        <asp:BoundField DataField="Primary_OtherLiabilitiesList" HeaderText="Primary_OtherLiabilitiesList" SortExpression="Primary_OtherLiabilitiesList" />
        <asp:BoundField DataField="Other_OtherLiabilitiesList" HeaderText="Other_OtherLiabilitiesList" SortExpression="Other_OtherLiabilitiesList" />
        <asp:BoundField DataField="TransactionId" HeaderText="TransactionId" SortExpression="TransactionId" />
        <asp:BoundField DataField="SourceURL" HeaderText="SourceURL" SortExpression="SourceURL" />
        <asp:BoundField DataField="HasReqestedPriority" HeaderText="HasReqestedPriority" SortExpression="HasReqestedPriority" />
        <asp:BoundField DataField="YrsPrevAddr" HeaderText="YrsPrevAddr" SortExpression="YrsPrevAddr" />
        <asp:BoundField DataField="AutoRejected" HeaderText="AutoRejected" SortExpression="AutoRejected" />
        <asp:BoundField DataField="AutoRejecetedBy" HeaderText="AutoRejecetedBy" SortExpression="AutoRejecetedBy" />
        <asp:BoundField DataField="AutoAccepted" HeaderText="AutoAccepted" SortExpression="AutoAccepted" />
        <asp:BoundField DataField="AutoAcceptedBy" HeaderText="AutoAcceptedBy" SortExpression="AutoAcceptedBy" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>
<asp:ObjectDataSource ID="BuyerApplicationDSDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter" UpdateMethod="Update">
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
        <asp:Parameter Name="Primary_DOB" Type="DateTime" />
        <asp:Parameter Name="Primary_Gender" Type="String" />
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
        <asp:Parameter Name="Primary_YrsCurrAddr" Type="String" />
        <asp:Parameter Name="Other_Res_Street1" Type="String" />
        <asp:Parameter Name="Other_Res_Street2" Type="String" />
        <asp:Parameter Name="Other_Res_PostCode" Type="Int16" />
        <asp:Parameter Name="Other_Res_State" Type="String" />
        <asp:Parameter Name="Other_Res_Country" Type="String" />
        <asp:Parameter Name="Other_Res_Suburb" Type="String" />
        <asp:Parameter Name="Other_YrsCurrAddr" Type="String" />
        <asp:Parameter Name="PrevResStatus" Type="String" />
        <asp:Parameter Name="CurrOccupType" Type="String" />
        <asp:Parameter Name="CurrEmploymentStatus" Type="String" />
        <asp:Parameter Name="CurrJobTitle" Type="String" />
        <asp:Parameter Name="CurrEmployerName" Type="String" />
        <asp:Parameter Name="YrsCurrEmployer" Type="String" />
        <asp:Parameter Name="PrevJobTitle" Type="String" />
        <asp:Parameter Name="PrevEmploymentStatus" Type="String" />
        <asp:Parameter Name="PrevEmployerName" Type="String" />
        <asp:Parameter Name="YrsPrevEmployer" Type="String" />
        <asp:Parameter Name="Other_CurrOccupType" Type="String" />
        <asp:Parameter Name="Other_CurrEmploymentStatus" Type="String" />
        <asp:Parameter Name="Other_JobTitle" Type="String" />
        <asp:Parameter Name="Other_CurrEmployerName" Type="String" />
        <asp:Parameter Name="Other_YrsCurrEmployer" Type="String" />
        <asp:Parameter Name="Other_PrevJobTitle" Type="String" />
        <asp:Parameter Name="Other_PrevEmployerName" Type="String" />
        <asp:Parameter Name="Other_PrevEmploymentStatus" Type="String" />
        <asp:Parameter Name="Other_YrsPrevEmployer" Type="String" />
        <asp:Parameter Name="IsSmoker" Type="String" />
        <asp:Parameter Name="HasPrivateHealthIns" Type="String" />
        <asp:Parameter Name="ReasonNoPHI" Type="String" />
        <asp:Parameter Name="HealthSelfRating" Type="String" />
        <asp:Parameter Name="RefusedHICover" Type="String" />
        <asp:Parameter Name="ReasonRefusedHI" Type="String" />
        <asp:Parameter Name="Other_IsSmoker" Type="String" />
        <asp:Parameter Name="Other_HasPrivateHealthIns" Type="String" />
        <asp:Parameter Name="Other_ReasonNoPHI" Type="String" />
        <asp:Parameter Name="Other_RefusedHICover" Type="String" />
        <asp:Parameter Name="Other_ReasonRefusedHI" Type="String" />
        <asp:Parameter Name="Other_HealthSelfRating" Type="String" />
        <asp:Parameter Name="CreatedBy" Type="String" />
        <asp:Parameter Name="ModifiedBy" Type="String" />
        <asp:Parameter DbType="DateTimeOffset" Name="Modified" />
        <asp:Parameter Name="Primary_IncomeMoAT" Type="String" />
        <asp:Parameter Name="Other_IncomeMoAT" Type="String" />
        <asp:Parameter Name="HouseholdIncomeGrossPA" Type="String" />
        <asp:Parameter Name="LookingLocation" Type="String" />
        <asp:Parameter Name="FoundLocation" Type="String" />
        <asp:Parameter Name="IntendedDeposit" Type="String" />
        <asp:Parameter Name="Broker" Type="String" />
        <asp:Parameter Name="BrokerDetails" Type="String" />
        <asp:Parameter Name="Property_Street1" Type="String" />
        <asp:Parameter Name="Property_Street2" Type="String" />
        <asp:Parameter Name="Property_Suburb" Type="String" />
        <asp:Parameter Name="Property_PostCode" Type="Int16" />
        <asp:Parameter Name="Property_State" Type="String" />
        <asp:Parameter Name="Property_Country" Type="String" />
        <asp:Parameter Name="PropertyID" Type="Int32" />
        <asp:Parameter Name="EstSpend" Type="String" />
        <asp:Parameter Name="EntryDate" Type="DateTime" />
        <asp:Parameter Name="EntryId" Type="Int32" />
        <asp:Parameter Name="EntryUserId" Type="String" />
        <asp:Parameter Name="CreatedUTC" Type="DateTime" />
        <asp:Parameter Name="HasAgreedPrivacy" Type="String" />
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
        <asp:Parameter Name="Other_CurrResidStatus" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Street1" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Street2" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Suburb" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_PostCode" Type="Int16" />
        <asp:Parameter Name="PrimPrev_Res_State" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Country" Type="String" />
        <asp:Parameter Name="YrsPrevAddr" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Street1" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Street2" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Suburb" Type="String" />
        <asp:Parameter Name="OthPrev_Res_PostCode" Type="Int16" />
        <asp:Parameter Name="OthPrev_Res_State" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Country" Type="String" />
        <asp:Parameter Name="Other_PrevResStatus" Type="String" />
        <asp:Parameter Name="Other_YrsPrevAddr" Type="String" />
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
        <asp:Parameter Name="TransactionId" Type="String" />
        <asp:Parameter Name="SourceURL" Type="String" />
        <asp:Parameter Name="HasReqestedPriority" Type="String" />
        <asp:Parameter Name="AutoRejected" Type="DateTime" />
        <asp:Parameter Name="AutoRejecetedBy" Type="String" />
        <asp:Parameter Name="AutoAccepted" Type="DateTime" />
        <asp:Parameter Name="AutoAcceptedBy" Type="String" />
        <asp:Parameter Name="_CondApprovedLimit_" Type="Decimal" />
        <asp:Parameter Name="_FinalApprovedLimit_" Type="Decimal" />
        <asp:Parameter Name="MthlyRent" Type="Decimal" />
        <asp:Parameter Name="MthlyDeposit" Type="Decimal" />
        <asp:Parameter Name="CondCreditDecisionDate" Type="DateTime" />
        <asp:Parameter Name="CondCreditDecision" Type="String" />
        <asp:Parameter Name="CondCreditDecisionBy" Type="String" />
        <asp:Parameter Name="CondCreditDecisionInformed" Type="DateTime" />
        <asp:Parameter Name="CondCreditDecisionInformedBy" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="-1" Name="Id" QueryStringField="Id" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ApplicantType" Type="String" />
        <asp:Parameter Name="Primary_Title" Type="String" />
        <asp:Parameter Name="Primary_FirstName" Type="String" />
        <asp:Parameter Name="Primary_OtherNames" Type="String" />
        <asp:Parameter Name="Primary_LastName" Type="String" />
        <asp:Parameter Name="Primary_AUCitizenStat" Type="String" />
        <asp:Parameter Name="Primary_Dependants" Type="Byte" />
        <asp:Parameter Name="Primary_DOB" Type="DateTime" />
        <asp:Parameter Name="Primary_Gender" Type="String" />
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
        <asp:Parameter Name="Primary_YrsCurrAddr" Type="String" />
        <asp:Parameter Name="Other_Res_Street1" Type="String" />
        <asp:Parameter Name="Other_Res_Street2" Type="String" />
        <asp:Parameter Name="Other_Res_PostCode" Type="Int16" />
        <asp:Parameter Name="Other_Res_State" Type="String" />
        <asp:Parameter Name="Other_Res_Country" Type="String" />
        <asp:Parameter Name="Other_Res_Suburb" Type="String" />
        <asp:Parameter Name="Other_YrsCurrAddr" Type="String" />
        <asp:Parameter Name="PrevResStatus" Type="String" />
        <asp:Parameter Name="CurrOccupType" Type="String" />
        <asp:Parameter Name="CurrEmploymentStatus" Type="String" />
        <asp:Parameter Name="CurrJobTitle" Type="String" />
        <asp:Parameter Name="CurrEmployerName" Type="String" />
        <asp:Parameter Name="YrsCurrEmployer" Type="String" />
        <asp:Parameter Name="PrevJobTitle" Type="String" />
        <asp:Parameter Name="PrevEmploymentStatus" Type="String" />
        <asp:Parameter Name="PrevEmployerName" Type="String" />
        <asp:Parameter Name="YrsPrevEmployer" Type="String" />
        <asp:Parameter Name="Other_CurrOccupType" Type="String" />
        <asp:Parameter Name="Other_CurrEmploymentStatus" Type="String" />
        <asp:Parameter Name="Other_JobTitle" Type="String" />
        <asp:Parameter Name="Other_CurrEmployerName" Type="String" />
        <asp:Parameter Name="Other_YrsCurrEmployer" Type="String" />
        <asp:Parameter Name="Other_PrevJobTitle" Type="String" />
        <asp:Parameter Name="Other_PrevEmployerName" Type="String" />
        <asp:Parameter Name="Other_PrevEmploymentStatus" Type="String" />
        <asp:Parameter Name="Other_YrsPrevEmployer" Type="String" />
        <asp:Parameter Name="IsSmoker" Type="String" />
        <asp:Parameter Name="HasPrivateHealthIns" Type="String" />
        <asp:Parameter Name="ReasonNoPHI" Type="String" />
        <asp:Parameter Name="HealthSelfRating" Type="String" />
        <asp:Parameter Name="RefusedHICover" Type="String" />
        <asp:Parameter Name="ReasonRefusedHI" Type="String" />
        <asp:Parameter Name="Other_IsSmoker" Type="String" />
        <asp:Parameter Name="Other_HasPrivateHealthIns" Type="String" />
        <asp:Parameter Name="Other_ReasonNoPHI" Type="String" />
        <asp:Parameter Name="Other_RefusedHICover" Type="String" />
        <asp:Parameter Name="Other_ReasonRefusedHI" Type="String" />
        <asp:Parameter Name="Other_HealthSelfRating" Type="String" />
        <asp:Parameter Name="CreatedBy" Type="String" />
        <asp:Parameter Name="ModifiedBy" Type="String" />
        <asp:Parameter DbType="DateTimeOffset" Name="Modified" />
        <asp:Parameter Name="Primary_IncomeMoAT" Type="String" />
        <asp:Parameter Name="Other_IncomeMoAT" Type="String" />
        <asp:Parameter Name="HouseholdIncomeGrossPA" Type="String" />
        <asp:Parameter Name="LookingLocation" Type="String" />
        <asp:Parameter Name="FoundLocation" Type="String" />
        <asp:Parameter Name="IntendedDeposit" Type="String" />
        <asp:Parameter Name="Broker" Type="String" />
        <asp:Parameter Name="BrokerDetails" Type="String" />
        <asp:Parameter Name="Property_Street1" Type="String" />
        <asp:Parameter Name="Property_Street2" Type="String" />
        <asp:Parameter Name="Property_Suburb" Type="String" />
        <asp:Parameter Name="Property_PostCode" Type="Int16" />
        <asp:Parameter Name="Property_State" Type="String" />
        <asp:Parameter Name="Property_Country" Type="String" />
        <asp:Parameter Name="PropertyID" Type="Int32" />
        <asp:Parameter Name="EstSpend" Type="String" />
        <asp:Parameter Name="EntryDate" Type="DateTime" />
        <asp:Parameter Name="EntryId" Type="Int32" />
        <asp:Parameter Name="EntryUserId" Type="String" />
        <asp:Parameter Name="CreatedUTC" Type="DateTime" />
        <asp:Parameter Name="HasAgreedPrivacy" Type="String" />
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
        <asp:Parameter Name="Other_CurrResidStatus" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Street1" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Street2" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Suburb" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_PostCode" Type="Int16" />
        <asp:Parameter Name="PrimPrev_Res_State" Type="String" />
        <asp:Parameter Name="PrimPrev_Res_Country" Type="String" />
        <asp:Parameter Name="YrsPrevAddr" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Street1" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Street2" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Suburb" Type="String" />
        <asp:Parameter Name="OthPrev_Res_PostCode" Type="Int16" />
        <asp:Parameter Name="OthPrev_Res_State" Type="String" />
        <asp:Parameter Name="OthPrev_Res_Country" Type="String" />
        <asp:Parameter Name="Other_PrevResStatus" Type="String" />
        <asp:Parameter Name="Other_YrsPrevAddr" Type="String" />
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
        <asp:Parameter Name="TransactionId" Type="String" />
        <asp:Parameter Name="SourceURL" Type="String" />
        <asp:Parameter Name="HasReqestedPriority" Type="String" />
        <asp:Parameter Name="AutoRejected" Type="DateTime" />
        <asp:Parameter Name="AutoRejecetedBy" Type="String" />
        <asp:Parameter Name="AutoAccepted" Type="DateTime" />
        <asp:Parameter Name="AutoAcceptedBy" Type="String" />
        <asp:Parameter Name="_CondApprovedLimit_" Type="Decimal" />
        <asp:Parameter Name="_FinalApprovedLimit_" Type="Decimal" />
        <asp:Parameter Name="MthlyRent" Type="Decimal" />
        <asp:Parameter Name="MthlyDeposit" Type="Decimal" />
        <asp:Parameter Name="CondCreditDecisionDate" Type="DateTime" />
        <asp:Parameter Name="CondCreditDecision" Type="String" />
        <asp:Parameter Name="CondCreditDecisionBy" Type="String" />
        <asp:Parameter Name="CondCreditDecisionInformed" Type="DateTime" />
        <asp:Parameter Name="CondCreditDecisionInformedBy" Type="String" />
        <asp:Parameter Name="Original_Id" Type="Int32" />
        <asp:Parameter Name="Original_RowVersion" Type="Object" />
    </UpdateParameters>
</asp:ObjectDataSource>
    <br />
        <p>
          <span style="font-weight: bold">Conditional Approval:</span>
        </p>
    <p>
           Approver: <asp:Label ID="lblApprover" runat="server" Text="Pavel Dvorak" ToolTip="Name of current user who will be recorded as approver of the Application."></asp:Label>
        </p>
    <p>
        <asp:Button ID="btnCondApprove" runat="server" Text="Conditionally Approve" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CondApprovalModal"/>
        </p>
    <p>
        <asp:Label ID="lblCondApproveError" runat="server" BackColor="Red" ForeColor="White" Visible="False"></asp:Label>
        </p>
    <p>
        &nbsp;</p>
   
    <!-- COnditional approval confirmation -->
        <div id="CondApprovalModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
         <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                 <h3 id="myModalLabel3">Confirmation</h3>

            </div>
            <div class="modal-body">
                <p>Are you sure you want to conditionally approve this application?</p>
            </div>
            <div class="modal-footer">
                <%--  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="SubForm">Conditionally Approve</button>--%>
                 <button data-dismiss="modal" class="btn  btn-large" aria-hidden="true">Cancel</button>
                 <asp:Button runat="server" ID="ButtonCondApprovedModal" Text="Conditionally Approve" CssClass="btn" OnClick="ButtonCondApprovedModal_Click" UseSubmitBehavior="false" data-dismiss="modal" />
            </div>
        </div>
    </div>
        </div>

        
     <p>
        <strong>Conditional Approval Letter Sent:</strong></p>
    <p>
        Officer: Pavel Dvorak</p>
      <p>
        <asp:Button ID="btnCondResultSent" runat="server" Text="Mark Conditional Result as Sent" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CondResultSentModal"/>
        </p>

      <div id="CondResultSentModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
         <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">                
                 <h3 id="myModalLabel2">Confirmation</h3>
            </div>
            <div class="modal-body">
                <p>Are you sure you have sent the result of conditional approval result <%=this.lblCondApproved.Text%> to this applicant?</p>
            </div>
            <div class="modal-footer">
              <%--  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="SubForm">Conditionally Approve</button>--%>
                 <button data-dismiss="modal" class="btn  btn-large" aria-hidden="true">Cancel</button>
                 <asp:Button runat="server" ID="Button1" Text="Mark Result as Sent" CssClass="btn" OnClick="ButtonCondResultSentModal_Click" UseSubmitBehavior="false" data-dismiss="modal" />
            </div>
        </div>
    </div>
           </div>
</asp:Content>
