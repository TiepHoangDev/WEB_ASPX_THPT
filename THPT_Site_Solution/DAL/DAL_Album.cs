
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_Album
    {

        public List<DTO_Album> GetAll()
        {
            var list = DataProvider.GetData("Album_GetAll", CommandType.StoredProcedure);
            List<DTO_Album> lst = new List<DTO_Album>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_Album();

                obj.ID = (int)item["ID"];
                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.TenAlbum = (string)item["TenAlbum"];
                obj.NgayCapNhat = (DateTime?)item["NgayCapNhat"];
                obj.MoTa = item["MoTa"] is DBNull ? "" : (string)item["MoTa"];
                obj.Anh = (string)item["Anh"];

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_Album GetByID(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };

            var list = DataProvider.GetData("Album_GetByID", CommandType.StoredProcedure, listPara);
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_Album();

                obj.ID = (int)item["ID"];
                obj.TaiKhoan = (string)item["TaiKhoan"];
                obj.TenAlbum = (string)item["TenAlbum"];
                obj.NgayCapNhat = (DateTime?)item["NgayCapNhat"];
                obj.MoTa = (string)item["MoTa"];
                obj.Anh = (string)item["Anh"];

                return obj;
            }
            return null;
        }


        public bool Insert(DTO_Album ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@Anh", ob.Anh),
                new SqlParameter("@MoTa", ob.MoTa),
                new SqlParameter("@NgayCapNhat", ob.NgayCapNhat),
                new SqlParameter("@TaiKhoan", ob.TaiKhoan),
                new SqlParameter("@TenAlbum", ob.TenAlbum)
            };
            return DataProvider.UpdateData("Album_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };
            return DataProvider.UpdateData("Album_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_Album ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ob.ID),
                new SqlParameter("@Anh", ob.Anh),
                new SqlParameter("@MoTa", ob.MoTa),
                new SqlParameter("@NgayCapNhat", ob.NgayCapNhat),
                new SqlParameter("@TaiKhoan", ob.TaiKhoan),
                new SqlParameter("@TenAlbum", ob.TenAlbum)
            };
            return DataProvider.UpdateData("Album_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
