using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.controls
{
    public partial class ucTaiNguyenHocTap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataList1.DataSource = BUS.clsCommon.LayTopMauTin(new BUS.BUS_BaiViet().LayDSBaiViet("", 10), 7);
                DataList1.DataBind();
            }
        }
    }
}