using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace webbansanphamapple
{
    public class log_out
    {
        public void log_out_user()
        {
            HttpSessionState session = HttpContext.Current.Session;
            session.Abandon();
            HttpResponse response = HttpContext.Current.Response;
            response.Redirect("login.aspx");
        }
    }
}