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
    public partial class register : System.Web.UI.Page
    {
        connect kn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        [Obsolete]
        protected void btSignup_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text;
            string password1 = txtPass1.Text;
            string password2 = txtPass2.Text;
            string fullname = HttpUtility.HtmlDecode(txtFullname.Text);
            string address = txtAddress.Text;
            if (password1 == password2)
            {

                password1 = kn.Mahoa(password1);

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = kn.con;
                cmd.CommandText = "insert into tbluser(Username,Password,Fullname,Address,Status,Role) values('" + username + "','" + password1 + "','" + fullname + "','" + address + "',0,0)";
                cmd.CommandType = CommandType.Text;

                kn.con.Open(); // mo ket noi
                cmd.ExecuteNonQuery(); // thực thi 
                kn.con.Close(); // dong ket noi
                Response.Redirect("Login.aspx");
            }
            else
            {
                lbkq.Text = "<font color=red>Mật khẩu không hợp lệ!</font>";
            }


        }
    }
}