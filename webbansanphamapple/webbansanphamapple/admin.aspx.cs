using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webbansanphamapple
{
    public partial class admin : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                DS();
            }
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

        protected void btThem_Click(object sender, EventArgs e)
        {
            //string masv = txtMasv.Text;

            //string email = txtEmail.Text;
            //string tensv = txtTensv.Text;



            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = conn.con;
            //cmd.CommandText = "insert into tblSinhvien(Masv,Email) values('" + masv + "','" + email + "')";
            //cmd.CommandType = CommandType.Text;

            //conn.con.Open(); // mo ket noi
            //cmd.ExecuteNonQuery(); // thực thi 
            //conn.con.Close(); // dong ket noi
            //Response.Redirect("QLGV.aspx");

        }
   
     
        protected void btnSave_Click(object sender, EventArgs e) // nhấn nút sửa trong popup
        {
            string imagePath = txtEditImage.Text;
            try
            {
                if (FileUpload1.HasFile && CheckFileType(FileUpload1.FileName))
                {
                    string dir = Server.MapPath("~/img/products/");
                    if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

                    string fileName = DateTime.Now.ToString("yyyyMMdd_hhmmss_") + FileUpload1.FileName;
                    string fullPath = Path.Combine(dir, fileName);

                    FileUpload1.SaveAs(fullPath);

                    imagePath = "img/products/" + fileName;
                }

                SqlCommand cmd = new SqlCommand(
        "UPDATE Products SET Name=@n, Description=@d, Price=@p, ImageUrl=@i WHERE ProductId=@id", conn.con);

                cmd.Parameters.AddWithValue("@n", txtEditName.Text);
                cmd.Parameters.AddWithValue("@d", txtEditDesc.Text);
                cmd.Parameters.AddWithValue("@p", txtEditPrice.Text);
                cmd.Parameters.AddWithValue("@i", imagePath);
                cmd.Parameters.AddWithValue("@id", hfProductId.Value);

                conn.con.Open();
                cmd.ExecuteNonQuery();
                conn.con.Close();

                DS();

                ScriptManager.RegisterStartupScript(this, GetType(), "HideEditModal",  "$('#editModal').modal('hide'); $('.modal-backdrop').remove(); $('body').removeClass('modal-open');",    true);


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Lỗi Upload: " + ex.Message + "');</script>");
            }

        }
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductId=@id", conn.con);
            cmd.Parameters.AddWithValue("@id", hfDeleteId.Value);

            conn.con.Open();
            cmd.ExecuteNonQuery();
            conn.con.Close();

            DS(); // cập nhật bảng

            ScriptManager.RegisterStartupScript(this, GetType(), "HideDelete", "$('#deleteModal').modal('hide'); $('.modal-backdrop').remove(); $('body').removeClass('modal-open');",  true);

            Response.Redirect("admin.aspx");
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditItem")
            {
                // Load dữ liệu ra modal sửa
                LoadProductToModal(id);
            }

            if (e.CommandName == "DeleteItem")
            {
                hfDeleteId.Value = id.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "showDelete", "$('#deleteModal').modal('show');", true);

            }
            if (e.CommandName == "addItem")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAddModal","$('#addModal').modal('show');", true);
            }


        }
        private void LoadProductToModal(int id) // load dữ liệu sản phẩm vào modal sửa
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE ProductId=@id", conn.con);
            cmd.Parameters.AddWithValue("@id", id);

            conn.con.Open();
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                hfProductId.Value = id.ToString();
                txtEditName.Text = rd["Name"].ToString();
                txtEditDesc.Text = rd["Description"].ToString();
                txtEditPrice.Text = rd["Price"].ToString();
                txtEditImage.Text = rd["ImageUrl"].ToString();
                img.ImageUrl = rd["ImageUrl"].ToString();
            }
            rd.Close();
            conn.con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal",
                "$('#editModal').modal('show');", true);
        }


        bool CheckFileType(string fileName) // check file ảnh up load
        {

            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string tenSP = txttenSPADD.Text;
            string chitiet = txtchiTietADD.Text;
            string gia = txtgiaSPADD.Text;
            Double giaSP = Convert.ToDouble(gia);


            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn.con;
            cmd.CommandText = "INSERT INTO [dbo].[Products]      " +
                "([Name]       " +
                " ,[Description]         " +
                " ,[Price]         " +
                " ,[ImageUrl]           ," +
                "[CategoryId])    " +
                " VALUES           " +
                "('"+tenSP+"', " +
                "'"+chitiet+"'," +
                ""+giaSP+"," +
                "'img/products/ip15.jpg', " +
                "3) ";
            cmd.CommandType = CommandType.Text;

            conn.con.Open(); // mo ket noi
            cmd.ExecuteNonQuery(); // thực thi 
            conn.con.Close(); // dong ket noi

            DS();
            ScriptManager.RegisterStartupScript(this, GetType(), "HideAddModal", "$('#addModal').modal('hide'); $('.modal-backdrop').remove(); $('body').removeClass('modal-open');", true);
            Response.Redirect("admin.aspx");

        }

        protected void Them_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowAddModal", "$('#addModal').modal('show');", true);
        }
    }
}
