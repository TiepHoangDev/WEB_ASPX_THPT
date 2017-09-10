using System;
using System.Collections.Generic;

namespace DTO
{
    public class DTO_HinhAnh
    {
        public string AnhLon { get; set; }
        public string AnhNho { get; set; }
        public System.Int32 ID { get; set; }
        public System.Int32? IDAlbum { get; set; }
        public DTO_Album DTO_AlbumJoin { get; set; }
    }
}
