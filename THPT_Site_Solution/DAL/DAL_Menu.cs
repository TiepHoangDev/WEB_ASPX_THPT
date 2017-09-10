
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_Menu
    {

        public List<DTO_Menu> GetAll()
        {
            var list = DataProvider.GetData("Menu_GetAll", CommandType.StoredProcedure);
            List<DTO_Menu> lst = new List<DTO_Menu>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_Menu();

                obj.ID = (int)item["ID"];
                obj.MaLoai = (int)item["MaLoai"];
                obj.MenuCha = (int)item["MenuCha"];
                obj.TenMenu = (string)item["TenMenu"];
                obj.TrangThai = (bool?)item["TrangThai"] == true;
                obj.URL = (string)item["URL"];

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_Menu GetByID(System.Int32 ID)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };

            var list = DataProvider.GetData("Menu_GetByID", CommandType.StoredProcedure, listPara);
            List<DTO_Menu> lst = new List<DTO_Menu>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_Menu();

                obj.ID = (int)item["ID"];
                obj.MaLoai = (int)item["MaLoai"];
                obj.MenuCha = (int)item["MenuCha"];
                obj.TenMenu = (string)item["TenMenu"];
                obj.TrangThai = (bool?)item["TrangThai"] == true;
                obj.URL = (string)item["URL"];

                return obj;
            }
            return null;
        }


        public bool Insert(DTO_Menu ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@TenMenu", ob.TenMenu),
                new SqlParameter("@MaLoai", ob.MaLoai),
                new SqlParameter("@MenuCha", ob.MenuCha),
                new SqlParameter("@TrangThai", ob.TrangThai),
                new SqlParameter("@URL", ob.URL)
            };
            return DataProvider.UpdateData("Menu_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@ID", ID)
            };
            return DataProvider.UpdateData("Menu_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_Menu ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@TenMenu", ob.TenMenu),
                new SqlParameter("@MaLoai", ob.MaLoai),
                new SqlParameter("@MenuCha", ob.MenuCha),
                new SqlParameter("@TrangThai", ob.TrangThai),
                new SqlParameter("@URL", ob.URL)
            };
            return DataProvider.UpdateData("Menu_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
