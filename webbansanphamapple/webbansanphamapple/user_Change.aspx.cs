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
    public partial class user_Change : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Username"] != null)
            {
                ScriptManager.RegisterStartupScript(
                        this,
                            GetType(),
                            "hideLogin",
                            "const login = document.getElementById('login'); login.remove();",
                            true
                    );
                lblHello.Text = "Xin chào : " + Session["Username"].ToString() + "";
                uimg.ImageUrl = Session["avatar"].ToString();
            }
            else if (Session["Username"] == null)
            {
                ScriptManager.RegisterStartupScript(
                        this,
                            GetType(),
                            "hideinf",
                            "const inf = document.getElementById('inf'); inf.remove();",
                            true
                    );
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                viewUS();
            }
            ;
        }
        public void viewUS()
        {
            string id = Session["IdUser"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE UserId=@id", conn.con);
            cmd.Parameters.AddWithValue("@id", id);

            conn.con.Open();
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                txtUser.Text = rd["Username"].ToString();
                txtFullname.Text = rd["Name"].ToString();
                txtAddress.Text = rd["Address"].ToString();
                txtemail.Text = rd["Email"].ToString();
                txtphone.Text = rd["PhoneNB"].ToString();
                Image1.ImageUrl = rd["Image"].ToString();
            }
            rd.Close();
            conn.con.Close();
        }

        protected void btchannged_Click(object sender, EventArgs e)
        {
            
          }
        protected void log_out(object sender, EventArgs e)
        {
            Session["Role"] = null;
            Response.Redirect("login.aspx");
        }

    }
}