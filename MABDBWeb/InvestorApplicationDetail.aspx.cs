using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MABDBWeb
{
    public partial class InvestorApplicationDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnCondApprove.Attributes.Add("onclick", "ShowCondApproveConfirmPopup();return false;");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //int i = 0;
        }
    }
}