
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_BoMon
    {

        public List<DTO_BoMon> GetAll()
        {
            var list = DataProvider.GetData("BoMon_GetAll", CommandType.StoredProcedure);
            List<DTO_BoMon> lst = new List<DTO_BoMon>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_BoMon();

                obj.MaBM = (int)item["MaBM"];
                obj.MoTa = (string)item["MoTa"];
                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.TenBM = (string)item["TenBM"];
                obj.TrangThai = (bool?)item["TrangThai"] != false;

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_BoMon GetByMaBM(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@MaBM", ID)
            };

            var list = DataProvider.GetData("BoMon_GetByMaBM", CommandType.StoredProcedure, listPara);
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_BoMon();

                obj.MaBM = (int)item["MaBM"];
                obj.MoTa = (string)item["MoTa"];
                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.TenBM = (string)item["TenBM"];
                obj.TrangThai = (bool?)item["TrangThai"] != false;


                return obj;
            }
            return null;
        }


        public bool Insert(DTO_BoMon ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MoTa", ob.MoTa),
                new SqlParameter("@TaiKhoan", ob.TaiKhoan),
                new SqlParameter("@TenBM", ob.TenBM),
                new SqlParameter("@TrangThai", ob.TrangThai)
            };
            return DataProvider.UpdateData("BoMon_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 MaBM)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaBM", MaBM)
            };
            return DataProvider.UpdateData("BoMon_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_BoMon ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaBM", ob.MaBM),
                new SqlParameter("@MoTa", ob.MoTa),
                new SqlParameter("@TaiKhoan", ob.TaiKhoan),
                new SqlParameter("@TenBM", ob.TenBM),
                new SqlParameter("@TrangThai", ob.TrangThai)
            };
            return DataProvider.UpdateData("BoMon_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
