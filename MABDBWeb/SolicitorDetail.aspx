<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SolicitorDetail.aspx.cs" Inherits="MABDBWeb.SolicitorDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <strong>Solicitor Details</strong><asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SolicitorDataSource" Height="16px" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdating="DetailsView1_ItemUpdating" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="496px">
        <Fields>
            <asp:BoundField DataField="MASolicitorId" HeaderText="MA Solicitor ID" SortExpression="MASolicitorId" />
            <asp:BoundField DataField="Id" HeaderText="Internal ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="CompanyName" HeaderText="Business Name" SortExpression="CompanyName" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="OtherName" HeaderText="Other Name" SortExpression="OtherName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="TradingName" HeaderText="Trading Name" SortExpression="TradingName" />
            <asp:BoundField DataField="RegisteredName" HeaderText="Registered Name" SortExpression="RegisteredName" />
            <asp:BoundField DataField="ABN" HeaderText="ABN" SortExpression="ABN" />
            <asp:BoundField DataField="ACN" HeaderText="ACN" SortExpression="ACN" />
            <asp:BoundField DataField="MainContactName" HeaderText="Main Contact" SortExpression="MainContactName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="EmailOther" HeaderText="Email - Other" SortExpression="EmailOther" />
            <asp:BoundField DataField="PhoneMobile" HeaderText="Phone - Mobile" SortExpression="PhoneMobile" />
            <asp:BoundField DataField="PhoneWork" HeaderText="Phone - Work" SortExpression="PhoneWork" />
            <asp:BoundField DataField="PhoneOther" HeaderText="Phone - Other" SortExpression="PhoneOther" />
            <asp:BoundField DataField="ContactNote" HeaderText="Contact - Note" SortExpression="ContactNote" />
            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
            <asp:BoundField DataField="RegAddr_Street1" HeaderText="Reg Addr - Street 1" SortExpression="RegAddr_Street1" />
            <asp:BoundField DataField="RegAddr_Street2" HeaderText="Reg Addr - Street 2" SortExpression="RegAddr_Street2" />
            <asp:BoundField DataField="RegAddr_Suburb" HeaderText="Reg Addr - Suburb" SortExpression="RegAddr_Suburb" />
            <asp:BoundField DataField="RegAddr_Postcode" HeaderText="Reg Addr - Postcode" SortExpression="RegAddr_Postcode" />
            <asp:BoundField DataField="RegAddr_State" HeaderText="Reg Addr - State" SortExpression="RegAddr_State" />
            <asp:BoundField DataField="RegAddr_Country" HeaderText="Reg Addr - Country" SortExpression="RegAddr_Country" />
            <asp:BoundField DataField="BillAddr_Name" HeaderText="Bill Addr - Name" SortExpression="BillAddr_Name" />
            <asp:BoundField DataField="BillAddr_Street1" HeaderText="Bill Addr - Street 1" SortExpression="BillAddr_Street1" />
            <asp:BoundField DataField="BillAddr_Street2" HeaderText="Bill Addr - Street 2" SortExpression="BillAddr_Street2" />
            <asp:BoundField DataField="BillAddr_Street3" HeaderText="Bill Addr - Street 3" SortExpression="BillAddr_Street3" />
            <asp:BoundField DataField="BillAddr_Suburb" HeaderText="Bill Addr - Suburb" SortExpression="BillAddr_Suburb" />
            <asp:BoundField DataField="BillAddr_Postcode" HeaderText="Bill Addr - Postcode" SortExpression="BillAddr_Postcode" />
            <asp:BoundField DataField="BillAddr_State" HeaderText="Bill Addr - State" SortExpression="BillAddr_State" />
            <asp:BoundField DataField="BillAddr_Country" HeaderText="Bill Addr - Country" SortExpression="BillAddr_Country" />
            <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
            <asp:BoundField DataField="Updated" HeaderText="Updated" SortExpression="Updated" />
            <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="SolicitorDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataUtils.SolicitorDSTableAdapters.SolicitorTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_MASolicitorId" Type="String" />
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
            <asp:Parameter Name="Original_InfoValidTill" Type="DateTime" />
            <asp:Parameter Name="Original_PrevInfoVerId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MASolicitorId" Type="String" />
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
            <asp:Parameter Name="InfoValidTill" Type="DateTime" />
            <asp:Parameter Name="PrevInfoVerId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MASolicitorId" Type="String" />
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
            <asp:Parameter Name="InfoValidTill" Type="DateTime" />
            <asp:Parameter Name="PrevInfoVerId" Type="Int32" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_MASolicitorId" Type="String" />
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
            <asp:Parameter Name="Original_InfoValidTill" Type="DateTime" />
            <asp:Parameter Name="Original_PrevInfoVerId" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lbl_SolicitorFirmsLstBox" runat="server" Font-Bold="True" Text="Associated Solicitor Firms"></asp:Label>
    <br />
    <asp:ListBox ID="lstBox_SolicitorFirms" runat="server" DataSourceID="SolicitorFirmsDataSource" DataTextField="CompanyName" DataValueField="Id" Height="127px" Width="497px"></asp:ListBox>
    <asp:ObjectDataSource ID="SolicitorFirmsDataSource" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" OnInit="SolicitorFirmsDataSource_Init" OnLoad="SolicitorFirmsDataSource_Load" SelectMethod="GetData" TypeName="DataUtils.SolicitorDSTableAdapters.SolicitorFirmTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_CompanyName" Type="String" />
            <asp:Parameter Name="Original_TradingName" Type="String" />
            <asp:Parameter Name="Original_RegisteredName" Type="String" />
            <asp:Parameter Name="Original_ABN" Type="String" />
            <asp:Parameter Name="Original_ACN" Type="String" />
            <asp:Parameter Name="Original_PrincipalName" Type="String" />
            <asp:Parameter Name="Original_OfficeAdminContactName" Type="String" />
            <asp:Parameter Name="Original_OfficeAdminEmail" Type="String" />
            <asp:Parameter Name="Original_OfficeAdminEmailOther" Type="String" />
            <asp:Parameter Name="Original_OfficeAdminPhoneMobile" Type="String" />
            <asp:Parameter Name="Original_OfficeAdminPhone" Type="String" />
            <asp:Parameter Name="Original_OfficeAdminPhoneOther" Type="String" />
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
            <asp:Parameter Name="Original_PrincipalAddr_Street1" Type="String" />
            <asp:Parameter Name="Original_PrincipalAddr_Street2" Type="String" />
            <asp:Parameter Name="Original_PrincipalAddr_Street3" Type="String" />
            <asp:Parameter Name="Original_PrincipalAddr_Suburb" Type="String" />
            <asp:Parameter Name="Original_PrincipalAddr_Postcode" Type="String" />
            <asp:Parameter Name="Original_PrincipalAddr_State" Type="String" />
            <asp:Parameter Name="Original_PrincipalAddr_Country" Type="String" />
            <asp:Parameter Name="Original_QLDOpsDesc" Type="String" />
            <asp:Parameter Name="Original_Partners" Type="String" />
            <asp:Parameter Name="Original_PIInsurer" Type="String" />
            <asp:Parameter Name="Original_PIInsRenewalDate" Type="DateTime" />
            <asp:Parameter Name="Original_PIInsAmtEvidence" Type="String" />
            <asp:Parameter Name="Original_RegionalOfficeId" Type="Int32" />
            <asp:Parameter Name="Original_Created" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_Updated" Type="DateTime" />
            <asp:Parameter Name="Original_UpdatedBy" Type="String" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Button ID="btn_AddSolFirmRel" runat="server" OnClick="btn_AddSolFirmRel_Click" Text="Link Solicitor To Selected Firm(s)" />
</asp:Content>
