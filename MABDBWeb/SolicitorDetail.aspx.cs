using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

using DataUtils;

namespace MABDBWeb
{
    public partial class SolicitorDetail : System.Web.UI.Page
    {
        /// <summary>
        /// 
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
        

        protected void btn_AddSolFirmRel_Click(object sender, EventArgs e)
        {
            int solicitorId = this.GetIdFromReqParam();
            if (solicitorId <= 0)
            {
                throw new ArgumentOutOfRangeException(String.Format("Invalid solicitor id. Received {0}, expecting positive integer."));
            };

            // get the data list box selected items
            int[] firms = lstBox_SolicitorFirms.GetSelectedIndices();
            List<int> firmIDs = new List<int>();

            foreach (int firm in firms)
            {
                ListItem item = lstBox_SolicitorFirms.Items[firm];
                int firmId = -1;
                if (Int32.TryParse(item.Value, out firmId))
                {
                    firmIDs.Add(firmId);
                }
            }

            if (firmIDs.Count > 0)
            {
                foreach (int firmId in firmIDs)
                {
                    DataUtils.SolicitorDSTableAdapters.SolicitorFirmTableAdapter sfda = new DataUtils.SolicitorDSTableAdapters.SolicitorFirmTableAdapter();
                    DataUtils.SolicitorDSTableAdapters.SolicitorTableAdapter scda = new DataUtils.SolicitorDSTableAdapters.SolicitorTableAdapter();
                    DataUtils.SolicitorDS.SolicitorFirmDataTable relatedFirmsTbl = scda.GetDataBySolicitorId(solicitorId);
                    sfda.InsertCurrentSolicitorToFirmRel(firmId, solicitorId );
                }
            }
        }
    }
}