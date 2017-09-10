using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BUS
{
    public class clsCommon
    {
        //Phương thức lấy về top (5, 10, 20, ..) mẫu tin (record) từ nguồn dữ liệu là DataTable
        public static DataTable LayTopMauTin(DataTable dt, int top)
        {
            return dt.Rows.Cast<System.Data.DataRow>().Take(top).CopyToDataTable();
        }
    }
}
