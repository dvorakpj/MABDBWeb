﻿using DataUtils;
using DataUtils.InvestorDSTableAdapters;
using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.Web.UI.WebControls;

namespace MABDBWeb
{
    public partial class InvestorApplicationDetails : System.Web.UI.Page
    {
        /// <summary>
        /// Was the applicant already conditionally approved
        /// </summary>
        public bool? IsCondApproved
        {
            get;
            set;
        }

        public bool IsAutoApproved
        {
            get;
            set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = Request.QueryString["Id"];
            if (!String.IsNullOrEmpty(Id))
            {
                HiddenField1.Value = Id;
            }

            this.txtValidationErrors.Visible = false;
            this.lblValidationErrorsTxtBoxLabel.Visible = false;
            this.txtValidationErrors.Text = String.Empty;

            //DateTime condApproved =
            string hasAssqPpty = Request.QueryString["HiddenField2"];
            if (!String.IsNullOrWhiteSpace(hasAssqPpty))
            {
                HiddenField2.Value = hasAssqPpty;
            }

        }
        protected void ButtonCondApprovedModal_Click(object sender, EventArgs e)
        {
            int id = 0;
            //throw new ApplicationException("Test.");
            // check if the status is autaccepted
            // extract the record from DB

            if (String.IsNullOrEmpty(this.HiddenField1.Value))
            {
                return;
            }
            else if (!Int32.TryParse(this.HiddenField1.Value, out id))
            {
                return;
            }
            //InvestorApplicationDS investor = new InvestorApplicationDS();

            DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter();

            //DataUtils.InvestorApplicationTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorApplicationTableAdapters.InvestorApplicationsTableAdapter();

            DataUtils.InvestorDS.InvestorApplicationsDataTable dt = new InvestorDS.InvestorApplicationsDataTable();
            dt = dta.GetDataById(id);

            if (dt.Rows.Count != 1)
            {
                throw new ArgumentException(String.Concat("InvestorApplication with Id ", id, " could not be found."), "InvestorApplication.Id");
            }

            DataUtils.InvestorDS.InvestorApplicationsRow currentRow = dt.Rows[0] as InvestorDS.InvestorApplicationsRow;
            if (null != currentRow)
            {
                currentRow.CondCreditDecisionDate = DateTime.Now;
                currentRow.CondCreditDecisionBy = "pdvorak";
                currentRow.CondCreditDecision = ((char)CondCreditDecisionResult.Accepted).ToString();
                dta.Update(currentRow);
            }



            Response.Redirect("~/InvestorApplicantsNewAll.aspx");
        }



        protected void ButtonAppAckLetter_Click(object sender, EventArgs e)
        {
            int id = 0;
            //throw new ApplicationException("Test.");
            // check if the status is autaccepted
            // extract the record from DB

            if (String.IsNullOrEmpty(this.HiddenField1.Value))
            {
                return;
            }
            else if (!Int32.TryParse(this.HiddenField1.Value, out id))
            {
                return;
            }
            //InvestorApplicationDS investor = new InvestorApplicationDS();

            DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter();

            //DataUtils.InvestorApplicationTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorApplicationTableAdapters.InvestorApplicationsTableAdapter();

            DataUtils.InvestorDS.InvestorApplicationsDataTable dt = new InvestorDS.InvestorApplicationsDataTable();
            dt = dta.GetDataById(id);

            if (dt.Rows.Count != 1)
            {
                throw new ArgumentException(String.Concat("InvestorApplication with Id ", id, " could not be found."), "InvestorApplication.Id");
            }

            DataUtils.InvestorDS.InvestorApplicationsRow currentRow = dt.Rows[0] as InvestorDS.InvestorApplicationsRow;
            if (null != currentRow)
            {
                currentRow.CondCreditDecisionDate = DateTime.Now;
                currentRow.CondCreditDecisionBy = "pdvorak";
                currentRow.CondCreditDecision = ((char)CondCreditDecisionResult.Accepted).ToString();
                dta.Update(currentRow);
            }



            Response.Redirect("~/InvestorApplicantsNewAll.aspx");
        }



        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            DetailsView dv = this.DetailsView1;

