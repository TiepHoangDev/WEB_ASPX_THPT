using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin.boMon
{
    public partial class bm : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            var key = Request.QueryString["key"];
            lblTitle.Text = "<h3 class='title'>" + (key != null ? "Chỉnh sửa" : "Thêm") + " bộ môn</h3>";
            if (int.TryParse(key, out id) && !IsPostBack) LoadData();
        }

        //Phưowng thức hiển thị dữ liệu
        private void LoadData()
        {
            if (id <= 0) return;
            var ob = new BUS.BUS_BoMon().GetByMaBM(id);
            txtTieuDe.Text = ob.TenBM;
            txtTomTat.Text = ob.MoTa;
            cbTrangThai.Checked = ob.TrangThai;
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            var ob = new DTO.DTO_BoMon()
            {
                MaBM = id,
                MoTa = txtTomTat.Text,
                TaiKhoan = Session["TaiKhoan"].ToString(),
                TenBM = txtTieuDe.Text,
                TrangThai = cbTrangThai.Checked
            };
            var result = id > 0 ? new BUS.BUS_BoMon().Update(ob) : new BUS.BUS_BoMon().Insert(ob);
            lblMsg.Text = result ?
                "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Thực hiện thành công"
                : "<img style='vertical-align:middle' src='/admin/images/error.png'/> Thực hiện thất bại";
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("dsbomon.aspx");
        }
    }
}