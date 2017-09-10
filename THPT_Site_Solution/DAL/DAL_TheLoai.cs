
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_TheLoai
    {
        public DataTable LayDanhSachTheLoai()
        {
            return DataProvider.GetData("TheLoai_DS", CommandType.StoredProcedure);
        }

        public List<DTO_TheLoai> GetAll()
        {
            var list = DataProvider.GetData("TheLoai_GetAll", CommandType.StoredProcedure);
            List<DTO_TheLoai> lst = new List<DTO_TheLoai>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_TheLoai();

                obj.MaLoai = (int)item["MaLoai"];
                obj.MoTa = item["MoTa"] is DBNull ? "" : item["MoTa"].ToString();
                obj.TenLoai = (string)item["TenLoai"];

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_TheLoai GetByMaLoai(System.Int32 MaLoai)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@MaLoai", MaLoai)
            };

            var list = DataProvider.GetData("TheLoai_GetByMaLoai", CommandType.StoredProcedure, listPara);
            List<DTO_TheLoai> lst = new List<DTO_TheLoai>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_TheLoai();

                obj.MaLoai = (int)item["MaLoai"];
                obj.MoTa = item["MoTa"] is DBNull ? "" : item["MoTa"].ToString();
                obj.TenLoai = (string)item["TenLoai"];

                return obj;
            }
            return null;
        }


        public bool Insert(DTO_TheLoai ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MoTa", ob.MoTa),
                new SqlParameter("@TenLoai", ob.TenLoai)
            };
            return DataProvider.UpdateData("TheLoai_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaLoai", ID)
            };
            return DataProvider.UpdateData("TheLoai_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_TheLoai ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@MaLoai", ob.MaLoai),
                new SqlParameter("@MoTa", ob.MoTa),
                new SqlParameter("@TenLoai", ob.TenLoai)
            };
            return DataProvider.UpdateData("TheLoai_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