            System.Data.DataRowView drv = dv.DataItem as System.Data.DataRowView;
            if (null != drv)
            {
                System.Data.DataRow dr = drv.Row;
                string Id = dr["Id"] as string;
                int intId = -1;
                if (Int32.TryParse(Id, out intId))
                {
                    this.HiddenField1.Value = intId.ToString();
                }

                string prop = dr["Property_Street1"] as string;
                if (!String.IsNullOrWhiteSpace(prop))
                {
                    HiddenField2.Value = prop.Trim();
                }

                bool? isCondApproved = null;
                string condStatus = String.Empty;

                object CondApproved = dr["CondCreditDecision"];
                if (null != CondApproved)
                {
                    string condApprovedStr = CondApproved as string;
                    if (!String.IsNullOrEmpty(condApprovedStr))
                    {
                        char condApprovedSt = condApprovedStr[0];

                        //if (Char.TryParse(condApprovedStr, out isCondApproved))
                        //{
                        if (((char)CondCreditDecisionResult.Accepted) == condApprovedSt)
                        {
                            isCondApproved = true;
                            condStatus = "Approved";

                        }
                        else if (((char)CondCreditDecisionResult.AcceptedLowerPrtyValLimit) == condApprovedSt)
                        {
                            isCondApproved = true;
                            condStatus = "Approved for Lower Limit";
                        }
                        else if (((char)CondCreditDecisionResult.Rejected) == condApprovedSt)
                        {
                            isCondApproved = false;
                            condStatus = "Rejected";
                        }
                    }
                }


                if (isCondApproved.HasValue)
                {
                    lblCondApproved.Visible = true;
                    this.lblCondApproved.Text = condStatus;
                    lblCondApproved.BackColor = isCondApproved.Value ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                    IsCondApproved = isCondApproved;
                }
                else
                {
                    this.lblCondApproved.Text = String.Empty;
                    lblCondApproved.Visible = false;
                    lblCondApproved.BackColor = System.Drawing.Color.White;
                    IsCondApproved = null;
                }
            } else
            {
                txtValidationErrors.Text = "Could not load Investor Application Id:" + Request.QueryString["Id"];
                txtValidationErrors.Visible = true;
                return;
            }                                                                                     
        }

