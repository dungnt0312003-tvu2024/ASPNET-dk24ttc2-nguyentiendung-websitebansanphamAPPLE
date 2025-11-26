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
        protected void Page_Load(object sender, EventArgs e) { 
            this.Page.Form.Enctype = "multipart/form-data";

            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
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

                //viewSP();

}
}


        
        protected void log_out(object sender, EventArgs e)
        {
            Session["Role"] = null;
            Response.Redirect("login.aspx");
        }
    }
}