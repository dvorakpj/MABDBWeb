<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestorApplicants.aspx.cs" Inherits="MABDBWeb.Investor_Applicants" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Investor Applicants</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="InvestorApplications">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
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
                <asp:BoundField DataField="Primary_DOB" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DOB" SortExpression="Primary_DOB" />
                <asp:BoundField DataField="Primary_AUCitizenStat" HeaderText="AU Citizen" SortExpression="Primary_AUCitizenStat" />
                <asp:BoundField DataField="Primary_Dependants" HeaderText="Dependants" SortExpression="Primary_Dependants" />
                <asp:BoundField DataField="Other_FirstName" HeaderText="First Name" SortExpression="Other_FirstName" />
                <asp:BoundField DataField="Other_OtherNames" HeaderText="Other Names" SortExpression="Other_OtherNames" />
                <asp:BoundField DataField="Other_LastName" HeaderText="Last Name" SortExpression="Other_LastName" />
                <asp:BoundField DataField="Other_DOB" HeaderText="DOB" SortExpression="Other_DOB" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Other_Gender" HeaderText="Gender" SortExpression="Other_Gender" />
                <asp:BoundField DataField="Other_AUCitizenStat" HeaderText="AU Citizen" SortExpression="Other_AUCitizenStat" />
                <asp:BoundField DataField="Other_Dependants" HeaderText="Dependants" SortExpression="Other_Dependants" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                <asp:BoundField DataField="Res_Street1" HeaderText="Street 1" SortExpression="Res_Street1" />
                <asp:BoundField DataField="Res_Street2" HeaderText="Res_Street2" SortExpression="Res_Street2" />
                <asp:BoundField DataField="Res_City" HeaderText="Res_City" SortExpression="Res_City" />
                <asp:BoundField DataField="Res_State" HeaderText="Res_State" SortExpression="Res_State" />
                <asp:BoundField DataField="Res_PostCode" HeaderText="Res_PostCode" SortExpression="Res_PostCode" />
                <asp:BoundField DataField="Res_Country" HeaderText="Res_Country" SortExpression="Res_Country" />
                <asp:BoundField DataField="YrsCurrAddr" HeaderText="YrsCurrAddr" SortExpression="YrsCurrAddr" />
                <asp:BoundField DataField="CurrRes_tatus" HeaderText="CurrRes_tatus" SortExpression="CurrRes_tatus" />
                <asp:BoundField DataField="YrsPrevAddr" HeaderText="YrsPrevAddr" SortExpression="YrsPrevAddr" />
                <asp:BoundField DataField="PrevResStatus" HeaderText="PrevResStatus" SortExpression="PrevResStatus" />
                <asp:BoundField DataField="CurrOccupType" HeaderText="CurrOccupType" SortExpression="CurrOccupType" />
                <asp:BoundField DataField="CurrEmploymentStatus" HeaderText="CurrEmploymentStatus" SortExpression="CurrEmploymentStatus" />
                <asp:BoundField DataField="YrsCurrEmployer" HeaderText="YrsCurrEmployer" SortExpression="YrsCurrEmployer" />
                <asp:BoundField DataField="YrsPrevEmployer" HeaderText="YrsPrevEmployer" SortExpression="YrsPrevEmployer" />
                <asp:CheckBoxField DataField="IsSmoker" HeaderText="IsSmoker" SortExpression="IsSmoker" />
                <asp:CheckBoxField DataField="HasPrivateHealthIns" HeaderText="HasPrivateHealthIns" SortExpression="HasPrivateHealthIns" />
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
                <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" />
                <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" />
                <asp:BoundField DataField="InvestorApplicant_AssquireInvestor" HeaderText="InvestorApplicant_AssquireInvestor" SortExpression="InvestorApplicant_AssquireInvestor" />
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:SqlDataSource ID="InvestorApplications" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [InvestorApplications]"></asp:SqlDataSource>
    </form>
</body>
</html>
