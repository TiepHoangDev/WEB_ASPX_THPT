using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.controls
{
    public partial class ucThongKe : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTongLuotTruyCap.Text = "Số lượt truy cập: " + Application["LuotTruyCap"].ToString();
            lblTongLuotOnline.Text = "Số lượt online: " + Application["LuotOnline"].ToString();
        }
    }
}