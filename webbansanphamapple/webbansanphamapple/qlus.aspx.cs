using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
namespace webbansanphamapple
{
    public partial class QLUser : System.Web.UI.Page
    {
        connect conn = new connect();
        protected void Page_Load(object sender, EventArgs e) { 
            this.Page.Form.Enctype = "multipart/form-data";

            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("login.aspx");

            }
            else if(!IsPostBack)
            {
                 lblXinchao.Text = "Xin chào : " + Session["Username"].ToString() +  "" ;
                 uimg.ImageUrl = Session["avatar"].ToString();

                viewUS();

            }
}
        public void viewUS()
        {

            SqlDataAdapter da = new SqlDataAdapter("select * from Users", conn.con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            Repeater1.DataSource = tb;
            Repeater1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e) { //Hàm tìm kiếm sản người dùng
            string keyword = txtSearch.Text.Trim();

            string query = "SELECT * FROM Users WHERE Name LIKE @kw OR Username LIKE @kw";
            SqlCommand cmd = new SqlCommand(query, conn.con);
            cmd.Parameters.AddWithValue("@kw", "%" + keyword + "%");
            conn.con.Open();
            Repeater1.DataSource = cmd.ExecuteReader();
            Repeater1.DataBind();
            conn.con.Close();
        }

        //Nút Lưu trong modal Sửa
        [Obsolete]
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string imagePath = txtEditImage.Text; // giữ ảnh cũ
            string passmahoa = conn.Mahoa(txtEditPass.Text);
            try
            {
                // Nếu có chọn file mới thì upload
                if (FileUpload1.HasFile)
                {
                    string dir = Server.MapPath("~/img/user/");
                    if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

                    string fileName = DateTime.Now.Ticks + "_" + FileUpload1.FileName;
                    string fullPath = Path.Combine(dir, fileName);
                    FileUpload1.SaveAs(fullPath);
                    imagePath = "img/user/" + fileName;
                    img.ImageUrl = imagePath;
                }
                if (!CheckFileType(FileUpload1.FileName))
                {
                    Response.Write("<script>alert('Chỉ cho phép file .jpg, .jpeg, .png, .gif');</script>");
                    return;
                }

                SqlCommand cmd = new SqlCommand(
                    "UPDATE Users SET Username=@u, Email=@e, PasswordHash=@p, Role=@r,Image=@i,Name=@n,PhoneNB=@ph,Address=@ad WHERE UserId=@id",
                    conn.con
                );
               
                string role = ddlRole.SelectedValue.ToString();
                int phoneNB = int.Parse(txtEditPhone.Text);
                cmd.Parameters.AddWithValue("@u", txtEditUName.Text);
                cmd.Parameters.AddWithValue("@e", txtEditEmail.Text);
                cmd.Parameters.AddWithValue("@p", passmahoa);
                cmd.Parameters.AddWithValue("@r", role);
                cmd.Parameters.AddWithValue("@i", imagePath);
                cmd.Parameters.AddWithValue("@n", txtEditName.Text);
                cmd.Parameters.AddWithValue("@ph", phoneNB);
                cmd.Parameters.AddWithValue("@ad", txtEditAdd.Text);
                cmd.Parameters.AddWithValue("@id", hfProductId.Value);

                conn.con.Open();
                cmd.ExecuteNonQuery();
                conn.con.Close();
                viewUS();
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "debug",
                    "alert('Role: " + cmd + "');",
                    true
                );
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
            SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE UserId=@id", conn.con);
            cmd.Parameters.AddWithValue("@id", hfDeleteId.Value);

            conn.con.Open();
            cmd.ExecuteNonQuery();
            conn.con.Close();

            viewUS(); // cập nhật bảng

            ScriptManager.RegisterStartupScript(this, GetType(), "HideDelete", "$('#deleteModal').modal('hide'); $('.modal-backdrop').remove(); $('body').removeClass('modal-open');", true);

            Response.Redirect("qlus.aspx");
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
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE UserId=@id", conn.con);
            cmd.Parameters.AddWithValue("@id", id);

            conn.con.Open();
            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                hfProductId.Value = id.ToString();
                txtEditUName.Text = rd["Username"].ToString();
                txtEditEmail.Text = rd["Email"].ToString();
                txtEditName.Text = rd["Name"].ToString();
                if (rd["Role"].ToString() == "admin")
                {
                    ddlRole.SelectedValue = "admin";
                }
                else
                {
                    ddlRole.SelectedValue = "user";
                }
                txtEditPhone.Text = rd["PhoneNB"].ToString();
                txtEditImage.Text = rd["Image"].ToString();
                txtEditAdd.Text = rd["Address"].ToString();
                img.ImageUrl = rd["Image"].ToString();
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
        protected void log_out(object sender, EventArgs e)
        {
            Session["Role"] = null;
            Response.Redirect("login.aspx");
        }
    }
}