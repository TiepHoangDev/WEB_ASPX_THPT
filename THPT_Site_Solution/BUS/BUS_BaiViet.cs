using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BUS
{
    public class BUS_BaiViet
    {
        public DataTable LayDSBaiViet(string tukhoa = "", int maloai = 0)
        {
            DAL.DAL_BaiViet bv = new DAL.DAL_BaiViet();
            return bv.LayDSBaiViet(tukhoa, maloai);
        }

        //Phương thức tin hoạt động nổi bật
        public DataTable LayDSTinHDNoiBat()
        {
            DAL.DAL_BaiViet bv = new DAL.DAL_BaiViet();
            return bv.LayDSTinHoatDongNoiBat();
        }

        public bool ThemBaiViet(DTO.DTO_BaiViet baiviet)
        {
            DAL.DAL_BaiViet bv = new DAL.DAL_BaiViet();
            return bv.ThemBaiViet(baiviet);
        }

        public bool CapNhatBaiViet(DTO.DTO_BaiViet baiviet)
        {
            DAL.DAL_BaiViet bv = new DAL.DAL_BaiViet();
            return bv.CapNhatBaiViet(baiviet);
        }

        public bool XoaBaiViet(int mabv)
        {
            DAL.DAL_BaiViet bv = new DAL.DAL_BaiViet();
            return bv.XoaBaiViet(mabv);
        }

        public DTO.DTO_BaiViet BaiViet(int mabv)
        {
            DAL.DAL_BaiViet bv = new DAL.DAL_BaiViet();
            return bv.BaiViet(mabv);
        }
    }
}
