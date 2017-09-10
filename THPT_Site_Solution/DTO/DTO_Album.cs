using System;
using System.Collections.Generic;

namespace DTO
{
    public class DTO_Album
    {
        public string Anh { get; set; }
        public System.Int32 ID { get; set; }
        public string MoTa { get; set; }
        public System.DateTime? NgayCapNhat { get; set; }
        public string TaiKhoan { get; set; }
        public string TenAlbum { get; set; }
        public DTO_NguoiDung DTO_NguoiDungJoin { get; set; }
    }
}
