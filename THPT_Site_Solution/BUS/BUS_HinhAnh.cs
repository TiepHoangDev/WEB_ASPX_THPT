
using DAL;
using DTO;
using System;
using System.Collections.Generic;
namespace BUS
{
    public class BUS_HinhAnh
    {

        public List<DTO_HinhAnh> GetAll()
        {
            return new DAL_HinhAnh().GetAll();
        }


        public DTO_HinhAnh ID(System.Int32 ID)
        {
            return new DAL_HinhAnh().GetByID(ID);
        }


        public bool Insert(DTO_HinhAnh ob)
        {
            return new DAL_HinhAnh().Insert(ob);
        }


        public bool Delete(System.Int32 ID)
        {
            return new DAL_HinhAnh().Delete(ID);
        }


        public bool Update(DTO_HinhAnh ob)
        {
            return new DAL_HinhAnh().Update(ob);
        }

    }
}
