
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_TrangLienKet
    {

        public List<DTO_TrangLienKet> GetAll()
        {
            return new DAL_TrangLienKet().GetAll();
        }


        public DTO_TrangLienKet GetByID(System.Int32 ID)
        {
            return new DAL_TrangLienKet().GetByID(ID);
        }


        public bool Insert(DTO_TrangLienKet ob)
        {
            return new DAL_TrangLienKet().Insert(ob);
        }


        public bool Delete(System.Int32 ID)
        {
            return new DAL_TrangLienKet().Delete(ID);
        }


        public bool Update(DTO_TrangLienKet ob)
        {
            return new DAL_TrangLienKet().Update(ob);
        }

    }
}
