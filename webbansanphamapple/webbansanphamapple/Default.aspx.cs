using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webbansanphamapple
{
    public partial class _default : System.Web.UI.Page
    {
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
            }
            
            
    }
        protected void log_out(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("login.aspx");
        }
    }
}