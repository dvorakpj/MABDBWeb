<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorApplicantsNewAll.aspx.cs" Inherits="MABDBWeb.InvestorApplicantsNewAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="New Investor Applications"></asp:Label>


           <div>
    
    <%--    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="New Investor Applications"></asp:Label>--%>
    
           <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [v_InvestorAppsBasicWScores] ORDER BY [Id] DESC"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT [EntryId] FROM [InvestorApplications]"></asp:SqlDataSource>--%>    
               
            <asp:SqlDataSource ID="InvestorApplications" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [v_InvestorAppsBasicWScores] ORDER BY [Id] DESC"></asp:SqlDataSource>
            <asp:SqlDataSource ID="InvApplicUniqueIDs" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT [EntryId] FROM [InvestorApplications]"></asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="InvestorApplications" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnDataBound="GridView1_DataBound">
           <Columns>
                <%--<asp:CommandField ButtonType="Button" SelectText="[V]" ShowSelectButton="True" />--%>
                <asp:TemplateField>                                        
                    <HeaderTemplate>
                            <input type="checkbox" id="cbSelectAll" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <input type="checkbox" name="EntrySelected" class="cbSelectRow" value="<%# Eval("Id") %>" ></input>
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:HyperLinkField HeaderText="Details" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/InvestorApplicationDetail.aspx?Id={0}" Text="Details" >
                <ItemStyle BackColor="#CCCCCC" BorderStyle="Solid" />
                </asp:HyperLinkField>
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
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Primary_Res_PostCode" HeaderText="ZIP" SortExpression="Primary_Res_PostCode" />
                <asp:BoundField DataField="Primary_Res_State" HeaderText="State" SortExpression="Primary_Res_State" />
                <asp:BoundField DataField="Score_Status" HeaderText="Score_Status" SortExpression="Score_Status"/>                               
                <asp:BoundField DataField="Score_Total" HeaderText="Score_Total" SortExpression="Score_Total" />
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
           <p>
               <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </p>



</asp:Content>
