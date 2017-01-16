using DataUtils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MABDBWeb
{

   

    public partial class BuyerApplicantsNewAll : System.Web.UI.Page
    {

        private List<int> entryIdSelected = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //process selected Ids
                // create a string builder to create the displayed string
                var builder = new StringBuilder();
                builder.Append("You have selected the following checks :<br/>");
                // get the selected checkboxes from the form data
                var checkString = Request.Form["EntrySelected"];
                if (checkString == null)
                    return;
                // we'll need a split to get the individual ids
                var values = checkString.Split(',');
                int intVal;
                foreach (var value in values)
                {
                    builder.Append("<br/>");

                    if (Int32.TryParse(value, out intVal))
                    {
                        entryIdSelected.Add(intVal);
                        builder.Append(value);
                    }
                    else
                    {
                        builder.Append("NoN:" + value);
                    }
                }
               // Response.Write(builder.ToString());
                GridView1.DataBind();
            }

        }


        protected void btnImport_Click(object sender, EventArgs e)
        {
            //Upload and save the file

            lblUploadError.Text = String.Empty;
            lblUploadError.Visible = false;
            string csvPath = Server.MapPath("~/") + Path.GetFileName(FileUpload1.PostedFile.FileName);

            if (!File.Exists(csvPath))
            {
                lblUploadError.Text = String.Concat("File was not received on the server into ", csvPath, ". Try again or contact the administrator.");
            }

            try
            {
                FileUpload1.SaveAs(csvPath);
            }
            catch (HttpException he)
            {
                lblUploadError.Visible = true;
                lblUploadError.Text = "Connection error while uploading, please try again in a moment.";
                    lblUploadError.Text += he.Message;

                return;
            }

            //IDs already in database. Start with empty list




            //load the current IDs to prevent duplicates



            int rowCnt = -1;

            try
            {
                rowCnt = UploadBuyerApplicsCSV(csvPath);
            }
            catch (ApplicationException aex)
            {
                lblUploadError.Visible = true;
                lblUploadError.Text = String.Concat(
                    "Cannot access database of exising applications, aborting import.\n", aex.Message);
                return;
            }

            lblImportRes.Text = String.Concat("Sucessfully imported ", rowCnt.ToString(), " new applications.");
            //if (dupl)

            lblImportResLabel.Visible = true;
            lblImportRes.Visible = true;



        }


        /// <summary>
        /// Loads a CSV with Buyer application data and loads into BuyerApplications table, a record per row
        /// </summary>
        /// <param name="csvPath">Local path to CSV file uploaded view HTTP file upload to Web server</param>
        /// <returns>number of rows successfully uploaded.</returns>
        private int UploadBuyerApplicsCSV(string csvPath)
        {
            List<int> existIDs = new List<int>();
            List<int> duplIds = new List<int>();
            // definition of DataTable to read the CSV into
            DataSet ds = new DataSet("BuyerApplication");

            DataTable dt = new DataTable();
            //dt.Columns.AddRange(

            try
            {
                existIDs = ReadExistingEntryIDs();  // note this is 
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Could not load list of Existing IDs", ex);
            }


            #region set up columns in dt
            
            List<DataColumn> impColsList = new List<DataColumn>();

            //total 128 columns in the table
            //Desired Property Address
            impColsList.Add(new DataColumn("LookingLocation", typeof(string)));            
            impColsList.Add(new DataColumn("EstSpend", typeof(string)));
            impColsList.Add(new DataColumn("IntendedDeposit", typeof(string)));
            impColsList.Add(new DataColumn("Broker", typeof(string)));
            impColsList.Add(new DataColumn("BrokerDetails", typeof(string)));
            impColsList.Add(new DataColumn("DesiredPropertyAddr", typeof(string)));
            impColsList.Add(new DataColumn("ApplicantType", typeof(string)));            
            impColsList.Add(new DataColumn("Primary_FirstName", typeof(string)));            
            impColsList.Add(new DataColumn("Other_FirstName", typeof(string)));
            impColsList.Add(new DataColumn("Primary_OtherNames", typeof(string)));
            impColsList.Add(new DataColumn("Other_OtherNames", typeof(string)));
            impColsList.Add(new DataColumn("Primary_LastName", typeof(string)));            
            impColsList.Add(new DataColumn("Other_LastName", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Title", typeof(string)));
            impColsList.Add(new DataColumn("Other_Title", typeof(string)));
            impColsList.Add(new DataColumn("Primary_DOB", typeof(DateTime)));
            impColsList.Add(new DataColumn("Other_DOB", typeof(DateTime)));
            impColsList.Add(new DataColumn("Primary_Gender", typeof(string)));
            impColsList.Add(new DataColumn("Other_Gender", typeof(string)));
            impColsList.Add(new DataColumn("Primary_MaritalStats", typeof(string)));
            impColsList.Add(new DataColumn("Other_MaritalStats", typeof(string)));
            impColsList.Add(new DataColumn("Email", typeof(string))); // primary
            impColsList.Add(new DataColumn("Other_Email", typeof(string))); // other
            impColsList.Add(new DataColumn("Primary_HomePhone", typeof(string))); // other
            impColsList.Add(new DataColumn("Other_HomePhone", typeof(string))); // other            
            impColsList.Add(new DataColumn("Mobile", typeof(string))); // primary
            impColsList.Add(new DataColumn("Other_Mobile", typeof(string))); // mobile number other
            impColsList.Add(new DataColumn("Primary_PassportNo", typeof(string))); //"Passport Number Primary Applicant",
            impColsList.Add(new DataColumn("Other_PassportNo", typeof(string))); //"Passport Number Other Applicant",
            impColsList.Add(new DataColumn("Primary_PassportCountry", typeof(string)));
            //"Passport Country of Issue - Primary Applicant",
            impColsList.Add(new DataColumn("Other_PassportCountry", typeof(string)));
            //"Passport Country of Issue - Other Applicant",
            impColsList.Add(new DataColumn("Primary_DriversLicenceNo", typeof(string)));
            //"Drivers Licence Number Primary Applicant","Drivers Licence Number Other Applicant",
            impColsList.Add(new DataColumn("Other_DriversLicenceNo", typeof(string)));
            //"Driver's Licence State of Issue Primary Applicant",
            impColsList.Add(new DataColumn("Primary_DriversLicenceState", typeof(string)));
            //"Driver's Licence State of Issue Other Applicant"
            impColsList.Add(new DataColumn("Other_DriversLicenceState", typeof(string)));
            impColsList.Add(new DataColumn("Primary_AUCitizenStat", typeof(string)));
            impColsList.Add(new DataColumn("Other_AUCitizenStat", typeof(string)));
            // <- impColsList.Add(new DataColumn("Other_Dependants", typeof(string)));

            impColsList.Add(new DataColumn("Primary_Res_Street1", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Res_Street2", typeof(string)));
            //impColsList.Add(new DataColumn("Primary_Res_City", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Res_Suburb", typeof(string)));            
            impColsList.Add(new DataColumn("Primary_Res_State", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Res_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Res_Country", typeof(string)));
            // 
            impColsList.Add(new DataColumn("Other_Res_Street1", typeof(string)));
            impColsList.Add(new DataColumn("Other_Res_Street2", typeof(string)));
            impColsList.Add(new DataColumn("Other_Res_Suburb", typeof(string)));
            impColsList.Add(new DataColumn("Other_Res_State", typeof(string)));
            impColsList.Add(new DataColumn("Other_Res_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("Other_Res_Country", typeof(string)));

            impColsList.Add(new DataColumn("Primary_CurrResidStatus", typeof(string))); // primary
            impColsList.Add(new DataColumn("Other_CurrResidStatus", typeof(string))); // other
            impColsList.Add(new DataColumn("Primary_YrsCurrAddr", typeof(string))); // primary
            impColsList.Add(new DataColumn("Other_YrsCurrAddr", typeof(string))); // other

            //Previous residential address Primary and Other applicants
            impColsList.Add(new DataColumn("PrimPrev_Res_Street1", typeof(string)));
            impColsList.Add(new DataColumn("PrimPrev_Res_Street2", typeof(string)));
            impColsList.Add(new DataColumn("PrimPrev_Res_Suburb", typeof(string)));
            impColsList.Add(new DataColumn("PrimPrev_Res_State", typeof(string)));
            impColsList.Add(new DataColumn("PrimPrev_Res_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("PrimPrev_Res_Country", typeof(string)));            
            impColsList.Add(new DataColumn("OthPrev_Res_Street1", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_Street2", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_Suburb", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_State", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_Country", typeof(string)));
            impColsList.Add(new DataColumn("YrsPrevAddr", typeof(string))); // primary
            impColsList.Add(new DataColumn("Other_YrsPrevAddr", typeof(string))); // primary
            impColsList.Add(new DataColumn("PrevResStatus", typeof(string))); // Other
            impColsList.Add(new DataColumn("Other_PrevResStatus", typeof(string))); // Other        
            impColsList.Add(new DataColumn("Primary_Dependants", typeof(string)));         
            impColsList.Add(new DataColumn("CurrOccupType", typeof(string))); // Primary    
            impColsList.Add(new DataColumn("Other_CurrOccupType", typeof(string))); // Other
            impColsList.Add(new DataColumn("CurrEmploymentStatus", typeof(string)));            
            impColsList.Add(new DataColumn("Other_CurrEmploymentStatus", typeof(string)));
            impColsList.Add(new DataColumn("CurrJobTitle", typeof(string)));
            impColsList.Add(new DataColumn("Other_JobTitle", typeof(string)));
            impColsList.Add(new DataColumn("CurrEmployerName", typeof(string)));
            impColsList.Add(new DataColumn("Other_CurrEmployerName", typeof(string)));        
            impColsList.Add(new DataColumn("YrsCurrEmployer", typeof(string)));
            impColsList.Add(new DataColumn("Other_YrsCurrEmployer", typeof(string)));
            impColsList.Add(new DataColumn("PrevJobTitle", typeof(string)));
            impColsList.Add(new DataColumn("Other_PrevJobTitle", typeof(string)));
            impColsList.Add(new DataColumn("PrevEmploymentStatus", typeof(string)));           
            impColsList.Add(new DataColumn("Other_PrevEmploymentStatus", typeof(string)));
            impColsList.Add(new DataColumn("PrevEmployerName", typeof(string)));
            impColsList.Add(new DataColumn("Other_PrevEmployerName", typeof(string)));
            impColsList.Add(new DataColumn("YrsPrevEmployer", typeof(string)));
            impColsList.Add(new DataColumn("Other_YrsPrevEmployer", typeof(string)));
            impColsList.Add(new DataColumn("HealthSelfRating", typeof(string)));
            impColsList.Add(new DataColumn("Other_HealthSelfRating", typeof(string)));
            impColsList.Add(new DataColumn("IsSmoker", typeof(string)));            
        impColsList.Add(new DataColumn("Other_IsSmoker", typeof(string)));
        impColsList.Add(new DataColumn("HasPrivateHealthIns", typeof(string)));
            impColsList.Add(new DataColumn("ReasonNoPHI", typeof(string)));
            impColsList.Add(new DataColumn("Other_HasPrivateHealthIns", typeof(string)));        
        impColsList.Add(new DataColumn("Other_ReasonNoPHI", typeof(string)));//UPDATE FORM!
        impColsList.Add(new DataColumn("RefusedHICover", typeof(string)));
            impColsList.Add(new DataColumn("ReasonRefusedHI", typeof(string)));
            impColsList.Add(new DataColumn("Other_RefusedHICover", typeof(string)));
         impColsList.Add(new DataColumn("Other_ReasonRefusedHI", typeof(string)));
            impColsList.Add(new DataColumn("Primary_IncomeMoAT", typeof(string)));
            impColsList.Add(new DataColumn("Other_IncomeMoAT", typeof(string)));
            // Primary Applicant $ Business Income (Personal Drawings/Share of Profits) after PAYG tax pa $",
            impColsList.Add(new DataColumn("Primary_BusIncomeAPAYGTaxPA", typeof(string)));
            //"Other Applicant $ Business Income (Personal Drawings/Share of Profits) after PAYG tax pa",
            impColsList.Add(new DataColumn("Other_BusIncomeAPAYGTaxPA", typeof(string)));
            //"Other $ Income per year - Primary Applicant",
            impColsList.Add(new DataColumn("Primary_OtherIncomePA", typeof(string)));
            //"Other $ Income per year - Other Applicant",
            impColsList.Add(new DataColumn("Other_OtherIncomePA", typeof(string)));
            //"Type of Other Income Primary Applicant (ie, dividends, rent, none)",
            impColsList.Add(new DataColumn("Primary_OtherIncomeType", typeof(string)));
            //"Type of other Income Other Applicant (ie, dividends, rent, none)"
            impColsList.Add(new DataColumn("Other_OtherIncomeType", typeof(string)));
            impColsList.Add(new DataColumn("HouseholdIncomeGrossPA", typeof(string)));
            //remove
            //Primary Applicant Home and/ or Investment loans (list all) 1",
            impColsList.Add(new DataColumn("Primary_HomeLoanList", typeof(string)));
            //"Other Applicant Home and/ or Investment loans (list all)",
            impColsList.Add(new DataColumn("Other_HomeLoanList", typeof(string)));
            //"Primary Applicant Car or Personal loans (list all) 1",
            impColsList.Add(new DataColumn("Primary_PersonalLoansList", typeof(string)));
            //"Other Applicant Car or Personal loans (list all)",
            impColsList.Add(new DataColumn("Other_PersonalLoansList", typeof(string)));
            //"Primary Applicant Credit and/ or Store(eg, Myer, David Jones) cards(list all) 1",
            impColsList.Add(new DataColumn("Primary_CreditCardList", typeof(string)));
            //"Other Applicant Credit and/ or Store(eg, Myer, David Jones) cards(list all)",
            impColsList.Add(new DataColumn("Other_CreditCardList", typeof(string)));
            //"Rent/Board per month ($)",
            impColsList.Add(new DataColumn("RentPM", typeof(string)));
            //"Property Assets & Liabilities for Primary Applicant: 1",
            impColsList.Add(new DataColumn("Primary_PropertyAssetsList", typeof(string)));
            impColsList.Add(new DataColumn("Other_PropertyAssetsList", typeof(string)));
            impColsList.Add(new DataColumn("Primary_OtherLiabilitiesList", typeof(string)));
            impColsList.Add(new DataColumn("Other_OtherLiabilitiesList", typeof(string)));
            //"Property Assets & Liabilities for Other Applicant:",
            //"List Other Assets for Primary Applicant: 1",
            //"List Other Assets for Other Applicant:",
            //"List Other Liabilities for Primary Applicant: 1",
            //"List Other Liabilities for Other Applicant:"
            
            
            
            
            // considered for priority
            // impColsList.Add(new DataColumn("HasReadPO6", typeof(string)));
            impColsList.Add(new DataColumn("HasAgreedPrivacy", typeof(string)));
            
            //           has read PAC Licence Agreement."
            // Created by UserID
            impColsList.Add(new DataColumn("EntryUserId", typeof(string)));
            impColsList.Add(new DataColumn("EntryId", typeof(string)));
            impColsList.Add(new DataColumn("EntryDate", typeof(DateTime)));
            //"Source Url",
            impColsList.Add(new DataColumn("SourceURL", typeof(string)));
            //"Transaction Id", 
            impColsList.Add(new DataColumn("TransactionId", typeof(string)));
            // ignored columns
            //[Payment Amount]
            //[Payment Date]
            //[Payment Status]
            //[Post iD]
            //[User Agent]
            //[User ID]

            int maxImportedColId = 127;
            impColsList.Add(new DataColumn("CreatedUTC", typeof(DateTime)));
            impColsList.Add(new DataColumn("CreatedBy", typeof(string)));
            //impColsList.Add(new DataColumn("HasAgreedPACLicence", typeof(string)));

            // ignored columns
            // columns not populated
            impColsList.Add(new DataColumn("FoundLocation", typeof(string)));
            impColsList.Add(new DataColumn("Property_Street1", typeof(string)));
            impColsList.Add(new DataColumn("Property_Street2", typeof(string)));
            impColsList.Add(new DataColumn("Property_Suburb", typeof(string)));
            impColsList.Add(new DataColumn("Property_State", typeof(string)));
            impColsList.Add(new DataColumn("Property_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("Property_Vendor", typeof(string)));
            impColsList.Add(new DataColumn("Property_Country", typeof(string)));
            impColsList.Add(new DataColumn("Property_AgentDetails", typeof(string)));
            impColsList.Add(new DataColumn("PropertyID", typeof(string)));            
            impColsList.Add(new DataColumn("Other_Dependants", typeof(string)));
            impColsList.Add(new DataColumn("ModifiedBy", typeof(string)));
            impColsList.Add(new DataColumn("Modified", typeof(string)));
            impColsList.Add(new DataColumn("RowVersion", typeof(string)));
            impColsList.Add(new DataColumn("InvestorApplicant_AssquireInvestor", typeof(string)));
            impColsList.Add(new DataColumn("InvestorApplication_Gender", typeof(string)));           
            impColsList.Add(new DataColumn("AutoPreApprovalBy", typeof(string)));
            impColsList.Add(new DataColumn("AutoPreApprovalResult", typeof(string)));
            impColsList.Add(new DataColumn("AutoPreApprovalDate", typeof(string)));
            impColsList.Add(new DataColumn("HasReqestedPriority", typeof(string)));
            impColsList.Add(new DataColumn("Primary_OtherAssetsList", typeof(string)));
            impColsList.Add(new DataColumn("Other_OtherAssetsList", typeof(string)));
            impColsList.Add(new DataColumn("CondApprovedLimit$", typeof(string)));
            impColsList.Add(new DataColumn("FinalApprovedLimit$", typeof(string)));
            impColsList.Add(new DataColumn("MthlyRent", typeof(string)));
            impColsList.Add(new DataColumn("MthlyDeposit", typeof(string)));
            impColsList.Add(new DataColumn("CondCreditDecisionDate", typeof(string)));
            impColsList.Add(new DataColumn("CondCreditDecision", typeof(string)));
            impColsList.Add(new DataColumn("CondCreditDecisionBy", typeof(string)));
            impColsList.Add(new DataColumn("CondCreditDecisionInformed", typeof(string)));
            impColsList.Add(new DataColumn("CondCreditDecisionInformedBy", typeof(string)));


            //impCols[163] = new DataColumn("", typeof(Boolean));


            DataColumn idCol = new DataColumn("Id", typeof(int));
            idCol.AutoIncrement = true;
            idCol.AutoIncrementSeed = -1;
            idCol.AutoIncrementStep = -1;
            impColsList.Add(idCol);

            int rowCnt = 0;
            

            DataColumn[] impCols;
            impCols = new DataColumn[impColsList.Count];
            impCols = impColsList.ToArray<DataColumn>();

            //modified
            //impCols[116] = DateTime.UtcNow;
            // created UTC
            //impCols[96] = DateTime.UtcNow;

            dt.Columns.AddRange(impCols);

            int colsCnt = dt.Columns.Count;

            #endregion set up columns


            //"Payment Amount","Payment Date","Payment Status","Post Id","User Agent","User IP"


            //prepare list columns
            List<string[,]> listColumns = new List<string[,]> ();

            string[,] t = new string[1,2] { { "Primary Applicant Home and/or Investment loans (list all)" , "Primary_HomeLoanList" }  };
            listColumns.Add(t);
            t = new string[1, 2] { { "Other Applicant Home and/or Investment loans (list all)", "Other_HomeLoanList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "Primary Applicant Car or Personal loans (list all)", "Primary_PersonalLoansList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "Other Applicant Car or Personal loans (list all)", "Other_PersonalLoansList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "Primary Applicant Credit and/or Store (eg, Myer, David Jones) cards (list all)", "Primary_CreditCardList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "Other Applicant Credit and/or Store (eg, Myer, David Jones) cards (list all)", "Other_CreditCardList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Assets for Primary Applicant:", "Primary_PropertyAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Assets for Other Applicant:", "Other_PropertyAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Assets for Primary Applicant:", "Primary_OtherAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Assets for Other Applicant:", "Other_OtherAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Liabilities for Primary Applicant:", "Primary_OtherLiabilitiesList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Liabilities for Other Applicant:", "Other_OtherLiabilitiesList" } };
            listColumns.Add(t);

            //listColumns.Add(new Dictionary<string, string>().Add("Primary Applicant Home and/or Investment loans (list all)", "") ); 
            //listColumns.Add("");
            //listColumns.Add(");
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();
            //listColumns.Add();

            string csvData = File.ReadAllText(csvPath);


            bool duplIDFound = false;
            bool skipHeaderRow = true;

            DataTable scoreDT = SetupScoreCard();


            Dictionary<string[,], short> listColsMaxCounts = null;

            ds.Tables.Add(dt);
            ds.Tables.Add(scoreDT);
            //DataRelation dr = new DataRelation("Rel_InvestorScoreCard_InvestorApplication", dt.Columns["Id"], scoreDT.Columns["InvestorApplicationId"], true);
            //DataRelation dr = new DataRelation("Rel_InvestorApplication", dt.Columns["Id"], scoreDT.Columns["InvestorApplicationId"], true);
            //ForeignKeyConstraint fkc = new ForeignKeyConstraint("FK_InvestorScoreCard_InvestorApplication", dt.Columns["Id"], scoreDT.Columns["InvestorApplicationId"]);
            //fkc.UpdateRule = Rule.Cascade;            
            DataRelation dr = ds.Relations.Add(dt.Columns["Id"], scoreDT.Columns["BuyerApplicationId"]);
            dr.ChildKeyConstraint.UpdateRule = Rule.Cascade;

            //scoreDT.Constraints.Add(fkc);

            //dr.ChildKeyConstraint = fkc;
            //dr.ChildKeyConstraint.UpdateRule = 


            // skips header row
            foreach (string row in csvData.Split('\n'))
            {
                //
                if (duplIDFound)
                {
                    continue;
                }

                if (0 == rowCnt && skipHeaderRow)
                {

                    listColsMaxCounts = ProcessListColumns(listColumns, row);
                    rowCnt++;
                    continue;
                }

                if (!string.IsNullOrEmpty(row))
                {
                    DataRow newRow = dt.Rows.Add();
                    int col = 0;
                    string currentColumnName = string.Empty;
                    string currentListColumn = String.Empty;
                    string[,] tmpListColumnMap = null;
                    short colHMax = 1;
                    int currentListColumnIndex = 1;

                    foreach (string cell in SplitCSV(row))
                    {
                        // do only columns that are defined
                        if (col >= maxImportedColId)
                        {
                            break;
                        }

                        currentColumnName = dt.Columns[col].ColumnName;

                        //initialisation of skipped columns
                        if (
                           //("Primary_OtherNames" == currentColumnName) ||
                           //("Other_OtherNames" == currentColumnName) ||
                           // ("Other_AUCitizenStat" == currentColumnName) ||
                           //("Primary_OtherLiabilitiesList" == currentColumnName) ||
                           //("Other_OtherLiabilitiesList" == currentColumnName) ||
                            ("Other_Dependants" == currentColumnName) ||
                            ("CondDecision" == currentColumnName) ||
                            ("CondDecisionBy" == currentColumnName) ||                           
                            ("HasAgreedPACLicence" == currentColumnName) ||
                            ("Primary_Res_City" == currentColumnName) ||
                            ("Other_Res_City" == currentColumnName) ||
                            ("Primary_Res_Street2" == currentColumnName) ||
                            ("Other_Res_Street2" == currentColumnName) ||
                            ("CondDecision" == currentColumnName) ||
                            ("CondDecisionBy" == currentColumnName)
                            )
                        {
                            newRow[col] = DBNull.Value;
                            col++;
                            continue;
                        }

                        //remove string delimiter "
                        string value = cell.Trim('"');

                        if (String.IsNullOrEmpty(currentListColumn))
                        {
                            foreach (string[,] item in listColsMaxCounts.Keys)
                            {
                                string colHeader = item[0, 1];
                                if (currentColumnName.Equals(colHeader))
                                {
                                    currentListColumn = colHeader;  // we are inside a new list
                                    currentListColumnIndex = 1; // reset
                                    tmpListColumnMap = item;
                                    if (!listColsMaxCounts.TryGetValue(tmpListColumnMap, out colHMax))
                                    {
                                        colHMax = 1;
                                    }
                                } 
                            }
                        }

                        if (!String.IsNullOrEmpty(currentListColumn))
                        {
                            if (colHMax > currentListColumnIndex)
                            {
                                if (currentListColumnIndex > 1)
                                {
                                    newRow[col] += "; ";  //concat lines using a semi-colon
                                }
                                newRow[col] += value;
                                currentListColumnIndex++;                              
                                //just grab the next data column under the same row and dt col index
                                
                            }
                            else if (colHMax == currentListColumnIndex) //move to the next column
                            {
                                newRow[col] += value;
                                currentListColumn = String.Empty;
                                currentListColumnIndex = 1;
                                tmpListColumnMap = null;
                                col++;
                                //currentColumnName = dt.Columns[col].ColumnName;
                            }
                            continue;

                        }                       


                    if ("EntryId" == currentColumnName)
                        {
                            int intID;
                            if (Int32.TryParse(value, out intID))
                            {
                                //application has already been imported
                                if (existIDs.Contains(intID))
                                {
                                    duplIDFound = true;
                                    duplIds.Add(intID);
                                    break;
                                } else
                                {
                                    newRow[col] = intID;
                                }
                            } else  // default Entry ID to -1
                            {
                                newRow[col] = -1;
                            }
                        }


                        else if ("EntryDate" == currentColumnName)
                        {
                            newRow[col] = (object)(ParseToDate(value)) ?? DateTime.Today;
                        }

                        //excptional formatting - Dates
                        else if (("Primary_DOB" == currentColumnName) ||
                                 ("Other_DOB" == currentColumnName))
                        {
                            newRow[col] = (object)(ParseToDate(value)) ?? DBNull.Value;
                        }

                        // Byte values
                        else if (("Primary_Dependants" == currentColumnName)
                                 || ("Other_Dependants" == currentColumnName)
                                // ("YrsCurrEmployer" == currentColumnName) ||
                                // ("YrsPrevEmployer" == currentColumnName) ||
                                //("Primary_YrsCurrAddr" == currentColumnName)
                                // || ("YrsPrevAddr" == currentColumnName)
                                // || ("Other_YrsCurrAddr" == currentColumnName)
                                // || ("Other_YrsPrevAddr" == currentColumnName)
                                )
                        {
                            byte? dbVal = ParseToTinyInt(value);
                            if (dbVal.HasValue)
                            {
                                newRow[col] = dbVal.Value;
                            }
                            //newRow[col] = dbVal.HasValue ? dbVal.Value : DBNull.Value;
                        }
                        // integer values
                        else if (
                            ("Property_Postcode" == currentColumnName) ||
                            ("Other_Res_PostCode" == currentColumnName) ||
                            ("PrimPrev_Res_PostCode" == currentColumnName) ||
                            ("OthPrev_Res_PostCode" == currentColumnName) ||
                            ("Primary_Res_PostCode" == currentColumnName)
                            )
                        {
                            short? dbVal = ParseToSmallInt(value);
                            if (dbVal.HasValue)
                            {
                                newRow[col] = dbVal.Value;
                            }
                            else
                            {
                                newRow[col] = DBNull.Value;
                            }
                        }
                        else if (("CreatedUTC" == currentColumnName) || ("Modified" == currentColumnName))
                        {
                            newRow[col] = DateTime.UtcNow;
                        } else if ("CreatedBy" == currentColumnName)
                        {
                            newRow[col] = "dvorakp";
                        }

                        // default parsing                        
                        else
                        {
                            newRow[col] = value;
                        }

                        col++;
                    }
                    ;
                    // ID already exists in the DB
                    if (duplIDFound)
                    {
                        dt.Rows.Remove(newRow);
                        break;
                    }
                    else
                    {
                        rowCnt++;
                    }


                    // clean-up unused list columns
                    
                    if (String.IsNullOrEmpty(newRow["Primary_HomeLoanList"] as String))
                    {
                        newRow["Primary_HomeLoanList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Other_HomeLoanList"] as String))
                    {
                        newRow["Other_HomeLoanList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Primary_PersonalLoansList"] as String))
                    {
                        newRow["Primary_PersonalLoansList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Other_PersonalLoansList"] as String))
                    {
                        newRow["Other_PersonalLoansList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Primary_CreditCardList"] as String))
                    {
                        newRow["Primary_CreditCardList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Other_CreditCardList"] as String))
                    {
                        newRow["Other_CreditCardList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Primary_PropertyAssetsList"] as String))
                    {
                        newRow["Primary_PropertyAssetsList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Other_PropertyAssetsList"] as String))
                    {
                        newRow["Other_PropertyAssetsList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Primary_OtherAssetsList"] as String))
                    {
                        newRow["Primary_OtherAssetsList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Other_OtherAssetsList"] as String))
                    {
                        newRow["Other_OtherAssetsList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Primary_OtherLiabilitiesList"] as String))
                    {
                        newRow["Primary_OtherLiabilitiesList"] = null;
                    }
                    if (String.IsNullOrEmpty(newRow["Other_OtherLiabilitiesList"] as String))
                    {
                        newRow["Other_OtherLiabilitiesList"] = null;
                    }


                    // calculate scores
                    DataRow newCard = scoreDT.NewRow();
                    newCard.SetParentRow(newRow);
                    newCard["Created"] = DateTime.Today;
                    newCard["Modified"] = DBNull.Value;
                    newCard["CreatedBy"] = "pdvorak";
                    newCard["ModifiedBy"] = DBNull.Value;

                    scoreDT.Rows.Add(newCard);

                    AutoCondApprovalResult condRes = CalcAutoCondApproval(newRow, newCard);

                    switch (condRes)
                    {
                        case AutoCondApprovalResult.Accepted:
                            newRow["AutoPreApprovalResult"] = 'A';
                            break;
                        case AutoCondApprovalResult.Rejected:
                            newRow["AutoPreApprovalResult"] = 'R';
                            break;
                        case AutoCondApprovalResult.Referred:
                            newRow["AutoPreApprovalResult"] = 'F';
                            break;
                    }
                    newRow["AutoPreApprovalDate"] = DateTime.Now;
                    newRow["AutoPreApprovalBy"] = "dvorakpj";

                    
                }
            }

            string consString = ConfigurationManager.ConnectionStrings["MABDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                SqlDataAdapter daInvApps =
                    new SqlDataAdapter("SELECT * FROM [dbo].[BuyerApplications]", con);

                SqlCommandBuilder cmdBldInvApps
                    = new SqlCommandBuilder(daInvApps);

                //dataAdapter.Connection
                //dataAdapter.SelectCommand = new SqlCommand();
                daInvApps.UpdateCommand = cmdBldInvApps.GetUpdateCommand();
                daInvApps.InsertCommand = cmdBldInvApps.GetInsertCommand();


                //SqlCommand sc =
                //    new SqlCommand(cmdBldInvApps.GetInsertCommand().CommandText +
                //                   "; Select Id From [dbo].[InvestorApplications] Where Id = @@IDENTITY");

                //sc.CommandType = CommandType.Text;
                //daInvApps.InsertCommand = sc;
                daInvApps.InsertCommand.CommandText += "; Select Id From [dbo].[BuyerApplications] Where Id = @@IDENTITY";
                daInvApps.InsertCommand.UpdatedRowSource = UpdateRowSource.FirstReturnedRecord;
                string insCmd = daInvApps.InsertCommand.CommandText;
                //daInvApps.RowUpdated += new SqlRowUpdatedEventHandler(MyHandler);
                daInvApps.DeleteCommand = cmdBldInvApps.GetDeleteCommand();
                cmdBldInvApps = null;



                SqlDataAdapter daInvApps2 = new SqlDataAdapter(daInvApps.SelectCommand.CommandText, con);
                daInvApps2.UpdateCommand = daInvApps.UpdateCommand;

                daInvApps2.InsertCommand = daInvApps.InsertCommand;

                //daInvApps2.RowUpdated += new SqlRowUpdatedEventHandler(MyHandler);
                daInvApps2.DeleteCommand = daInvApps.DeleteCommand;

                daInvApps2.Update(dt);
                //daInvApps.Update(dt);


                SqlDataAdapter daSC = new SqlDataAdapter("select * from [dbo].[BuyerScoreCard]", con);

                SqlCommandBuilder cmdBldSC = new SqlCommandBuilder(daSC);

                daSC.UpdateCommand = cmdBldSC.GetUpdateCommand(true);
                daSC.InsertCommand = cmdBldSC.GetInsertCommand(true);
                //daSC.InsertCommand.CommandText += "; Select * From [dbo].[InvestorScoreCard] Where Id = @@IDENTITY";
                daSC.InsertCommand.UpdatedRowSource = UpdateRowSource.FirstReturnedRecord;
                daSC.DeleteCommand = cmdBldSC.GetDeleteCommand(true);


                daSC.Update(scoreDT);



                //using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                //{
                //    //Set the database table name
                //    sqlBulkCopy.DestinationTableName = "[dbo].[InvestorApplications]";
                //    con.Open();
                //    sqlBulkCopy.WriteToServer(dt);
                //    con.Close();
                //}
            }

            GridView1.DataBind();

            return rowCnt - 1 - duplIds.Count;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="listCols"></param>
        /// <param name="row"></param>
        private Dictionary<string[,], short> ProcessListColumns(List<string[,]> listCols, string row)
        {

            Dictionary<string[,], short> listColsMaxCounts = new Dictionary<string[,], short>();

            //throw new NotImplementedException();
            foreach (string cell in SplitCSV(row))
            {

                string value = cell.Trim('"');
                foreach (string[,] listHeader in listCols)
                {
                    string colheader = listHeader[0,0];
                    //if (!listColsMaxCounts.ContainsKey(listHeader))  // the list is 
                    //{
                        short listHMax = 1;
                    if (value.StartsWith(colheader))
                    {
                        int i = 0;
                        char[] charsInheader = value.ToCharArray();

                        while ((charsInheader[charsInheader.Length - 1 - i] >= '0') && (charsInheader[charsInheader.Length - 1 - i] <= '9'))
                        {
                            i++;
                        }

                        if (i > 0)
                        {
                            string counter = value.Substring(value.Length - i);
                            if (Int16.TryParse(counter, out listHMax))
                            {
                                listColsMaxCounts[listHeader] = listHMax;
                            }
                            //char c = ''; // none
                            //value.Substring(value.Length-)
                        }
                        else
                        {
                            listColsMaxCounts[listHeader] = 1;
                        }
                    }
                    //} else
                    //{
                    //    throw new ArgumentException("The list is not unique.", "listCols");
                    //}
                }

            }

            return listColsMaxCounts;
        }

        public static void MyHandler(object adapter, SqlRowUpdatedEventArgs e)
        {
            //if (e.f)
            e.Status = UpdateStatus.SkipCurrentRow;

        }


        private List<int> ReadExistingEntryIDs()
        {
            List<int> existIDs = new List<int>();
            //string consString = ConfigurationManager.ConnectionStrings["MABDBConnectionString"].ConnectionString;


            //< asp:SqlDataSource ID = "InvApplicUniqueIDs" runat = "server" ConnectionString = "<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand = "SELECT [EntryId] FROM [InvestorApplications]" ></ asp:SqlDataSource >

            //    System.Web.UI.WebControls.SqlDataSource InvApplicUniqueIDsSDS = new 


            IEnumerable ids =
                        MABApplicUniqueIDs.Select(DataSourceSelectArguments.Empty);
            if (null != ids)
            {
                foreach (var o in ids)
                {
                    DataRowView rowView = o as DataRowView;
                    if (null != rowView) {
                        int intID;
                        object val = rowView.Row[0];
                        if (Int32.TryParse(val.ToString(), out intID))
                        {
                            existIDs.Add(intID);
                        }
                    }
                }
            }


            return existIDs;
        }

        private Int16? ParseToSmallInt(string cell)
        {
            DataTable dt;
            int i;
            Int16 smallInt;
            if (Int16.TryParse(cell, out smallInt))
            {
                return smallInt;
            }
            else
            {
                return null;
            }
        }

        private byte? ParseToTinyInt(string cell)
        {
            DataTable dt;
            int i;
            byte tinyInt;
            if (byte.TryParse(cell, out tinyInt))
            {
                return tinyInt;
            }
            else
            {
                return null;
            }
        }

        private DateTime? ParseToDate(string value)
        {
            if (String.IsNullOrEmpty(value))
            {
                return null;
            }

            try
            {
                DateTime dob = new DateTime();
                if (DateTime.TryParse(value, out dob))
                {
                    return dob;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }

        }

        private string[] SplitCSV(string input)
        {
            Regex csvSplit = new Regex("(?:^|,)(\"(?:[^\"]+|\"\")*\"|[^,]*)", RegexOptions.Compiled);
            List<string> list = new List<string>();
            string curr = null;
            foreach (Match match in csvSplit.Matches(input))
            {
                curr = match.Value;
                if (0 == curr.Length)
                {
                    list.Add("");
                }

                list.Add(curr.TrimStart(','));
            }

            return list.ToArray<string>();
        }

        private string SelectedIdsInclude(int numero)
        {
            if (entryIdSelected.Contains(numero))
                return "checked";
            return string.Empty;
        }

        private DataTable SetupScoreCard()
        {
            DataTable dt = new DataTable();

            DataColumn[] tblCols;            

            tblCols = new DataColumn[18]; //total 119 columns in the table
                                          //Desired Property Address
            tblCols[0] = new DataColumn("Primary_AUCitizen", typeof(Char));
            tblCols[1] = new DataColumn("Age", typeof(Char));
            tblCols[2] = new DataColumn("GrossIncomeSingle", typeof(Char));
            tblCols[3] = new DataColumn("GrossIncomeJoint", typeof(Char));
            tblCols[4] = new DataColumn("Primary_EmplStat", typeof(Char));
            tblCols[5] = new DataColumn("ScorecardLimit", typeof(Char));
            tblCols[6] = new DataColumn("Score_Personal", typeof(int));
            tblCols[7] = new DataColumn("Score_Residential", typeof(int));
            tblCols[8] = new DataColumn("Score_Employment", typeof(int));
            tblCols[9] = new DataColumn("Score_Class", typeof(string));
            tblCols[10] = new DataColumn("BuyerApplicationId", typeof(int));
            tblCols[11] = new DataColumn("CreatedBy", typeof(string));
            tblCols[12] = new DataColumn("Id", typeof(int));
            tblCols[12].AutoIncrement = true;
            tblCols[12].AutoIncrementSeed = -1;
            tblCols[12].AutoIncrementStep = -1;

            tblCols[13] = new DataColumn("Created", typeof(DateTime));
            tblCols[15] = new DataColumn("CreatedBy", typeof(string));
            tblCols[15] = new DataColumn("Modified", typeof(DateTime));
            tblCols[16] = new DataColumn("ModifiedBy", typeof(string));
            tblCols[17] = new DataColumn("Score_Total", typeof(int));



            dt.Columns.AddRange(tblCols);

            return dt;
        }

        private AutoCondApprovalResult CalcAutoCondApproval(DataRow InvAppRow, DataRow newCard)
        {
            //AutoCondApprovalResult result = AutoCondApprovalResult.Rejected;
            int acceptedScore = 0;
            int rejectedScore = 0;

            try
            {
                if (SC_IsPrimary_AUCitizen(InvAppRow["Primary_AUCitizenStat"] as string))
                {
                    newCard["Primary_AUCitizen"] = (char)AutoCondApprovalResult.Accepted;
                    acceptedScore++;
                }
                else
                {
                    newCard["Primary_AUCitizen"] = (char)AutoCondApprovalResult.Rejected;
                    rejectedScore++;
                }


                if (SC_IsAge25Plus(InvAppRow["Primary_DOB"] as DateTime?))
                {
                    newCard["Age"] = (char)AutoCondApprovalResult.Accepted;
                    acceptedScore++;
                }
                else if (SC_IsAgeUnder21(InvAppRow["Primary_DOB"] as DateTime?))
                {
                    newCard["Age"] = (char)AutoCondApprovalResult.Rejected;
                    rejectedScore++;
                } else
                {
                    newCard["Age"] = (char)AutoCondApprovalResult.Referred;
                }


                //if (SC_IsSingleApplic(InvAppRow["ApplicantType"] as string))
                //{
                //    //newCard["Pass_GrossIncomeSingle"] =
                //    //    SC_IncomeTestEorGT((InvAppRow["HouseholdIncomeGrossPA"] as string), 80000);
                //    //newCard["Pass_GrossIncomeJoint"] = true;
                //    newCard["GrossIncomeSingle"] = DBNull.Value;
                //    newCard["GrossIncomeJoint"] = DBNull.Value;
                //}
                //else
                //{
                newCard["GrossIncomeSingle"] = DBNull.Value;
                if (SC_IncomeTestEorGT((InvAppRow["HouseholdIncomeGrossPA"] as string), 120000))
                {
                    newCard["GrossIncomeJoint"] = (char)AutoCondApprovalResult.Accepted;
                    acceptedScore++;
                }
                else if (SC_IncomeTestEorLT((InvAppRow["HouseholdIncomeGrossPA"] as string), 100000))
                {
                    newCard["GrossIncomeJoint"] = (char)AutoCondApprovalResult.Rejected;
                    rejectedScore++;
                }
                else
                {
                    newCard["GrossIncomeJoint"] = (char)AutoCondApprovalResult.Referred;
                }
                //change from prev $100k Bob 20161004
            

                if (SC_EmplFullTimeStatTest(InvAppRow["CurrOccupType"] as string))
                {
                    newCard["Primary_EmplStat"] = (char)AutoCondApprovalResult.Accepted;
                    acceptedScore++;
                    
                } else if (SC_EmplPartTimeStatTest(InvAppRow["CurrOccupType"] as string))
                {
                    newCard["Primary_EmplStat"] = (char)AutoCondApprovalResult.Rejected;
                    rejectedScore++;
                } else
                {
                    newCard["Primary_EmplStat"] = (char)AutoCondApprovalResult.Referred;
                }
                //newCard["Pass_ScorecardGt80"] = true; 

               // newCard["ScorecardGt80"] = true;

            }
            catch
            {
                throw;
            }

            #region ScoreCard points
            int scoreSC = CalcScorecard(InvAppRow, newCard);

            if (scoreSC > 80)
            {
                newCard["ScorecardLimit"] = (char)AutoCondApprovalResult.Accepted;
                acceptedScore++;
            }
            else
            {
                newCard["ScorecardLimit"] = (char)AutoCondApprovalResult.Rejected;
                rejectedScore++;
            }

            #endregion ScoreCard points



            if (rejectedScore > 0)
            {
                return AutoCondApprovalResult.Rejected;
            } else if (acceptedScore >= 5)
            {
                return AutoCondApprovalResult.Accepted;
            } else
            {
                return AutoCondApprovalResult.Referred;
            }

            //(newCard["Pass_Primary_AUCitizen"] && newCard["Pass_Age25To55"] && newCard["Pass_GrossIncomeSingle"] &&
            //    newCard["Pass_GrossIncomeJoint"] && newCard["Pass_Primary_EmplStat"] &&
            //    newCard["Pass_ScorecardGt80"]);


        }

        private int CalcScorecard(DataRow InvAppRow, DataRow scDR)
        {
            int score = 0;
            int persSC = 0;
            int residSC = 0;
            int emplSC = 0;
            int health = 0;


            // personal and income
            #region personal
            // Core personal attributes and Income
            if (SC_IsSingleApplic(InvAppRow["ApplicantType"] as string))
            {
                persSC += 0;
            }
            else
            {
                persSC += 10;
            }

            // Age
            DateTime? primDOB = InvAppRow["Primary_DOB"] as DateTime?;
            if (primDOB.HasValue)
            {
                byte age = Age(primDOB.Value);
                {
                    if ((age > 0) && (age < 25))
                    {
                        persSC += 0;
                    }
                    else if ((age >= 25) && (age <= 40))
                    {
                        persSC += 10;
                    }
                    else if ((age > 40) && (age <= 60))
                    {
                        persSC += 15;
                    }
                    else if (age >= 60)
                    {
                        persSC += 10;
                    }
                }
            }


            //Gross Household Income pa
            decimal householdIncomeGrossPA = 0;

            if (Decimal.TryParse((InvAppRow["HouseholdIncomeGrossPA"] as string), out householdIncomeGrossPA))
            {
                if (householdIncomeGrossPA < 100000)
                {
                    persSC += 0;
                }
                else if ((householdIncomeGrossPA >= 100000) && (householdIncomeGrossPA < 150000))
                {
                    persSC += 10;
                }
                else if ((householdIncomeGrossPA >= 150000) && (householdIncomeGrossPA < 200000))
                {
                    persSC += 25;
                }
                //else if ((householdIncomeGrossPA >= 150000) && (householdIncomeGrossPA < 200000))
                //{
                //    persSC += 25;  //revision Bob 20161004
                //}
                else if (householdIncomeGrossPA >= 200000)
                {
                    persSC += 40;
                }
            }

            // Health

            string hasPHI = InvAppRow["HasPrivateHealthIns"] as String;
            if (hasPHI.Trim().Equals("yes", StringComparison.OrdinalIgnoreCase))
            {
                health = +10;
            }

            string isSmoker = InvAppRow["IsSmoker"] as String;
            if (hasPHI.Trim().Equals("no", StringComparison.OrdinalIgnoreCase))
            {
                health = +5;
            }


            persSC = +health;

            scDR["Score_Personal"] = persSC;

           

            #endregion personal
            score += persSC;

            // residential assessment
            #region residential

            // status
            String Prim_residStat = InvAppRow["Primary_CurrResidStatus"] as String;
            if (!String.IsNullOrEmpty(Prim_residStat))
            {
                Prim_residStat = Prim_residStat.Trim();

                if (Prim_residStat.Equals("Homeowner", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 20;
                }
                else if (Prim_residStat.Equals("Renter", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 20;
                }
            }

            //Years at Current Address
            String Prim_YrsCurrAddr = InvAppRow["Primary_YrsCurrAddr"] as String;
            if (!String.IsNullOrEmpty(Prim_YrsCurrAddr))
            {
                Prim_YrsCurrAddr = Prim_YrsCurrAddr.Trim();
                if (Prim_YrsCurrAddr.Equals("1 and less than 2 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 5;
                }
                else if (Prim_YrsCurrAddr.Equals("2 and less than 3 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 10;
                }
                else if (Prim_YrsCurrAddr.Equals("3 and less than 5 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 20;
                }
                else if (Prim_YrsCurrAddr.Equals("5 Years or more", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 40;
                }
            }

            //Years at Previous Address
            String Prim_YrsPrevAddr = InvAppRow["YrsPrevAddr"] as String;
            if (!String.IsNullOrEmpty(Prim_YrsPrevAddr))
            {
                Prim_YrsPrevAddr = Prim_YrsPrevAddr.Trim();
                if (Prim_YrsPrevAddr.Equals("1 and less than 2 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 5;
                }
                else if (Prim_YrsPrevAddr.Equals("2 and less than 3 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 10;
                }
                else if (Prim_YrsPrevAddr.Equals("3 and less than 5 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    residSC += 20;
                }

            }

            scDR["Score_Residential"] = residSC;

            #endregion residential
            score += residSC;

            // Employment Assessment
            #region employment
            String Empl_Status = InvAppRow["CurrEmploymentStatus"] as String;
            if (!String.IsNullOrEmpty(Empl_Status))
            {
                Empl_Status = Empl_Status.Trim();

                if (Empl_Status.Equals("Other - Full time", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 5;
                }
                else if (Empl_Status.Equals("Blue Collar/Trade", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 10;
                }
                else if (Empl_Status.Equals("Professional", StringComparison.CurrentCultureIgnoreCase) || Empl_Status.Equals("Self-Funded Retiree", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 20;
                }
                else if (Empl_Status.Equals("White Collar", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 15;
                }
            }

            //No. of Years with current employer

            String yrsCurrEmpl = InvAppRow["YrsCurrEmployer"] as String;
            if (!String.IsNullOrEmpty(yrsCurrEmpl))
            {
                yrsCurrEmpl = yrsCurrEmpl.Trim();

                if (yrsCurrEmpl.Equals("1 and less than 2 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 5;
                }
                else if (yrsCurrEmpl.Equals("2 and less than 3 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 10;
                }
                else if (yrsCurrEmpl.Equals("3 and less than 5 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 20;
                }
                else if (yrsCurrEmpl.Equals("5 Years or more", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 40;
                }

            }

            //No. of Years with previous employer
            String yrsPrevEmpl = InvAppRow["YrsPrevEmployer"] as String;
            if (!String.IsNullOrEmpty(yrsPrevEmpl))
            {
                yrsPrevEmpl = yrsPrevEmpl.Trim();

                if (yrsPrevEmpl.Equals("1 and less than 2 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 5;
                }
                else if (yrsPrevEmpl.Equals("2 and less than 3 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 10;
                }
                else if (yrsPrevEmpl.Equals("3 and less than 5 Years", StringComparison.CurrentCultureIgnoreCase))
                {
                    emplSC += 20;
                } 
            }


            scDR["Score_Employment"] = emplSC;

            #endregion employment
            score += emplSC;

            scDR["Score_Total"] = score;
            scDR["Score_Class"] = (CalcScoreClass(score)).ToString();

            return score;
        }


        private ScoreClass CalcScoreClass(int score)
        {
            if (score < 80)
            {
                return ScoreClass.Reject;
            }
            else if (score < 110)
            {
                return ScoreClass.Bronze;
            }
            else if (score < 140)
            {
                return ScoreClass.Silver;
            }
            else if (score <= 170)
            {
                return ScoreClass.Gold;
            }
            else //if (score <= 200) change Bob 20161004
            {
                return ScoreClass.Platinum;
            }
            //else
            //{
            //    return ScoreClass.Undefined;
            //}
        }


        //private SC_ResidentialStatus


        /// <summary>
        ///scorecard parameters
        /// </summary>
        /// <param name="answer"></param>
        /// <returns></returns>
        private Boolean SC_IsPrimary_AUCitizen(string answer)
        {
            if (String.IsNullOrEmpty(answer))
            {
                return false;
            }
            else
            {

                StringComparison comparisonType = StringComparison.OrdinalIgnoreCase;
                if (answer.Trim().Equals("yes", comparisonType))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// Indicator if the person if 25 years or older
        /// </summary>
        /// <param name="birthday">Person's birthday</param>
        /// <returns>Indicator if the person is 25 years of age or over.</returns>
        private Boolean SC_IsAge25Plus(DateTime? birthday)
        {
            if (!birthday.HasValue)
            {
                throw new ArgumentException("Birthday date value was not provided.");
            }

            byte age = Age(birthday.Value);
            return (age >= 25); //&& (age <= 55); //rev Bob 20160410
        }


        /// <summary>
        /// Test if the age is less than 21
        /// </summary>
        /// <param name="birthday">Person's birthdate</param>
        /// <returns>Indicator if the person is less than 21 years of age.</returns>
        private Boolean SC_IsAgeUnder21(DateTime? birthday)
        {
            if (!birthday.HasValue)
            {
                throw new ArgumentException("Birthday date value was not provided.");
            }

            byte age = Age(birthday.Value);
            return (age < 21); //&& (age <= 55); //rev Bob 20160410
        }

        /// <summary>
        /// Test on income
        /// </summary>
        /// <param name="value">actual value</param>
        /// <param name="lowLimit">Lower limit tested using greater or equal</param>
        /// <returns></returns>
        /// <exception ref="InvalidArgumentException" ></exception>
        private Boolean SC_IncomeTestEorGT(string value, decimal lowLimit)
        {
            decimal income;
            value = value.Trim();
            if ((value.StartsWith("$")) || ((value.StartsWith("AU$")))) // || (value.StartsWith("AUD")))
            {

                value = value.Substring(value.IndexOf("$") + 1, value.Length);

            }
            if (Decimal.TryParse(value, out income))
            {
                return (income >= lowLimit);
            }
            else
            {
                throw new ArgumentException("The income value is not a valid number.");
            }
        }

        /// <summary>
        /// Is the income represented by value equal or lower than the highLimit parameter.
        /// </summary>
        /// <param name="value">String representation of the value.</param>
        /// <param name="highLimit">High limit of the income to be tested.</param>
        /// <returns>Indicator</returns>
        /// <exception src="ArgumentException">Throws ArgumentException if the value is not a valid money number.</exception>
        private Boolean SC_IncomeTestEorLT(string value, decimal highLimit)
        {
            decimal income;
            value = value.Trim();
            if ((value.StartsWith("$")) || ((value.StartsWith("AU$")))) // || (value.StartsWith("AUD")))
            {

                value = value.Substring(value.IndexOf("$") + 1, value.Length);

            }
            if (Decimal.TryParse(value, out income))
            {
                return (income <= highLimit);
            }
            else
            {
                throw new ArgumentException("The income value is not a valid number.");
            }
        }

        private Boolean SC_IsSingleApplic(string value)
        {
            if (String.IsNullOrEmpty(value))
            {
                throw new ArgumentException("Applicant type is not provided. Please provide a value.");
            }
            else
            {
                if (value.Trim().Equals("Single"))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }


        /// <summary>
        /// Test employee status. Is it one of "Employee - Full Time" or "Self employed - Full Time"
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private Boolean SC_EmplFullTimeStatTest(string value)
        {
            if (String.IsNullOrEmpty(value))
            {
                throw new ArgumentException("No value was provided. Value is mandatory.");
            }
            else
            {
                StringComparison comparisonType = StringComparison.OrdinalIgnoreCase;
                if ((value.Trim().Equals("Employee - Full Time", comparisonType)) ||
                    (value.Trim().Equals("Self employed - Full Time", comparisonType)))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        private Boolean SC_EmplPartTimeStatTest(string value)
        {
            if (String.IsNullOrEmpty(value))
            {
                throw new ArgumentException("No value was provided. Value is mandatory.");
            }
            else
            {
                StringComparison comparisonType = StringComparison.OrdinalIgnoreCase;
                if ((value.Trim().Equals("Employee - Part Time", comparisonType)) ||
                    (value.Trim().Equals("Self employed - Part Time", comparisonType)))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="birthDate"></param>
        /// <returns>Whole age</returns>
        /// <exception cref="ApplicationException">When birthdate is not valie</exception>xception>
        private byte Age(DateTime birthDate)
        {

            if (birthDate >= DateTime.Today)
            {
                throw new ApplicationException("Invalid birth date, cannot be in the future.");
            }


            birthDate = birthDate.Date;

            DateTime today = DateTime.Today;
            int age = today.Year - birthDate.Year;

            if (birthDate > today.AddYears(-age))
                age--;

            //  int ageInDays = Convert.ToInt32(Math.Floor((DateTime.Today - birthDate).TotalDays));

            if (age < Byte.MaxValue)
            {
                return Convert.ToByte(age);
            }
            else
            {
                return Byte.MaxValue;
            }
        }

        private Color ColourCodeScore(string Score)
        {
            if (String.IsNullOrEmpty(Score))
            {
                return Color.White;
            }
            else
            {

                if (ScoreClass.Bronze.ToString() == Score)
                {
                    return Color.White;
                }
                else if (ScoreClass.Silver.ToString() == Score)
                {
                    return Color.LightSlateGray;
                }
                else if (ScoreClass.Gold.ToString() == Score)
                {
                    return Color.Gold;
                }
                else if (ScoreClass.Platinum.ToString() == Score)
                {
                    return Color.LightGray;
                }
                else if (ScoreClass.Reject.ToString() == Score)
                {
                    return Color.Red;
                }
                else
                {
                    return Color.White;
                }
            }


        }

        private void GridView1_DataBindingComplete(object sender, EventArgs e)
        {
            int rowscount = GridView1.Rows.Count;
            //GridView1.Rows[i].Cells[GetColumnIndexByName(GridView1, "Score_Class")]

            for (int i = 0; i < rowscount; i++)
            {
                if (!(GridView1.Rows[i].Cells[GetColumnIndexByName(GridView1, "Class")] == null))
                {
                    string status = GridView1.Rows[i].Cells[GetColumnIndexByName(GridView1, "Class")].Text;
                    GridView1.Rows[i].Cells[GetColumnIndexByName(GridView1, "Class")].BackColor = ColourCodeScore(status);
                }
            }
        }


        private int GetColumnIndexByName(GridView grid, string name)
        {
            for (int i = 0; i < grid.Columns.Count; i++)
            {
                if (grid.Columns[i].HeaderText.ToLower().Trim() == name.ToLower().Trim())
                {
                    return i;
                }
            }

            return -1;
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            GridView1_DataBindingComplete(sender, e);
        }

        private void MoveApplicantToInvestor(int InvestorApplicationId)
        {
            StatusUpdate sa = new StatusUpdate();

            sa.InvestorApplication_to_newInvestor(InvestorApplicationId);


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MoveApplicantToInvestor(1118);
        }


    }
}