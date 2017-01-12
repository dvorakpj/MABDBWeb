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
            object o = this.DetailsView1.DataSourceObject;
            ObjectDataSource bata = this.BuyerApplicationDSDataSource1;// as DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter;            
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            object o = this.DetailsView1.DataSourceObject;
            ObjectDataSource bata = this.BuyerApplicationDSDataSource1;// as DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter;            
            bata.ObjectCreated += OnObjectDataSourceObjectCreated;

            //bata.DataBinding += DataSource1Binding;
        }

        void OnObjectDataSourceObjectCreated(object sender, ObjectDataSourceEventArgs e)
        {
            if (e.ObjectInstance != null)
            {
              DataUtils.DataUtil.SetConnectionStrFromConfig(e.ObjectInstance, "MyConnectionString");
            }
        }

        //private void DataSource1Binding(object source, EventArgs e)
        //{
        //    object o = this.DetailsView1.DataSourceObject;
        //    ObjectDataSource bata = this.BuyerApplicationDSDataSource1;// as DataUtils.BuyerDSTableAdapters.BuyerApplicationsTableAdapter;            
        //}


    }
}