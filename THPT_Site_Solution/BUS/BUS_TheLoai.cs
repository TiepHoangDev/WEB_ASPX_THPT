using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BUS
{
    public class BUS_TheLoai
    {
        public DataTable LayDSTheLoai()
        {
            DAL.DAL_TheLoai tl = new DAL.DAL_TheLoai();
            return tl.LayDanhSachTheLoai();
        }

        public List<DTO_TheLoai> GetAll()
        {
            return new DAL_TheLoai().GetAll();
        }


        public DTO_TheLoai GetByMaLoai(System.Int32 MaLoai)
        {
            return new DAL_TheLoai().GetByMaLoai(MaLoai);
        }


        public bool Insert(DTO_TheLoai ob)
        {
            return new DAL_TheLoai().Insert(ob);
        }


        public bool Delete(System.Int32 MaLoai)
        {
            return new DAL_TheLoai().Delete(MaLoai);
        }


        public bool Update(DTO_TheLoai ob)
        {
            return new DAL_TheLoai().Update(ob);
        }
    }
}
