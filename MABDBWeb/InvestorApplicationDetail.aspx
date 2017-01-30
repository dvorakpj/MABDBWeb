﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorApplicationDetail.aspx.cs" Inherits="MABDBWeb.InvestorApplicationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" Visible="False" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:Label ID="lblValidationErrorsTxtBoxLabel" runat="server" ForeColor="Red" Text="Validation Errors:" Visible="False"></asp:Label>
    <br />
    <asp:TextBox ID="txtValidationErrors" runat="server" ForeColor="Red" Visible="False" Wrap="False"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="Investor Application Details"></asp:Label>
    <br />
    Auto-accepted Status:
    <asp:Label ID="lblAutoApprovalStatus" runat="server"></asp:Label>
    <br />
    Cond Approval Status:&nbsp;<asp:Label ID="lblStatus" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="InvestorApplicationDetailsSqlDataSource" Height="50px" Width="125px" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" OnDataBound="DetailsView1_DataBound">
        <EditRowStyle Wrap="False" />
        <FieldHeaderStyle Wrap="False" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Temp ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="ApplicantType" HeaderText="Applicant Type" SortExpression="ApplicantType" />
            <asp:BoundField DataField="Primary_FirstName" HeaderText="Primary - First Name" SortExpression="Primary_FirstName" />
            <asp:BoundField DataField="Primary_OtherNames" HeaderText="Primary- Other Names" SortExpression="Primary_OtherNames" />
            <asp:BoundField DataField="Primary_LastName" HeaderText="Primary - Last Name" SortExpression="Primary_LastName" />
            <asp:BoundField DataField="Primary_DOB" HeaderText="Primary - DOB" SortExpression="Primary_DOB" />
            <asp:BoundField DataField="Primary_Gender" HeaderText="Primary - Gender" SortExpression="Primary_Gender" />
            <asp:BoundField DataField="Primary_MaritalStats" HeaderText="Primary - Marital Status" SortExpression="Primary_MaritalStats" />
            <asp:BoundField DataField="Email" HeaderText="Primary - Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Primary - Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="Primary_HomePhone" HeaderText="Primary - HomePhone" SortExpression="Primary_HomePhone" />
            <asp:BoundField DataField="Primary_AUCitizenStat" HeaderText="Primary - AU Citizen" SortExpression="Primary_AUCitizenStat" />
            <asp:BoundField DataField="Primary_Dependants" HeaderText="Primary - Dependants" SortExpression="Primary_Dependants" />
            <asp:BoundField DataField="Other_FirstName" HeaderText="Other - First Name" SortExpression="Other_FirstName" />
            <asp:BoundField DataField="Other_OtherNames" HeaderText="Other - Other Names" SortExpression="Other_OtherNames" />
            <asp:BoundField DataField="Other_LastName" HeaderText="Other - Last Name" SortExpression="Other_LastName" />
            <asp:BoundField DataField="Other_DOB" HeaderText="Other - DOB" SortExpression="Other_DOB" />
            <asp:BoundField DataField="Other_Gender" HeaderText="Other - Gender" SortExpression="Other_Gender" />
            <asp:BoundField DataField="Other_MaritalStats" HeaderText="Other- Marital Status" SortExpression="Other_MaritalStats" />
            <asp:BoundField DataField="Other_Email" HeaderText="Other - Email" SortExpression="Other_Email" />
            <asp:BoundField DataField="Other_Mobile" HeaderText="Other - Mobile" SortExpression="Other_Mobile" />
            <asp:BoundField DataField="Other_AUCitizenStat" HeaderText="Other - AU Citizen" SortExpression="Other_AUCitizenStat" />
            <asp:BoundField DataField="Other_Dependants" HeaderText="Other_Dependants" SortExpression="Other_Dependants" />
            <asp:BoundField DataField="Primary_Res_Street1" HeaderText="Primary Res -Street1" SortExpression="Primary_Res_Street1" />
            <asp:BoundField DataField="Primary_Res_Street2" HeaderText="Primary Res - Street2" SortExpression="Primary_Res_Street2" />
            <asp:BoundField DataField="Primary_Res_Suburb" HeaderText="Primary Res - Suburb" SortExpression="Primary_Res_Suburb" />
            <asp:BoundField DataField="Primary_Res_PostCode" HeaderText="Primary Res - PostCode" SortExpression="Primary_Res_PostCode" />
            <asp:BoundField DataField="Primary_Res_State" HeaderText="Primary Res - State" SortExpression="Primary_Res_State" />
            <asp:BoundField DataField="Primary_Res_Country" HeaderText="Primary Res - Country" SortExpression="Primary_Res_Country" />
            <asp:BoundField DataField="Primary_CurrResidStatus" HeaderText="Primary - Current  Resid Status" SortExpression="Primary_CurrResidStatus" />
            <asp:BoundField DataField="PrevResStatus" HeaderText="Priary - Prev Resid Status" SortExpression="PrevResStatus" />
            <asp:BoundField DataField="CurrOccupType" HeaderText="Primary - Curr Occup Type" SortExpression="CurrOccupType" />
            <asp:BoundField DataField="CurrEmploymentStatus" HeaderText="Primary - Current Employment Status" SortExpression="CurrEmploymentStatus" />
            <asp:BoundField DataField="IsSmoker" HeaderText="Primary - Smoker" SortExpression="IsSmoker" />
            <asp:BoundField DataField="HasPrivateHealthIns" HeaderText="Primary - Private Health Ins" SortExpression="HasPrivateHealthIns" />
            <asp:BoundField DataField="ModifiedBy" HeaderText="Last Modified By" SortExpression="ModifiedBy" />
            <asp:BoundField DataField="Modified" HeaderText="Last Date Modified" SortExpression="Modified" />
            <asp:BoundField DataField="Primary_IncomeMoAT" HeaderText="Primary - Income mo After Tax" SortExpression="Primary_IncomeMoAT" />
            <asp:BoundField DataField="Other_IncomeMoAT" HeaderText="Other - Income mo After Tax" SortExpression="Other_IncomeMoAT" />
            <asp:BoundField DataField="HouseholdIncomeGrossPA" HeaderText="Household Income Gross p.a." SortExpression="HouseholdIncomeGrossPA" />
            <asp:BoundField DataField="LookingLocation" HeaderText="Looking in Location" SortExpression="LookingLocation" />
            <asp:BoundField DataField="FoundLocation" HeaderText="Found Location" SortExpression="FoundLocation" />
            <asp:BoundField DataField="Property_Vendor" HeaderText="Property - Vendor" SortExpression="Property_Vendor" />
            <asp:BoundField DataField="Property_AgentDetails" HeaderText="Property - Agent Details" SortExpression="Property_AgentDetails" />
            <asp:BoundField DataField="Property_Street1" HeaderText="Property - Street1" SortExpression="Property_Street1" />
            <asp:BoundField DataField="Property_Street2" HeaderText="Property - Street2" SortExpression="Property_Street2" />
            <asp:BoundField DataField="Property_Suburb" HeaderText="Property - Suburb" SortExpression="Property_Suburb" />
            <asp:BoundField DataField="Property_PostCode" HeaderText="Property - Post Code" SortExpression="Property_PostCode" />
            <asp:BoundField DataField="Property_State" HeaderText="Property - State" SortExpression="Property_State" />
            <asp:BoundField DataField="Property_Country" HeaderText="Property - Country" SortExpression="Property_Country" />
            <asp:BoundField DataField="EstSpend" HeaderText="Estimated Spend" SortExpression="EstSpend" />
            <asp:BoundField DataField="EntryDate" HeaderText="Application Date" SortExpression="EntryDate" />
            <asp:BoundField DataField="HasAgreedPrivacy" HeaderText="Has Agreed Privacy" SortExpression="HasAgreedPrivacy" />
            <asp:BoundField DataField="DesiredPropertyAddr" HeaderText="Desired Property Addr" SortExpression="DesiredPropertyAddr" />
            <asp:BoundField DataField="Other_HomePhone" HeaderText="Other - HomePhone" SortExpression="Other_HomePhone" />
            <asp:BoundField DataField="Primary_PassportNo" HeaderText="Primary - Passport No" SortExpression="Primary_PassportNo" />
            <asp:BoundField DataField="Primary_PassportCountry" HeaderText="Primary- Passport Country" SortExpression="Primary_PassportCountry" />
            <asp:BoundField DataField="Other_PassportNo" HeaderText="Other - Passport No" SortExpression="Other_PassportNo" />
            <asp:BoundField DataField="Other_PassportCountry" HeaderText="Other - Passport Country" SortExpression="Other_PassportCountry" />
            <asp:BoundField DataField="Primary_DriversLicenceNo" HeaderText="Primary - Drivers Licence No" SortExpression="Primary_DriversLicenceNo" />
            <asp:BoundField DataField="Other_DriversLicenceNo" HeaderText="Other - Drivers Licence No" SortExpression="Other_DriversLicenceNo" />
            <asp:BoundField DataField="Primary_DriversLicenceState" HeaderText="Primary - Drivers Licence State" SortExpression="Primary_DriversLicenceState" FooterText="XXXX" />
            <asp:BoundField DataField="Other_DriversLicenceState" HeaderText="Other - Drivers Licence State" SortExpression="Other_DriversLicenceState" />
            <asp:BoundField DataField="Other_Res_Street1" HeaderText="Other Res - Street1" SortExpression="Other_Res_Street1" />
            <asp:BoundField DataField="Other_Res_Street2" HeaderText="Other Res - Street2" SortExpression="Other_Res_Street2" />
            <asp:BoundField DataField="Other_Res_Suburb" HeaderText="Other Res - Suburb" SortExpression="Other_Res_Suburb" />
            <asp:BoundField DataField="Other_Res_PostCode" HeaderText="Other Res - Post Code" SortExpression="Other_Res_PostCode" />
            <asp:BoundField DataField="Other_Res_State" HeaderText="Other Res - State" SortExpression="Other_Res_State" />
            <asp:BoundField DataField="Other_Res_Country" HeaderText="Other Res - Country" SortExpression="Other_Res_Country" />
            <asp:BoundField DataField="Other_CurrResidStatus" HeaderText="Other - Current Resid Status" SortExpression="Other_CurrResidStatus" />
            <asp:BoundField DataField="PrimPrev_Res_Street1" HeaderText="Primary Prev Res - Street1" SortExpression="PrimPrev_Res_Street1" />
            <asp:BoundField DataField="PrimPrev_Res_Street2" HeaderText="Prim Prev Res - Street2" SortExpression="PrimPrev_Res_Street2" />
            <asp:BoundField DataField="PrimPrev_Res_Suburb" HeaderText="Prim Prev Res - Suburb" SortExpression="PrimPrev_Res_Suburb" />
            <asp:BoundField DataField="PrimPrev_Res_PostCode" HeaderText="Prim Prev Res - Post Code" SortExpression="PrimPrev_Res_PostCode" />
            <asp:BoundField DataField="PrimPrev_Res_State" HeaderText="Prim Prev Res - State" SortExpression="PrimPrev_Res_State" />
            <asp:BoundField DataField="PrimPrev_Res_Country" HeaderText="Prim Prev Res - Country" SortExpression="PrimPrev_Res_Country" />
            <asp:BoundField DataField="OthPrev_Res_Street1" HeaderText="Other Prev Res - Street1" SortExpression="OthPrev_Res_Street1" />
            <asp:BoundField DataField="OthPrev_Res_Street2" HeaderText="Other Prev Res - Street2" SortExpression="OthPrev_Res_Street2" />
            <asp:BoundField DataField="OthPrev_Res_Suburb" HeaderText="Other Prev Res - Suburb" SortExpression="OthPrev_Res_Suburb" />
            <asp:BoundField DataField="OthPrev_Res_PostCode" HeaderText="Other Prev Res - Post Code" SortExpression="OthPrev_Res_PostCode" />
            <asp:BoundField DataField="OthPrev_Res_State" HeaderText="Other Prev Res - State" SortExpression="OthPrev_Res_State" />
            <asp:BoundField DataField="OthPrev_Res_Country" HeaderText="Other Prev Res - Country" SortExpression="OthPrev_Res_Country" />
            <asp:BoundField DataField="Other_PrevResStatus" HeaderText="Other Prev Res - Status" SortExpression="Other_PrevResStatus" />
            <asp:BoundField DataField="Other_CurrOccupType" HeaderText="Other - Current Occupation Type" SortExpression="Other_CurrOccupType" />
            <asp:BoundField DataField="Primary_BusIncomeAPAYGTaxPA" HeaderText="Primary - Bus Income After PAYG Tax p.a." SortExpression="Primary_BusIncomeAPAYGTaxPA" />
            <asp:BoundField DataField="Other_BusIncomeAPAYGTaxPA" HeaderText="Other - Bus Income After PAYG Tax p.a." SortExpression="Other_BusIncomeAPAYGTaxPA" />
            <asp:BoundField DataField="Primary_OtherIncomePA" HeaderText="Primary - Other Income p.a." SortExpression="Primary_OtherIncomePA" />
            <asp:BoundField DataField="Other_OtherIncomePA" HeaderText="Other - Other Income p.a." SortExpression="Other_OtherIncomePA" />
            <asp:BoundField DataField="Primary_OtherIncomeType" HeaderText="Primary - Other Income Type" SortExpression="Primary_OtherIncomeType" />
            <asp:BoundField DataField="Other_OtherIncomeType" HeaderText="Other - Other Income Type" SortExpression="Other_OtherIncomeType" />
            <asp:BoundField DataField="Primary_HomeLoanList" HeaderText="Primary - Home Loan List" SortExpression="Primary_HomeLoanList" />
            <asp:BoundField DataField="Other_HomeLoanList" HeaderText="Other - Home Loan List" SortExpression="Other_HomeLoanList" />
            <asp:BoundField DataField="Primary_CreditCardList" HeaderText="Primary - Credit Card List" SortExpression="Primary_CreditCardList" />
            <asp:BoundField DataField="Other_CreditCardList" HeaderText="Other - Credit Card List" SortExpression="Other_CreditCardList" />
            <asp:BoundField DataField="RentPM" HeaderText="Rent p.mo." SortExpression="RentPM" />
            <asp:BoundField DataField="Primary_PropertyAssetsList" HeaderText="Primary - Property Assets" SortExpression="Primary_PropertyAssets" />
            <asp:BoundField DataField="Other_PropertyAssetsList" HeaderText="Other - Property Assets" SortExpression="Other_PropertyAssets" />
            <asp:BoundField DataField="Primary_PersonalLoansList" HeaderText="Primary - Personal Loans List" SortExpression="Primary_PersonalLoansList" />
            <asp:BoundField DataField="Other_PersonalLoansList" HeaderText="Other - Personal Loans List" SortExpression="Other_PersonalLoansList" />
            <asp:BoundField DataField="Primary_OtherAssetsList" HeaderText="Primary- Other Assets List" SortExpression="Primary_OtherAssetsList" />
            <asp:BoundField DataField="Other_OtherAssetsList" HeaderText="Other- Other Assets List" SortExpression="Other_OtherAssetsList" />
            <asp:BoundField DataField="Primary_OtherLiabilitiesList" HeaderText="Primary - Other Liabilities List" SortExpression="Primary_OtherLiabilitiesList" />
            <asp:BoundField DataField="Other_OtherLiabilitiesList" HeaderText="Other - Other Liabilities List" SortExpression="Other_OtherLiabilitiesList" />
            <asp:BoundField DataField="HasReqestedPriority" HeaderText="Has Reqested Priority" SortExpression="HasReqestedPriority" />
            <asp:BoundField DataField="HasAgreedPACLicence" HeaderText="Has Agreed PAC Licence" SortExpression="HasAgreedPACLicence" />
            <asp:BoundField DataField="Primary_YrsCurrAddr" HeaderText="Primary - Yrs Current Addr" SortExpression="Primary_YrsCurrAddr" />
            <asp:BoundField DataField="Other_YrsCurrAddr" HeaderText="Other - Yrs Curr Addr" SortExpression="Other_YrsCurrAddr" />
            <asp:BoundField DataField="Other_YrsPrevAddr" HeaderText="Other - Yrs Prev Addr" SortExpression="Other_YrsPrevAddr" />
            <asp:BoundField DataField="YrsPrevAddr" HeaderText="Yrs Prev Addr" SortExpression="YrsPrevAddr" />
            <asp:BoundField DataField="YrsCurrEmployer" HeaderText="Yrs Curr Employer" SortExpression="YrsCurrEmployer" />
            <asp:BoundField DataField="YrsPrevEmployer" HeaderText="Yrs Prev Employer" SortExpression="YrsPrevEmployer" />
            <asp:BoundField DataField="AppAckLetterSent" HeaderText="App Ack Letter Sent" SortExpression="AppAckLetterSent" />
            <asp:BoundField DataField="AutoRejected" HeaderText="Date Auto Rejected" SortExpression="AutoRejected" />
            <asp:BoundField DataField="AutoAccepted" HeaderText="Date Auto Accepted" SortExpression="AutoAccepted" />
            <asp:BoundField DataField="CondCreditDecision" HeaderText="Cond. Decision" SortExpression="CondCreditDecision" />
            <asp:BoundField DataField="CondCreditDecisionBy" HeaderText="Cond. Decision By" SortExpression="CondCreditDecisionBy" />
        </Fields>
        <RowStyle Wrap="False" />
    </asp:DetailsView>


    <asp:SqlDataSource ID="InvestorApplicationDetailsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand="SELECT * FROM [InvestorApplications] WHERE ([Id] = @Id)" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="-1" Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <hr/>
        <div>
            <p>
              <span style="font-weight: bold">Acknowledgment of Application Letter Sent:</span>
            </p>
               Approver: <asp:Label ID="Label3" runat="server" Text="Pavel Dvorak" ToolTip="Name of current user who will be recorded as sender of the letter of acknowledgement."></asp:Label>
            <br />
                <p>
            <asp:Button ID="Button8" runat="server" Text="Record Letter of Acknowledgement of Application Sent" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#AppAckModal"/>
               </p>
        </div>

  
        <!-- Application Acknowledgement Letter Sent -->
        <div id="AppAckModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="AppAckLabel" aria-hidden="true">
         <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                 <h3 id="AppAckLabelmyModalLabel3">Confirmation</h3>

            </div>
            <div class="modal-body">
                <p>Are you sure you want to record that the Letter of Acknowledgement of Investor Application was sent?</p>
            </div>
            <div class="modal-footer">
                <%--  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="SubForm">Conditionally Approve</button>--%>
                 <button data-dismiss="modal" class="btn  btn-large" aria-hidden="true">Cancel</button>
                 <asp:Button runat="server" ID="Button9" Text="Record Applic Ack Letter" CssClass="btn" OnClick="ButtonAppAckLetterSentModal_Click" UseSubmitBehavior="false" data-dismiss="modal" />
            </div>
        </div>
    </div>
        </div>
  


    <hr />
        <div>
        <p>
          <span style="font-weight: bold">Conditional Decision:</span>
        </p>
           Approver: <asp:Label ID="lblApprover" runat="server" Text="Pavel Dvorak" ToolTip="Name of current user who will be recorded as approver of the Application."></asp:Label>
        <br />
            <p>
        <asp:Button ID="btnCondApprove" runat="server" Text="Conditionally Approve" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CondApprovalModal" BackColor="#99FF66" ForeColor="Black"/>
           &nbsp;<asp:Button ID="btnCondReject" runat="server" Text="Conditionally Reject" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CondRejectModal" BackColor="#FF6666" ForeColor="Black"/>
           </p>
        </div>

  
        <!-- COnditional approval confirmation -->
        <div id="CondApprovalModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myCondApprovModalLabel3" aria-hidden="true">
         <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                 <h3 id="myCondApprovModalLabel3">Confirmation</h3>

            </div>
            <div class="modal-body">
                <p>Are you sure you want to conditionally approve this application for the applied limit?</p>
                <p>A permanent Investor Id will be assigned and should be used for credit fee payment reference.</p>
            </div>
            <div class="modal-footer">
                <%--  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="SubForm">Conditionally Approve</button>--%>
                 <button data-dismiss="modal" class="btn  btn-large" aria-hidden="true">Cancel</button>
                 <asp:Button runat="server" ID="ButtonCondApprovedModal" Text="Conditionally Approve" CssClass="btn" OnClick="btn_CondApprovedModal_Click" UseSubmitBehavior="false" data-dismiss="modal" />
            </div>
        </div>
    </div>
        </div>


    
        <!-- COnditional rejection confirmation -->
          <div id="CondRejectModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="CondRejectLabel" aria-hidden="true">
         <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                 <h3 id="CondRejectLabel">Confirmation</h3>

            </div>
            <div class="modal-body">
                <p>Are you sure you want to conditionally reject this application?</p>
            </div>
            <div class="modal-footer">
                <%--  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn-primary btn" id="SubForm">Conditionally Approve</button>--%>
                 <button data-dismiss="modal" class="btn  btn-large" aria-hidden="true">Cancel</button>
                 <asp:Button runat="server" ID="Button5" Text="Conditionally Approve" CssClass="btn" OnClick="btnCondRejectModal_Click" UseSubmitBehavior="false" data-dismiss="modal" />
            </div>
        </div>
    </div>
        </div>
  
    <hr />

     <br />
        <p>
            <span style="font-weight: bold">Conditional Result </span><asp:Label ID="lblCondApproved" runat="server" Text="Label"></asp:Label><span style="font-weight: bold">&nbsp;Sent (emailed):</span>
        </p>

        <p>
        <asp:Button ID="btnCondResultSent" runat="server" Text="Mark Conditional Result as Sent" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CondResultSentModal"/>
        </p>

      <div id="CondResultSentModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
         <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">                
                 <h3 id="myModalLabel3">Confirmation</h3>
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

     <hr />
        <p>
            <span style="font-weight: bold">Investor Credit Fee Received:</span>

        </p>
        <p>
            Confirmation by:<asp:Label ID="lblCreditFeeConfirmerName" runat="server" Text="Pavel Dvorak"></asp:Label>
        </p>
        <p>
        <asp:Button ID="btnCreditFeeReceived" runat="server" Text="Investor Credit Fee Received" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#CreditFeeRecvdModal" OnClick="btnCreditFeeReceived_Click1"/>
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
                        <p>Please confirm the Investor credit (and property valuation) fee payment has been received.<br />  This will start the Investor Credit Assessment process.</p>
                        <% if (!String.IsNullOrWhiteSpace(HiddenField2.Value)) { %>
                        <p>
                            <em>Investor Property: </em> <br /> <%= this.HiddenField2.Value %><br />
                            <asp:CheckBox ID="chckPrptyValFeePaid" runat="server" Checked="true" /> Property fee paid and valuation can start. 
                            <br/>
                            <asp:Label ID="lblPrptyFeeReceivedNote" runat="server" Text="(Payment of Property Valuation Fee will need to be confirmed on this page before valuation can commence)." Font-Italic="True" Font-Size="Small" Visible="False"></asp:Label>
                            
                        </p>
                       <% } %>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        <asp:Button runat="server" ID="Button2" Text="Mark Credit Fee as Received." CssClass="btn" OnClick="btnCreditFeeReceived_Click" UseSubmitBehavior="false" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>

     <hr />
     <p>
            <span style="font-weight: bold">Property Evaluation Fee (only) Received:</span>

        </p>
        <p>
            Confirmation by:<asp:Label ID="Label2" runat="server" Text="Pavel Dvorak"></asp:Label>
        </p>
        <p>
        <asp:Button ID="Button3" runat="server" Text="Property Evaluation Fee Received" CausesValidation="False" class="btn btn-info btn-sm" data-toggle="modal" data-target="#PropertyFeeRecvdModal"/>
    </p>     
   <!-- Property Fee Received Confirmation -->
        <div id="PropertyFeeRecvdModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                         <h3 id="myModalLabel5">Confirmation</h3>
                    </div>
                    <div class="modal-body">
                        <p>Please confirm the Property Evaluation Fee payment has been received.<br />  This will start the property evaluation process. <br />
                            If the investor is not licensed you will still need to confirm Investor credit fee receipt and evaluation commencement.
                        </p>

                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        <asp:Button runat="server" ID="Button4" Text="Mark Property Fee as Received." CssClass="btn" OnClick="btnCreditFeeReceived_Click" UseSubmitBehavior="false" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
