using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Security;

namespace webbansanphamapple
{

    public class connect
    {
        //public SqlConnection con = new SqlConnection("Data Source=DESKTOP-HSSVDLO;Initial Catalog=AppleStoreDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
          public SqlConnection con = new SqlConnection("Data Source=DESKTOP-HSSVDLO;Initial Catalog=AppleStoreDB;Integrated Security=True;TrustServerCertificate=True");
        [Obsolete]
        public string Mahoa(string pass)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "SHA1");
        }

    }

}