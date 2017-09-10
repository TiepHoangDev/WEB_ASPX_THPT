
using System;
using System.Collections.Generic;

namespace DTO
{
    public class DTO_BoMon
    {
        public System.Int32 MaBM { get; set; }
        public string MoTa { get; set; }
        public string TaiKhoan { get; set; }
        public string TenBM { get; set; }
        public System.Boolean TrangThai { get; set; }
        public DTO_NguoiDung DTO_NguoiDungJoin { get; set; }
    }
}
