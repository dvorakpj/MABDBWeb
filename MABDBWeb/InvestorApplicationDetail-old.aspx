<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestorApplicationDetail-old.aspx.cs" Inherits="MABDBWeb.InvestorApplicationDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Investor Application Detail</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/App/InvestorApplicationDetail.js"></script>
    <script >
        $('#form1')
            .submit(function() {
                    /* when the submit button in the modal is clicked, submit the form */
                $('#CondApprovalModal').modal('show');
                    //alert('submitting');
                    $('#btnCondApprove')
                        .click(function() {
                                form.submit();
                            }
            );
        });
    </script>

</head>
<body>

    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Application Details"></asp:Label>
    <div>
    
    </div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" Height="50px" HorizontalAlign="Justify" style="margin-right: 52px" Width ="220px">
            <EditRowStyle BackColor="#CCCCCC" BorderColor="#999999" Font-Bold="True" ForeColor="White" BorderWidth="3px" />
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ApplicantType" HeaderText="App Type" SortExpression="ApplicantType" />
                <asp:BoundField DataField="Primary_FirstName" HeaderText="Primary First Name" SortExpression="Primary_FirstName" />
                <asp:BoundField DataField="Primary_OtherNames" HeaderText="Primary Other Names" SortExpression="Primary_OtherNames" />
                <asp:BoundField DataField="Primary_LastName" HeaderText="Primary Last Name" SortExpression="Primary_LastName" />
                <asp:BoundField DataField="Primary_DOB" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Primary DOB" SortExpression="Primary_DOB" />
                <asp:BoundField DataField="Primary_AUCitizenStat" HeaderText="Primary Citizenship" SortExpression="Primary_AUCitizenStat" />
                <asp:BoundField DataField="Primary_Dependants" HeaderText="Primary Dependants" SortExpression="Primary_Dependants" />
                <asp:BoundField DataField="Other_FirstName" HeaderText="Other First Name" SortExpression="Other_FirstName" />
                <asp:BoundField DataField="Other_OtherNames" HeaderText="Other OtherNames" SortExpression="Other_OtherNames" />
                <asp:BoundField DataField="Other_LastName" HeaderText="Other Last Name" SortExpression="Other_LastName" />
                <asp:BoundField DataField="Other_DOB" DataFormatString="{0:dd/mm/yyyy}" HeaderText="Other DOB" SortExpression="Other_DOB" />
                <asp:BoundField DataField="Other_Gender" HeaderText="Other Gender" SortExpression="Other_Gender" />
                <asp:BoundField DataField="Other_AUCitizenStat" HeaderText="Other Citizenship" SortExpression="Other_AUCitizenStat" />
                <asp:BoundField DataField="Other_Dependants" HeaderText="Other Dependants" SortExpression="Other_Dependants" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                <asp:BoundField DataField="Res_Street1" HeaderText="Res_Street1" SortExpression="Res_Street1" />
                <asp:BoundField DataField="Res_Street2" HeaderText="Res_Street2" SortExpression="Res_Street2" />
                <asp:BoundField DataField="Res_City" HeaderText="Res_City" SortExpression="Res_City" />
                <asp:BoundField DataField="Res_PostCode" HeaderText="Res_PostCode" SortExpression="Res_PostCode" />
                <asp:BoundField DataField="Res_State" HeaderText="Res_State" SortExpression="Res_State" />
                <asp:BoundField DataField="Res_Country" HeaderText="Res_Country" SortExpression="Res_Country" />
                <asp:BoundField DataField="YrsCurrAddr" HeaderText="YrsCurrAddr" SortExpression="YrsCurrAddr" />
                <asp:BoundField DataField="CurrResidStatus" HeaderText="CurrResidStatus" SortExpression="CurrResidStatus" />
                <asp:BoundField DataField="YrsPrevAddr" HeaderText="YrsPrevAddr" SortExpression="YrsPrevAddr" />
                <asp:BoundField DataField="PrevResStatus" HeaderText="PrevResStatus" SortExpression="PrevResStatus" />
                <asp:BoundField DataField="CurrOccupType" HeaderText="CurrOccupType" SortExpression="CurrOccupType" />
                <asp:BoundField DataField="CurrEmploymentStatus" HeaderText="CurrEmploymentStatus" SortExpression="CurrEmploymentStatus" />
                <asp:BoundField DataField="YrsCurrEmployer" HeaderText="YrsCurrEmployer" SortExpression="YrsCurrEmployer" />
                <asp:BoundField DataField="YrsPrevEmployer" HeaderText="YrsPrevEmployer" SortExpression="YrsPrevEmployer" />
                <asp:BoundField DataField="IsSmoker" HeaderText="IsSmoker" SortExpression="IsSmoker" />
                <asp:BoundField DataField="HasPrivateHealthIns" HeaderText="HasPrivateHealthIns" SortExpression="HasPrivateHealthIns" />
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
                <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" />
                <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" />
                <asp:BoundField DataField="InvestorApplicant_AssquireInvestor" HeaderText="InvestorApplicant_AssquireInvestor" SortExpression="InvestorApplicant_AssquireInvestor" />
                <asp:BoundField DataField="InvestorApplication_Gender" HeaderText="InvestorApplication_Gender" SortExpression="InvestorApplication_Gender" />
                <asp:BoundField DataField="Primary_IncomeMoAT" HeaderText="Primary_IncomeMoAT" SortExpression="Primary_IncomeMoAT" />
                <asp:BoundField DataField="Other_IncomeMoAT" HeaderText="Other_IncomeMoAT" SortExpression="Other_IncomeMoAT" />
                <asp:BoundField DataField="HouseholdIncomeGrossPA" HeaderText="HouseholdIncomeGrossPA" SortExpression="HouseholdIncomeGrossPA" />
                <asp:BoundField DataField="LookingLocation" HeaderText="LookingLocation" SortExpression="LookingLocation" />
                <asp:BoundField DataField="FoundLocation" HeaderText="FoundLocation" SortExpression="FoundLocation" />
                <asp:BoundField DataField="Property_Street1" HeaderText="Property_Street1" SortExpression="Property_Street1" />
                <asp:BoundField DataField="Property_Street2" HeaderText="Property_Street2" SortExpression="Property_Street2" />
                <asp:BoundField DataField="Property_City" HeaderText="Property_City" SortExpression="Property_City" />
                <asp:BoundField DataField="Property_Vendor" HeaderText="Property_Vendor" SortExpression="Property_Vendor" />
                <asp:BoundField DataField="EstSpend" HeaderText="EstSpend" SortExpression="EstSpend" />
                <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" SortExpression="EntryDate" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" DeleteCommand="DELETE FROM [InvestorApplications] WHERE [Id] = @original_Id AND (([ApplicantType] = @original_ApplicantType) OR ([ApplicantType] IS NULL AND @original_ApplicantType IS NULL)) AND (([Primary_FirstName] = @original_Primary_FirstName) OR ([Primary_FirstName] IS NULL AND @original_Primary_FirstName IS NULL)) AND (([Primary_OtherNames] = @original_Primary_OtherNames) OR ([Primary_OtherNames] IS NULL AND @original_Primary_OtherNames IS NULL)) AND (([Primary_LastName] = @original_Primary_LastName) OR ([Primary_LastName] IS NULL AND @original_Primary_LastName IS NULL)) AND (([Primary_AUCitizenStat] = @original_Primary_AUCitizenStat) OR ([Primary_AUCitizenStat] IS NULL AND @original_Primary_AUCitizenStat IS NULL)) AND (([Primary_Dependants] = @original_Primary_Dependants) OR ([Primary_Dependants] IS NULL AND @original_Primary_Dependants IS NULL)) AND (([Other_FirstName] = @original_Other_FirstName) OR ([Other_FirstName] IS NULL AND @original_Other_FirstName IS NULL)) AND (([Other_OtherNames] = @original_Other_OtherNames) OR ([Other_OtherNames] IS NULL AND @original_Other_OtherNames IS NULL)) AND (([Other_LastName] = @original_Other_LastName) OR ([Other_LastName] IS NULL AND @original_Other_LastName IS NULL)) AND (([Other_DOB] = @original_Other_DOB) OR ([Other_DOB] IS NULL AND @original_Other_DOB IS NULL)) AND (([Other_Gender] = @original_Other_Gender) OR ([Other_Gender] IS NULL AND @original_Other_Gender IS NULL)) AND (([Other_AUCitizenStat] = @original_Other_AUCitizenStat) OR ([Other_AUCitizenStat] IS NULL AND @original_Other_AUCitizenStat IS NULL)) AND (([Other_Dependants] = @original_Other_Dependants) OR ([Other_Dependants] IS NULL AND @original_Other_Dependants IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Mobile] = @original_Mobile) OR ([Mobile] IS NULL AND @original_Mobile IS NULL)) AND (([Res_Street1] = @original_Res_Street1) OR ([Res_Street1] IS NULL AND @original_Res_Street1 IS NULL)) AND (([Res_Street2] = @original_Res_Street2) OR ([Res_Street2] IS NULL AND @original_Res_Street2 IS NULL)) AND (([Res_City] = @original_Res_City) OR ([Res_City] IS NULL AND @original_Res_City IS NULL)) AND (([Res_PostCode] = @original_Res_PostCode) OR ([Res_PostCode] IS NULL AND @original_Res_PostCode IS NULL)) AND (([Res_State] = @original_Res_State) OR ([Res_State] IS NULL AND @original_Res_State IS NULL)) AND (([Res_Country] = @original_Res_Country) OR ([Res_Country] IS NULL AND @original_Res_Country IS NULL)) AND (([YrsCurrAddr] = @original_YrsCurrAddr) OR ([YrsCurrAddr] IS NULL AND @original_YrsCurrAddr IS NULL)) AND (([CurrResidStatus] = @original_CurrResidStatus) OR ([CurrResidStatus] IS NULL AND @original_CurrResidStatus IS NULL)) AND (([YrsPrevAddr] = @original_YrsPrevAddr) OR ([YrsPrevAddr] IS NULL AND @original_YrsPrevAddr IS NULL)) AND (([PrevResStatus] = @original_PrevResStatus) OR ([PrevResStatus] IS NULL AND @original_PrevResStatus IS NULL)) AND (([CurrOccupType] = @original_CurrOccupType) OR ([CurrOccupType] IS NULL AND @original_CurrOccupType IS NULL)) AND (([CurrEmploymentStatus] = @original_CurrEmploymentStatus) OR ([CurrEmploymentStatus] IS NULL AND @original_CurrEmploymentStatus IS NULL)) AND (([YrsCurrEmployer] = @original_YrsCurrEmployer) OR ([YrsCurrEmployer] IS NULL AND @original_YrsCurrEmployer IS NULL)) AND (([YrsPrevEmployer] = @original_YrsPrevEmployer) OR ([YrsPrevEmployer] IS NULL AND @original_YrsPrevEmployer IS NULL)) AND (([IsSmoker] = @original_IsSmoker) OR ([IsSmoker] IS NULL AND @original_IsSmoker IS NULL)) AND (([HasPrivateHealthIns] = @original_HasPrivateHealthIns) OR ([HasPrivateHealthIns] IS NULL AND @original_HasPrivateHealthIns IS NULL)) AND (([CreatedBy] = @original_CreatedBy) OR ([CreatedBy] IS NULL AND @original_CreatedBy IS NULL)) AND (([Created] = @original_Created) OR ([Created] IS NULL AND @original_Created IS NULL)) AND (([ModifiedBy] = @original_ModifiedBy) OR ([ModifiedBy] IS NULL AND @original_ModifiedBy IS NULL)) AND (([Modified] = @original_Modified) OR ([Modified] IS NULL AND @original_Modified IS NULL)) AND [RowVersion] = @original_RowVersion AND (([InvestorApplicant_AssquireInvestor] = @original_InvestorApplicant_AssquireInvestor) OR ([InvestorApplicant_AssquireInvestor] IS NULL AND @original_InvestorApplicant_AssquireInvestor IS NULL)) AND (([InvestorApplication_Gender] = @original_InvestorApplication_Gender) OR ([InvestorApplication_Gender] IS NULL AND @original_InvestorApplication_Gender IS NULL)) AND (([Primary_IncomeMoAT] = @original_Primary_IncomeMoAT) OR ([Primary_IncomeMoAT] IS NULL AND @original_Primary_IncomeMoAT IS NULL)) AND (([Other_IncomeMoAT] = @original_Other_IncomeMoAT) OR ([Other_IncomeMoAT] IS NULL AND @original_Other_IncomeMoAT IS NULL)) AND (([HouseholdIncomeGrossPA] = @original_HouseholdIncomeGrossPA) OR ([HouseholdIncomeGrossPA] IS NULL AND @original_HouseholdIncomeGrossPA IS NULL)) AND (([LookingLocation] = @original_LookingLocation) OR ([LookingLocation] IS NULL AND @original_LookingLocation IS NULL)) AND (([FoundLocation] = @original_FoundLocation) OR ([FoundLocation] IS NULL AND @original_FoundLocation IS NULL)) AND (([Property_Street1] = @original_Property_Street1) OR ([Property_Street1] IS NULL AND @original_Property_Street1 IS NULL)) AND (([Property_Street2] = @original_Property_Street2) OR ([Property_Street2] IS NULL AND @original_Property_Street2 IS NULL)) AND (([Property_City] = @original_Property_City) OR ([Property_City] IS NULL AND @original_Property_City IS NULL)) AND (([Property_Vendor] = @original_Property_Vendor) OR ([Property_Vendor] IS NULL AND @original_Property_Vendor IS NULL)) AND (([EstSpend] = @original_EstSpend) OR ([EstSpend] IS NULL AND @original_EstSpend IS NULL)) AND [EntryDate] = @original_EntryDate AND (([Primary_DOB] = @original_Primary_DOB) OR ([Primary_DOB] IS NULL AND @original_Primary_DOB IS NULL))" InsertCommand="INSERT INTO [InvestorApplications] ([ApplicantType], [Primary_FirstName], [Primary_OtherNames], [Primary_LastName], [Primary_AUCitizenStat], [Primary_Dependants], [Other_FirstName], [Other_OtherNames], [Other_LastName], [Other_DOB], [Other_Gender], [Other_AUCitizenStat], [Other_Dependants], [Email], [Mobile], [Res_Street1], [Res_Street2], [Res_City], [Res_PostCode], [Res_State], [Res_Country], [YrsCurrAddr], [CurrResidStatus], [YrsPrevAddr], [PrevResStatus], [CurrOccupType], [CurrEmploymentStatus], [YrsCurrEmployer], [YrsPrevEmployer], [IsSmoker], [HasPrivateHealthIns], [CreatedBy], [Created], [ModifiedBy], [Modified], [RowVersion], [InvestorApplicant_AssquireInvestor], [InvestorApplication_Gender], [Primary_IncomeMoAT], [Other_IncomeMoAT], [HouseholdIncomeGrossPA], [LookingLocation], [FoundLocation], [Property_Street1], [Property_Street2], [Property_City], [Property_Vendor], [EstSpend], [EntryDate], [Primary_DOB]) VALUES (@ApplicantType, @Primary_FirstName, @Primary_OtherNames, @Primary_LastName, @Primary_AUCitizenStat, @Primary_Dependants, @Other_FirstName, @Other_OtherNames, @Other_LastName, @Other_DOB, @Other_Gender, @Other_AUCitizenStat, @Other_Dependants, @Email, @Mobile, @Res_Street1, @Res_Street2, @Res_City, @Res_PostCode, @Res_State, @Res_Country, @YrsCurrAddr, @CurrResidStatus, @YrsPrevAddr, @PrevResStatus, @CurrOccupType, @CurrEmploymentStatus, @YrsCurrEmployer, @YrsPrevEmployer, @IsSmoker, @HasPrivateHealthIns, @CreatedBy, @Created, @ModifiedBy, @Modified, @RowVersion, @InvestorApplicant_AssquireInvestor, @InvestorApplication_Gender, @Primary_IncomeMoAT, @Other_IncomeMoAT, @HouseholdIncomeGrossPA, @LookingLocation, @FoundLocation, @Property_Street1, @Property_Street2, @Property_City, @Property_Vendor, @EstSpend, @EntryDate, @Primary_DOB)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [InvestorApplications] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [InvestorApplications] SET [ApplicantType] = @ApplicantType, [Primary_FirstName] = @Primary_FirstName, [Primary_OtherNames] = @Primary_OtherNames, [Primary_LastName] = @Primary_LastName, [Primary_AUCitizenStat] = @Primary_AUCitizenStat, [Primary_Dependants] = @Primary_Dependants, [Other_FirstName] = @Other_FirstName, [Other_OtherNames] = @Other_OtherNames, [Other_LastName] = @Other_LastName, [Other_DOB] = @Other_DOB, [Other_Gender] = @Other_Gender, [Other_AUCitizenStat] = @Other_AUCitizenStat, [Other_Dependants] = @Other_Dependants, [Email] = @Email, [Mobile] = @Mobile, [Res_Street1] = @Res_Street1, [Res_Street2] = @Res_Street2, [Res_City] = @Res_City, [Res_PostCode] = @Res_PostCode, [Res_State] = @Res_State, [Res_Country] = @Res_Country, [YrsCurrAddr] = @YrsCurrAddr, [CurrResidStatus] = @CurrResidStatus, [YrsPrevAddr] = @YrsPrevAddr, [PrevResStatus] = @PrevResStatus, [CurrOccupType] = @CurrOccupType, [CurrEmploymentStatus] = @CurrEmploymentStatus, [YrsCurrEmployer] = @YrsCurrEmployer, [YrsPrevEmployer] = @YrsPrevEmployer, [IsSmoker] = @IsSmoker, [HasPrivateHealthIns] = @HasPrivateHealthIns, [CreatedBy] = @CreatedBy, [Created] = @Created, [ModifiedBy] = @ModifiedBy, [Modified] = @Modified, [RowVersion] = @RowVersion, [InvestorApplicant_AssquireInvestor] = @InvestorApplicant_AssquireInvestor, [InvestorApplication_Gender] = @InvestorApplication_Gender, [Primary_IncomeMoAT] = @Primary_IncomeMoAT, [Other_IncomeMoAT] = @Other_IncomeMoAT, [HouseholdIncomeGrossPA] = @HouseholdIncomeGrossPA, [LookingLocation] = @LookingLocation, [FoundLocation] = @FoundLocation, [Property_Street1] = @Property_Street1, [Property_Street2] = @Property_Street2, [Property_City] = @Property_City, [Property_Vendor] = @Property_Vendor, [EstSpend] = @EstSpend, [EntryDate] = @EntryDate, [Primary_DOB] = @Primary_DOB WHERE [Id] = @original_Id AND (([ApplicantType] = @original_ApplicantType) OR ([ApplicantType] IS NULL AND @original_ApplicantType IS NULL)) AND (([Primary_FirstName] = @original_Primary_FirstName) OR ([Primary_FirstName] IS NULL AND @original_Primary_FirstName IS NULL)) AND (([Primary_OtherNames] = @original_Primary_OtherNames) OR ([Primary_OtherNames] IS NULL AND @original_Primary_OtherNames IS NULL)) AND (([Primary_LastName] = @original_Primary_LastName) OR ([Primary_LastName] IS NULL AND @original_Primary_LastName IS NULL)) AND (([Primary_AUCitizenStat] = @original_Primary_AUCitizenStat) OR ([Primary_AUCitizenStat] IS NULL AND @original_Primary_AUCitizenStat IS NULL)) AND (([Primary_Dependants] = @original_Primary_Dependants) OR ([Primary_Dependants] IS NULL AND @original_Primary_Dependants IS NULL)) AND (([Other_FirstName] = @original_Other_FirstName) OR ([Other_FirstName] IS NULL AND @original_Other_FirstName IS NULL)) AND (([Other_OtherNames] = @original_Other_OtherNames) OR ([Other_OtherNames] IS NULL AND @original_Other_OtherNames IS NULL)) AND (([Other_LastName] = @original_Other_LastName) OR ([Other_LastName] IS NULL AND @original_Other_LastName IS NULL)) AND (([Other_DOB] = @original_Other_DOB) OR ([Other_DOB] IS NULL AND @original_Other_DOB IS NULL)) AND (([Other_Gender] = @original_Other_Gender) OR ([Other_Gender] IS NULL AND @original_Other_Gender IS NULL)) AND (([Other_AUCitizenStat] = @original_Other_AUCitizenStat) OR ([Other_AUCitizenStat] IS NULL AND @original_Other_AUCitizenStat IS NULL)) AND (([Other_Dependants] = @original_Other_Dependants) OR ([Other_Dependants] IS NULL AND @original_Other_Dependants IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Mobile] = @original_Mobile) OR ([Mobile] IS NULL AND @original_Mobile IS NULL)) AND (([Res_Street1] = @original_Res_Street1) OR ([Res_Street1] IS NULL AND @original_Res_Street1 IS NULL)) AND (([Res_Street2] = @original_Res_Street2) OR ([Res_Street2] IS NULL AND @original_Res_Street2 IS NULL)) AND (([Res_City] = @original_Res_City) OR ([Res_City] IS NULL AND @original_Res_City IS NULL)) AND (([Res_PostCode] = @original_Res_PostCode) OR ([Res_PostCode] IS NULL AND @original_Res_PostCode IS NULL)) AND (([Res_State] = @original_Res_State) OR ([Res_State] IS NULL AND @original_Res_State IS NULL)) AND (([Res_Country] = @original_Res_Country) OR ([Res_Country] IS NULL AND @original_Res_Country IS NULL)) AND (([YrsCurrAddr] = @original_YrsCurrAddr) OR ([YrsCurrAddr] IS NULL AND @original_YrsCurrAddr IS NULL)) AND (([CurrResidStatus] = @original_CurrResidStatus) OR ([CurrResidStatus] IS NULL AND @original_CurrResidStatus IS NULL)) AND (([YrsPrevAddr] = @original_YrsPrevAddr) OR ([YrsPrevAddr] IS NULL AND @original_YrsPrevAddr IS NULL)) AND (([PrevResStatus] = @original_PrevResStatus) OR ([PrevResStatus] IS NULL AND @original_PrevResStatus IS NULL)) AND (([CurrOccupType] = @original_CurrOccupType) OR ([CurrOccupType] IS NULL AND @original_CurrOccupType IS NULL)) AND (([CurrEmploymentStatus] = @original_CurrEmploymentStatus) OR ([CurrEmploymentStatus] IS NULL AND @original_CurrEmploymentStatus IS NULL)) AND (([YrsCurrEmployer] = @original_YrsCurrEmployer) OR ([YrsCurrEmployer] IS NULL AND @original_YrsCurrEmployer IS NULL)) AND (([YrsPrevEmployer] = @original_YrsPrevEmployer) OR ([YrsPrevEmployer] IS NULL AND @original_YrsPrevEmployer IS NULL)) AND (([IsSmoker] = @original_IsSmoker) OR ([IsSmoker] IS NULL AND @original_IsSmoker IS NULL)) AND (([HasPrivateHealthIns] = @original_HasPrivateHealthIns) OR ([HasPrivateHealthIns] IS NULL AND @original_HasPrivateHealthIns IS NULL)) AND (([CreatedBy] = @original_CreatedBy) OR ([CreatedBy] IS NULL AND @original_CreatedBy IS NULL)) AND (([Created] = @original_Created) OR ([Created] IS NULL AND @original_Created IS NULL)) AND (([ModifiedBy] = @original_ModifiedBy) OR ([ModifiedBy] IS NULL AND @original_ModifiedBy IS NULL)) AND (([Modified] = @original_Modified) OR ([Modified] IS NULL AND @original_Modified IS NULL)) AND [RowVersion] = @original_RowVersion AND (([InvestorApplicant_AssquireInvestor] = @original_InvestorApplicant_AssquireInvestor) OR ([InvestorApplicant_AssquireInvestor] IS NULL AND @original_InvestorApplicant_AssquireInvestor IS NULL)) AND (([InvestorApplication_Gender] = @original_InvestorApplication_Gender) OR ([InvestorApplication_Gender] IS NULL AND @original_InvestorApplication_Gender IS NULL)) AND (([Primary_IncomeMoAT] = @original_Primary_IncomeMoAT) OR ([Primary_IncomeMoAT] IS NULL AND @original_Primary_IncomeMoAT IS NULL)) AND (([Other_IncomeMoAT] = @original_Other_IncomeMoAT) OR ([Other_IncomeMoAT] IS NULL AND @original_Other_IncomeMoAT IS NULL)) AND (([HouseholdIncomeGrossPA] = @original_HouseholdIncomeGrossPA) OR ([HouseholdIncomeGrossPA] IS NULL AND @original_HouseholdIncomeGrossPA IS NULL)) AND (([LookingLocation] = @original_LookingLocation) OR ([LookingLocation] IS NULL AND @original_LookingLocation IS NULL)) AND (([FoundLocation] = @original_FoundLocation) OR ([FoundLocation] IS NULL AND @original_FoundLocation IS NULL)) AND (([Property_Street1] = @original_Property_Street1) OR ([Property_Street1] IS NULL AND @original_Property_Street1 IS NULL)) AND (([Property_Street2] = @original_Property_Street2) OR ([Property_Street2] IS NULL AND @original_Property_Street2 IS NULL)) AND (([Property_City] = @original_Property_City) OR ([Property_City] IS NULL AND @original_Property_City IS NULL)) AND (([Property_Vendor] = @original_Property_Vendor) OR ([Property_Vendor] IS NULL AND @original_Property_Vendor IS NULL)) AND (([EstSpend] = @original_EstSpend) OR ([EstSpend] IS NULL AND @original_EstSpend IS NULL)) AND [EntryDate] = @original_EntryDate AND (([Primary_DOB] = @original_Primary_DOB) OR ([Primary_DOB] IS NULL AND @original_Primary_DOB IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_ApplicantType" Type="String" />
                <asp:Parameter Name="original_Primary_FirstName" Type="String" />
                <asp:Parameter Name="original_Primary_OtherNames" Type="String" />
                <asp:Parameter Name="original_Primary_LastName" Type="String" />
                <asp:Parameter Name="original_Primary_AUCitizenStat" Type="String" />
                <asp:Parameter Name="original_Primary_Dependants" Type="Byte" />
                <asp:Parameter Name="original_Other_FirstName" Type="String" />
                <asp:Parameter Name="original_Other_OtherNames" Type="String" />
                <asp:Parameter Name="original_Other_LastName" Type="String" />
                <asp:Parameter Name="original_Other_DOB" Type="DateTime" />
                <asp:Parameter Name="original_Other_Gender" Type="String" />
                <asp:Parameter Name="original_Other_AUCitizenStat" Type="String" />
                <asp:Parameter Name="original_Other_Dependants" Type="Byte" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Mobile" Type="String" />
                <asp:Parameter Name="original_Res_Street1" Type="String" />
                <asp:Parameter Name="original_Res_Street2" Type="String" />
                <asp:Parameter Name="original_Res_City" Type="String" />
                <asp:Parameter Name="original_Res_PostCode" Type="Int16" />
                <asp:Parameter Name="original_Res_State" Type="String" />
                <asp:Parameter Name="original_Res_Country" Type="String" />
                <asp:Parameter Name="original_YrsCurrAddr" Type="Byte" />
                <asp:Parameter Name="original_CurrResidStatus" Type="String" />
                <asp:Parameter Name="original_YrsPrevAddr" Type="Byte" />
                <asp:Parameter Name="original_PrevResStatus" Type="String" />
                <asp:Parameter Name="original_CurrOccupType" Type="String" />
                <asp:Parameter Name="original_CurrEmploymentStatus" Type="String" />
                <asp:Parameter Name="original_YrsCurrEmployer" Type="Byte" />
                <asp:Parameter Name="original_YrsPrevEmployer" Type="Byte" />
                <asp:Parameter Name="original_IsSmoker" Type="String" />
                <asp:Parameter Name="original_HasPrivateHealthIns" Type="String" />
                <asp:Parameter Name="original_CreatedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="original_Created" />
                <asp:Parameter Name="original_ModifiedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="original_Modified" />
                <asp:Parameter Name="original_RowVersion" Type="Object" />
                <asp:Parameter Name="original_InvestorApplicant_AssquireInvestor" Type="Int32" />
                <asp:Parameter Name="original_InvestorApplication_Gender" Type="Int32" />
                <asp:Parameter Name="original_Primary_IncomeMoAT" Type="String" />
                <asp:Parameter Name="original_Other_IncomeMoAT" Type="String" />
                <asp:Parameter Name="original_HouseholdIncomeGrossPA" Type="String" />
                <asp:Parameter Name="original_LookingLocation" Type="String" />
                <asp:Parameter Name="original_FoundLocation" Type="String" />
                <asp:Parameter Name="original_Property_Street1" Type="String" />
                <asp:Parameter Name="original_Property_Street2" Type="String" />
                <asp:Parameter Name="original_Property_City" Type="String" />
                <asp:Parameter Name="original_Property_Vendor" Type="String" />
                <asp:Parameter Name="original_EstSpend" Type="String" />
                <asp:Parameter Name="original_EntryDate" Type="DateTime" />
                <asp:Parameter Name="original_Primary_DOB" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ApplicantType" Type="String" />
                <asp:Parameter Name="Primary_FirstName" Type="String" />
                <asp:Parameter Name="Primary_OtherNames" Type="String" />
                <asp:Parameter Name="Primary_LastName" Type="String" />
                <asp:Parameter Name="Primary_AUCitizenStat" Type="String" />
                <asp:Parameter Name="Primary_Dependants" Type="Byte" />
                <asp:Parameter Name="Other_FirstName" Type="String" />
                <asp:Parameter Name="Other_OtherNames" Type="String" />
                <asp:Parameter Name="Other_LastName" Type="String" />
                <asp:Parameter Name="Other_DOB" Type="DateTime" />
                <asp:Parameter Name="Other_Gender" Type="String" />
                <asp:Parameter Name="Other_AUCitizenStat" Type="String" />
                <asp:Parameter Name="Other_Dependants" Type="Byte" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="Res_Street1" Type="String" />
                <asp:Parameter Name="Res_Street2" Type="String" />
                <asp:Parameter Name="Res_City" Type="String" />
                <asp:Parameter Name="Res_PostCode" Type="Int16" />
                <asp:Parameter Name="Res_State" Type="String" />
                <asp:Parameter Name="Res_Country" Type="String" />
                <asp:Parameter Name="YrsCurrAddr" Type="Byte" />
                <asp:Parameter Name="CurrResidStatus" Type="String" />
                <asp:Parameter Name="YrsPrevAddr" Type="Byte" />
                <asp:Parameter Name="PrevResStatus" Type="String" />
                <asp:Parameter Name="CurrOccupType" Type="String" />
                <asp:Parameter Name="CurrEmploymentStatus" Type="String" />
                <asp:Parameter Name="YrsCurrEmployer" Type="Byte" />
                <asp:Parameter Name="YrsPrevEmployer" Type="Byte" />
                <asp:Parameter Name="IsSmoker" Type="String" />
                <asp:Parameter Name="HasPrivateHealthIns" Type="String" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="Created" />
                <asp:Parameter Name="ModifiedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="Modified" />
                <asp:Parameter Name="RowVersion" Type="Object" />
                <asp:Parameter Name="InvestorApplicant_AssquireInvestor" Type="Int32" />
                <asp:Parameter Name="InvestorApplication_Gender" Type="Int32" />
                <asp:Parameter Name="Primary_IncomeMoAT" Type="String" />
                <asp:Parameter Name="Other_IncomeMoAT" Type="String" />
                <asp:Parameter Name="HouseholdIncomeGrossPA" Type="String" />
                <asp:Parameter Name="LookingLocation" Type="String" />
                <asp:Parameter Name="FoundLocation" Type="String" />
                <asp:Parameter Name="Property_Street1" Type="String" />
                <asp:Parameter Name="Property_Street2" Type="String" />
                <asp:Parameter Name="Property_City" Type="String" />
                <asp:Parameter Name="Property_Vendor" Type="String" />
                <asp:Parameter Name="EstSpend" Type="String" />
                <asp:Parameter Name="EntryDate" Type="DateTime" />
                <asp:Parameter Name="Primary_DOB" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="-1" Name="Id" QueryStringField="Id" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ApplicantType" Type="String" />
                <asp:Parameter Name="Primary_FirstName" Type="String" />
                <asp:Parameter Name="Primary_OtherNames" Type="String" />
                <asp:Parameter Name="Primary_LastName" Type="String" />
                <asp:Parameter Name="Primary_AUCitizenStat" Type="String" />
                <asp:Parameter Name="Primary_Dependants" Type="Byte" />
                <asp:Parameter Name="Other_FirstName" Type="String" />
                <asp:Parameter Name="Other_OtherNames" Type="String" />
                <asp:Parameter Name="Other_LastName" Type="String" />
                <asp:Parameter Name="Other_DOB" Type="DateTime" />
                <asp:Parameter Name="Other_Gender" Type="String" />
                <asp:Parameter Name="Other_AUCitizenStat" Type="String" />
                <asp:Parameter Name="Other_Dependants" Type="Byte" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="Res_Street1" Type="String" />
                <asp:Parameter Name="Res_Street2" Type="String" />
                <asp:Parameter Name="Res_City" Type="String" />
                <asp:Parameter Name="Res_PostCode" Type="Int16" />
                <asp:Parameter Name="Res_State" Type="String" />
                <asp:Parameter Name="Res_Country" Type="String" />
                <asp:Parameter Name="YrsCurrAddr" Type="Byte" />
                <asp:Parameter Name="CurrResidStatus" Type="String" />
                <asp:Parameter Name="YrsPrevAddr" Type="Byte" />
                <asp:Parameter Name="PrevResStatus" Type="String" />
                <asp:Parameter Name="CurrOccupType" Type="String" />
                <asp:Parameter Name="CurrEmploymentStatus" Type="String" />
                <asp:Parameter Name="YrsCurrEmployer" Type="Byte" />
                <asp:Parameter Name="YrsPrevEmployer" Type="Byte" />
                <asp:Parameter Name="IsSmoker" Type="String" />
                <asp:Parameter Name="HasPrivateHealthIns" Type="String" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="Created" />
                <asp:Parameter Name="ModifiedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="Modified" />
                <asp:Parameter Name="RowVersion" Type="Object" />
                <asp:Parameter Name="InvestorApplicant_AssquireInvestor" Type="Int32" />
                <asp:Parameter Name="InvestorApplication_Gender" Type="Int32" />
                <asp:Parameter Name="Primary_IncomeMoAT" Type="String" />
                <asp:Parameter Name="Other_IncomeMoAT" Type="String" />
                <asp:Parameter Name="HouseholdIncomeGrossPA" Type="String" />
                <asp:Parameter Name="LookingLocation" Type="String" />
                <asp:Parameter Name="FoundLocation" Type="String" />
                <asp:Parameter Name="Property_Street1" Type="String" />
                <asp:Parameter Name="Property_Street2" Type="String" />
                <asp:Parameter Name="Property_City" Type="String" />
                <asp:Parameter Name="Property_Vendor" Type="String" />
                <asp:Parameter Name="EstSpend" Type="String" />
                <asp:Parameter Name="EntryDate" Type="DateTime" />
                <asp:Parameter Name="Primary_DOB" Type="DateTime" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_ApplicantType" Type="String" />
                <asp:Parameter Name="original_Primary_FirstName" Type="String" />
                <asp:Parameter Name="original_Primary_OtherNames" Type="String" />
                <asp:Parameter Name="original_Primary_LastName" Type="String" />
                <asp:Parameter Name="original_Primary_AUCitizenStat" Type="String" />
                <asp:Parameter Name="original_Primary_Dependants" Type="Byte" />
                <asp:Parameter Name="original_Other_FirstName" Type="String" />
                <asp:Parameter Name="original_Other_OtherNames" Type="String" />
                <asp:Parameter Name="original_Other_LastName" Type="String" />
                <asp:Parameter Name="original_Other_DOB" Type="DateTime" />
                <asp:Parameter Name="original_Other_Gender" Type="String" />
                <asp:Parameter Name="original_Other_AUCitizenStat" Type="String" />
                <asp:Parameter Name="original_Other_Dependants" Type="Byte" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Mobile" Type="String" />
                <asp:Parameter Name="original_Res_Street1" Type="String" />
                <asp:Parameter Name="original_Res_Street2" Type="String" />
                <asp:Parameter Name="original_Res_City" Type="String" />
                <asp:Parameter Name="original_Res_PostCode" Type="Int16" />
                <asp:Parameter Name="original_Res_State" Type="String" />
                <asp:Parameter Name="original_Res_Country" Type="String" />
                <asp:Parameter Name="original_YrsCurrAddr" Type="Byte" />
                <asp:Parameter Name="original_CurrResidStatus" Type="String" />
                <asp:Parameter Name="original_YrsPrevAddr" Type="Byte" />
                <asp:Parameter Name="original_PrevResStatus" Type="String" />
                <asp:Parameter Name="original_CurrOccupType" Type="String" />
                <asp:Parameter Name="original_CurrEmploymentStatus" Type="String" />
                <asp:Parameter Name="original_YrsCurrEmployer" Type="Byte" />
                <asp:Parameter Name="original_YrsPrevEmployer" Type="Byte" />
                <asp:Parameter Name="original_IsSmoker" Type="String" />
                <asp:Parameter Name="original_HasPrivateHealthIns" Type="String" />
                <asp:Parameter Name="original_CreatedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="original_Created" />
                <asp:Parameter Name="original_ModifiedBy" Type="String" />
                <asp:Parameter DbType="DateTimeOffset" Name="original_Modified" />
                <asp:Parameter Name="original_RowVersion" Type="Object" />
                <asp:Parameter Name="original_InvestorApplicant_AssquireInvestor" Type="Int32" />
                <asp:Parameter Name="original_InvestorApplication_Gender" Type="Int32" />
                <asp:Parameter Name="original_Primary_IncomeMoAT" Type="String" />
                <asp:Parameter Name="original_Other_IncomeMoAT" Type="String" />
                <asp:Parameter Name="original_HouseholdIncomeGrossPA" Type="String" />
                <asp:Parameter Name="original_LookingLocation" Type="String" />
                <asp:Parameter Name="original_FoundLocation" Type="String" />
                <asp:Parameter Name="original_Property_Street1" Type="String" />
                <asp:Parameter Name="original_Property_Street2" Type="String" />
                <asp:Parameter Name="original_Property_City" Type="String" />
                <asp:Parameter Name="original_Property_Vendor" Type="String" />
                <asp:Parameter Name="original_EstSpend" Type="String" />
                <asp:Parameter Name="original_EntryDate" Type="DateTime" />
                <asp:Parameter Name="original_Primary_DOB" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <hr />
        <div>
        <p>
          <span style="font-weight: bold">Conditional Approval:</span></p>
           Approver: <asp:Label ID="lblApprover" runat="server" Text="Pavel Dvorak" ToolTip="Name of current user who will be recorded as approver of the Application."></asp:Label>
        <br />
            <p>
        <asp:Button ID="btnCondApprove" runat="server" Text="Conditionally Approve" CausesValidation="False" OnClick="Button1_Click" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CondApprovalModal"/>
           </p>
        </div>
        
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
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="SubForm">Conditionally Approve</button>
            </div>
        </div>
    </div>
</div>
  

    <hr />
    <p>
        <span style="font-weight: bold">Credit Fee Received:</span></p>
    <p>
        Confirmation by:<asp:Label ID="lblCreditFeeConfirmerName" runat="server" Text="Pavel Dvorak"></asp:Label>
    </p>
<p>
    <asp:Button ID="btnCreditFeeReceived" runat="server" Text="Credit Fee Received" CausesValidation="False" OnClick="Button1_Click" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CreditFeeRecvdModal"/>
</p>     
   <!-- Credit Fee Received Confirmation -->
<div id="CreditFeeRecvdModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                 <h3 id="myModalLabel4">Confirmation</h3>

            </div>
            <div class="modal-body">
                <p>Confirm the credit fee payment has been received.</p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="Confirm">Confirm</button>
            </div>
        </div>
    </div>
</div>

    </form>
    </body>
</html>
