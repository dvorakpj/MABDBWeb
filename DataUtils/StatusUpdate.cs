using DataUtils.InvestorDSTableAdapters;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataUtils
{
    public class StatusUpdate
    {
        /// <summary>
        /// Copy a temporary investor application to permanent Investor
        /// </summary>
        public int InvestorApplication_to_newInvestor(int InvestorApplicationId)
        {
            InvestorDS.InvestorApplicationsDataTable invAppDT = null; // new InvestorDS.InvestorApplicationsDataTable();            
            InvestorDSTableAdapters.InvestorApplicationsTableAdapter invAppTA = new InvestorDSTableAdapters.InvestorApplicationsTableAdapter();
            InvestorDS.InvestorApplicationsRow invAppRow = null;

            StringBuilder invAppErrorMsgSB = new StringBuilder();

            //invAppTA
            invAppDT = invAppTA.GetDataById(InvestorApplicationId);

            if (1 != invAppDT.Rows.Count)
            {
                return -1;
            } else
            {
                invAppRow = invAppDT.Rows[0] as InvestorDS.InvestorApplicationsRow; 

                if (invAppRow.IsPrimary_LastNameNull())
                {
                    invAppErrorMsgSB.AppendLine("Primary Investor's Last Name cannot be null.");
                }
                if (invAppRow.IsPrimary_DOBNull())
                {
                    invAppErrorMsgSB.AppendLine("Primary Investor's DOB cannot be null.");
                }

                if (invAppErrorMsgSB.Length > 0)
                {
                    string invAppErrorMsg = invAppErrorMsgSB.ToString();
                    throw new ApplicationException(invAppErrorMsg);
                }

                
            }

            InvestorDS.InvestorDataTable invDT = new InvestorDS.InvestorDataTable();            

            InvestorDS.InvestorRow invRow = invDT.NewRow() as InvestorDS.InvestorRow;

            invRow.InvestorApplicationId = invAppRow.Id;

            invRow.FirstName = invAppRow.Primary_FirstName.Trim();
            invRow.LastName = invAppRow.Primary_LastName.Trim();

            invRow.DOB = invAppRow.Primary_DOB;



            return 1;

            //invRow = invAppRow.Id
        }
    }
}

