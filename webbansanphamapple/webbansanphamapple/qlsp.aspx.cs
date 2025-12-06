using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using System.Xml.Linq;

namespace webbansanphamapple
{
    public partial class qlsp : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e)
        {


            this.Page.Form.Enctype = "multipart/form-data";

            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("login.aspx");

            }
            else if(!IsPostBack)
            {
                
                lblXinchao.Text = "Xin chào : " + Session["Username"].ToString() + "" ;
                uimg.ImageUrl = Session["avatar"].ToString();

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
                if (!CheckFileType(FileUpload1.FileName))
                {
                    Response.Write("<script>alert('Chỉ cho phép file .jpg, .jpeg, .png, .gif');</script>");
                    return;
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

                ScriptManager.RegisterStartupScript( this, GetType(), "HideEdit",
                        "var hideeditModal = new bootstrap.Modal(document.getElementById('editModal')); hideeditModal.hide();",  true  );
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

            Response.Redirect("qlsp.aspx");
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
  
            try
            {
                string imagePath = "";

                // Validate file có chọn không
                if (!FileUpload2.HasFile)
                {
                    Response.Write("<script>alert('Vui lòng chọn ảnh!');</script>");
                    return;
                }

                // Kiểm tra định dạng file
                if (!CheckFileType(FileUpload2.FileName))
                {
                    Response.Write("<script>alert('Chỉ cho phép file .jpg, .jpeg, .png, .gif');</script>");
                    return;
                }

                string dir = Server.MapPath("~/img/products/");
                if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

                string fileName = DateTime.Now.Ticks + "_" + Path.GetFileName(FileUpload2.FileName);
                string fullPath = Path.Combine(dir, fileName);

                // Save file
                FileUpload2.SaveAs(fullPath);
                imagePath = "img/products/" + fileName;
                imgadd.ImageUrl = imagePath;
                txtaddimg.Text = imagePath;

                // Lấy dữ liệu
                string tenSP = txttenSPADD.Text.Trim();
                string chitiet = txtchiTietADD.Text.Trim();
                double giaSP = 0;
                if (!Double.TryParse(txtgiaSPADD.Text.Trim(), out giaSP))
                {
                    Response.Write("<script>alert('Giá không hợp lệ');</script>");
                    ScriptManager.RegisterStartupScript(
                    this,
                        GetType(),
                        "ShowAddModal",
                        "var addModal = new bootstrap.Modal(document.getElementById('addModal')); addModal.show();",
                        true
                );
                    return;
                }

                // Insert bằng parameterized query
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Products (Name, Description, Price, ImageUrl, CategoryId) " +
                    "VALUES (@n, @d, @p, @i, @c)", conn.con);

                cmd.Parameters.AddWithValue("@n", tenSP);
                cmd.Parameters.AddWithValue("@d", chitiet);
                cmd.Parameters.AddWithValue("@p", giaSP);
                cmd.Parameters.AddWithValue("@i", imagePath);
                cmd.Parameters.AddWithValue("@c", 3);

                conn.con.Open();
                cmd.ExecuteNonQuery();
                conn.con.Close();

                viewSP();

                ScriptManager.RegisterStartupScript(
                    this, GetType(),
                    "HideAddModal",
                    "var modal = bootstrap.Modal.getInstance(document.getElementById('addModal')); if (modal) modal.hide();",
                    true
                );

                // Redirect nếu cần, hoặc chỉ update UI
                Response.Redirect("qlsp.aspx");
            }
            catch (Exception ex)
            {
                // Hiển thị lỗi để debug
                Response.Write("<script>alert('Lỗi khi thêm sản phẩm: " + Server.HtmlEncode(ex.Message) + "');</script>");
            }
        }



        protected void log_out(object sender, EventArgs e)
        {
            Session["Role"] = null;
            Response.Redirect("login.aspx");
        }

        protected void Show_addModal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
                    this,
                        GetType(),
                        "ShowAddModal",
                        "var addModal = new bootstrap.Modal(document.getElementById('addModal')); addModal.show();",
                        true
                );
        }
    }
}