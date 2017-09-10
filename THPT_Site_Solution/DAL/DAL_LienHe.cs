
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_LienHe
    {

        public List<DTO_LienHe> GetAll()
        {
            var list = DataProvider.GetData("LienHe_GetAll", CommandType.StoredProcedure);
            List<DTO_LienHe> lst = new List<DTO_LienHe>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_LienHe();

                obj.ID = (int)item["ID"];
                obj.DienThoai = (string)item["DienThoai"];
                obj.Email = (string)item["Email"];
                obj.NgayGui = (DateTime?)item["NgayGui"];
                obj.NguoiGui = (string)item["NguoiGui"];
                obj.NoiDung = (string)item["NoiDung"];
                obj.TieuDe = (string)item["TieuDe"];

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_LienHe GetByID(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };

            var list = DataProvider.GetData("LienHe_GetByID", CommandType.StoredProcedure, listPara);
            List<DTO_LienHe> lst = new List<DTO_LienHe>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_LienHe();

                obj.ID = (int)item["ID"];
                obj.DienThoai = (string)item["DienThoai"];
                obj.Email = (string)item["Email"];
                obj.NgayGui = (DateTime?)item["NgayGui"];
                obj.NguoiGui = (string)item["NguoiGui"];
                obj.NoiDung = (string)item["NoiDung"];
                obj.TieuDe = (string)item["TieuDe"];


                return obj;
            }
            return null;
        }



        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };
            return DataProvider.UpdateData("LienHe_Delete", CommandType.StoredProcedure, listParas);
        }

        //public bool Insert(DTO_LienHe ob)
        //{
        //    List<SqlParameter> listParas = new List<SqlParameter>()
        //    {
        //        new SqlParameter("@DienThoai", ob.DienThoai),
        //        new SqlParameter("@Email", ob.Email),
        //        new SqlParameter("@NgayGui", ob.NgayGui),
        //        new SqlParameter("@NguoiGui", ob.NguoiGui),
        //        new SqlParameter("@NoiDung", ob.NoiDung),
        //        new SqlParameter("@TieuDe", ob.TieuDe)
        //    };
        //    return DataProvider.UpdateData("LienHe_Insert", CommandType.StoredProcedure, listParas);
        //}

        //public bool Update(DTO_LienHe ob)
        //{
        //    List<SqlParameter> listParas = new List<SqlParameter>()
        //    {
        //        new SqlParameter("@ID", ob.ID),
        //        new SqlParameter("@DienThoai", ob.DienThoai),
        //        new SqlParameter("@Email", ob.Email),
        //        new SqlParameter("@NgayGui", ob.NgayGui),
        //        new SqlParameter("@NguoiGui", ob.NguoiGui),
        //        new SqlParameter("@NoiDung", ob.NoiDung),
        //        new SqlParameter("@TieuDe", ob.TieuDe)
        //    };
        //    return DataProvider.UpdateData("LienHe_Update", CommandType.StoredProcedure, listParas);
        //}

    }
}
