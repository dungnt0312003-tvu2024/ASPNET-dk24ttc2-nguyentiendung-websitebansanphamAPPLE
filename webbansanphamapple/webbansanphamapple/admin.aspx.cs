using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace webbansanphamapple
{
    public partial class admin : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {


            this.Page.Form.Enctype = "multipart/form-data";

            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");

            }
            else if(!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(
                    this,
                        GetType(),
                        "hideLogin",
                        "const login = document.getElementById('info'); login.remove();",
                        true
                );
                lblXinchao.Text = "Xin chào : " + Session["Username"].ToString() + "" ;

                viewSP();

            }


            
        }


        // Hiển thị sản phẩm ra bảng
        public void viewSP()
        {
            
            SqlDataAdapter da = new SqlDataAdapter("select * from Products", conn.con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            Repeater1.DataSource = tb;
            Repeater1.DataBind();
        }

        //Nút Lưu trong modal Sửa
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string imagePath = txtEditImage.Text; // giữ ảnh cũ

            try
            {
                // Nếu có chọn file mới thì upload
                if (FileUpload1.HasFile)
                {
                    string dir = Server.MapPath("~/img/products/");
                    if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);
                  
                    string fileName = DateTime.Now.Ticks + "_" + FileUpload1.FileName;
                    string fullPath = Path.Combine(dir, fileName);
                    FileUpload1.SaveAs(fullPath);
                    imagePath = "img/products/" + fileName;
                    img.ImageUrl = imagePath;
                }

                SqlCommand cmd = new SqlCommand(
                    "UPDATE Products SET Name=@n, Description=@d, Price=@p, ImageUrl=@i WHERE ProductId=@id",
                    conn.con
                );

                cmd.Parameters.AddWithValue("@n", txtEditName.Text);
                cmd.Parameters.AddWithValue("@d", txtEditDesc.Text);
                cmd.Parameters.AddWithValue("@p", txtEditPrice.Text);
                cmd.Parameters.AddWithValue("@i", imagePath);
                cmd.Parameters.AddWithValue("@id", hfProductId.Value);

                conn.con.Open();
                cmd.ExecuteNonQuery();
                conn.con.Close();

                viewSP();

                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "CloseModal",
                    "$('#editModal').modal('hide');",
                    true
                );
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Lỗi Upload: " + ex.Message + "');</script>");
            }
        }

        //Nút Xác nhận xóa trong modal Xóa
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductId=@id", conn.con);
            cmd.Parameters.AddWithValue("@id", hfDeleteId.Value);

            conn.con.Open();
            cmd.ExecuteNonQuery();
            conn.con.Close();

            viewSP(); // cập nhật bảng

            ScriptManager.RegisterStartupScript(this, GetType(), "HideDelete", "$('#deleteModal').modal('hide'); $('.modal-backdrop').remove(); $('body').removeClass('modal-open');",  true);

            Response.Redirect("admin.aspx");
        }

        // Xử lý các lệnh từ Repeater
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
                ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "ShowDeleteModal",
                        "var delModal = new bootstrap.Modal(document.getElementById('deleteModal')); delModal.show();",
                        true
                    );

            }
            if (e.CommandName == "addItem")
            {

                ScriptManager.RegisterStartupScript(
                    this,
                        GetType(),
                        "ShowaddModal",
                        "var addModal = new bootstrap.Modal(document.getElementById('addModal')); addModal.show();",
                        true
                );

            }


        }

        // Load dữ liệu sản phẩm vào modal sửa
        private void LoadProductToModal(int id) 
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
            // Sử dụng cú pháp Bootstrap 5 thuần
            ScriptManager.RegisterStartupScript(
                 this,
                        GetType(),
                        "ShoweditModal",
                        "var editModal = new bootstrap.Modal(document.getElementById('editModal')); editModal.show();",
                        true
             );



        }

        // Kiểm tra định dạng file ảnh
        bool CheckFileType(string fileName) 
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

        //Nút Thêm trong modal Thêm
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

            viewSP();
            ScriptManager.RegisterStartupScript(this, GetType(), "HideAddModal", "$('#addModal').modal('hide'); $('.modal-backdrop').remove(); $('body').removeClass('modal-open');", true);
            Response.Redirect("admin.aspx");

        }

        protected void log_out(object sender, EventArgs e)
        {
            Session["Role"] = null;
            Response.Redirect("login.aspx");
        }


    }
}
