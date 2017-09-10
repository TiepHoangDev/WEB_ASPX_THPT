
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_Album
    {

        public List<DTO_Album> GetAll()
        {
            return new DAL_Album().GetAll();
        }


        public DTO_Album GetByID(System.Int32 ID)
        {
            return new DAL_Album().GetByID(ID);
        }


        public bool Insert(DTO_Album ob)
        {
            return new DAL_Album().Insert(ob);
        }


        public bool Delete(System.Int32 ID)
        {
            return new DAL_Album().Delete(ID);
        }


        public bool Update(DTO_Album ob)
        {
            return new DAL_Album().Update(ob);
        }

    }
}
