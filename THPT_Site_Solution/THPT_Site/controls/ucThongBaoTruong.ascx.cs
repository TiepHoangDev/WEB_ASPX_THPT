using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.controls
{
    public partial class ucThongBaoTruong : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                HienThiThongBaoTruong();
        }

        private void HienThiThongBaoTruong()
        {
            BUS.BUS_BaiViet baiviet = new BUS.BUS_BaiViet();
            dtlThongBaoTruong.DataSource = BUS.clsCommon.LayTopMauTin(baiviet.LayDSBaiViet("", 5), 10);
            dtlThongBaoTruong.DataBind();
        }
    }
}