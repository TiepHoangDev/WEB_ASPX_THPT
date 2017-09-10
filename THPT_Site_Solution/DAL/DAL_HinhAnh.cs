
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_HinhAnh
    {

        public List<DTO_HinhAnh> GetAll()
        {
            var list = DataProvider.GetData("HinhAnh_GetAll", CommandType.StoredProcedure);
            List<DTO_HinhAnh> lst = new List<DTO_HinhAnh>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_HinhAnh();

                obj.ID = (int)item["ID"];
                obj.AnhLon = (string)item["AnhLon"];
                obj.AnhNho = (string)item["AnhNho"];
                obj.IDAlbum = (int?)item["IDAlbum"];

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_HinhAnh GetByID(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };

            var list = DataProvider.GetData("HinhAnh_GetByID", CommandType.StoredProcedure, listPara);
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_HinhAnh();

                obj.ID = (int)item["ID"];
                obj.AnhLon = (string)item["AnhLon"];
                obj.AnhNho = (string)item["AnhNho"];
                obj.IDAlbum = (int?)item["IDAlbum"];


                return obj;
            }
            return null;
        }


        public bool Insert(DTO_HinhAnh ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@AnhLon", ob.AnhLon),
                new SqlParameter("@AnhNho", ob.AnhNho),
                new SqlParameter("@IDAlbum", ob.IDAlbum)
            };
            return DataProvider.UpdateData("HinhAnh_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };
            return DataProvider.UpdateData("HinhAnh_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_HinhAnh ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ob.ID),
                new SqlParameter("@AnhLon", ob.AnhLon),
                new SqlParameter("@AnhNho", ob.AnhNho),
                new SqlParameter("@IDAlbum", ob.IDAlbum)
            };
            return DataProvider.UpdateData("HinhAnh_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
