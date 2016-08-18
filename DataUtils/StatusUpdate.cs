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
        public void InvestorApplication_to_newInvestor(int InvestorApplicationId)
        {
            InvestorDS.InvestorApplicationsDataTable invAppDT = new InvestorDS.InvestorApplicationsDataTable();
            InvestorDSTableAdapters.InvestorApplicationsTableAdapter invAppTA = new InvestorDSTableAdapters.InvestorApplicationsTableAdapter();
            //invAppTA
            invAppTA.GetDataById(InvestorApplicationId);
        }
    }
}
