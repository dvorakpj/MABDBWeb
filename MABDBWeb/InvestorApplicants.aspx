﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestorApplicants.aspx.cs" Inherits="MABDBWeb.Investor_Applicants" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Investor Applicants</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="New Investor Applications"></asp:Label>
    
            <asp:SqlDataSource ID="InvestorApplications" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [InvestorApplications]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="InvApplicUniqueIDs" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT [Id] FROM [InvestorApplications]"></asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="InvestorApplications" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="[V]" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:HyperLinkField HeaderText="Details" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/InvestorApplicationDetail.aspx?Id={0}" Text="Details" />
                <asp:BoundField DataField="EntryDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="App Date" SortExpression="EntryDate" />
                <asp:TemplateField HeaderText="Type" SortExpression="ApplicantType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ApplicantType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ApplicantType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Primary_FirstName" HeaderText="First Name" SortExpression="Primary_FirstName" />
                <asp:BoundField DataField="Primary_OtherNames" HeaderText="Middle Names" SortExpression="Primary_OtherNames" />
                <asp:BoundField DataField="Primary_LastName" HeaderText="Last Name" SortExpression="Primary_LastName" />
                <asp:BoundField DataField="Primary_Gender" HeaderText="Gender" SortExpression="Primary_Gender" />
                <asp:BoundField DataField="Primary_DOB" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DOB" SortExpression="Primary_DOB" />
                <asp:BoundField DataField="Other_FirstName" HeaderText="First Name" SortExpression="Other_FirstName" />
                <asp:BoundField DataField="Other_OtherNames" HeaderText="Other Names" SortExpression="Other_OtherNames" />
                <asp:BoundField DataField="Other_LastName" HeaderText="Last Name" SortExpression="Other_LastName" />
                <asp:BoundField DataField="Other_Gender" HeaderText="Gender" SortExpression="Other_Gender" />
                <asp:BoundField DataField="Other_DOB" HeaderText="DOB" SortExpression="Other_DOB" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                <asp:BoundField DataField="Primary_Res_Street1" HeaderText="Street 1" SortExpression="Primary_Res_Street1" />
                <asp:BoundField DataField="Primary_Res_Street2" HeaderText="Street2" SortExpression="Primary_Res_Street2" />
                <asp:BoundField DataField="Primary_Res_City" HeaderText="City" SortExpression="Primary_Res_City" />
                <asp:BoundField DataField="Primary_Res_State" HeaderText="State" SortExpression="Primary_Res_State" />
                <asp:BoundField DataField="Primary_Res_PostCode" HeaderText="ZIP" SortExpression="Primary_Res_PostCode" />
                <asp:BoundField DataField="Primary_Res_Country" HeaderText="Country" SortExpression="Primary_Res_Country" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
    </div>

        <div>
            <asp:Label ID="lblUploadError" runat="server" BorderStyle="Solid" BorderColor="Red" BackColor="Red" Visible="false"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" Width="655px" />            
            <p>
                <asp:Button ID="btnImport" runat="server" Font-Bold="True" OnClick="btnImport_Click" Text="Import Applications" />
            </p>
            <p>
                <asp:Label ID="lblImportResLabel" runat="server" Text="Import Results:" Visible="False"></asp:Label>
                <asp:Label ID="lblImportRes" runat="server" Visible="False"></asp:Label>
            </p>
        </div>
           </form> 
</body>
</html>
