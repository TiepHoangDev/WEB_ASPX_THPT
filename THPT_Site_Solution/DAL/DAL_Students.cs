
using System;
using System.Collections.Generic;
using DTO;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DAL_Students
    {

        public List<DTO_Students> GetAll()
        {
            var list = DataProvider.GetData("Students_GetAll", CommandType.StoredProcedure);
            List<DTO_Students> lst = new List<DTO_Students>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_Students();

                obj.Id = (int)item["Id"];
                obj.StudentName = (string)item["StudentName"];

                lst.Add(obj);
            }
            return lst;
        }


        public DTO_Students GetByID(System.Int32 Id)
        {
            List<SqlParameter> listPara = new List<SqlParameter>()
            {
                new SqlParameter("@Id", Id)
            };

            var list = DataProvider.GetData("Students_GetByID", CommandType.StoredProcedure, listPara);
            List<DTO_Students> lst = new List<DTO_Students>();
            foreach (DataRow item in list.Rows)
            {
                var obj = new DTO_Students();

                obj.Id = (int)item["Id"];
                obj.StudentName = (string)item["StudentName"];

                return obj;
            }
            return null;
        }


        public bool Insert(DTO_Students ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@Id", ob.Id),
                new SqlParameter("@StudentName", ob.StudentName)
            };
            return DataProvider.UpdateData("Students_Insert", CommandType.StoredProcedure, listParas);
        }


        public bool Delete(System.Int32 ID)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@Id", ID)
            };
            return DataProvider.UpdateData("Students_Delete", CommandType.StoredProcedure, listParas);
        }


        public bool Update(DTO_Students ob)
        {
            List<SqlParameter> listParas = new List<SqlParameter>()
            {
                new SqlParameter("@Id", ob.Id),
                new SqlParameter("@StudentName", ob.StudentName)
            };
            return DataProvider.UpdateData("Students_Update", CommandType.StoredProcedure, listParas);
        }

    }
}
