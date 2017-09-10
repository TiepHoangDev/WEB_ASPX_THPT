using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin
{
    public partial class thoat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["TaiKhoan"] = "";
            Session["isLogin"] = 0;

            Response.Redirect("~/admin/dangnhap.aspx");
        }
    }
}