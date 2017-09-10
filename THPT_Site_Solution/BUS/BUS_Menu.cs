
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_Menu
    {

        public List<DTO_Menu> GetAll()
        {
            return new DAL_Menu().GetAll();
        }


        public DTO_Menu GetByID(System.Int32 ID)
        {
            return new DAL_Menu().GetByID(ID);
        }


        public bool Insert(DTO_Menu ob)
        {
            return new DAL_Menu().Insert(ob);
        }


        public bool Delete(System.Int32 ID)
        {
            return new DAL_Menu().Delete(ID);
        }


        public bool Update(DTO_Menu ob)
        {
            return new DAL_Menu().Update(ob);
        }

    }
}
