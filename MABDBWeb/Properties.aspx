<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Properties.aspx.cs" Inherits="MABDBWeb.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <strong>Properties</strong><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="PropertiesDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/PropertyDetail.aspx?Id={0}" DataTextField="{Id}" Text="Detail" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="UnitNum" HeaderText="UnitNum" SortExpression="UnitNum" />
            <asp:BoundField DataField="Street1" HeaderText="Street1" SortExpression="Street1" />
            <asp:BoundField DataField="Street2" HeaderText="Street2" SortExpression="Street2" />
            <asp:BoundField DataField="Suburb" HeaderText="Suburb" SortExpression="Suburb" />
            <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="PropertiesDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataUtils.PropertyDSTableAdapters.PropertyTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_MAId" Type="String" />
            <asp:Parameter Name="Original_Type" Type="Int16" />
            <asp:Parameter Name="Original_UnitNum" Type="String" />
            <asp:Parameter Name="Original_Street1" Type="String" />
            <asp:Parameter Name="Original_Street2" Type="String" />
            <asp:Parameter Name="Original_Street3" Type="String" />
            <asp:Parameter Name="Original_Street4" Type="String" />
            <asp:Parameter Name="Original_Street5" Type="String" />
            <asp:Parameter Name="Original_Suburb" Type="String" />
            <asp:Parameter Name="Original_Postcode" Type="Int16" />
            <asp:Parameter Name="Original_State" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
            <asp:Parameter Name="Original_Country" Type="String" />
            <asp:Parameter Name="Original_LocalGov" Type="String" />
            <asp:Parameter Name="Original_ListPrice" Type="Decimal" />
            <asp:Parameter Name="Original_AgreedPrice" Type="Decimal" />
            <asp:Parameter Name="Original_PurchasePrice" Type="Decimal" />
            <asp:Parameter Name="Original_TitleType" Type="String" />
            <asp:Parameter Name="Original_Lot" Type="String" />
            <asp:Parameter Name="Original_Plan" Type="String" />
            <asp:Parameter Name="Original_Parish" Type="String" />
            <asp:Parameter Name="Original_CTVolume" Type="String" />
            <asp:Parameter Name="Original_CTFolio" Type="String" />
            <asp:Parameter Name="Original_AreaSqm" Type="Decimal" />
            <asp:Parameter Name="Original_InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="Original_InvestorListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="Original_BuyerListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="Original_ListingComments" Type="String" />
            <asp:Parameter Name="Original_InvestorListingAgentId" Type="Int32" />
            <asp:Parameter Name="Original_VendorId" Type="Int32" />
            <asp:Parameter Name="Original_DevelopmentId" Type="Int32" />
            <asp:Parameter Name="Original_PrimaryInvestorId" Type="Int32" />
            <asp:Parameter Name="Original_InvestorContractId" Type="Int32" />
            <asp:Parameter Name="Original_BuyerContractId" Type="Int32" />
            <asp:Parameter Name="Original_BuyerId" Type="Int32" />
            <asp:Parameter Name="Original_ManagingAgentId" Type="Int32" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MAId" Type="String" />
            <asp:Parameter Name="Type" Type="Int16" />
            <asp:Parameter Name="UnitNum" Type="String" />
            <asp:Parameter Name="Street1" Type="String" />
            <asp:Parameter Name="Street2" Type="String" />
            <asp:Parameter Name="Street3" Type="String" />
            <asp:Parameter Name="Street4" Type="String" />
            <asp:Parameter Name="Street5" Type="String" />
            <asp:Parameter Name="Suburb" Type="String" />
            <asp:Parameter Name="Postcode" Type="Int16" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="LocalGov" Type="String" />
            <asp:Parameter Name="ListPrice" Type="Decimal" />
            <asp:Parameter Name="AgreedPrice" Type="Decimal" />
            <asp:Parameter Name="PurchasePrice" Type="Decimal" />
            <asp:Parameter Name="TitleType" Type="String" />
            <asp:Parameter Name="Lot" Type="String" />
            <asp:Parameter Name="Plan" Type="String" />
            <asp:Parameter Name="Parish" Type="String" />
            <asp:Parameter Name="CTVolume" Type="String" />
            <asp:Parameter Name="CTFolio" Type="String" />
            <asp:Parameter Name="AreaSqm" Type="Decimal" />
            <asp:Parameter Name="InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="InvestorListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="BuyerListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="ListingComments" Type="String" />
            <asp:Parameter Name="InvestorListingAgentId" Type="Int32" />
            <asp:Parameter Name="VendorId" Type="Int32" />
            <asp:Parameter Name="DevelopmentId" Type="Int32" />
            <asp:Parameter Name="PrimaryInvestorId" Type="Int32" />
            <asp:Parameter Name="InvestorContractId" Type="Int32" />
            <asp:Parameter Name="BuyerContractId" Type="Int32" />
            <asp:Parameter Name="BuyerId" Type="Int32" />
            <asp:Parameter Name="ManagingAgentId" Type="Int32" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="Updated" Type="DateTime" />
            <asp:Parameter Name="UpdatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MAId" Type="String" />
            <asp:Parameter Name="Type" Type="Int16" />
            <asp:Parameter Name="UnitNum" Type="String" />
            <asp:Parameter Name="Street1" Type="String" />
            <asp:Parameter Name="Street2" Type="String" />
            <asp:Parameter Name="Street3" Type="String" />
            <asp:Parameter Name="Street4" Type="String" />
            <asp:Parameter Name="Street5" Type="String" />
            <asp:Parameter Name="Suburb" Type="String" />
            <asp:Parameter Name="Postcode" Type="Int16" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="LocalGov" Type="String" />
            <asp:Parameter Name="ListPrice" Type="Decimal" />
            <asp:Parameter Name="AgreedPrice" Type="Decimal" />
            <asp:Parameter Name="PurchasePrice" Type="Decimal" />
            <asp:Parameter Name="TitleType" Type="String" />
            <asp:Parameter Name="Lot" Type="String" />
            <asp:Parameter Name="Plan" Type="String" />
            <asp:Parameter Name="Parish" Type="String" />
            <asp:Parameter Name="CTVolume" Type="String" />
            <asp:Parameter Name="CTFolio" Type="String" />
            <asp:Parameter Name="AreaSqm" Type="Decimal" />
            <asp:Parameter Name="InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="InvestorListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="BuyerListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="ListingComments" Type="String" />
            <asp:Parameter Name="InvestorListingAgentId" Type="Int32" />
            <asp:Parameter Name="VendorId" Type="Int32" />
            <asp:Parameter Name="DevelopmentId" Type="Int32" />
            <asp:Parameter Name="PrimaryInvestorId" Type="Int32" />
            <asp:Parameter Name="InvestorContractId" Type="Int32" />
            <asp:Parameter Name="BuyerContractId" Type="Int32" />
            <asp:Parameter Name="BuyerId" Type="Int32" />
            <asp:Parameter Name="ManagingAgentId" Type="Int32" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="Updated" Type="DateTime" />
            <asp:Parameter Name="UpdatedBy" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_MAId" Type="String" />
            <asp:Parameter Name="Original_Type" Type="Int16" />
            <asp:Parameter Name="Original_UnitNum" Type="String" />
            <asp:Parameter Name="Original_Street1" Type="String" />
            <asp:Parameter Name="Original_Street2" Type="String" />
            <asp:Parameter Name="Original_Street3" Type="String" />
            <asp:Parameter Name="Original_Street4" Type="String" />
            <asp:Parameter Name="Original_Street5" Type="String" />
            <asp:Parameter Name="Original_Suburb" Type="String" />
            <asp:Parameter Name="Original_Postcode" Type="Int16" />
            <asp:Parameter Name="Original_State" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
            <asp:Parameter Name="Original_Country" Type="String" />
            <asp:Parameter Name="Original_LocalGov" Type="String" />
            <asp:Parameter Name="Original_ListPrice" Type="Decimal" />
            <asp:Parameter Name="Original_AgreedPrice" Type="Decimal" />
            <asp:Parameter Name="Original_PurchasePrice" Type="Decimal" />
            <asp:Parameter Name="Original_TitleType" Type="String" />
            <asp:Parameter Name="Original_Lot" Type="String" />
            <asp:Parameter Name="Original_Plan" Type="String" />
            <asp:Parameter Name="Original_Parish" Type="String" />
            <asp:Parameter Name="Original_CTVolume" Type="String" />
            <asp:Parameter Name="Original_CTFolio" Type="String" />
            <asp:Parameter Name="Original_AreaSqm" Type="Decimal" />
            <asp:Parameter Name="Original_InvestorApplicationId" Type="Int32" />
            <asp:Parameter Name="Original_InvestorListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="Original_BuyerListingFeePaid" Type="DateTime" />
            <asp:Parameter Name="Original_ListingComments" Type="String" />
            <asp:Parameter Name="Original_InvestorListingAgentId" Type="Int32" />
            <asp:Parameter Name="Original_VendorId" Type="Int32" />
            <asp:Parameter Name="Original_DevelopmentId" Type="Int32" />
            <asp:Parameter Name="Original_PrimaryInvestorId" Type="Int32" />
            <asp:Parameter Name="Original_InvestorContractId" Type="Int32" />
            <asp:Parameter Name="Original_BuyerContractId" Type="Int32" />
            <asp:Parameter Name="Original_BuyerId" Type="Int32" />
            <asp:Parameter Name="Original_ManagingAgentId" Type="Int32" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
