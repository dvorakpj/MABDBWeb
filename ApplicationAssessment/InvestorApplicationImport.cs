using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace ApplicationAssessment
{
    public class InvestorApplicationImport
    {

        /// <summary>
        /// ctor
        /// </summary>
        public InvestorApplicationImport()
        {

        }

        private DataSet SetupInvApplicDS(out int maxImportedColId)
        {
            DataTable InvApplicsDT = new DataTable("InvestorApplications");
            DataSet InvApplicationDS = new DataSet("InvApplication");

            #region set up columns in dt

            List<DataColumn> impColsList = new List<DataColumn>();
            //Desired Property Address
            impColsList.Add(new DataColumn("DesiredPropertyAddr", typeof(string)));
            impColsList.Add(new DataColumn("EstSpend", typeof(string)));
            impColsList.Add(new DataColumn("Property_LoanOutstanding", typeof(string)));
            impColsList.Add(new DataColumn("Property_Deposit", typeof(string)));
            impColsList.Add(new DataColumn("IsCompany", typeof(string)));
            impColsList.Add(new DataColumn("CompanyName", typeof(string)));
            impColsList.Add(new DataColumn("CompanyABN", typeof(string)));

            impColsList.Add(new DataColumn("Broker", typeof(string)));
            impColsList.Add(new DataColumn("BrokerDetails", typeof(string)));

            impColsList.Add(new DataColumn("ApplicantType", typeof(string)));
            impColsList.Add(new DataColumn("Primary_FirstName", typeof(string)));
            impColsList.Add(new DataColumn("Other_FirstName", typeof(string)));
            impColsList.Add(new DataColumn("Primary_OtherNames", typeof(string)));
            impColsList.Add(new DataColumn("Other_OtherNames", typeof(string)));
            impColsList.Add(new DataColumn("Primary_LastName", typeof(string)));
            impColsList.Add(new DataColumn("Other_LastName", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Title", typeof(string)));
            impColsList.Add(new DataColumn("Other_Title", typeof(string)));
            impColsList.Add(new DataColumn("Primary_CompRole", typeof(string)));


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
            //"Drivers Licence State of Issue Primary Applicant",
            impColsList.Add(new DataColumn("Primary_DriversLicenceState", typeof(string)));
            //"Driver's Licence State of Issue Other Applicant"
            impColsList.Add(new DataColumn("Other_DriversLicenceState", typeof(string)));
            impColsList.Add(new DataColumn("Primary_AUCitizenStat", typeof(string)));
            impColsList.Add(new DataColumn("Other_AUCitizenStat", typeof(string)));
            // <- impColsList.Add(new DataColumn("Other_Dependants", typeof(string)));

            impColsList.Add(new DataColumn("Primary_Res_Street1", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Res_Street2", typeof(string)));
            //impCols 32] = new DataColumn("Primary_Res_City", typeof(string)));
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
            // 
            impColsList.Add(new DataColumn("OthPrev_Res_Street1", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_Street2", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_Suburb", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_State", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("OthPrev_Res_Country", typeof(string)));
            impColsList.Add(new DataColumn("YrsPrevAddr", typeof(string))); // primary
            // years at previous address Other
            impColsList.Add(new DataColumn("Other_YrsPrevAddr", typeof(string))); // primary
            impColsList.Add(new DataColumn("PrevResStatus", typeof(string))); // Other
            // pre reidential status other
            impColsList.Add(new DataColumn("Other_PrevResStatus", typeof(string))); // Other
            impColsList.Add(new DataColumn("IsSmoker", typeof(string)));
            impColsList.Add(new DataColumn("HasPrivateHealthIns", typeof(string)));
            impColsList.Add(new DataColumn("CurrOccupType", typeof(string))); // Primary    
            impColsList.Add(new DataColumn("CurrEmploymentStatus", typeof(string)));

            impColsList.Add(new DataColumn("Other_CurrOccupType", typeof(string))); // Other
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
            //remov
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
            impColsList.Add(new DataColumn("Primary_OtherAssetsList", typeof(string)));
            impColsList.Add(new DataColumn("Other_OtherAssetsList", typeof(string)));
            impColsList.Add(new DataColumn("Primary_OtherLiabilitiesList", typeof(string)));
            impColsList.Add(new DataColumn("Other_OtherLiabilitiesList", typeof(string)));
            //"Property Assets & Liabilities for Other Applicant:",
            //"List Other Assets for Primary Applicant: 1",
            //"List Other Assets for Other Applicant:",
            //"List Other Liabilities for Primary Applicant: 1",
            //"List Other Liabilities for Other Applicant:"
            // considered for priority
            impColsList.Add(new DataColumn("HasReadPO6", typeof(string)));
            impColsList.Add(new DataColumn("HasAgreedPrivacy", typeof(string)));
            impColsList.Add(new DataColumn("HasReqestedPriority", typeof(string)));

            //           has read PAC Licence Agreement."
            // Created by UserID
            impColsList.Add(new DataColumn("UserId", typeof(string)));
            impColsList.Add(new DataColumn("EntryId", typeof(string)));
            impColsList.Add(new DataColumn("EntryDate", typeof(DateTime)));
            //"Source Url",
            impColsList.Add(new DataColumn("SourceURL", typeof(string)));
            //"Transaction Id", 
            impColsList.Add(new DataColumn("TransactionId", typeof(string)));

            impColsList.Add(new DataColumn("CreatedUTC", typeof(DateTime)));
            impColsList.Add(new DataColumn("HasAgreedPACLicence", typeof(string)));
            impColsList.Add(new DataColumn("CreatedBy", typeof(string)));
            // ignored columns
            // columns not populated
            maxImportedColId = 109;

            impColsList.Add(new DataColumn("LookingLocation", typeof(string)));
            impColsList.Add(new DataColumn("FoundLocation", typeof(string)));
            impColsList.Add(new DataColumn("Property_Street1", typeof(string)));
            impColsList.Add(new DataColumn("Property_Street2", typeof(string)));
            impColsList.Add(new DataColumn("Property_Suburb", typeof(string)));
            impColsList.Add(new DataColumn("Property_State", typeof(string)));
            impColsList.Add(new DataColumn("Property_PostCode", typeof(string)));
            impColsList.Add(new DataColumn("Property_Vendor", typeof(string)));
            impColsList.Add(new DataColumn("Property_Country", typeof(string)));
            impColsList.Add(new DataColumn("Property_AgentDetails", typeof(string)));
            impColsList.Add(new DataColumn("Primary_Dependants", typeof(string)));
            impColsList.Add(new DataColumn("CondDecision", typeof(DateTime)));
            impColsList.Add(new DataColumn("Other_Dependants", typeof(string)));
            impColsList.Add(new DataColumn("CondDecisionBy", typeof(string)));
            impColsList.Add(new DataColumn("ModifiedBy", typeof(string)));
            impColsList.Add(new DataColumn("Modified", typeof(string)));
            impColsList.Add(new DataColumn("RowVersion", typeof(string)));
            impColsList.Add(new DataColumn("InvestorApplicant_AssquireInvestor", typeof(string)));
            impColsList.Add(new DataColumn("InvestorApplication_Gender", typeof(string)));
            impColsList.Add(new DataColumn("AutoRejected", typeof(string)));
            impColsList.Add(new DataColumn("AutoRejectedBy", typeof(string)));
            impColsList.Add(new DataColumn("AutoAccepted", typeof(string)));
            impColsList.Add(new DataColumn("AutoAcceptedBy", typeof(string)));
            impColsList.Add(new DataColumn("CondCreditDecisionDate", typeof(Boolean)));
            impColsList.Add(new DataColumn("CondCreditDecisionInformed", typeof(Boolean)));
            impColsList.Add(new DataColumn("CondCreditDecisionInformedBy", typeof(Boolean)));
            impColsList.Add(new DataColumn("CondCreditDecisionBy", typeof(Boolean)));
            impColsList.Add(new DataColumn("CondCreditDecision", typeof(Boolean)));
            impColsList.Add(new DataColumn("AppAckLetterSent", typeof(Boolean)));
            impColsList.Add(new DataColumn("AppAckLetterSentBy", typeof(Boolean)));
            impColsList.Add(new DataColumn("ApplicantsNotes", typeof(Boolean)));
            impColsList.Add(new DataColumn("CondDecisionOfficeNotes", typeof(Boolean)));
            impColsList.Add(new DataColumn("AppliedLimit", typeof(Boolean)));
            impColsList.Add(new DataColumn("YrsCurrEmployer", typeof(string)));
            impColsList.Add(new DataColumn("YrsPrevEmployer", typeof(string)));
            impColsList.Add(new DataColumn("CompanyACN", typeof(string)));

         
            DataColumn idCol = new DataColumn("Id", typeof(int));
            idCol.AutoIncrement = true;
            idCol.AutoIncrementSeed = -1;
            idCol.AutoIncrementStep = -1;
            impColsList.Add(idCol);


            //modified
            //impCols[116] = DateTime.UtcNow;
            // created UTC
            //impCols[96] = DateTime.UtcNow;



            DataColumn[] impCols;
            impCols = new DataColumn[impColsList.Count]; //total 138 columns in the table
            impCols = impColsList.ToArray<DataColumn>();
            InvApplicsDT.Columns.AddRange(impCols);

            InvApplicationDS.Tables.Add(InvApplicsDT);

            DataTable scoreDT = SetupAsqInvScoreCardTable();
            InvApplicationDS.Tables.Add(scoreDT);

            //DataRelation dr = new DataRelation("Rel_InvestorScoreCard_InvestorApplication", dt.Columns["Id"], scoreDT.Columns["InvestorApplicationId"], true);
            //DataRelation dr = new DataRelation("Rel_InvestorApplication", dt.Columns["Id"], scoreDT.Columns["InvestorApplicationId"], true);
            //ForeignKeyConstraint fkc = new ForeignKeyConstraint("FK_InvestorScoreCard_InvestorApplication", dt.Columns["Id"], scoreDT.Columns["InvestorApplicationId"]);
            //fkc.UpdateRule = Rule.Cascade;            
            DataRelation dr = InvApplicationDS.Relations.Add(InvApplicsDT.Columns["Id"], scoreDT.Columns["InvestorApplicationId"]);
            dr.ChildKeyConstraint.UpdateRule = Rule.Cascade;

            #endregion set up columns

            return InvApplicationDS;
        }

        public  int UploadInvestorApplicsCSV(string csvPath, List<int> existingFormIds)
        {
            //List<int> existingFormIds = new List<int>();
            List<int> duplIds = new List<int>();
            // definition of DataTable to read the CSV into

            int rowCnt = 0;

            //"Payment Amount","Payment Date","Payment Status","Post Id","User Agent","User IP"

            #region prepare list columns
            //prepare list columns           

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

 #endregion prepare list columns

            string csvData = File.ReadAllText(csvPath);

            bool duplIDFound = false;
            bool skipHeaderRow = true;



            Dictionary<string[,], short> listColsMaxCounts = null;

            int maxImportedColId = -1;
            DataSet InvApplicsDS = this.SetupInvApplicDS(out maxImportedColId);
            DataTable InvApplicsDT = InvApplicsDS.Tables["InvestorApplications"];
            DataTable scoreDT = InvApplicsDS.Tables["InvestorScoreCard"];

            List<string[,]> listColumns = SetupInvApplicListColumns();


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
                    DataRow newRow = InvApplicsDT.Rows.Add();
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

                        currentColumnName = InvApplicsDT.Columns[col].ColumnName;

                        //initialisation of skipped columns
                        if (
                            ("Primary_OtherNames" == currentColumnName) ||
                            ("Other_OtherNames" == currentColumnName) ||
                            ("Other_AUCitizenStat" == currentColumnName) ||
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
                                if (existingFormIds.Contains(intID))
                                {
                                    duplIDFound = true;
                                    duplIds.Add(intID);
                                    break;
                                }
                                else
                                {
                                    newRow[col] = intID;
                                }
                            }
                            else  // default Entry ID to -1
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
                        }
                        else if ("CreatedBy" == currentColumnName)
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
                        InvApplicsDT.Rows.Remove(newRow);
                        break;
                    }
                    else
                    {
                        rowCnt++;
                    }


                    // calculate scores
                    DataRow newCard = scoreDT.NewRow();
                    newCard.SetParentRow(newRow);
                    newCard["Created"] = DateTime.Today;
                    newCard["Modified"] = DBNull.Value;
                    newCard["CreatedBy"] = "pdvorak";
                    newCard["ModifiedBy"] = DBNull.Value;

                    scoreDT.Rows.Add(newCard);

                    //CalcAutoCondApproval(newRow, newCard);

                    //int score = CalcScoreClass()
                    //newRow[94] = DateTime.UtcNow;
                    // newRow[90] = "3";
                }
            }

            
            return rowCnt - 1 - duplIds.Count;
        }


        /// <summary>
        /// Insert New Investor Application and related records (ScoreCard) to the MATDBD.
        /// </summary>
        /// <param name="InvestorApplicsDS">DataSet ready to be saved.</param>
        /// <returns>Number of new inv applications saved.</returns>
        /// <exception cref="ApplicationException">ApplicationException when integrity of records is found in violation of logi rules.</exception>
        private int InsNewInvApplics(DataSet InvestorApplicsDS)
        {
            string consString = ConfigurationManager.ConnectionStrings["MABDBConnectionString"].ConnectionString;
            int invApplicsUpdated, invSCsUpdated;
            using (SqlConnection con = new SqlConnection(consString))
            {
                SqlDataAdapter daInvApps =
                    new SqlDataAdapter("SELECT * FROM [dbo].[InvestorApplications]", con);

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
                daInvApps.InsertCommand.CommandText += "; Select Id From [dbo].[InvestorApplications] Where Id = @@IDENTITY";
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


                
                //daInvApps2.Update(InvApplicsDT);
                invApplicsUpdated = daInvApps2.Update(InvestorApplicsDS.Tables["InvestorApplications"]);

                //daInvApps.Update(dt);

                SqlDataAdapter daSC = new SqlDataAdapter("select * from [dbo].[InvestorScoreCard]", con);

                SqlCommandBuilder cmdBldSC = new SqlCommandBuilder(daSC);

                daSC.UpdateCommand = cmdBldSC.GetUpdateCommand(true);
                daSC.InsertCommand = cmdBldSC.GetInsertCommand(true);
                //daSC.InsertCommand.CommandText += "; Select * From [dbo].[InvestorScoreCard] Where Id = @@IDENTITY";
                daSC.InsertCommand.UpdatedRowSource = UpdateRowSource.FirstReturnedRecord;
                daSC.DeleteCommand = cmdBldSC.GetDeleteCommand(true);

                invSCsUpdated = daSC.Update(InvestorApplicsDS.Tables["InvestorScoreCard"]);

                //using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                //{
                //    //Set the database table name
                //    sqlBulkCopy.DestinationTableName = "[dbo].[InvestorApplications]";
                //    con.Open();
                //    sqlBulkCopy.WriteToServer(dt);
                //    con.Close();
                //}

                if (invApplicsUpdated != invSCsUpdated)
                {
                    throw new ApplicationException(String.Format("Number of new inv applications and scorecards don't match. Applics: {0}, SCs: {1}", invApplicsUpdated, invSCsUpdated));
                }

            }          
            return invApplicsUpdated;

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


        /// <summary>
        /// Set up struture of the Investor ScoreCard table
        /// </summary>
        /// <returns>Data table with structure corresponding to the Investor Score Card table.</returns>
        private DataTable SetupAsqInvScoreCardTable()
        {
            DataTable dt = new DataTable("InvestorScoreCard");

            DataColumn[] tblCols;

            tblCols = new DataColumn[17]; //total 17 columns in the table
            tblCols[0] = new DataColumn("Primary_AUCitizen", typeof(Char));
            tblCols[1] = new DataColumn("Age", typeof(Char));
            tblCols[2] = new DataColumn("GrossIncomeSingle", typeof(Char));
            tblCols[2].AllowDBNull = true;
            tblCols[3] = new DataColumn("GrossIncomeJoint", typeof(Char));
            tblCols[3].AllowDBNull = true;
            tblCols[4] = new DataColumn("Primary_EmplStat", typeof(Char));
            tblCols[5] = new DataColumn("ScorecardLimit", typeof(Char));
            tblCols[6] = new DataColumn("Score_Personal", typeof(int));
            tblCols[7] = new DataColumn("Score_Residential", typeof(int));
            tblCols[8] = new DataColumn("Score_Employment", typeof(int));
            tblCols[9] = new DataColumn("Score_Total", typeof(int));
            tblCols[10] = new DataColumn("Score_Class", typeof(string));
            tblCols[11] = new DataColumn("InvestorApplicationId", typeof(int));
            tblCols[12] = new DataColumn("Id", typeof(int));
            tblCols[12].AutoIncrement = true;
            tblCols[12].AutoIncrementSeed = -1;
            tblCols[12].AutoIncrementStep = -1;
            tblCols[13] = new DataColumn("Created", typeof(DateTime));
            tblCols[13].AllowDBNull = false;
            tblCols[14] = new DataColumn("CreatedBy", typeof(string));
            tblCols[14].AllowDBNull = false;              
           // tblCols[15] = new DataColumn("CreatedBy", typeof(string));
            tblCols[15] = new DataColumn("Modified", typeof(DateTime));
            tblCols[16] = new DataColumn("ModifiedBy", typeof(string));
                       
            dt.Columns.AddRange(tblCols);

            return dt;
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
                    string colheader = listHeader[0, 0];
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


        /// <summary>
        /// Sets up mapping from List Columns in the Investor Application Import CSV based on the structure of the online form to the corresponding DB columns.
        /// </summary>
        /// <returns>2d array of question, DB field that are lists of answers in the online form.</returns>
        private List<string[,]> SetupInvApplicListColumns()
        {
            List<string[,]> listColumns = new List<string[,]>();

            string[,] t = new string[1, 2] { { "Primary Applicant Home and/or Investment loans (list all)", "Primary_HomeLoanList" } };
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
            t = new string[1, 2] { { "Property Assets & Liabilities for Primary Applicant:", "Primary_PropertyAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "Property Assets & Liabilities for Other Applicant:", "Other_PropertyAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Assets for Primary Applicant:", "Primary_OtherAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Assets for Other Applicant:", "Other_OtherAssetsList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Liabilities for Primary Applicant:", "Primary_OtherLiabilitiesList" } };
            listColumns.Add(t);
            t = new string[1, 2] { { "List Other Liabilities for Other Applicant:", "Other_OtherLiabilitiesList" } };
            listColumns.Add(t);

            return listColumns;
        }

    }
}
