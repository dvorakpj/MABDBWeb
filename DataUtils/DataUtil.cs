using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Reflection;

namespace DataUtils
{
    public static class DataUtil
    {
        /// <summary>
        /// replaces Connection string from Settings as defined in the DataAdapter by the VS designer
        /// </summary>
        /// <param name="source">ObjectDataSource to set</param>
        public static void SetConnectionStrFromConfig(object source, string configkey)
        {            
            if (source != null)
            {
                if (String.IsNullOrEmpty(configkey))
                {
                    configkey = "MABDBConnectionString";
                }
                    string conns = ConfigurationManager.ConnectionStrings[configkey].ConnectionString;
                ((SqlConnection)source.GetType()
                    .GetProperty("Connection", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance)
                    .GetValue(source, null)
                 ).ConnectionString = conns;// ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            }
    }
}
}
