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
        connect conn = new connect();
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
            string email = txtemail.Text;
            String phone = txtphone.Text;
            int phoneNum = int.Parse(phone);

            if (password1 == password2)
            {
                password1 = conn.Mahoa(password1);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn.con;
                cmd.CommandText = "insert into Users(Username,Email,PasswordHash,Role,Image,Name,PhoneNB,Address) " +
                "values('" + username + "','" + email + "','" + password1 + "','user','img/user/user.png','" + fullname + "'," + phoneNum + ",'" + address + "')";
                cmd.CommandType = CommandType.Text;
                Response.Write(cmd.CommandText);
                conn.con.Open(); // mo ket noi
                cmd.ExecuteNonQuery(); // thực thi 
                conn.con.Close(); // dong ket noi
                Response.Redirect("Login.aspx");
            }
            else
            {
                lbkq.Text = "<font color=red>Mật khẩu không hợp lệ!</font>";
            }


        }
    }
}