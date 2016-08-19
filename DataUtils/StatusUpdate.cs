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
            InvestorDS.InvestorApplicationsDataTable invAppDT = new InvestorDS.InvestorApplicationsDataTable();            
            InvestorDSTableAdapters.InvestorApplicationsTableAdapter invAppTA = new InvestorDSTableAdapters.InvestorApplicationsTableAdapter();
            InvestorDS.InvestorApplicationsRow invAppRow = null;

            //invAppTA
            invAppTA.GetDataById(InvestorApplicationId);

            if (1 != invAppDT.Rows.Count)
            {
                return -1;
            } else
            {
                invAppRow = invAppDT.Rows[0] as InvestorDS.InvestorApplicationsRow; 
            }

            InvestorDS.InvestorDataTable invDT = new InvestorDS.InvestorDataTable();            

            InvestorDS.InvestorRow invRow = invDT.NewRow() as InvestorDS.InvestorRow;

            return 1;

            //invRow = invAppRow.Id
        }
    }
}

