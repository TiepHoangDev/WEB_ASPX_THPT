using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.controls
{
    public partial class ucLichLamViec : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                HienThiLichLamViec();
        }

        private void HienThiLichLamViec()
        {
            BUS.BUS_BaiViet baiviet = new BUS.BUS_BaiViet();
            
            dtlLichLamViec.DataSource = BUS.clsCommon.LayTopMauTin(baiviet.LayDSBaiViet("", 9), 5);
            dtlLichLamViec.DataBind();
        }
    }
}