        protected void btnCreditFeeReceived_Click(object sender, EventArgs e)
        {
            // log credit fee received
            // create 
            // investor
            // property

            bool IsOtherApplicantPresent = false;

            StringBuilder validationErrorSB = new StringBuilder();




            int invAppId = -1;
            if (String.IsNullOrEmpty(this.HiddenField1.Value))
            {
                return;
            }
            else if (!Int32.TryParse(this.HiddenField1.Value, out invAppId))
            {
                return;
            }


            InvestorDS ds = new InvestorDS();
            InvestorDS.InvestorApplicationsDataTable invAppDT = ds.InvestorApplications;
            InvestorDS.InvestorDataTable invDT = ds.Investor;
            InvestorDS.PropertyDataTable prptyDT = ds.Property;


            InvestorApplicationsTableAdapter invAppTA = new DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter();
            
            try
            {
                 invAppTA.FillById(invAppDT, invAppId) ;
                    //GetDataById(invAppId);
            }
            catch (System.Data.ConstraintException constrExc)
            {
                System.Data.DataRow[] rowsErr = invAppDT.GetErrors();
                for (int i = 0; i < rowsErr.Length; i++)
                    if (rowsErr[i].HasErrors)
                    {
                        string err = rowsErr[i].RowError;
                        if (!String.IsNullOrWhiteSpace(err))
                        {
                            validationErrorSB.AppendLine(err);
                            return;
                        }
                    }
            }


            if (invAppDT.Rows.Count != 1)
            {
                throw new ArgumentException(String.Concat("InvestorApplication with Id ", invAppId, " could not be found."), "InvestorApplication.Id");
            }
          
            DataUtils.InvestorDS.InvestorApplicationsRow currentInvAppRow = invAppDT.Rows[0] as InvestorDS.InvestorApplicationsRow;
            
            InvestorDS.InvestorRow invRow = invDT.NewInvestorRow();
            InvestorDS.InvestorRow othinvRow = null;

            InvestorDS.PropertyRow prptyNewR = prptyDT.NewPropertyRow();

            InvestorTableAdapter invTA = new InvestorTableAdapter();
            PropertyTableAdapter prtyTA = new PropertyTableAdapter();


            TableAdapterManager tam = new TableAdapterManager();
            //tam.InvestorApplicationsTableAdapter = ;
            tam.PropertyTableAdapter = prtyTA;
            tam.InvestorTableAdapter = invTA;

            tam.UpdateOrder = TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            

            //InvestorTableAdapter invTA = new InvestorTableAdapter();

            //if (currentInvAppRow.IsPrimary_FirstNameNull() || String.IsNullOrEmpty(currentInvAppRow.Primary_FirstName))
            //{
            //    validationErrorSB.AppendLine("Primary Applicant's First name is empty");
            //}

            invRow.InvestorApplicationId = currentInvAppRow.Id;
            if (!currentInvAppRow.IsOther_LastNameNull() && !String.IsNullOrWhiteSpace(currentInvAppRow.Other_LastName) )
            {
                IsOtherApplicantPresent = true;
            }

            #region PrimaryInvestor
            //invRow.Id = -1;

            if (currentInvAppRow.IsPrimary_FirstNameNull())
            {
                invRow.FirstName = null;
            }
            else
            {
                invRow.FirstName = currentInvAppRow.Primary_FirstName.Trim();
            }


            if (currentInvAppRow.IsPrimary_OtherNamesNull())
            {
                invRow.OtherNames = null;
            }
            else
            {
                invRow.OtherNames = currentInvAppRow.Primary_OtherNames.Trim();
            }

            if (currentInvAppRow.IsPrimary_LastNameNull() || String.IsNullOrEmpty(currentInvAppRow.Primary_LastName))
            {
                validationErrorSB.AppendLine("Primary Applicant's Last name is empty");
            }
            else
            {
                invRow.LastName = currentInvAppRow.Primary_LastName.Trim();
            }

            if (currentInvAppRow.IsPrimary_DOBNull() || currentInvAppRow.Primary_DOB < DateTime.Today.AddYears(-100))
            {
                validationErrorSB.AppendLine("Primary Applicant's DOB is empty or invalid");
            }
            else
            {
                invRow.DOB = currentInvAppRow.Primary_DOB;
            }


            if (currentInvAppRow.IsPrimary_LastNameNull())
            {
                validationErrorSB.AppendLine("Primary Applicant's Last Name is empty or invalid");
            } else
            {
                invRow.LastName = currentInvAppRow.Primary_LastName.Trim();
            }

            if (currentInvAppRow.IsEmailNull() || String.IsNullOrWhiteSpace(currentInvAppRow.Email))
            {
                validationErrorSB.AppendLine("Primary Applicant's Email address is empty or invalid");
            }
            else
            {
                invRow.Email = currentInvAppRow.Email;
            }


            currentInvAppRow.Other_Email = null;

            //invRow.Gender = 
            if (String.IsNullOrWhiteSpace(currentInvAppRow.Primary_Gender))
            {
                validationErrorSB.AppendLine("");
            } else
            {
                string gender = currentInvAppRow.Primary_Gender.Trim();

                if (gender.StartsWith("m", StringComparison.InvariantCultureIgnoreCase))
                {
                    invRow.Gender = 'M';
                } else if (gender.StartsWith("f", StringComparison.InvariantCultureIgnoreCase))
                {
                    invRow.Gender = 'F';
                } else
                {
                    invRow.Gender = 'O';
                }
            }


            if (  currentInvAppRow.IsPrimary_Res_Street1Null() || String.IsNullOrWhiteSpace(currentInvAppRow.Primary_Res_Street1) )
            {
                validationErrorSB.AppendLine("Primary Applicant's Street address is empty or invalid");
            } else
            {
                string unitKeyword = "unit";
                string street1 = currentInvAppRow.Primary_Res_Street1;
                int unitKeywdIndex = new CultureInfo("EN-AU").CompareInfo.IndexOf(street1, unitKeyword, CompareOptions.IgnoreCase);
                if (unitKeywdIndex > 0)
                {
                    string unitNo = street1.Substring(unitKeywdIndex + unitKeyword.Length).TrimStart();
                    int endOfUnitNo = unitNo.Length - unitNo.IndexOf(" ", StringComparison.InvariantCultureIgnoreCase);
                    unitNo = unitNo.Substring(0, endOfUnitNo);
                    if (!String.IsNullOrWhiteSpace(unitNo))
                    {
                        invRow.Res_UnitNum = unitNo;
                        invRow.Res_Street1 = street1.Substring(unitKeywdIndex + endOfUnitNo);
                    }  else
                    {
                        invRow.Res_Street1 = street1;
                    }
                }  else
                {
                    invRow.Res_Street1 = currentInvAppRow.Primary_Res_Street1.Trim();
                }
            }

            if (String.IsNullOrWhiteSpace(currentInvAppRow.Primary_Res_Street2))
            {
                invRow.Res_Street2 = null;
            } else
            {
                invRow.Res_Street2 = currentInvAppRow.Primary_Res_Street2.Trim();
            }

            if (currentInvAppRow.IsPrimary_Res_PostCodeNull())
            {
                invRow.Res_Postcode = -1;
            }
            else
            {
                invRow.Res_Postcode = currentInvAppRow.Primary_Res_PostCode;
            }

            //  invRow.Res_Suburb = currentInvAppRow.Primary_Res

            if (currentInvAppRow.IsPrimary_Res_SuburbNull())
            {
                validationErrorSB.AppendLine("Primary current residence Suburb cannot be empty.");
                //invRow.Res_Suburb = null;
            } else
            {
                invRow.Res_Suburb = currentInvAppRow.Primary_Res_Suburb.Trim();
            }

            invRow.Res_City = null;

            if (currentInvAppRow.IsPrimary_Res_StateNull())
            {
                invRow.Res_State = null;
            } else
            {
                invRow.Res_State = currentInvAppRow.Primary_Res_State;
            }

            if (String.IsNullOrWhiteSpace(currentInvAppRow.Primary_Res_Country))
            {
                invRow.Res_Country = "Australia";

            } else
            {
                invRow.Res_Country = currentInvAppRow.Primary_Res_Country;
            }

            invRow.Res_Street3 = null;
            invRow.Res_Street4 = null;
            invRow.Res_Street5 = null;

            if (String.IsNullOrWhiteSpace(currentInvAppRow.Mobile))
            {
                invRow.PhoneMobile = null;
             } else
            {
                invRow.PhoneMobile = currentInvAppRow.Mobile.Trim();
            }


            if (currentInvAppRow.IsPrimary_HomePhoneNull())
            {
                invRow.PhoneHome = null;
            } else
            {
                invRow.PhoneHome = currentInvAppRow.Primary_HomePhone.Trim();
            }

            invRow.PhoneWork = null;
            invRow.PhoneOther = null;

            invRow.Bill_Street1 = null;
            invRow.Bill_Street2 = null;
            invRow.Bill_Street3 = null;
            invRow.Bill_Street4 = null;
            invRow.Bill_Street5 = null;

            invRow.AssquireStatus = "New";
            invRow.AppliedDate = currentInvAppRow.EntryDate;
            invRow.Created = DateTime.Now;
            invRow.CreatedBy = "pdvorak";

            invDT.AddInvestorRow(invRow);

            #endregion PrimaryInvestor

            #region PrimaryInvestorProperty

            // We will create property only if the details are provided and it must be confirmed
            bool hasProperty = this.chckPrptyValFeePaid.Checked;

            if (hasProperty)
            {
                //                InvestorDS.PropertyDataTable prptyDT = new InvestorDS.PropertyDataTable();               

                prptyNewR.InvestorRow = invRow;
                prptyNewR.InvestorApplicationsRow = currentInvAppRow;

                prptyNewR.Street1 = currentInvAppRow.Property_Street1;

                prptyNewR.Street2 = currentInvAppRow.Property_Street2;
           
                prptyNewR.Suburb = currentInvAppRow.Property_Suburb;

                if (currentInvAppRow.IsProperty_PostCodeNull())
                {
                    prptyNewR.Postcode = -1;
                }
                else
                {
                    prptyNewR.Postcode = currentInvAppRow.Property_PostCode;
                }

                prptyNewR.State = currentInvAppRow.Property_State;

                prptyNewR.Country = currentInvAppRow.Property_Country;

                //prptyNewR.PrimaryInvestorId = invRow.Id;
               // prptyNewR.InvestorApplicationId = currentInvAppRow.Id;

                //prptyNewR.

                prptyDT.AddPropertyRow(prptyNewR);

            }


            #endregion PrimaryInvestorProperty

            #region OtherApplicant
            if (IsOtherApplicantPresent)
            {

                othinvRow = invDT.NewInvestorRow();


                othinvRow.PrimaryInvestorID = invRow.Id;
                //othinvRow.PrimaryInvestorID = invRow.Id;

                othinvRow.LastName = currentInvAppRow.Other_LastName;

                if (currentInvAppRow.IsOther_FirstNameNull())
                {
                    othinvRow = null;
                } else
                {
                    othinvRow.FirstName = currentInvAppRow.Other_FirstName;
                }

                if (currentInvAppRow.IsOther_OtherNamesNull())
                {
                    othinvRow.OtherNames = null;
                } else
                {
                    othinvRow.OtherNames = currentInvAppRow.Other_OtherNames.Trim();
                }


                if (currentInvAppRow.IsOther_DOBNull() || (currentInvAppRow.Other_DOB <= DateTime.Today.AddYears(-100) ) )
                {
                    validationErrorSB.AppendLine("Other Investor DOB cannot be null");
                } else
                {
                    othinvRow.DOB = currentInvAppRow.Other_DOB;
                }


                if (currentInvAppRow.IsOther_Res_Street1Null() || String.IsNullOrWhiteSpace(currentInvAppRow.Other_Res_Street1))
                {
                    validationErrorSB.AppendLine("Other Applicant's Street address is empty or invalid");
                }
                else
                {
                    string unitKeyword = "unit";
                    string street1 = currentInvAppRow.Other_Res_Street1;
                    int unitKeywdIndex = new CultureInfo("EN-AU").CompareInfo.IndexOf(street1, unitKeyword, CompareOptions.IgnoreCase);
                    if (unitKeywdIndex > 0)
                    {
                        string unitNo = street1.Substring(unitKeywdIndex + unitKeyword.Length).TrimStart();
                        int endOfUnitNo = unitNo.Length - unitNo.IndexOf(" ", StringComparison.InvariantCultureIgnoreCase);
                        unitNo = unitNo.Substring(0, endOfUnitNo);
                        if (!String.IsNullOrWhiteSpace(unitNo))
                        {
                            othinvRow.Res_UnitNum = unitNo;
                            othinvRow.Res_Street1 = street1.Substring(unitKeywdIndex + endOfUnitNo);
                        }
                        else
                        {
                            othinvRow.Res_Street1 = street1;
                        }
                    }
                    else
                    {
                        othinvRow.Res_Street1 = currentInvAppRow.Other_Res_Street1.Trim();
                    }
                }

                if (String.IsNullOrWhiteSpace(currentInvAppRow.Other_Res_Street2))
                {
                    othinvRow.Res_Street2 = null;
                }
                else
                {
                    othinvRow.Res_Street2 = currentInvAppRow.Other_Res_Street2.Trim();
                }

                if (currentInvAppRow.IsOther_Res_PostCodeNull())
                {
                    othinvRow.Res_Postcode = -1;
                }
                else
                {
                    othinvRow.Res_Postcode = currentInvAppRow.Other_Res_PostCode;
                }

                //  othinvRow.Res_Suburb = currentInvAppRow.Other_Res

                if (currentInvAppRow.IsOther_Res_SuburbNull())
                {
                    othinvRow.Res_Suburb = null;
                }
                else
                {
                    othinvRow.Res_Suburb = currentInvAppRow.Other_Res_Suburb.Trim();
                    
                }

                othinvRow.Res_City = null;

                if (currentInvAppRow.IsOther_Res_StateNull())
                {
                    othinvRow.Res_State = null;
                }
                else
                {
                    othinvRow.Res_State = currentInvAppRow.Other_Res_State;
                }

                if (String.IsNullOrWhiteSpace(currentInvAppRow.Other_Res_Country))
                {
                    othinvRow.Res_Country = "Australia";

                }
                else
                {
                    othinvRow.Res_Country = currentInvAppRow.Other_Res_Country;
                }

                othinvRow.Res_Street3 = null;
                othinvRow.Res_Street4 = null;
                othinvRow.Res_Street5 = null;

                if (String.IsNullOrWhiteSpace(currentInvAppRow.Mobile))
                {
                    othinvRow.PhoneMobile = null;
                }
                else
                {
                    othinvRow.PhoneMobile = currentInvAppRow.Mobile.Trim();
                }


                if (currentInvAppRow.IsPrimary_HomePhoneNull())
                {
                    othinvRow.PhoneHome = null;
                }
                else
                {
                    othinvRow.PhoneHome = currentInvAppRow.Other_HomePhone.Trim();
                }

                othinvRow.PhoneWork = null;
                othinvRow.PhoneOther = null;

                othinvRow.Bill_Street1 = null;
                othinvRow.Bill_Street2 = null;
                othinvRow.Bill_Street3 = null;
                othinvRow.Bill_Street4 = null;
                othinvRow.Bill_Street5 = null;

                othinvRow.InvestorApplicationId = currentInvAppRow.Id;

                othinvRow.AssquireStatus = "New";
                othinvRow.AppliedDate = currentInvAppRow.EntryDate;
                othinvRow.Created = DateTime.Now;
                othinvRow.CreatedBy = "pdvorak";

                invDT.AddInvestorRow(othinvRow);

            }
            #endregion OtherApplicant


            if (validationErrorSB.Length > 0)
            {
                this.lblValidationErrorsTxtBoxLabel.Visible = true;
                this.txtValidationErrors.Visible = true;
                this.txtValidationErrors.Text = validationErrorSB.ToString();
                return;
            }
            else
            {

                this.lblValidationErrorsTxtBoxLabel.Visible = false;
                this.txtValidationErrors.Visible  = false;
                this.txtValidationErrors.Text = validationErrorSB.ToString();

                                           
                try
                {

                    //invTA.Update(invRow);
                    //invTA.Update(othinvRow);
                    //prtyTA.Update(prptyNewR);

                    //Inserts
                    tam.UpdateAll(ds);

                    othinvRow.PrimaryInvestorID = invRow.Id;
                    prptyNewR.PrimaryInvestorId = invRow.Id;


                    //update relationships
                    tam.UpdateAll(ds);

                } catch (SqlException se)
                {
                    this.lblValidationErrorsTxtBoxLabel.Visible = true;
                    this.txtValidationErrors.Visible = true;
                    this.txtValidationErrors.Text = "Error adding new Investor(s): " + se.Message;
                }


                //if (null != currentInvAppRow)
                //{
                //currentRow.CondDecision = DateTime.Now;
                //currentRow.CondDecisionBy = "pdvorak";
                //currentRow.CondApproved = true;
                //invAppTA.Update(currentRow);
                //}

                Response.Redirect("~/InvestorApplicantsNewAll.aspx");

            }
        }

