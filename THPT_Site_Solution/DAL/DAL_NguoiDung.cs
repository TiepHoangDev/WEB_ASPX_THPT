
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_NguoiDung
    {
        //Phương thức kiểm tra đăng nhập
        public bool Login(string taikhoan, string matkhau)
        {
            bool loginSuccess = false;

            List<SqlParameter> paras = new List<SqlParameter>()
            {
                new SqlParameter("@TaiKhoan", taikhoan),
                new SqlParameter("@MatKhau", matkhau)
            };

            DataTable dtND = DataProvider.GetData("NguoiDung_Login", CommandType.StoredProcedure, paras);

            if (dtND.Rows.Count > 0)
                loginSuccess = true;

            return loginSuccess;
        }

        public List<DTO_NguoiDung> GetAll()
        {
            var list = DataProvider.GetData("NguoiDung_GetAll", CommandType.StoredProcedure);
            List<DTO_NguoiDung> lst = new List<DTO_NguoiDung>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_NguoiDung();

                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.HoTen = (string)item["HoTen"];
                obj.MatKhau = (string)item["MatKhau"];
                obj.TrangThai = (bool?)item["TrangThai"] != true;

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_NguoiDung GetByID(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };

            var list = DataProvider.GetData("NguoiDung_GetByID", CommandType.StoredProcedure, listPara);
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_NguoiDung();

                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.HoTen = (string)item["HoTen"];
                obj.MatKhau = (string)item["MatKhau"];
                obj.TrangThai = (bool?)item["TrangThai"] != true;


                return obj;
            }
            return null;
        }


        public bool Insert(DTO_NguoiDung ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@HoTen", ob.HoTen),
                new SqlParameter("@MatKhau", ob.MatKhau),
                new SqlParameter("@TrangThai", ob.TrangThai)
            };
            return DataProvider.UpdateData("NguoiDung_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 MaBM)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaBM", MaBM)
            };
            return DataProvider.UpdateData("NguoiDung_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_NguoiDung ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@HoTen", ob.HoTen),
                new SqlParameter("@MatKhau", ob.MatKhau),
                new SqlParameter("@TrangThai", ob.TrangThai)
            };
            return DataProvider.UpdateData("NguoiDung_Update", CommandType.StoredProcedure, listParas);
        }


    }
}
