using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace THPT_Site
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //Khai báo 2 biến dạng Application để lưu trữ thông tin lượt truy cập và online
            Application["LuotTruyCap"] = 0;
            Application["LuotOnline"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["TaiKhoan"] = "";
            Session["isLogin"] = 0;

            Application.Lock();
            Application["LuotTruyCap"] = (int)Application["LuotTruyCap"] + 1;
            Application["LuotOnline"] = (int)Application["LuotOnline"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();            
            Application["LuotOnline"] = (int)Application["LuotOnline"] - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}