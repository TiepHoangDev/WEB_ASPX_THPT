using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin.qlbv
{
    public partial class dsbaiviet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HienDSTheLoai();
                HienThiBaiViet();
            }
        }

        private void HienDSTheLoai()
        {
            BUS.BUS_TheLoai theloai = new BUS.BUS_TheLoai();
            ddlTheLoai.DataSource = theloai.LayDSTheLoai();
            ddlTheLoai.DataTextField = "TenLoai";
            ddlTheLoai.DataValueField = "MaLoai";
            ddlTheLoai.DataBind();           
            ddlTheLoai.Items.Insert(0, new ListItem("--Tất cả--", "0"));
        }

        private void HienThiBaiViet()
        {
            BUS.BUS_BaiViet baiviet = new BUS.BUS_BaiViet();
            grdBaiViet.DataSource = baiviet.LayDSBaiViet(txtTuKhoa.Text, Convert.ToInt32(ddlTheLoai.SelectedItem.Value));
            grdBaiViet.DataBind();

            lblMsg.Text = "";
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            if (txtTuKhoa.Text != "")
                HienThiBaiViet();
        }

        protected void ddlTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            HienThiBaiViet();
        }

        protected void grdBaiViet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdBaiViet.PageIndex = e.NewPageIndex;
            HienThiBaiViet();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("baiviet.aspx?act=add");
        }

        protected void grdBaiViet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int mabv = Convert.ToInt32(e.CommandArgument.ToString());

                BUS.BUS_BaiViet baiviet = new BUS.BUS_BaiViet();

                if (baiviet.XoaBaiViet(mabv))
                {
                    HienThiBaiViet();

                    lblMsg.Text = "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Xóa thành công";
                }

            }
        }
    }
}