using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BUS
{
    public class BUS_NguoiDung
    {
        //Phương thức kiểm tra đăng nhập
        public bool Login(string taikhoan, string matkhau)
        {
            DAL.DAL_NguoiDung nguoidung = new DAL.DAL_NguoiDung();
            return nguoidung.Login(taikhoan, matkhau);
        }
    }
}
