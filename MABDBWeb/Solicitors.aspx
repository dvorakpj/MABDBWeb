<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Solicitors.aspx.cs" Inherits="MABDBWeb.Solicitors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Solicitors<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SolicitorDataSource">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="CompanyName" HeaderText="Business Name" SortExpression="CompanyName" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="OtherName" HeaderText="Other Name" SortExpression="OtherName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="ABN" HeaderText="ABN" SortExpression="ABN" />
            <asp:BoundField DataField="MainContactName" HeaderText="Main Contact" SortExpression="MainContactName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="PhoneMobile" HeaderText="Mobile" SortExpression="PhoneMobile" />
            <asp:BoundField DataField="PhoneWork" HeaderText="Work" SortExpression="PhoneWork" />
            <asp:BoundField DataField="RegAddr_Street1" HeaderText="RegAddr Street1" SortExpression="RegAddr_Street1" />
            <asp:BoundField DataField="RegAddr_Street2" HeaderText="Street2" SortExpression="RegAddr_Street2" />
            <asp:BoundField DataField="RegAddr_Suburb" HeaderText="Suburb" SortExpression="RegAddr_Suburb" />
            <asp:BoundField DataField="RegAddr_Postcode" HeaderText="Postcode" SortExpression="RegAddr_Postcode" />
            <asp:BoundField DataField="RegAddr_State" HeaderText="State" SortExpression="RegAddr_State" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="SolicitorDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataUtils.SolicitorDSTableAdapters.SolicitorTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
            <asp:Parameter Name="Original_OtherName" Type="String" />
            <asp:Parameter Name="Original_LastName" Type="String" />
            <asp:Parameter Name="Original_TradingName" Type="String" />
            <asp:Parameter Name="Original_RegisteredName" Type="String" />
            <asp:Parameter Name="Original_ABN" Type="String" />
            <asp:Parameter Name="Original_ACN" Type="String" />
            <asp:Parameter Name="Original_MainContactName" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
            <asp:Parameter Name="Original_EmailOther" Type="String" />
            <asp:Parameter Name="Original_PhoneMobile" Type="String" />
            <asp:Parameter Name="Original_PhoneWork" Type="String" />
            <asp:Parameter Name="Original_PhoneOther" Type="String" />
            <asp:Parameter Name="Original_ContactNote" Type="String" />
            <asp:Parameter Name="Original_Notes" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Street1" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Street2" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Street3" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Suburb" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Postcode" Type="String" />
            <asp:Parameter Name="Original_RegAddr_State" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Country" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Name" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Street1" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Street2" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Street3" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Suburb" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Postcode" Type="String" />
            <asp:Parameter Name="Original_BillAddr_State" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Country" Type="String" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="OtherName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="TradingName" Type="String" />
            <asp:Parameter Name="RegisteredName" Type="String" />
            <asp:Parameter Name="ABN" Type="String" />
            <asp:Parameter Name="ACN" Type="String" />
            <asp:Parameter Name="MainContactName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="EmailOther" Type="String" />
            <asp:Parameter Name="PhoneMobile" Type="String" />
            <asp:Parameter Name="PhoneWork" Type="String" />
            <asp:Parameter Name="PhoneOther" Type="String" />
            <asp:Parameter Name="ContactNote" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="RegAddr_Street1" Type="String" />
            <asp:Parameter Name="RegAddr_Street2" Type="String" />
            <asp:Parameter Name="RegAddr_Street3" Type="String" />
            <asp:Parameter Name="RegAddr_Suburb" Type="String" />
            <asp:Parameter Name="RegAddr_Postcode" Type="String" />
            <asp:Parameter Name="RegAddr_State" Type="String" />
            <asp:Parameter Name="RegAddr_Country" Type="String" />
            <asp:Parameter Name="BillAddr_Name" Type="String" />
            <asp:Parameter Name="BillAddr_Street1" Type="String" />
            <asp:Parameter Name="BillAddr_Street2" Type="String" />
            <asp:Parameter Name="BillAddr_Street3" Type="String" />
            <asp:Parameter Name="BillAddr_Suburb" Type="String" />
            <asp:Parameter Name="BillAddr_Postcode" Type="String" />
            <asp:Parameter Name="BillAddr_State" Type="String" />
            <asp:Parameter Name="BillAddr_Country" Type="String" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="Updated" Type="DateTime" />
            <asp:Parameter Name="UpdatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="OtherName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="TradingName" Type="String" />
            <asp:Parameter Name="RegisteredName" Type="String" />
            <asp:Parameter Name="ABN" Type="String" />
            <asp:Parameter Name="ACN" Type="String" />
            <asp:Parameter Name="MainContactName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="EmailOther" Type="String" />
            <asp:Parameter Name="PhoneMobile" Type="String" />
            <asp:Parameter Name="PhoneWork" Type="String" />
            <asp:Parameter Name="PhoneOther" Type="String" />
            <asp:Parameter Name="ContactNote" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="RegAddr_Street1" Type="String" />
            <asp:Parameter Name="RegAddr_Street2" Type="String" />
            <asp:Parameter Name="RegAddr_Street3" Type="String" />
            <asp:Parameter Name="RegAddr_Suburb" Type="String" />
            <asp:Parameter Name="RegAddr_Postcode" Type="String" />
            <asp:Parameter Name="RegAddr_State" Type="String" />
            <asp:Parameter Name="RegAddr_Country" Type="String" />
            <asp:Parameter Name="BillAddr_Name" Type="String" />
            <asp:Parameter Name="BillAddr_Street1" Type="String" />
            <asp:Parameter Name="BillAddr_Street2" Type="String" />
            <asp:Parameter Name="BillAddr_Street3" Type="String" />
            <asp:Parameter Name="BillAddr_Suburb" Type="String" />
            <asp:Parameter Name="BillAddr_Postcode" Type="String" />
            <asp:Parameter Name="BillAddr_State" Type="String" />
            <asp:Parameter Name="BillAddr_Country" Type="String" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="Updated" Type="DateTime" />
            <asp:Parameter Name="UpdatedBy" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
            <asp:Parameter Name="Original_OtherName" Type="String" />
            <asp:Parameter Name="Original_LastName" Type="String" />
            <asp:Parameter Name="Original_TradingName" Type="String" />
            <asp:Parameter Name="Original_RegisteredName" Type="String" />
            <asp:Parameter Name="Original_ABN" Type="String" />
            <asp:Parameter Name="Original_ACN" Type="String" />
            <asp:Parameter Name="Original_MainContactName" Type="String" />
            <asp:Parameter Name="Original_Email" Type="String" />
            <asp:Parameter Name="Original_EmailOther" Type="String" />
            <asp:Parameter Name="Original_PhoneMobile" Type="String" />
            <asp:Parameter Name="Original_PhoneWork" Type="String" />
            <asp:Parameter Name="Original_PhoneOther" Type="String" />
            <asp:Parameter Name="Original_ContactNote" Type="String" />
            <asp:Parameter Name="Original_Notes" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Street1" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Street2" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Street3" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Suburb" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Postcode" Type="String" />
            <asp:Parameter Name="Original_RegAddr_State" Type="String" />
            <asp:Parameter Name="Original_RegAddr_Country" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Name" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Street1" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Street2" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Street3" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Suburb" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Postcode" Type="String" />
            <asp:Parameter Name="Original_BillAddr_State" Type="String" />
            <asp:Parameter Name="Original_BillAddr_Country" Type="String" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
