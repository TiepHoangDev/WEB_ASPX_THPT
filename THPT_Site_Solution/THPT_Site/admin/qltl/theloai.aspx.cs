using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin.qltl
{
    public partial class theloai : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            var key = Request.QueryString["key"];
            lblTitle.Text = "<h3 class='title'>" + (key != null ? "Chỉnh sửa" : "Thêm") + " thể loại</h3>";
            if (int.TryParse(key, out id) && !IsPostBack) LoadData();
        }

        //Phưowng thức hiển thị dữ liệu
        private void LoadData()
        {
            if (id <= 0) return;
            var ob = new BUS.BUS_TheLoai().GetByMaLoai(id);
            txtTenLoai.Text = ob.TenLoai;
            txtMoTa.Text = ob.MoTa;
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            var ob = new DTO.DTO_TheLoai()
            {
                MaLoai = id,
                MoTa = txtMoTa.Text,
                TenLoai = txtTenLoai.Text
            };
            var result = id > 0 ? new BUS.BUS_TheLoai().Update(ob) : new BUS.BUS_TheLoai().Insert(ob);
            lblMsg.Text = result ?
                "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Thực hiện thành công"
                : "<img style='vertical-align:middle' src='/admin/images/error.png'/> Thực hiện thất bại";
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("dstheloai.aspx");
        }
    }
}