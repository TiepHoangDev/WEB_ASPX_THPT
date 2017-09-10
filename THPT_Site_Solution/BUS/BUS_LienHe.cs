
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_LienHe
    {

        public List<DTO_LienHe> GetAll()
        {
            return new DAL_LienHe().GetAll();
        }


        public DTO_LienHe GetByID(System.Int32 ID)
        {
            return new DAL_LienHe().GetByID(ID);
        }


        public bool Delete(System.Int32 ID)
        {
            return new DAL_LienHe().Delete(ID);
        }

        //public bool Insert(DTO_LienHe ob)
        //{
        //    return new DAL_LienHe().Insert(ob);
        //}

        //public bool Update(DTO_LienHe ob)
        //{
        //    return new DAL_LienHe().Update(ob);
        //}

    }
}
