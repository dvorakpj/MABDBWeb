﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using Microsoft.SqlServer.Server;

namespace MABDBWeb
{
    public partial class Investor_Applicants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        

        protected void btnImport_Click(object sender, EventArgs e)
        {
            //Upload and save the file
            string csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            lblUploadError.Text = String.Empty;
            lblUploadError.Visible = false;

            //IDs already in database. Start with empty list
            List<int> existIDs = new List<int>();
            List<int> duplIds = new List<int>();

            try
            {
                FileUpload1.SaveAs(csvPath);
            } catch (HttpException he)
            {
                lblUploadError.Visible = true;
                lblUploadError.Text = "Connection error while uploading, please try again in a moment.";
                return;
            }

            //load the current IDs to prevent duplicates
            try
            {
                existIDs = ReadExistingIDs();
            }
            catch (InvalidOperationException ioe)
            {
                lblUploadError.Visible = true;
                lblUploadError.Text = String.Concat(
                    "Cannot access database of exising applications, aborting import.\n", ioe.Message);
            }

                  
            if (!File.Exists(csvPath))
            {
                lblUploadError.Text =  String.Concat("File was not received on the server into ", csvPath, ". Try again or contact the administrator.");
            }

            
            // definition of DataTable to read the CSV into
            DataTable dt = new DataTable();
            //dt.Columns.AddRange(

            DataColumn[] impCols;
            
            impCols = new DataColumn[51];

            impCols[0] = new DataColumn("ApplicantType", typeof(string));
            impCols[1] = new DataColumn("Primary_FirstName", typeof(string));
            impCols[2] = new DataColumn("Primary_OtherNames",typeof(string));
            impCols[3] = new DataColumn("Primary_LastName",typeof(string));
            impCols[4] = new DataColumn("Other_FirstName", typeof(string));
            impCols[5] = new DataColumn("Other_OtherNames", typeof(string));
            impCols[6] = new DataColumn("Other_LastName", typeof(string));
            impCols[7] = new DataColumn("Primary_DOB",typeof(DateTime));
            impCols[8] = new DataColumn("Other_DOB", typeof(DateTime));
            impCols[9] = new DataColumn("Primary_Gender", typeof(string));
            impCols[10] = new DataColumn("Other_Gender", typeof(string));            
            impCols[11] = new DataColumn("Primary_AUCitizenStat",typeof(string));
            impCols[12] = new DataColumn("Primary_Dependants",typeof(string));            
            impCols[13] = new DataColumn("Other_AUCitizenStat", typeof(string));
            impCols[14] = new DataColumn("Other_Dependants", typeof(string));
            impCols[15] = new DataColumn("Email", typeof(string));
            impCols[16] = new DataColumn("Mobile", typeof(string));
            impCols[17] = new DataColumn("Res_Street1", typeof(string));
            impCols[18] = new DataColumn("Res_Street2", typeof(string));
            impCols[19] = new DataColumn("Res_City", typeof(string));            
            impCols[20] = new DataColumn("Res_State", typeof(string));
            impCols[21] = new DataColumn("Res_PostCode", typeof(string));
            impCols[22] = new DataColumn("Res_Country", typeof(string));
            impCols[23] = new DataColumn("YrsCurrAddr", typeof(string));
            impCols[24] = new DataColumn("CurrResidStatus", typeof(string));
            impCols[25] = new DataColumn("YrsPrevAddr", typeof(string));
            impCols[26] = new DataColumn("PrevResStatus", typeof(string));
            impCols[27] = new DataColumn("CurrOccupType", typeof(string));
            impCols[28] = new DataColumn("CurrEmploymentStatus", typeof(string));
            impCols[29] = new DataColumn("YrsCurrEmployer", typeof(string));
            impCols[30] = new DataColumn("YrsPrevEmployer", typeof(string));
            impCols[31] = new DataColumn("IsSmoker", typeof(string));
            impCols[32] = new DataColumn("HasPrivateHealthIns", typeof(string));
            impCols[33] = new DataColumn("Primary_IncomeMoAT", typeof(string));
            impCols[34] = new DataColumn("Other_IncomeMoAT", typeof(string));
            impCols[35] = new DataColumn("HouseholdIncomeGrossPA", typeof(string));
            impCols[36] = new DataColumn("LookingLocation", typeof(string));
            impCols[37] = new DataColumn("FoundLocation", typeof(string));
            impCols[39] = new DataColumn("Property_Street1", typeof(string));
            impCols[40] = new DataColumn("Property_Street2", typeof(string));
            impCols[41] = new DataColumn("Property_City", typeof(string));
            impCols[42] = new DataColumn("Property_State", typeof(string));
            impCols[43] = new DataColumn("Property_PostCode", typeof(string));            
            impCols[44] = new DataColumn("Property_Vendor", typeof(string));
            impCols[45] = new DataColumn("Property_Country", typeof(string));
            impCols[46] = new DataColumn("Property_AgentDetails", typeof(string));
            impCols[47] = new DataColumn("HasAgreedPrivacy", typeof(string));            
            impCols[48] = new DataColumn("EstSpend", typeof(string));
            impCols[49] = new DataColumn("Id", typeof(string));
            impCols[50] = new DataColumn("EntryDate", typeof(string));

            dt.Columns.AddRange(impCols);

            string csvData = File.ReadAllText(csvPath);
            int rowCnt = 0;
            int colsCnt = dt.Columns.Count;
            bool duplIDFound = false;
            bool skipHeaderRow = true;

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
                    foreach (string cell in row.Split(','))
                    {
                        string currentColumnName = dt.Columns[col].ColumnName;

                        //initialisation of skipped columns
                        if (
                            ("Primary_OtherNames" == currentColumnName) ||
                            ("Other_OtherNames" == currentColumnName) ||
                            ("Other_AUCitizenStat" == currentColumnName) ||
                            ("Other_Dependants" == currentColumnName)
                            )
                        {
                            newRow[col] = null;
                            col++;
                            continue;
                        }
                        
                        
                        // do only columns that are defined
                        if (col > colsCnt)
                        {
                            break;
                        }
                        //remove string delimiter "
                        string value = cell.Trim('"');

                        if ("Id" == currentColumnName)
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

                            //excptional formatting - Dates
                            if (("Primary_DOB" == currentColumnName) || ("Other_DOB" == currentColumnName) ||
                                ("EntryDate" == currentColumnName))
                            {
                                newRow[col] = ParseToDate(value);
                            }
                            else
                            {
                                newRow[col] = DBNull.Value;
                            }
                        }

                        // Byte values
                        else if (("Primary_Dependants" == currentColumnName) || ("Other_Dependants" == currentColumnName)
                                 || ("YrsPrevAddr" == currentColumnName)
                                 || ("YrsPrevAddr" == currentColumnName)
                                 || ("YrsPrevAddr" == currentColumnName))
                        {
                            byte? dbVal = ParseToTinyInt(value);
                            if (dbVal.HasValue)
                            {
                                newRow[col] = dbVal.Value;
                            }
                            //newRow[col] = dbVal.HasValue ? dbVal.Value : DBNull.Value;

                        }
                        // integer values
                        else if (("Res_PostCodes" == currentColumnName) ||
                                 ("Property_Postcode" == currentColumnName))
                        {
                            short? dbVal = ParseToSmallInt(value);
                            if (dbVal.HasValue)
                            {
                                newRow[col] = dbVal.Value;
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
                    
                }
               
            }

            string consString = ConfigurationManager.ConnectionStrings["MABDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "[dbo].[InvestorApplications]";
                    con.Open();
                    sqlBulkCopy.WriteToServer(dt);
                    con.Close();
                }
            }

            lblImportRes.Text = String.Concat("Sucessfully imported ", rowCnt.ToString(), " new applications.");
            lblImportResLabel.Visible = true;
            lblImportRes.Visible = true;

        }

        private List<int> ReadExistingIDs()
        {
            List<int> existIDs = new List<int>();
            

           
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
            DataTable dt;
            int i;
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
    }
}