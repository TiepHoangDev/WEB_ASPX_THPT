using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin.qlbv
{
    public partial class baiviet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["act"] = "";
                ViewState["mbv"] = 0;
                ViewState["Anh"] = "";

                if (Request.QueryString["act"] != null)
                {
                    string act = Request.QueryString["act"];
                    if (act == "edit")
                        lblTitle.Text = "<h3 class='title'>Chỉnh sửa bài viết</h3>";
                    else
                        lblTitle.Text = "<h3 class='title'>Thêm bài viết</h3>";

                    ViewState["act"] = act;
                }

                if (Request.QueryString["mbv"] != null)
                    ViewState["mbv"] = Convert.ToInt32(Request.QueryString["mbv"]); 

                //Hiển thị dữ liệu lên các control
                LoadData(ViewState["act"].ToString());
            }

        }

        //Phưowng thức hiển thị dữ liệu
        private void LoadData(string action)
        {
            if (action.Equals("edit"))
            {
                BUS.BUS_BaiViet busBaiViet = new BUS.BUS_BaiViet();

                DTO.DTO_BaiViet baiviet = new DTO.DTO_BaiViet();

                baiviet = busBaiViet.BaiViet(Convert.ToInt32(ViewState["mbv"]));

                HienThiTheLoai();

                txtTieuDe.Text = baiviet.TieuDe;
                txtTomTat.Text = baiviet.TomTat;
                ckNoiDung.InnerHtml = Server.HtmlDecode(baiviet.NoiDung);
                ddlNoiBat.SelectedValue = baiviet.NoiBat.ToString();
                ddlTT.SelectedValue = baiviet.TrangThai.ToString();
                ddlTheLoai.SelectedValue = baiviet.MaLoai.ToString();
                ViewState["Anh"] = baiviet.Anh;
                
            }
            else
            {
                txtTieuDe.Text = "";
                txtTomTat.Text = "";
                ckNoiDung.InnerText = "";
                ddlNoiBat.SelectedIndex = 0;
                ddlTT.SelectedIndex = 0;

                HienThiTheLoai();                
            }

        }

        private void HienThiTheLoai()
        {
            BUS.BUS_TheLoai theloai = new BUS.BUS_TheLoai();
            ddlTheLoai.DataSource = theloai.LayDSTheLoai();
            ddlTheLoai.DataTextField = "TenLoai";
            ddlTheLoai.DataValueField = "MaLoai";
            ddlTheLoai.DataBind();
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            //Lấy thông tin bài viết lưu trữ trong đối tượng DTO_BaiViet
            DTO.DTO_BaiViet baiviet = new DTO.DTO_BaiViet();
            baiviet.MaBV = Convert.ToInt32(ViewState["mbv"]);
            baiviet.TieuDe = txtTieuDe.Text;
            baiviet.TomTat = txtTomTat.Text;
            baiviet.NoiDung = Server.HtmlEncode(ckNoiDung.InnerHtml);
            baiviet.NoiBat = bool.Parse(ddlNoiBat.SelectedValue.ToString());
            baiviet.TrangThai = bool.Parse(ddlTT.SelectedValue.ToString());
            baiviet.TaiKhoan = Session["TaiKhoan"].ToString();
            baiviet.MaLoai = Convert.ToInt32(ddlTheLoai.SelectedValue);
            baiviet.Anh = ViewState["Anh"].ToString();

            BUS.BUS_BaiViet busBV = new BUS.BUS_BaiViet();

            if(ViewState["act"].ToString() == "edit")
            {
                if (busBV.CapNhatBaiViet(baiviet))
                {
                    lblMsg.Text = "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Cập nhật thành công";
                    lblMsg.ForeColor = System.Drawing.Color.Blue;
                }
            }
            else
            {
                baiviet.NgayCapNhat = DateTime.Now;

                if (busBV.ThemBaiViet(baiviet))
                {
                    lblMsg.Text = "<img style='vertical-align:middle' src='/admin/images/tick.png'/> Thêm thành công";
                    lblMsg.ForeColor = System.Drawing.Color.Blue;
                }
            }
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("dsbaiviet.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int sobytes = 1024 * 1024; //1kb=1024b ; 1mb = 1024kb
            if (KiemTraAnh(fuAnh.FileName) && fuAnh.FileContent.Length <= sobytes)
            {
                string path = Server.MapPath("~/upload/tintuc/") + fuAnh.FileName;
                fuAnh.SaveAs(path);
                lblUploadText.Text = "Tải ảnh thành công.";
                lblUploadText.ForeColor = System.Drawing.Color.Blue;
                ViewState["Anh"] = fuAnh.FileName;
            }
            else
            {
                lblUploadText.Text = "File không hợp lệ.";
                lblUploadText.ForeColor = System.Drawing.Color.Red;
            }

        }

        private bool KiemTraAnh(string filename)
        {
            string ext = System.IO.Path.GetExtension(filename);
            switch (ext)
            {
                case ".png":
                case ".jpg":
                case ".jpeg":
                case ".gif":
                    return true;
                default:
                    return false;
            }
        }
    }
}