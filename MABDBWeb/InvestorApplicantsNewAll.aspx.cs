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

    

    public partial class InvestorApplicantsNewAll : System.Web.UI.Page
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
                ApplicationAssessment.InvestorApplicationImport importEngine = new ApplicationAssessment.InvestorApplicationImport();
                rowCnt = importEngine.UploadInvestorApplicsCSV(csvPath, ReadExistingEntryIDs());
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
            GridView1.DataBind();



        }

       



        public static void MyHandler(object adapter, SqlRowUpdatedEventArgs e)
        {
            //if (e.f)
            e.Status = UpdateStatus.SkipCurrentRow;

        }


       



    
        private string SelectedIdsInclude(int numero)
        {
            if (entryIdSelected.Contains(numero))
                return "checked";
            return string.Empty;
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
                } else
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
                }


                if (SC_IsSingleApplic(InvAppRow["ApplicantType"] as string))
                {
                    //newCard["Pass_GrossIncomeSingle"] =
                    //    SC_IncomeTestEorGT((InvAppRow["HouseholdIncomeGrossPA"] as string), 80000);
                    //newCard["Pass_GrossIncomeJoint"] = true;
                    newCard["GrossIncomeSingle"] = DBNull.Value;
                    newCard["GrossIncomeJoint"] = DBNull.Value;
                }
                else
                {
                    newCard["GrossIncomeSingle"] = DBNull.Value;
                    if (SC_IncomeTestEorGT((InvAppRow["HouseholdIncomeGrossPA"] as string), 120000))
                    {                      
                        newCard["GrossIncomeJoint"] = (char)AutoCondApprovalResult.Accepted;
                        acceptedScore++;
                    } else if ( SC_IncomeTestEorLT((InvAppRow["HouseholdIncomeGrossPA"] as string), 100000) )
                    {
                        newCard["GrossIncomeJoint"] = (char)AutoCondApprovalResult.Rejected;
                        rejectedScore++;
                    }
                    //change from prev $100k Bob 20161004
                }

                if (SC_EmplFullTimeStatTest(InvAppRow["CurrOccupType"] as string))
                {
                    newCard["Primary_EmplStat"] = (char)AutoCondApprovalResult.Accepted;
                    acceptedScore++;
                    
                } else if (SC_EmplPartTimeStatTest(InvAppRow["CurrOccupType"] as string))
                {
                    newCard["Primary_EmplStat"] = (char)AutoCondApprovalResult.Rejected;
                    rejectedScore++;
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