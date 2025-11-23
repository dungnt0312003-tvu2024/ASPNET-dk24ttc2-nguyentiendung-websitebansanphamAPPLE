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
    public partial class login : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {
      
        }

        [Obsolete]
        protected void btLogin_Click(object sender, EventArgs e)
        {
            string passmahoa = conn.Mahoa (txtPassword.Text);
            SqlDataAdapter da = new SqlDataAdapter("select * from Users where Username='" + txtUsername.Text + "' and PasswordHash ='" + txtPassword.Text + "' ", conn.con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            if (tb.Rows.Count > 0) // nếu có us/pass trung khớp trong csdl thì 
            {
                
                Session["Username"] = txtUsername.Text; // tạo biến session có tên là name, luu username
                // Session["allow"] = true; // tạo session có tên là allow lưu trạng tháng true
                Session["Role"] = tb.Rows[0][4].ToString(); // lưu section quyền.
                Session["avatar"] = tb.Rows[0][6].ToString();
                if (Session["Role"].ToString() == "Admin") {
                    Response.Redirect("admin.aspx");
                }
                else
                    //Response.Write("<script>console.log('" + tb.Rows[0][4].ToString() + "')</script>");
                    Response.Redirect("default.aspx"); // trả về trang Default

            }
            else Response.Write("<script>alert('Username/Password chưa đúng')</script>"); // ngược lại hiện thông báo lỗi

        }
    }
}