using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using Microsoft.SqlServer.Server;

namespace MABDBWeb
{

    
    public partial class Investor_Applicants : System.Web.UI.Page
    {


        private List<int> entryIdSelected = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            // handle any postback
            if(IsPostBack)
            {
                //process selected Ids
                // create a string builder to create the displayed string
                var builder = new StringBuilder();
                builder.Append("Vous have selected the following checks :<br/>");
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
                        builder.Append("NoN:" +  value);
                    }
                }
                Response.Write(builder.ToString());
                GridView1.DataBind();
            }
        }        

        protected void btnImport_Click(object sender, EventArgs e)
        {
            //Upload and save the file



            lblUploadError.Text = String.Empty;
            lblUploadError.Visible = false; string csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);


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
                return;
            }

            //IDs already in database. Start with empty list
           

           

            //load the current IDs to prevent duplicates
                       


            int rowCnt = -1;

            try
            {
                rowCnt = UploadInvestorApplicsCSV(csvPath);
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

        private int UploadInvestorApplicsCSV(string csvPath)
        {
            List<int> existIDs = new List<int>();
            List<int> duplIds = new List<int>();
// definition of DataTable to read the CSV into
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


            DataColumn[] impCols;

            impCols = new DataColumn[121]; //total 119 columns in the table
            //Desired Property Address
            impCols[0] = new DataColumn("DesiredPropertyAddr", typeof(string));
            impCols[1] = new DataColumn("ApplicantType", typeof(string));
            impCols[2] = new DataColumn("Primary_FirstName", typeof(string));
            impCols[3] = new DataColumn("Primary_OtherNames", typeof(string));
            impCols[4] = new DataColumn("Primary_LastName", typeof(string));
            impCols[5] = new DataColumn("Other_FirstName", typeof(string));
            impCols[6] = new DataColumn("Other_OtherNames", typeof(string));
            impCols[7] = new DataColumn("Other_LastName", typeof(string));
            impCols[8] = new DataColumn("Primary_DOB", typeof(DateTime));
            impCols[9] = new DataColumn("Other_DOB", typeof(DateTime));
            impCols[10] = new DataColumn("Primary_Gender", typeof(string));
            impCols[11] = new DataColumn("Other_Gender", typeof(string));
            impCols[12] = new DataColumn("Primary_MaritalStats", typeof(string));
            impCols[13] = new DataColumn("Other_MaritalStats", typeof(string));
            impCols[14] = new DataColumn("Email", typeof(string)); // primary
            impCols[15] = new DataColumn("Other_Email", typeof(string)); // other
            impCols[16] = new DataColumn("Primary_HomePhone", typeof(string)); // other
            impCols[17] = new DataColumn("Other_HomePhone", typeof(string)); // other            
            impCols[18] = new DataColumn("Mobile", typeof(string)); // primary
            impCols[19] = new DataColumn("Other_Mobile", typeof(string)); // mobile number other
            impCols[20] = new DataColumn("Primary_PassportNo", typeof(string)); //"Passport Number Primary Applicant",
            impCols[21] = new DataColumn("Other_PassportNo", typeof(string)); //"Passport Number Other Applicant",
            impCols[22] = new DataColumn("Primary_PassportCountry", typeof(string));
                //"Passport Country of Issue - Primary Applicant",
            impCols[23] = new DataColumn("Other_PassportCountry", typeof(string));
                //"Passport Country of Issue - Other Applicant",
            impCols[24] = new DataColumn("Primary_DriversLicenceNo", typeof(string));
                //"Drivers Licence Number Primary Applicant","Drivers Licence Number Other Applicant",
            impCols[25] = new DataColumn("Other_DriversLicenceNo", typeof(string));
                //"Driver's Licence State of Issue Primary Applicant",
            impCols[26] = new DataColumn("Primary_DriversLicenceState", typeof(string));
                //"Driver's Licence State of Issue Other Applicant"
            impCols[27] = new DataColumn("Other_DriversLicenceState", typeof(string));
            impCols[28] = new DataColumn("Primary_AUCitizenStat", typeof(string));
            impCols[29] = new DataColumn("Other_AUCitizenStat", typeof(string));
            // <- impCols[14] = new DataColumn("Other_Dependants", typeof(string));

            impCols[30] = new DataColumn("Primary_Res_Street1", typeof(string));
            impCols[31] = new DataColumn("Primary_Res_Street2", typeof(string));
            impCols[32] = new DataColumn("Primary_Res_City", typeof(string));
            impCols[33] = new DataColumn("Primary_Res_State", typeof(string));
            impCols[34] = new DataColumn("Primary_Res_PostCode", typeof(string));            
            impCols[35] = new DataColumn("Primary_Res_Country", typeof(string));
            // 
            impCols[36] = new DataColumn("Other_Res_Street1", typeof(string));
            impCols[37] = new DataColumn("Other_Res_Street2", typeof(string));
            impCols[38] = new DataColumn("Other_Res_City", typeof(string));
            impCols[39] = new DataColumn("Other_Res_State", typeof(string));
            impCols[40] = new DataColumn("Other_Res_PostCode", typeof(string));
            impCols[41] = new DataColumn("Other_Res_Country", typeof(string));

            impCols[42] = new DataColumn("Primary_CurrResidStatus", typeof(string)); // primary
            impCols[43] = new DataColumn("Other_CurrResidStatus", typeof(string)); // other
            impCols[44] = new DataColumn("Primary_YrsCurrAddr", typeof(string)); // primary
            impCols[45] = new DataColumn("Other_YrsCurrAddr", typeof(string)); // other

            //Previous residential address Primary and Other applicants
            impCols[46] = new DataColumn("PrimPrev_Res_Street1", typeof(string));
            impCols[47] = new DataColumn("PrimPrev_Res_Street2", typeof(string));
            impCols[48] = new DataColumn("PrimPrev_Res_City", typeof(string));
            impCols[49] = new DataColumn("PrimPrev_Res_State", typeof(string));
            impCols[50] = new DataColumn("PrimPrev_Res_PostCode", typeof(string));
            impCols[51] = new DataColumn("PrimPrev_Res_Country", typeof(string));
            // 
            impCols[52] = new DataColumn("OthPrev_Res_Street1", typeof(string));
            impCols[53] = new DataColumn("OthPrev_Res_Street2", typeof(string));
            impCols[54] = new DataColumn("OthPrev_Res_City", typeof(string));
            impCols[55] = new DataColumn("OthPrev_Res_State", typeof(string));
            impCols[56] = new DataColumn("OthPrev_Res_PostCode", typeof(string));
            impCols[57] = new DataColumn("OthPrev_Res_Country", typeof(string));

            impCols[58] = new DataColumn("YrsPrevAddr", typeof(byte)); // primary
            // years at previous address Other
            impCols[59] = new DataColumn("Other_YrsPrevAddr", typeof(byte)); // primary
            impCols[60] = new DataColumn("PrevResStatus", typeof(string)); // Other
            // pre residential status other
            impCols[61] = new DataColumn("Other_PrevResStatus", typeof(string)); // Other
            impCols[62] = new DataColumn("CurrOccupType", typeof(string)); // Primary
            impCols[63] = new DataColumn("Other_CurrOccupType", typeof(string)); // Other


            impCols[64] = new DataColumn("Primary_IncomeMoAT", typeof(string));
            impCols[65] = new DataColumn("Other_IncomeMoAT", typeof(string));
            // Primary Applicant $ Business Income (Personal Drawings/Share of Profits) after PAYG tax pa $",
            impCols[66] = new DataColumn("Primary_BusIncomeAPAYGTaxPA", typeof(string));
            //"Other Applicant $ Business Income (Personal Drawings/Share of Profits) after PAYG tax pa",
            impCols[67] = new DataColumn("Other_BusIncomeAPAYGTaxPA", typeof(string));
            //"Other $ Income per year - Primary Applicant",
            impCols[68] = new DataColumn("Primary_OtherIncomePA", typeof(string));
            //"Other $ Income per year - Other Applicant",
            impCols[69] = new DataColumn("Other_OtherIncomePA", typeof(string));
            //"Type of Other Income Primary Applicant (ie, dividends, rent, none)",
            impCols[70] = new DataColumn("Primary_OtherIncomeType", typeof(string));
            //"Type of other Income Other Applicant (ie, dividends, rent, none)"
            impCols[71] = new DataColumn("Other_OtherIncomeType", typeof(string));
            impCols[72] = new DataColumn("HouseholdIncomeGrossPA", typeof(string));

            //remove
            //Primary Applicant Home and/ or Investment loans (list all) 1",
            impCols[73] = new DataColumn("Primary_HomeLoanList", typeof(string));
            //"Other Applicant Home and/ or Investment loans (list all)",
            impCols[74] = new DataColumn("Other_HomeLoanList", typeof(string));
            //"Primary Applicant Car or Personal loans (list all) 1",
            impCols[75] = new DataColumn("Primary_PersonalLoansList", typeof(string));
            //"Other Applicant Car or Personal loans (list all)",
            impCols[76] = new DataColumn("Other_PersonalLoansList", typeof(string));
            //"Primary Applicant Credit and/ or Store(eg, Myer, David Jones) cards(list all) 1",
            impCols[77] = new DataColumn("Primary_CreditCardList", typeof(string));
            //"Other Applicant Credit and/ or Store(eg, Myer, David Jones) cards(list all)",
            impCols[78] = new DataColumn("Other_CreditCardList", typeof(string));
            //"Rent/Board per month ($)",
            impCols[79] = new DataColumn("RentPM", typeof(string));
            //"Property Assets & Liabilities for Primary Applicant: 1",
            impCols[80] = new DataColumn("Primary_PropertyAssets", typeof(string));
            impCols[81] = new DataColumn("Other_PropertyAssets", typeof(string));
            impCols[82] = new DataColumn("Primary_OtherAssetsList", typeof(string));
            impCols[83] = new DataColumn("Other_OtherAssetsList", typeof(string));
            impCols[84] = new DataColumn("Primary_OtherLiabilitiesList", typeof(string));
            impCols[85] = new DataColumn("Other_OtherLiabilitiesList", typeof(string));
            //"Property Assets & Liabilities for Other Applicant:",
            //"List Other Assets for Primary Applicant: 1",
            //"List Other Assets for Other Applicant:",
            //"List Other Liabilities for Primary Applicant: 1",
            //"List Other Liabilities for Other Applicant:"


            // considered for priority
            impCols[86] = new DataColumn("HasReqestedPriority", typeof(string));
            impCols[87] = new DataColumn("HasAgreedPrivacy", typeof(string));
            impCols[88] = new DataColumn("HasAgreedPACLicence", typeof(string));
            //           has read PAC Licence Agreement."
            // Created by UserID
            impCols[89] = new DataColumn("UserId", typeof(string));

            impCols[90] = new DataColumn("EntryId", typeof(string));
            impCols[91] = new DataColumn("EntryDate", typeof(DateTime));
            //"Source Url",
            impCols[92] = new DataColumn("SourceURL", typeof(string));
            //"Transaction Id", 
            impCols[93] = new DataColumn("TransactionId", typeof(string));

            int maxImportedColId = 93;

            //unused columns
            impCols[94] = new DataColumn("CondApproved", typeof(DateTime));
            impCols[95] = new DataColumn("CondApprovedBy", typeof(string));
            impCols[96] = new DataColumn("CreatedUTC", typeof(DateTime));
            impCols[97] = new DataColumn("Other_Dependants", typeof(string));
            impCols[98] = new DataColumn("LookingLocation", typeof(string));
            impCols[99] = new DataColumn("FoundLocation", typeof(string));
            impCols[100] = new DataColumn("Property_Street1", typeof(string));
            impCols[101] = new DataColumn("Property_Street2", typeof(string));
            impCols[102] = new DataColumn("Property_City", typeof(string));
            impCols[103] = new DataColumn("Property_State", typeof(string));
            impCols[104] = new DataColumn("Property_PostCode", typeof(string));
            impCols[105] = new DataColumn("Property_Vendor", typeof(string));
            impCols[106] = new DataColumn("Property_Country", typeof(string));
            impCols[107] = new DataColumn("Property_AgentDetails", typeof(string));
            impCols[108] = new DataColumn("Primary_Dependants", typeof(string));
            impCols[109] = new DataColumn("CurrEmploymentStatus", typeof(string));
            impCols[110] = new DataColumn("YrsCurrEmployer", typeof(string));
            impCols[111] = new DataColumn("YrsPrevEmployer", typeof(string));
            impCols[112] = new DataColumn("IsSmoker", typeof(string));
            impCols[113] = new DataColumn("HasPrivateHealthIns", typeof(string));
            impCols[114] = new DataColumn("CreatedBy", typeof(string));
            impCols[115] = new DataColumn("ModifiedBy", typeof(string));
            impCols[116] = new DataColumn("Modified", typeof(string));
            impCols[117] = new DataColumn("RowVersion", typeof(string));
            impCols[118] = new DataColumn("InvestorApplicant_AssquireInvestor", typeof(string));
            impCols[119] = new DataColumn("InvestorApplication_Gender", typeof(string));
            impCols[120] = new DataColumn("EstSpend", typeof(string));

            //"Payment Amount","Payment Date","Payment Status","Post Id","User Agent","User IP"
            dt.Columns.AddRange(impCols);
            string csvData = File.ReadAllText(csvPath);
            
            int rowCnt = 0;
            int colsCnt = dt.Columns.Count;
            bool duplIDFound = false;
            bool skipHeaderRow = true;

            DataTable scoreDT = SetupScoreCard();

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
                    rowCnt++;
                    continue;
                }

                if (!string.IsNullOrEmpty(row))
                {
                    DataRow newRow = dt.Rows.Add();
                    int col = 0;
                    foreach (string cell in SplitCSV(row))
                    {
                        // do only columns that are defined
                        if (col >= maxImportedColId)
                        {
                            break;
                        }

                        string currentColumnName = dt.Columns[col].ColumnName;

                        //initialisation of skipped columns
                        if (
                            ("Primary_OtherNames" == currentColumnName) ||
                            ("Other_OtherNames" == currentColumnName) ||
                            ("Other_AUCitizenStat" == currentColumnName) ||
                            ("Other_Dependants" == currentColumnName) ||
                            ("CondApproved" == currentColumnName) ||
                            ("CondApprovedBy" == currentColumnName) ||
                            ("CreatedUTC" == currentColumnName)
                            )
                        {
                            newRow[col] = DBNull.Value;
                            col++;
                            continue;
                        }


                        //remove string delimiter "
                        string value = cell.Trim('"');

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
                                }
                            }
                        }

                        //excptional formatting - Dates
                        else if (("Primary_DOB" == currentColumnName) ||
                                 ("Other_DOB" == currentColumnName) ||
                                 ("EntryDate" == currentColumnName))
                        {
                            newRow[col] = (object) (ParseToDate(value)) ?? DBNull.Value;
                        }

                        // Byte values
                        else if (("Primary_Dependants" == currentColumnName) ||
                                 ("Other_Dependants" == currentColumnName) ||
                                 ("YrsCurrEmployer" == currentColumnName) ||
                                 ("YrsPrevEmployer" == currentColumnName) ||
                                 ("Primary_YrsCurrAddr" == currentColumnName)
                                 || ("YrsPrevAddr" == currentColumnName)
                                 || ("Other_YrsCurrAddr" == currentColumnName)
                                 || ("Other_YrsPrevAddr" == currentColumnName))
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

                    // calculate score
                    CalcAutoScoring(newRow, scoreDT);
                }
            }




            
            

            string consString = ConfigurationManager.ConnectionStrings["MABDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                SqlDataAdapter dataAdapter =
                    new SqlDataAdapter("SELECT TOP 1 * FROM [dbo].[InvestorApplications] ORDER BY Id DESC", con);

                SqlCommandBuilder cmdBld = new SqlCommandBuilder(dataAdapter);

                //dataAdapter.Connection
                //dataAdapter.SelectCommand = new SqlCommand();
                dataAdapter.UpdateCommand = cmdBld.GetUpdateCommand(true);
                dataAdapter.InsertCommand = cmdBld.GetInsertCommand(true);
                dataAdapter.DeleteCommand = cmdBld.GetDeleteCommand(true);
               // dataAdapter.Update(dt);

                //dataAdapter.Update(dt);

                //using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                //{
                //    //Set the database table name
                //    sqlBulkCopy.DestinationTableName = "[dbo].[InvestorApplications]";
                //    con.Open();
                //    sqlBulkCopy.WriteToServer(dt);
                //    con.Close();
                //}
            }

            return rowCnt - 1 - duplIds.Count;
        }

        private List<int> ReadExistingEntryIDs()
        {
            List<int> existIDs = new List<int>();
            //string consString = ConfigurationManager.ConnectionStrings["MABDBConnectionString"].ConnectionString;


            //< asp:SqlDataSource ID = "InvApplicUniqueIDs" runat = "server" ConnectionString = "<%$ ConnectionStrings:MABDBConnectionString %>" SelectCommand = "SELECT [EntryId] FROM [InvestorApplications]" ></ asp:SqlDataSource >
                       
            //    System.Web.UI.WebControls.SqlDataSource InvApplicUniqueIDsSDS = new 


        IEnumerable ids =
                    InvApplicUniqueIDs.Select(DataSourceSelectArguments.Empty);
                if (null != ids)
                {
                    foreach (var o in ids)
                    {
                        int intID;
                        if (Int32.TryParse(o.ToString(), out intID))
                        {
                            existIDs.Add(intID);
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

            tblCols = new DataColumn[15]; //total 119 columns in the table
            //Desired Property Address
            tblCols[0] = new DataColumn("IsPrimary_AUCitizen", typeof(Boolean));
            tblCols[1] = new DataColumn("IsAge25To55", typeof(Boolean));
            tblCols[2] = new DataColumn("IsGrossIncomeSingle", typeof(Boolean));
            tblCols[3] = new DataColumn("IsGrossIncomeJoint", typeof(Boolean));
            tblCols[4] = new DataColumn("IsPrimary_EmplStat", typeof(Boolean));
            tblCols[5] = new DataColumn("IsScorecardGt80", typeof(Boolean));
            tblCols[6] = new DataColumn("SC_Personal", typeof(int));
            tblCols[7] = new DataColumn("SC_Residential", typeof(Boolean));
            tblCols[8] = new DataColumn("SC_Employment", typeof(Boolean));
            tblCols[9] = new DataColumn("SC_Status", typeof(Boolean));
            tblCols[10] = new DataColumn("InvestorApplicationId", typeof(int));

            dt.Columns.AddRange(tblCols);

            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        /// <exception ref="ArgumentException">Throws ArgumentException in case table object to fill in is either null or no columns.</exception>
        private Boolean CalcAutoScoring(DataRow InvAppRow, DataTable SCdt)
        {
            if ((null == SCdt) || (0 == SCdt.Columns.Count))
            {
                throw new ArgumentException(
                    "Scorecard Data Table is not set up correctly, must have at least some columns.", "SCdt");
            }

            if ((null == InvAppRow) || (0 == InvAppRow.Table.Columns.Count))
            {
                throw new ArgumentException(
                    "InvestorApplication Data Table is not populated correctly, must have at least some columns.", "InvAppRow");
            }

            DataRow newCard = SCdt.NewRow();

            newCard["InvestorApplicationId"] = InvAppRow["Id"];

            try
            {
                newCard["Pass_Primary_AUCitizen"] = SC_IsPrimary_AUCitizen(InvAppRow["Primary_AUCitizenStat"] as string);
                newCard["Pass_Age25To55"] = SC_IsAge25To55(InvAppRow["Primary_DOB"] as DateTime?);
                if (SC_IsSingleApplic(InvAppRow["ApplicantType"] as string))
                {
                    newCard["Pass_GrossIncomeSingle"] =
                        SC_IncomeTestEorGT((InvAppRow["HouseholdIncomeGrossPA"] as string), 80000);
                    newCard["Pass_GrossIncomeJoint"] = true;
                }
                else
                {
                    newCard["Pass_GrossIncomeSingle"] = true;
                    newCard["Pass_GrossIncomeJoint"] =
                        SC_IncomeTestEorGT((InvAppRow["HouseholdIncomeGrossPA"] as string), 100000);
                }
                newCard["Pass_Primary_EmplStat"] = SC_EmplStatTest(InvAppRow["CurrOccupType"] as string);
                newCard["Pass_ScorecardGt80"] = true;

            }
            catch
            {
                throw;
            }


            return true;
                
                //(newCard["Pass_Primary_AUCitizen"] && newCard["Pass_Age25To55"] && newCard["Pass_GrossIncomeSingle"] &&
                //    newCard["Pass_GrossIncomeJoint"] && newCard["Pass_Primary_EmplStat"] &&
                //    newCard["Pass_ScorecardGt80"]);


        }


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

         private Boolean   SC_IsAge25To55(DateTime? birthday)
         {
             if (!birthday.HasValue)
             {
                 throw new ArgumentException("Birthday date value was not provided.");
             }

             byte age = Age(birthday.Value);
             return ( age < 25) && ( age > 55);
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
        private Boolean SC_EmplStatTest(string value)
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
                throw new ApplicationException ("Invalid birth date, cannot be in the future.");
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

    }
}