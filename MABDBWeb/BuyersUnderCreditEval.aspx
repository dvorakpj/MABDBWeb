<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyersUnderCreditEval.aspx.cs" Inherits="MABDBWeb.BuyersAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        MA Buyers - Credit assessment in progress</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="BuyersUnderCreditEvalDS">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="MABuyerId" HeaderText="MA Buyer Id" SortExpression="MABuyerId" />
                <asp:HyperLinkField DataNavigateUrlFormatString="BuyerDetail.aspx?Id={0}" HeaderText="Detail" Text="Detail" />
                <asp:BoundField DataField="BuyerApplicationId" HeaderText="App Id" SortExpression="BuyerApplicationId" />
                <asp:BoundField DataField="PrimaryBuyerId" HeaderText="Primary Buyer Id" SortExpression="PrimaryBuyerId" />
                <asp:BoundField DataField="PersonalSalutation" HeaderText="Personal Salutation" SortExpression="PersonalSalutation" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="OtherNames" HeaderText="OtherNames" SortExpression="OtherNames" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Res_UnitNum" HeaderText="UnitNum" SortExpression="Res_UnitNum" />
                <asp:BoundField DataField="Res_Street1" HeaderText="Street 1" SortExpression="Res_Street1" />
                <asp:BoundField DataField="Res_Street2" HeaderText="Street2" SortExpression="Res_Street2" />
                <asp:BoundField DataField="Res_Postcode" HeaderText="Postcode" SortExpression="Res_Postcode" />
                <asp:BoundField DataField="Res_Suburb" HeaderText="Suburb" SortExpression="Res_Suburb" />
                <asp:BoundField DataField="Res_State" HeaderText="State" SortExpression="Res_State" />
                <asp:BoundField DataField="Res_Country" HeaderText="Country" SortExpression="Res_Country" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                <asp:BoundField DataField="PhoneMobile" HeaderText="Mobile" SortExpression="PhoneMobile" />
                <asp:BoundField DataField="PhoneHome" HeaderText="Ph Home" SortExpression="PhoneHome" />
                <asp:BoundField DataField="PhoneWork" HeaderText="Ph Work" SortExpression="PhoneWork" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="AppliedLimit$" HeaderText="AppliedLimit$" SortExpression="AppliedLimit$" />
                <asp:BoundField DataField="CondCreditDecision" HeaderText="Cond Decision" SortExpression="CondCreditDecision" />
                <asp:BoundField DataField="CondApprovedLimit$" HeaderText="CondApprovedLimit$" SortExpression="CondApprovedLimit$" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="BuyersUnderCreditEvalDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_UnderCreditEval" TypeName="DataUtils.BuyerDSTableAdapters.BuyerTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32" />
                <asp:Parameter Name="Original_MABuyerId" Type="String" />
                <asp:Parameter Name="Original_BuyerApplicationId" Type="Int32" />
                <asp:Parameter Name="Original_PrimaryBuyerId" Type="Int32" />
                <asp:Parameter Name="Original_Title" Type="String" />
                <asp:Parameter Name="Original_FirstName" Type="String" />
                <asp:Parameter Name="Original_OtherNames" Type="String" />
                <asp:Parameter Name="Original_LastName" Type="String" />
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
                <asp:Parameter Name="Original_Email" Type="String" />
                <asp:Parameter Name="Original_EmailOther" Type="String" />
                <asp:Parameter Name="Original_ContactComments" Type="String" />
                <asp:Parameter Name="Original_DeathCoverInsurer" Type="String" />
                <asp:Parameter Name="Original_DeathCoverDetail" Type="String" />
                <asp:Parameter Name="Original_TPDCoverInsurer" Type="String" />
                <asp:Parameter Name="Original_TPDCoverDetail" Type="String" />
                <asp:Parameter Name="Original_MAStatus" Type="String" />
                <asp:Parameter Name="Original_AppliedDate" Type="DateTime" />
                <asp:Parameter Name="Original_MAApprovedDate" Type="DateTime" />
                <asp:Parameter Name="Original_Created" Type="DateTime" />
                <asp:Parameter Name="Original_CreatedBy" Type="String" />
                <asp:Parameter Name="Original_Updated" Type="DateTime" />
                <asp:Parameter Name="Original_UpdatedBy" Type="String" />
                <asp:Parameter Name="Original_CondCreditDecisionDate" Type="DateTime" />
                <asp:Parameter Name="Original_CondCreditDecision" Type="String" />
                <asp:Parameter Name="Original_CondCreditDecisionBy" Type="String" />
                <asp:Parameter Name="Original_CondCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="Original_CondCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="Original_FinalCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="Original_FinalCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="_Original_AppliedLimit_" Type="Decimal" />
                <asp:Parameter Name="_Original_CondApprovedLimit_" Type="Decimal" />
                <asp:Parameter Name="_Original_FinalApprovedLimit_" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MABuyerId" Type="String" />
                <asp:Parameter Name="BuyerApplicationId" Type="Int32" />
                <asp:Parameter Name="PrimaryBuyerId" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="OtherNames" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
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
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EmailOther" Type="String" />
                <asp:Parameter Name="ContactComments" Type="String" />
                <asp:Parameter Name="DeathCoverInsurer" Type="String" />
                <asp:Parameter Name="DeathCoverDetail" Type="String" />
                <asp:Parameter Name="TPDCoverInsurer" Type="String" />
                <asp:Parameter Name="TPDCoverDetail" Type="String" />
                <asp:Parameter Name="MAStatus" Type="String" />
                <asp:Parameter Name="AppliedDate" Type="DateTime" />
                <asp:Parameter Name="MAApprovedDate" Type="DateTime" />
                <asp:Parameter Name="Created" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="Updated" Type="DateTime" />
                <asp:Parameter Name="UpdatedBy" Type="String" />
                <asp:Parameter Name="CondCreditDecisionDate" Type="DateTime" />
                <asp:Parameter Name="CondCreditDecision" Type="String" />
                <asp:Parameter Name="CondCreditDecisionBy" Type="String" />
                <asp:Parameter Name="CondCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="CondCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="FinalCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="FinalCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="_AppliedLimit_" Type="Decimal" />
                <asp:Parameter Name="_CondApprovedLimit_" Type="Decimal" />
                <asp:Parameter Name="_FinalApprovedLimit_" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MABuyerId" Type="String" />
                <asp:Parameter Name="BuyerApplicationId" Type="Int32" />
                <asp:Parameter Name="PrimaryBuyerId" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="OtherNames" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
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
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EmailOther" Type="String" />
                <asp:Parameter Name="ContactComments" Type="String" />
                <asp:Parameter Name="DeathCoverInsurer" Type="String" />
                <asp:Parameter Name="DeathCoverDetail" Type="String" />
                <asp:Parameter Name="TPDCoverInsurer" Type="String" />
                <asp:Parameter Name="TPDCoverDetail" Type="String" />
                <asp:Parameter Name="MAStatus" Type="String" />
                <asp:Parameter Name="AppliedDate" Type="DateTime" />
                <asp:Parameter Name="MAApprovedDate" Type="DateTime" />
                <asp:Parameter Name="Created" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="Updated" Type="DateTime" />
                <asp:Parameter Name="UpdatedBy" Type="String" />
                <asp:Parameter Name="CondCreditDecisionDate" Type="DateTime" />
                <asp:Parameter Name="CondCreditDecision" Type="String" />
                <asp:Parameter Name="CondCreditDecisionBy" Type="String" />
                <asp:Parameter Name="CondCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="CondCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="FinalCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="FinalCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="_AppliedLimit_" Type="Decimal" />
                <asp:Parameter Name="_CondApprovedLimit_" Type="Decimal" />
                <asp:Parameter Name="_FinalApprovedLimit_" Type="Decimal" />
                <asp:Parameter Name="Original_Id" Type="Int32" />
                <asp:Parameter Name="Original_MABuyerId" Type="String" />
                <asp:Parameter Name="Original_BuyerApplicationId" Type="Int32" />
                <asp:Parameter Name="Original_PrimaryBuyerId" Type="Int32" />
                <asp:Parameter Name="Original_Title" Type="String" />
                <asp:Parameter Name="Original_FirstName" Type="String" />
                <asp:Parameter Name="Original_OtherNames" Type="String" />
                <asp:Parameter Name="Original_LastName" Type="String" />
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
                <asp:Parameter Name="Original_Email" Type="String" />
                <asp:Parameter Name="Original_EmailOther" Type="String" />
                <asp:Parameter Name="Original_ContactComments" Type="String" />
                <asp:Parameter Name="Original_DeathCoverInsurer" Type="String" />
                <asp:Parameter Name="Original_DeathCoverDetail" Type="String" />
                <asp:Parameter Name="Original_TPDCoverInsurer" Type="String" />
                <asp:Parameter Name="Original_TPDCoverDetail" Type="String" />
                <asp:Parameter Name="Original_MAStatus" Type="String" />
                <asp:Parameter Name="Original_AppliedDate" Type="DateTime" />
                <asp:Parameter Name="Original_MAApprovedDate" Type="DateTime" />
                <asp:Parameter Name="Original_Created" Type="DateTime" />
                <asp:Parameter Name="Original_CreatedBy" Type="String" />
                <asp:Parameter Name="Original_Updated" Type="DateTime" />
                <asp:Parameter Name="Original_UpdatedBy" Type="String" />
                <asp:Parameter Name="Original_CondCreditDecisionDate" Type="DateTime" />
                <asp:Parameter Name="Original_CondCreditDecision" Type="String" />
                <asp:Parameter Name="Original_CondCreditDecisionBy" Type="String" />
                <asp:Parameter Name="Original_CondCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="Original_CondCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="Original_FinalCreditDecisionInformed" Type="DateTime" />
                <asp:Parameter Name="Original_FinalCreditDecisionInformedBy" Type="String" />
                <asp:Parameter Name="_Original_AppliedLimit_" Type="Decimal" />
                <asp:Parameter Name="_Original_CondApprovedLimit_" Type="Decimal" />
                <asp:Parameter Name="_Original_FinalApprovedLimit_" Type="Decimal" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </p>
</asp:Content>
