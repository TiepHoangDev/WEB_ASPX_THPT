
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_BoMon
    {

        public List<DTO_BoMon> GetAll()
        {
            return new DAL_BoMon().GetAll();
        }


        public DTO_BoMon GetByMaBM(System.Int32 MaBM)
        {
            return new DAL_BoMon().GetByMaBM(MaBM);
        }


        public bool Insert(DTO_BoMon ob)
        {
            return new DAL_BoMon().Insert(ob);
        }


        public bool Delete(System.Int32 MaBM)
        {
            return new DAL_BoMon().Delete(MaBM);
        }


        public bool Update(DTO_BoMon ob)
        {
            return new DAL_BoMon().Update(ob);
        }

    }
}
