using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DTO
{
    public class DTO_BaiViet
    {
        public int MaBV { get; set; }
        public string TieuDe { get; set; }
        public string TomTat { get; set; }
        public string NoiDung { get; set; }
        public bool NoiBat { get; set; }
        public bool TrangThai { get; set; }
        public string Anh { get; set; }
        public DateTime NgayCapNhat { get; set; }
        public int MaLoai { get; set; }
        public string TaiKhoan { get; set; }
    }
}
