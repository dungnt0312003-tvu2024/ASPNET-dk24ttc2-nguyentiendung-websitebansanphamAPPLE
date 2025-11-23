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
        protected void btnSearch_Click(object sender, EventArgs e) //Hàm tìm kiếm sản phẩm khi click nút tìm kiếm
        {
            string keyword = txtSearch.Text.Trim();

            string query = "SELECT * FROM Products WHERE Name LIKE @kw OR Description LIKE @kw";
            SqlCommand cmd = new SqlCommand(query, conn.con);
            cmd.Parameters.AddWithValue("@kw", "%" + keyword + "%");

            conn.con.Open();
            Repeater1.DataSource = cmd.ExecuteReader();
            Repeater1.DataBind();
            conn.con.Close();
        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)//Hàm tìm kiếm khi gõ trong ô tìm kiếm
        {
            LoadData(txtSearch.Text.Trim());
        }

        private void LoadData(string keyword)//Hàm tìm kiếm khi gõ trong ô tìm kiếm
        {
            string query = "SELECT * FROM Products WHERE Name LIKE @kw OR Description LIKE @kw";

            SqlCommand cmd = new SqlCommand(query, conn.con);
            cmd.Parameters.AddWithValue("@kw", "%" + keyword + "%");

            conn.con.Open();
            Repeater1.DataSource = cmd.ExecuteReader();
            Repeater1.DataBind();
            conn.con.Close();
        }

    }
}