        /// <summary>
        /// Handler of button "Mark conditional Result as Sent"
        /// </summary>
        /// <param name="sender">originating control</param>
        /// <param name="e">event params</param>
        protected void ButtonCondResultSentModal_Click(object sender, EventArgs e)
        {
            int id = 0;
            //throw new ApplicationException("Test.");
            // check if the status is autaccepted
            // extract the record from DB

            if (String.IsNullOrEmpty(this.HiddenField1.Value))
            {
                return;
            }
            else if (!Int32.TryParse(this.HiddenField1.Value, out id))
            {
                return;
            }
            //InvestorApplicationDS investor = new InvestorApplicationDS();

            DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter();

            //DataUtils.InvestorApplicationTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorApplicationTableAdapters.InvestorApplicationsTableAdapter();

            DataUtils.InvestorDS.InvestorApplicationsDataTable dt = new InvestorDS.InvestorApplicationsDataTable();
            dt = dta.GetDataById(id);

            if (dt.Rows.Count != 1)
            {
                throw new ArgumentException(String.Concat("InvestorApplication with Id ", id, " could not be found."), "InvestorApplication.Id");
            }

            DataUtils.InvestorDS.InvestorApplicationsRow currentRow = dt.Rows[0] as InvestorDS.InvestorApplicationsRow;


            if (null != currentRow)
            {
                bool? condApproved = false;

                try
                {
                    condApproved =  (("A" == currentRow.CondCreditDecision) || ("L" == currentRow.CondCreditDecision))  ;
                    if (condApproved.HasValue)
                    {
                        if (condApproved.Value)
                        {
                            //currentRow.AutoAcceptedInformed = DateTime.Now;
                            //currentRow.AutoAcceptedInformedBy = "pdvorak";
                        }
                        else
                        {
                            //currentRow.AutoRejectedInformed = DateTime.Now;
                            //currentRow.AutoRejectedInformedBy = "pdvorak";
                        }
                    }
                    else
                    {
                        //error this app has to be approved first 
                    }
                }
                catch
                {
                    //error this app has to be approved first 
                }
            }

            Response.Redirect("~/InvestorApplicantsNewAll.aspx");
        }


