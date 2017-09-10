using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin.qllk
{
    public partial class lienket : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            var key = Request.QueryString["key"];
            lblTitle.Text = "<h3 class='title'>" + (key != null ? "Chỉnh sửa" : "Thêm") + " Trang liên kết</h3>";
            if (int.TryParse(key, out id) && !IsPostBack) LoadData();
        }

        //Phưowng thức hiển thị dữ liệu
        private void LoadData()
        {
            if (id <= 0) return;
            var ob = new BUS.BUS_TrangLienKet().GetByID(id);
            txtTenSite.Text = ob.TenSite;
            txtURL.Text = ob.URL;
            ddlTarget.SelectedValue = ob.Target;
            cbTrangThai.Checked = ob.TrangThai;
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            var ob = new DTO.DTO_TrangLienKet()
            {
                ID = id,
                TenSite = txtTenSite.Text,
                URL = txtURL.Text,
                TaiKhoan = Session["TaiKhoan"].ToString(),
                Target = ddlTarget.SelectedValue,
                TrangThai = cbTrangThai.Checked
            };
            var result = id > 0 ? new BUS.BUS_TrangLienKet().Update(ob) : new BUS.BUS_TrangLienKet().Insert(ob);
            lblMsg.Text = result ?
                "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Thực hiện thành công"
                : "<img style='vertical-align:middle' src='/admin/images/error.png'/> Thực hiện thất bại";
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("dslienket.aspx");
        }
    }
}