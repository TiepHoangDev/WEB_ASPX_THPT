
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_Students
    {

        public List<DTO_Students> GetAll()
        {
            return new DAL_Students().GetAll();
        }


        public DTO_Students GetByID(System.Int32 Id)
        {
            return new DAL_Students().GetByID(Id);
        }


        public bool Insert(DTO_Students ob)
        {
            return new DAL_Students().Insert(ob);
        }


        public bool Delete(System.Int32 Id)
        {
            return new DAL_Students().Delete(Id);
        }


        public bool Update(DTO_Students ob)
        {
            return new DAL_Students().Update(ob);
        }

    }
}
