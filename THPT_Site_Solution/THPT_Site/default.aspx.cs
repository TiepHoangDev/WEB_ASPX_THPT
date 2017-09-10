using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThiTinNoiBat();

                rptThongtinGiaoDuc.DataSource = BUS.clsCommon.LayTopMauTin(new BUS.BUS_BaiViet().LayDSBaiViet("", 5), 3);
                rptThongtinGiaoDuc.DataBind();

                dtAlbum.DataSource = new BUS.BUS_Album().GetAll().Take(4);
                dtAlbum.DataBind();

                dtThongBaoHocSinh.DataSource = BUS.clsCommon.LayTopMauTin(new BUS.BUS_BaiViet().LayDSBaiViet("", 6), 5);
                dtThongBaoHocSinh.DataBind();
            }
        }

        private void HienThiTinNoiBat()
        {
            BUS.BUS_BaiViet bv = new BUS.BUS_BaiViet();
            rptTinNoiBat.DataSource = BUS.clsCommon.LayTopMauTin(bv.LayDSTinHDNoiBat(), 10);
            rptTinNoiBat.DataBind();
        }
    }
}