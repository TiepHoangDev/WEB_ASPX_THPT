
using System;
using System.Collections.Generic;

namespace DTO
{
    public class DTO_TrangLienKet
    {
        
public System.Int32 ID { get; set; }
public string TaiKhoan { get; set; }
public string Target { get; set; }
public string TenSite { get; set; }
public System.Boolean TrangThai { get; set; }
public string URL { get; set; }
public DTO_NguoiDung DTO_NguoiDungJoin { get; set; }
    }
}
