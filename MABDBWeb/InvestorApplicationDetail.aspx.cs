using DataUtils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MABDBWeb
{
    public partial class InvestorApplicationDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = Request.QueryString["Id"];
            if (!String.IsNullOrEmpty(Id))
            {
                HiddenField1.Value = Id;
            }

            //DateTime condApproved =

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
                currentRow.CondDecision = DateTime.Now;
                currentRow.CondDecisionBy = "pdvorak";
                currentRow.CondApproved = true;
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

            }
        }

        protected void btnCreditFeeReceived_Click(object sender, EventArgs e)
        {

        }
    }
}