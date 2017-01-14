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
            //object o = this.DetailsView1.DataSourceObject;
            ObjectDataSource bata = this.BuyerApplicationDSDataSource1;// as DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter;            
            bata.ObjectCreated += OnObjectDataSourceObjectCreated;

            //bata.DataBinding += DataSource1Binding;
        }

        void OnObjectDataSourceObjectCreated(object sender, ObjectDataSourceEventArgs e)
        {
            if (e.ObjectInstance != null)
            {
              DataUtils.DataUtil.SetConnectionStrFromConfig(e.ObjectInstance, "MABDBConnectionString");
            }
        }

        protected void ButtonCondApprovedModal_Click(object sender, EventArgs e)
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
            //InvestorApplicationDS investor = new InvestorApplicationDS();

            DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter bata = new DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter();
           
            DataUtils.BuyerDS.BuyerDataTable bdt = new DataUtils.BuyerDS.BuyerDataTable();      
            DataUtils.BuyerDSTableAdapters.BuyerTableAdapter bta = new DataUtils.BuyerDSTableAdapters.BuyerTableAdapter();

            DataUtils.BuyerDS.BuyerApplicationsDataTable badt = bata.GetDataBy(buyerAppIdi);

            if (badt.Rows.Count != 1)
            {
                throw new ApplicationException("Buyer Application not found for Id:" + buyerAppIds);
            }
            

            DataUtils.BuyerDS.BuyerApplicationsRow newBuyerApp = badt[0];
            
            if (null != newBuyerApp)
            {
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

                int updates = bta.Update(bdt);

                if ((newBuyerApp.ApplicantType != "Single") && (!String.IsNullOrEmpty(newBuyerApp.Other_LastName)))
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

                    int updates2 = bta.Update(bdt);

                }



            }


        }

 
    }
}