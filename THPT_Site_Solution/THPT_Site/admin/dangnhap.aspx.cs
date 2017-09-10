using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THPT_Site.admin
{
    public partial class dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            if(txtTaiKhoan.Text == "" || txtMatKhau.Text == "")
            {
                lblMsg.Text = "Chưa nhập tên đăng nhập hoặc mật khẩu.";
                return;
            }

            BUS.BUS_NguoiDung nguoidung = new BUS.BUS_NguoiDung();

            if (nguoidung.Login(txtTaiKhoan.Text, txtMatKhau.Text))
            {
                Session["TaiKhoan"] = txtTaiKhoan.Text;
                Session["isLogin"] = 1; //1: Đã đăng nhập; 0: Chưa đăng nhập

                Response.Redirect("default.aspx");
            }
            else
            {
                lblMsg.Text = "Tài khoản không tồn tại. Vui lòng kiểm tra lại.";
            }
        }
    }
}