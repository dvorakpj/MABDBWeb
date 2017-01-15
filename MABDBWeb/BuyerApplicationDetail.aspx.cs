using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MABDBWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //object o = this.DetailsView1.DataSourceObject;
            //ObjectDataSource bata = this.BuyerApplicationDSDataSource1;// as DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter;            
        }

        protected void Page_Init(object sender, EventArgs e)
        {
           

            ObjectDataSource bata = this.BuyerApplicationDSDataSource1;// as DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter;            
            bata.ObjectCreated += OnObjectDataSourceObjectCreated;
            DetailsView1.DataBound += DetailsView1_DataBound1;

            //bata.DataBinding += DataSource1Binding;
        }

        private void DetailsView1_DataBound1(object sender, EventArgs e)
        {
            DetailsView o = this.DetailsView1;
            System.Data.DataRowView drw = o.DataItem as System.Data.DataRowView;

            if (null != drw)
            {
                string condDecision = drw.Row["CondCreditDecision"] as String;
                string condDecisionDate = (drw.Row["CondCreditDecisionDate"] == null) ? String.Empty : (drw.Row["CondCreditDecisionDate"]).ToString();
                string condDecSent = (drw.Row["CondCreditDecisionInformed"] == null) ?  String.Empty : (drw.Row["CondCreditDecisionInformed"]).ToString() ;

                if ((!String.IsNullOrEmpty(condDecision)) || (!String.IsNullOrEmpty(condDecisionDate)))
                {
                    btnCondApprove.Enabled = false;
                    lblCondApproved.Visible = true;
                    lblCondDecLbl.Visible = true;
                    lblCondDecInformedLbl.Visible = true;

                    if ("C" == condDecision)
                    {
                        
                        lblCondApproved.Text = "Conditionally Approved";
                        lblCondApproved.BackColor = System.Drawing.Color.Green;
                    }
                    else if ("R" == condDecision)
                    {
                        lblCondApproved.Text = "Rejected";
                        lblCondApproved.BackColor = System.Drawing.Color.Red;
                    }

                    if (String.IsNullOrEmpty(condDecSent))
                    {
                        lblCondDecInformed.Text = "No";
                        lblCondDecInformed.BackColor = System.Drawing.Color.Red;
                        lblCondDecInformedLbl.Visible = true;
                        lblCondDecInformed.Visible = true;
                        btnCondResultSent.Enabled = true;
                    } else
                    {
                        lblCondDecInformed.Text = condDecSent;
                        lblCondDecInformed.BackColor = System.Drawing.Color.Green;
                        lblCondDecInformedLbl.Visible = true;
                        lblCondDecInformed.Visible = true;
                        btnCondResultSent.Enabled = false;
                    }

                } else
                {
                    lblCondApproved.Text = String.Empty;
                    lblCondApproved.Visible = false;
                    lblCondDecLbl.Visible = false;
                    lblCondDecInformed.Text = String.Empty;
                    lblCondDecInformed.Visible = false;
                    lblCondDecInformedLbl.Visible = false;
                    btnCondResultSent.Enabled = false;
                }

            }
        }

       protected void OnObjectDataSourceObjectCreated(object sender, ObjectDataSourceEventArgs e)
        {
            if (e.ObjectInstance != null)
            {
              DataUtils.DataUtil.SetConnectionStrFromConfig(e.ObjectInstance, "MABDBConnectionString");
            }
        }
       

        protected void ButtonCondResultSentModal_Click(object sender, EventArgs e)
        {

            int buyerAppIdi = 0;
            //throw new ApplicationException("Test.");
            // check if the status is autaccepted
            // extract the record from DB
            string buyerAppIds = Request.Params["Id"] as string;
            if (String.IsNullOrEmpty(buyerAppIds))
            {
                return;
            }
            else if (!Int32.TryParse(buyerAppIds, out buyerAppIdi))
            {
                return;
            }

            DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter bata = new DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter();
            DataUtils.DataUtil.SetConnectionStrFromConfig(bata, null);
            DataUtils.BuyerDS.BuyerApplicationsDataTable badt = null;

            try
            {
                badt = bata.GetDataBy(buyerAppIdi);
            }
            catch (Exception ex)
            {
                this.lblCondApproveError.Text = "Error loading MAB application Id:" + buyerAppIds + ex.Message + ex.StackTrace;
                this.lblCondApproveError.Visible = true;
                return;
            }

            if (badt.Rows.Count != 1)
            {
                this.lblCondApproveError.Text = "Unique buyer Application not found for Id:" + buyerAppIds;
                this.lblCondApproveError.Visible = true;
                return;
            }

            DataUtils.BuyerDS.BuyerApplicationsRow newBuyerApp = badt[0];
            newBuyerApp.CondCreditDecisionInformed = DateTime.Now;
            newBuyerApp.CondCreditDecisionInformedBy = "dvorakpj";
            
            try
            {
                int updates = bata.Update(badt);
                if (updates != 1)
                {
                    throw new ApplicationException("Failed to record notification of Conditional Decision for MAB App Id:" + buyerAppIds);
                }
            } catch (Exception ex)
            {
                this.lblCondApproveError.Text += "Error recording notification of Conditional Decision for MAB App Id:" + buyerAppIds + ex.Message + ex.StackTrace;
                this.lblCondApproveError.Visible = true;
                return;
            }

            Response.Redirect("~/BuyerApplicantsNewAll.aspx");

        }

        protected void ButtonCondApprovedModal_Click(object sender, EventArgs e)
        {
            //cleanup UI
            this.lblCondApproveError.Text = String.Empty;
            this.lblCondApproveError.Visible = false;

            int buyerAppIdi = 0;
            //throw new ApplicationException("Test.");
            // check if the status is autaccepted
            // extract the record from DB
            string buyerAppIds = Request.Params["Id"] as string;
            if (String.IsNullOrEmpty(buyerAppIds))           
            {
                return;
            }
            else if (!Int32.TryParse(buyerAppIds, out buyerAppIdi))
            {
                return;
            }
            //InvestorApplicationDS investor = new InvestorApplicationDS();

            DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter bata = new DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter();                                 
            DataUtils.BuyerDS.BuyerDataTable bdt = new DataUtils.BuyerDS.BuyerDataTable();
            DataUtils.DataUtil.SetConnectionStrFromConfig(bata, null);


            DataUtils.BuyerDSTableAdapters.BuyerTableAdapter bta = new DataUtils.BuyerDSTableAdapters.BuyerTableAdapter();
            DataUtils.DataUtil.SetConnectionStrFromConfig(bta, null);

            DataUtils.BuyerDS.BuyerApplicationsDataTable badt = null;

            try
            {
                badt = bata.GetDataBy(buyerAppIdi);
            } catch (Exception ex)
            {
                this.lblCondApproveError.Text = "Error loading MAB application Id:" + buyerAppIds + ex.Message + ex.StackTrace;
                this.lblCondApproveError.Visible = true;
                return;
            }

                      
            if (badt.Rows.Count != 1)
            {
                this.lblCondApproveError.Text = "Unique buyer Application not found for Id:" + buyerAppIds;
                this.lblCondApproveError.Visible = true;
                return;
            }

            DataUtils.BuyerDS.BuyerApplicationsRow newBuyerApp = badt[0];

            if (null != newBuyerApp)
            {

                //test of current status
                if ((!newBuyerApp.IsCondCreditDecisionNull()) || (!(newBuyerApp.IsCondCreditDecisionDateNull())))
                {
                    this.lblCondApproveError.Text = "This mAB Application has already been conditionally approved by:" + newBuyerApp.CondCreditDecisionBy + " on:" + newBuyerApp.CondCreditDecisionDate.ToString();
                    this.lblCondApproveError.Visible = true;
                    return;
                }
           
                DataUtils.BuyerDS.BuyerRow newBuyerPrim = bdt.NewBuyerRow();

                newBuyerPrim.LastName = newBuyerApp.Primary_LastName;
                newBuyerPrim.FirstName = newBuyerApp.Primary_FirstName;
                newBuyerPrim.DOB = newBuyerApp.Primary_DOB;
                newBuyerPrim.Res_Street1 = newBuyerApp.Primary_Res_Street1;
                newBuyerPrim.Res_Suburb= newBuyerApp.Primary_Res_Suburb;
                newBuyerPrim.Res_Postcode = newBuyerApp.Primary_Res_PostCode;
                newBuyerPrim.Res_State = newBuyerApp.Primary_Res_State;
                newBuyerPrim.Res_Country = newBuyerApp.Primary_Res_Country;
                newBuyerPrim.Gender = "M";

                newBuyerPrim.MAStatus = "C";
                newBuyerPrim.AppliedDate = newBuyerApp.EntryDate;
                newBuyerPrim.BuyerApplicationId = newBuyerApp.Id;
                newBuyerPrim.Created = DateTime.Now;
                newBuyerPrim.CreatedBy = "dvorakpj";

                bdt.AddBuyerRow(newBuyerPrim);

                try
                {
                    int updates = bta.Update(bdt);
                    if (updates != 1)
                    {
                        throw new ApplicationException("Failed to insert Permanent Primary MAB record for MAB App Id:" + buyerAppIds + ";" + "expected 1 row insterted actually:" + updates);
                    }
                }
                catch (Exception ex)
                {
                    this.lblCondApproveError.Text += "Error creating a permanent Primary Buyer record for Application:" + buyerAppIds + ex.Message + ex.StackTrace;
                    this.lblCondApproveError.Visible = true;
                    return;
                }

                // process Other applicant as well
                if ((newBuyerApp.ApplicantType != "Single") && (!newBuyerApp.IsOther_LastNameNull()))
                {
                    DataUtils.BuyerDS.BuyerRow newBuyerOth = bdt.NewBuyerRow();

                    newBuyerOth.PrimaryBuyerId = newBuyerPrim.Id;

                    newBuyerOth.LastName = newBuyerApp.Other_LastName;
                    newBuyerOth.FirstName = newBuyerApp.Other_FirstName;
                    newBuyerOth.DOB = newBuyerApp.Other_DOB;
                    newBuyerOth.Gender = "M";
                    newBuyerOth.Res_Street1 = newBuyerApp.Other_Res_Street1;
                    newBuyerOth.Res_Suburb = newBuyerApp.Other_Res_Suburb;
                    newBuyerOth.Res_Postcode = newBuyerApp.Other_Res_PostCode;
                    newBuyerOth.Res_State = newBuyerApp.Other_Res_State;
                    newBuyerOth.Res_Country = newBuyerApp.Other_Res_Country;

                    newBuyerOth.MAStatus = "C";
                    newBuyerOth.AppliedDate = newBuyerApp.EntryDate;
                    newBuyerOth.BuyerApplicationId = newBuyerPrim.BuyerApplicationId;
                    newBuyerOth.CreatedBy = newBuyerPrim.CreatedBy;
                    newBuyerOth.Created = DateTime.Now;                    

                    bdt.AddBuyerRow(newBuyerOth);

                    try
                    {
                        int updates2 = bta.Update(bdt);
                        if (updates2 != 1)
                        {
                            throw new ApplicationException("Failed to insert Permanent Other MAB record for MAB App Id:" + buyerAppIds + ";" + "expected 1 row insterted actually:" + updates2);
                        }
                    }                     
                    catch (Exception ex)
                    {
                        this.lblCondApproveError.Text += "Error creating a permanent Other Buyer record for Application:" + buyerAppIds + ex.Message + ex.StackTrace;
                        this.lblCondApproveError.Visible = true;
                        return;
                    }

                }

                newBuyerApp.CondCreditDecision = "C";
                newBuyerApp.CondCreditDecisionBy = "dvorakpj";
                newBuyerApp.CondCreditDecisionDate = DateTime.Now;
                newBuyerApp.Modified = newBuyerApp.CondCreditDecisionDate;
                newBuyerApp.ModifiedBy = newBuyerApp.CondCreditDecisionBy;

                try
                {
                    int updates3 = bata.Update(badt);
                    if (updates3 != 1)
                    {
                        throw new ApplicationException("Failed to update MAB Application Id:" + buyerAppIds + ";" + "expected 1 row updated actually:" + updates3);
                    }
                }
                catch (Exception ex)
                {
                    this.lblCondApproveError.Text += "Error recording a conditional approval for MAB Application:" + buyerAppIds + "\n" + ex.Message + "\n" + ex.StackTrace;
                    this.lblCondApproveError.Visible = true;
                    return;
                }


                Response.Redirect("~/BuyerApplicantsNewAll.aspx");
            }


        }

 
    }
}