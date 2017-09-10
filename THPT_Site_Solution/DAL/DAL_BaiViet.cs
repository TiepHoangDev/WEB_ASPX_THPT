using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class DAL_BaiViet
    {
        //Lấy danh sách bài viết dựa theo tên bài viết và thể loại
        public DataTable LayDSBaiViet(string tukhoa = "", int maloai = 0)
        {
            //Tạo danh sách tham số 
            List<SqlParameter> listPara = new List<SqlParameter>() 
            {
                new SqlParameter("@TuKhoa", "%" + tukhoa + "%"),
                new SqlParameter("@MaLoai", maloai)
            };

            return DataProvider.GetData("BaiViet_DanhSach", CommandType.StoredProcedure, listPara);
        }

        //Phương thức tin hoạt động nổi bật
        public DataTable LayDSTinHoatDongNoiBat()
        {
            return DataProvider.GetData("BaiViet_NoiBat", CommandType.StoredProcedure);
        }

        //Thêm bài viết
        public bool ThemBaiViet(DTO.DTO_BaiViet baiviet)
        {
            bool result = false;
            //Tạo danh sách tham số
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@TieuDe", baiviet.TieuDe),
                new SqlParameter("@TomTat", baiviet.TomTat),
                new SqlParameter("@NoiDung", baiviet.NoiDung),
                new SqlParameter("@NoiBat", baiviet.NoiBat),
                new SqlParameter("@TrangThai", baiviet.TrangThai),
                new SqlParameter("@NgayCapNhat", baiviet.NgayCapNhat),
                new SqlParameter("@Anh", baiviet.Anh),
                new SqlParameter("@MaLoai", baiviet.MaLoai),
                new SqlParameter("@TaiKhoan", baiviet.TaiKhoan)
            };

            result = DataProvider.UpdateData("BaiViet_Them", CommandType.StoredProcedure, listParas);
            return result;
        }

        //Chỉnh sửa bài viết
        public bool CapNhatBaiViet(DTO.DTO_BaiViet baiviet)
        {
            bool result = false;
            //Tạo danh sách tham số
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaBV", baiviet.MaBV),
                new SqlParameter("@TieuDe", baiviet.TieuDe),
                new SqlParameter("@TomTat", baiviet.TomTat),
                new SqlParameter("@NoiDung", baiviet.NoiDung),
                new SqlParameter("@NoiBat", baiviet.NoiBat),
                new SqlParameter("@TrangThai", baiviet.TrangThai),                
                new SqlParameter("@Anh", baiviet.Anh),
                new SqlParameter("@MaLoai", baiviet.MaLoai),
                new SqlParameter("@TaiKhoan", baiviet.TaiKhoan)
            };

            result = DataProvider.UpdateData("BaiViet_CapNhat", CommandType.StoredProcedure, listParas);
            return result;
        }

        //Xóa bài viết
        public bool XoaBaiViet(int mabv)
        {
            bool result = false;

            //Tạo danh sách tham số
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaBV", mabv)                
            };

            result = DataProvider.UpdateData("BaiViet_Xoa", CommandType.StoredProcedure, listParas);

            return result;
        }

        //Thông tin chi tiết bài viết
        public DTO.DTO_BaiViet BaiViet(int mabv)
        {
            List<SqlParameter> listPara = new List<SqlParameter>() 
            {
                new SqlParameter("@MaBV", mabv)                
            };

            DataTable dtBV = DataProvider.GetData("BaiViet_ChiTiet", CommandType.StoredProcedure, listPara);

            DTO.DTO_BaiViet baiviet = new DTO.DTO_BaiViet();
            baiviet.MaBV = (int)dtBV.Rows[0]["MaBV"];
            baiviet.TieuDe = dtBV.Rows[0]["TieuDe"].ToString();
            baiviet.TomTat = dtBV.Rows[0]["TomTat"].ToString();
            baiviet.NoiDung = dtBV.Rows[0]["NoiDung"].ToString();
            baiviet.NoiBat = (bool)dtBV.Rows[0]["NoiBat"];
            baiviet.TrangThai = (bool)dtBV.Rows[0]["TrangThai"];
            baiviet.Anh = dtBV.Rows[0]["Anh"].ToString();
            baiviet.NgayCapNhat = DateTime.Parse(dtBV.Rows[0]["NgayCapNhat"].ToString());
            baiviet.MaLoai = (int)dtBV.Rows[0]["MaLoai"];
            baiviet.TaiKhoan = dtBV.Rows[0]["TaiKhoan"].ToString();

            return baiviet;
        }


    }
}
