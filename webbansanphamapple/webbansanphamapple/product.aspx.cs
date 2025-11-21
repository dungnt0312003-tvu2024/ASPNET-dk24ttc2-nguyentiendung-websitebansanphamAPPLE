using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace webbansanphamapple
{
    public partial class product : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {
                DS();
        }

        public void DS()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from Products", conn.con);

            //String query = string.Format("select * from Products");
            //SqlCommand comm = new SqlCommand(query, conn.con);
            //conn.con.Open();
            //SqlDataReader dr = comm.ExecuteReader();
            DataTable tb = new DataTable();
            da.Fill(tb);
            Repeater1.DataSource = tb;
            Repeater1.DataBind();
            //conn.con.Close();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}