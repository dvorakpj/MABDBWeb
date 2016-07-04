using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

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


            try
            {
                FileUpload1.SaveAs(csvPath);
            } catch (HttpException he)
            {
                lblUploadError.Visible = true;
                lblUploadError.Text = "Connection error while uploading, please try again in a moment.";
                return;
            }

            if(!File.Exists(csvPath))
            {
                lblUploadError.Text = "File was not received. Try again or contact the administrator.";
            }

            
            DataTable dt = new DataTable();
            //dt.Columns.AddRange(

            DataColumn[] impCols;
            
            impCols = new DataColumn[34];

            impCols[0] = new DataColumn("EntryDate", typeof(string));
            impCols[1] = new DataColumn("ApplicantType", typeof(string));
            impCols[2] = new DataColumn("Primary_FirstName", typeof(string));
            impCols[3] = new DataColumn("Primary_OtherNames",typeof(string));
            impCols[4] = new DataColumn("Primary_LastName",typeof(string));
            impCols[5] = new DataColumn("Primary_DOB",typeof(DateTime));
            impCols[6] = new DataColumn("Primary_AUCitizenStat",typeof(string));
            impCols[7] = new DataColumn("Primary_Dependants",typeof(string));
            impCols[8] = new DataColumn("Other_FirstName",typeof(string));
            impCols[9] = new DataColumn("Other_OtherNames",typeof(string));
            impCols[10] = new DataColumn("Other_LastName",typeof(string));
            impCols[11] = new DataColumn("Other_DOB",typeof(DateTime));
            impCols[12] = new DataColumn("Other_Gender", typeof(string));
            impCols[13] = new DataColumn("Other_AUCitizenStat", typeof(string));
            impCols[14] = new DataColumn("Other_Dependants", typeof(string));
            impCols[15] = new DataColumn("Email", typeof(string));
            impCols[16] = new DataColumn("Mobile", typeof(string));
            impCols[17] = new DataColumn("Res_Street1", typeof(string));
            impCols[18] = new DataColumn("Res_Street2", typeof(string));
            impCols[19] = new DataColumn("Res_City", typeof(string));
            impCols[20] = new DataColumn("Res_PostCode", typeof(string));
            impCols[21] = new DataColumn("Res_State", typeof(string));
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

            dt.Columns.AddRange(impCols);

            string csvData = File.ReadAllText(csvPath);
            int rowCnt = 0;
            int colsCnt = dt.Columns.Count;

            foreach (string row in csvData.Split('\n'))
            {
                if (0 == rowCnt)
                {
                    rowCnt++;
                    continue;
                }

                if (!string.IsNullOrEmpty(row))
                {
                    DataRow newRow = dt.Rows.Add();
                    int i = 0;
                    foreach (string cell in row.Split(','))
                    {
                        // do only columns that are defined
                        if (i >= colsCnt)
                        {
                            break;
                        }
                        //remove string delimiter "
                        string value = cell.Trim('"');     
                        
                        //excptional formatting - Dates
                        if (("Primary_DOB" == dt.Columns[i].ColumnName) || ("Other_DOB" == dt.Columns[i].ColumnName) || ("EntryDate" == dt.Columns[i].ColumnName))
                        {
                            try
                            {
                                DateTime dob = new DateTime();
                                if (DateTime.TryParse(value, out dob))
                                {
                                    dt.Rows[dt.Rows.Count - 1][i] = dob;
                                }
                            }
                            catch
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = null;
                            }                            
                        }
                        // Byte values
                        else if (("Primary_Dependants" == dt.Columns[i].ColumnName) || ("Other_Dependants" == dt.Columns[i].ColumnName)
                            || ("YrsPrevAddr" == dt.Columns[i].ColumnName)
                            || ("YrsPrevAddr" == dt.Columns[i].ColumnName)
                            || ("YrsPrevAddr" == dt.Columns[i].ColumnName))
                        {
                            byte tinyInt;
                            if (byte.TryParse(cell, out tinyInt))
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = tinyInt;
                            }
                            else
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = null;
                            }
                        }
                        // integer values
                        else if (("Res_PostCodes" == dt.Columns[i].ColumnName) ||
                                 ("Property_Postcode" == dt.Columns[i].ColumnName))
                        {
                            Int16 smallInt;
                            if (Int16.TryParse(cell, out smallInt))
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = smallInt;
                            }
                            else
                            {
                                dt.Rows[dt.Rows.Count - 1][i] = null;
                            }
                        }
                        // default parsing                        
                        else
                        {
                            dt.Rows[dt.Rows.Count - 1][i] = value;
                        }
                        i++;
                    }
                }
                rowCnt++;
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
        }
    }
}