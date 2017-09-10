
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_TrangLienKet
    {

        public List<DTO_TrangLienKet> GetAll()
        {
            var list = DataProvider.GetData("TrangLienKet_GetAll", CommandType.StoredProcedure);
            List<DTO_TrangLienKet> lst = new List<DTO_TrangLienKet>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_TrangLienKet();

                obj.ID = (int)item["ID"];
                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.Target = (string)item["Target"];
                obj.TenSite = (string)item["TenSite"];
                obj.TrangThai = (bool?)item["TrangThai"] == true;
                obj.URL = (string)item["URL"];
                obj.DTO_NguoiDungJoin = new DTO_NguoiDung()
                {

                    HoTen = (string)item["HoTen_NguoiDungJoin"],
                    MatKhau = (string)item["MatKhau_NguoiDungJoin"],
                    TaiKhoan = (string)item["TaiKhoan"],
                    TrangThai = (bool?)item["TrangThai_NguoiDungJoin"] == true
                };

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_TrangLienKet GetByID(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };

            var list = DataProvider.GetData("TrangLienKet_GetByID", CommandType.StoredProcedure, listPara);
            List<DTO_TrangLienKet> lst = new List<DTO_TrangLienKet>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_TrangLienKet();

                obj.ID = (int)item["ID"];
                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.Target = (string)item["Target"];
                obj.TenSite = (string)item["TenSite"];
                obj.TrangThai = (bool?)item["TrangThai"] == true;
                obj.URL = (string)item["URL"];
                obj.DTO_NguoiDungJoin = new DTO_NguoiDung()
                {

                    HoTen = (string)item["HoTen_NguoiDungJoin"],
                    MatKhau = (string)item["MatKhau_NguoiDungJoin"],
                    TaiKhoan = (string)item["TaiKhoan"],
                    TrangThai = (bool?)item["TrangThai_NguoiDungJoin"] == true
                };

                return obj;
            }
            return null;
        }


        public bool Insert(DTO_TrangLienKet ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@TaiKhoan", ob.TaiKhoan),
                new SqlParameter("@Target", ob.Target),
                new SqlParameter("@TenSite", ob.TenSite),
                new SqlParameter("@TrangThai", ob.TrangThai),
                new SqlParameter("@URL", ob.URL)
            };
            return DataProvider.UpdateData("TrangLienKet_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };
            return DataProvider.UpdateData("TrangLienKet_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_TrangLienKet ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@TaiKhoan", ob.TaiKhoan),
                new SqlParameter("@ID", ob.ID),
                new SqlParameter("@Target", ob.Target),
                new SqlParameter("@TenSite", ob.TenSite),
                new SqlParameter("@TrangThai", ob.TrangThai),
                new SqlParameter("@URL", ob.URL)
            };
            return DataProvider.UpdateData("TrangLienKet_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