        protected void ButtonAppAckLetterSentModal_Click(object sender, EventArgs e)
        {
            int id = 0;
           

            // read current InvAppId
            if (String.IsNullOrEmpty(this.HiddenField1.Value))
            {
                return;
            }
            else if (!Int32.TryParse(this.HiddenField1.Value, out id))
            {
                return;
            }
            

            //get inv app row form DB for update
            DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter dta = new DataUtils.InvestorDSTableAdapters.InvestorApplicationsTableAdapter();           
            DataUtils.InvestorDS.InvestorApplicationsDataTable dt = new InvestorDS.InvestorApplicationsDataTable();
            dt = dta.GetDataById(id);

            if (dt.Rows.Count != 1)
            {
                throw new ArgumentException(String.Concat("InvestorApplication with Id ", id, " could not be found."), "InvestorApplication.Id");
            }

            DataUtils.InvestorDS.InvestorApplicationsRow currentRow = dt.Rows[0] as InvestorDS.InvestorApplicationsRow;


            if (null != currentRow)
            {
                //bool condApproved = false;

                try
                {
                    //condApproved = (("A" == currentRow.CondCreditDecision) || ("L" == currentRow.CondCreditDecision));
                    if (!String.IsNullOrEmpty(currentRow.CondCreditDecision))
                    {
                        this.txtValidationErrors.Text = "Cannot send a letter of acknowledgement to already conditionally decisioned application.";
                        //currentRow.AutoAcceptedInformed = DateTime.Now;
                        //currentRow.AutoAcceptedInformedBy = "pdvorak";
                        //currentRow.AutoRejectedInformed = DateTime.Now;
                        //currentRow.AutoRejectedInformedBy = "pdvorak";
                        this.DetailsView1.DataBind();
                        return;
                    } else
                    {
                        currentRow.AppAckLetterSent = DateTime.Now;
                        currentRow.AppAckLetterSentBy = "pdvorak";
                        currentRow.Modified = currentRow.AppAckLetterSent;
                        currentRow.ModifiedBy = currentRow.AppAckLetterSentBy;
                        dta.Update(currentRow);
                    }
                    
                }
                catch
                {
                    this.txtValidationErrors.Text = "Error saving update";
                    this.DetailsView1.DataBind();
                    return;
                    //error this app has to be approved first 
                }
            }

            Response.Redirect("~/InvestorApplicantsNewAll.aspx");
            return;
        }

        protected void btnCreditFeeReceived_Click1(object sender, EventArgs e)
        {

        }
    }
}