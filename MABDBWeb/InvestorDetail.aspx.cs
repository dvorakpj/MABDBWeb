using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MABDBWeb
{
    public partial class InvestorDetail : System.Web.UI.Page
    {
        /// <summary>
        /// Gets Id from a CGI parameter as specified od "Id" be default.
        /// </summary>
        /// <param name="Id">Name of the CGI Parameter which contains the Id value.</param>
        /// <returns></returns>
        private int GetIdFromReqParam(string Id)
        {
            int id = -1;
            string Idparam = String.IsNullOrEmpty(Id) ? "Id" : Id;

            string InvAppIds = this.Request.Params[Idparam].Trim();

            if (!String.IsNullOrEmpty(InvAppIds))
            {
                Int32.TryParse(InvAppIds, out id);
            }
            return id;
        }

        /// <summary>
        /// Extracts the ID from the Request Params set
        /// </summary>
        /// <returns></returns>
        private int GetIdFromReqParam()
        {
            int id = -1;
            string InvAppIds = this.Request.Params["Id"].Trim();

            if (!String.IsNullOrEmpty(InvAppIds))
            {
                Int32.TryParse(InvAppIds, out id);
            }
            return id;
        }


        private void btnCreditFeeReceived_Click(object sender, EventArgs eargs)
        {
            int invId = GetIdFromReqParam();

            this.setInvCreditFee(invId, DateTime.Now, String.Empty);
        }

        /// <summary>
        /// INvestor record to set the Credit Fee received
        /// </summary>
        /// <param name="InvId">Investor ID to update.</param>
        /// <param name="note">Comment on this operation.</param>
        /// <param name="stamp">Timestamp of this operation.</param>
        private int setInvCreditFee(int InvId, DateTime stamp, string refNo)
        {
            int resCnt = -1;

            if (InvId < 1)
            {
                throw new ArgumentException(String.Format("Investor Id {0} is invalid.", "InvId"));
            }

            if (refNo.Length >= 25)
            {
                refNo = refNo.Substring(0, 25);
            }

            refNo = refNo.Trim();

            DataUtils.InvestorDS.InvestorDataTable invDT = new DataUtils.InvestorDS.InvestorDataTable();
            DataUtils.InvestorDSTableAdapters.InvestorTableAdapter invDA = new DataUtils.InvestorDSTableAdapters.InvestorTableAdapter();

            invDA.FillBy(invDT, InvId);
            if (invDT.Rows.Count != 1)
            {
                throw new ArgumentException(String.Format("Could not find one Investor with ID {0}", InvId), "eargs");
            }

            DataUtils.InvestorDS.InvestorRow invRow = invDT.Rows[0] as DataUtils.InvestorDS.InvestorRow;

            invRow.CreditFeePaid = stamp;
            invRow.CreditFeePaymentRefNo = refNo;
            invRow.AssquireStatus = "E";
            //TODO
            //invRow.Updated = DateTime.Now;
            //invRow.UpdatedBy = "dvorakpj";

            try
            {
                resCnt = invDA.Update(invDT);                
            } catch (Exception ex)
            {
                throw ex;
            }

            return resCnt;
                       
        }
    }
}