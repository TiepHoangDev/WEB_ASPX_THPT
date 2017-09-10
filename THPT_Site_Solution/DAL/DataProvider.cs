using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DataProvider
/// </summary>
public class DataProvider
{
	//Khai báo đối tượng kết nối
    static SqlConnection sqlConn;
  //Phương thức mở kết nối
    public static void Open()
    {
        sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
        if (sqlConn.State != ConnectionState.Open)
            sqlConn.Open();
    }
    //Phương thức đóng kết nối
    public static void Close()
    {
        if (sqlConn.State != ConnectionState.Closed)
            sqlConn.Close();
    }
    //Phương thức lấy dữ liệu từ một bảng

    public static DataTable GetData(string SQL, CommandType cmdType)
    {
        //Khai báo biến DataTable dùng để lưu trữ dữ liệu
        DataTable dt = new DataTable();
        //Mở kết nối
        Open();
        //Khai báo đối tượng SqlCommand
        SqlCommand sqlCmd = new SqlCommand();
        sqlCmd.Connection = sqlConn;
        sqlCmd.CommandText = SQL;
        sqlCmd.CommandType = cmdType;
        
        //Khai báo đối tượng SqlDataAdapter
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        //Gọi phương thức Fill của SqlDataAdapter để lấy dữ liệu
        da.Fill(dt);
        //Đóng kết nối
        Close();
        //Trả kết quả về cho phương thức
        return dt;
    }

    public static DataTable GetData(string SQL, CommandType cmdType, List<SqlParameter> paras)
    {
        //Khai báo biến DataTable dùng để lưu trữ dữ liệu
        DataTable dt = new DataTable();
        //Mở kết nối
        Open();
        //Khai báo đối tượng SqlCommand
        SqlCommand sqlCmd = new SqlCommand();
        sqlCmd.Connection = sqlConn;
        sqlCmd.CommandText = SQL;
        sqlCmd.CommandType = cmdType;

        sqlCmd.Parameters.AddRange(paras.ToArray());

        //Khai báo đối tượng SqlDataAdapter
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        //Gọi phương thức Fill của SqlDataAdapter để lấy dữ liệu
        da.Fill(dt);
        //Đóng kết nối
        Close();
        //Trả kết quả về cho phương thức
        return dt;
    }

    //Phương thức cập nhật dữ liệu: thêm, sửa, xóa
    //Phương thức trả về dữ liệu kiểu bool 
    //xác nhận thành công hay không
    public static bool UpdateData(string SQL, CommandType cmdType)
    {
        bool result = false;
        SqlCommand sqlCmd = new SqlCommand();
        //Mở kết nối
        Open();
        //Gán các thuộc tính cho đối tượng Command
        sqlCmd.Connection = sqlConn;
        sqlCmd.CommandType = cmdType;
        sqlCmd.CommandText = SQL;
        
        //Thực thi với phương thức ExecuteNonQuery
        if (sqlCmd.ExecuteNonQuery() > 0)
            result = true;
        else
            result = false;
        //Đóng kết nối
        Close();
        //Trả kết quả về cho phương thức
        return result;
    }

    public static bool UpdateData(string SQL, CommandType cmdType, List<SqlParameter> paras)
    {
        bool result = false;
        SqlCommand sqlCmd = new SqlCommand();
        //Mở kết nối
        Open();
        //Gán các thuộc tính cho đối tượng Command
        sqlCmd.Connection = sqlConn;
        sqlCmd.CommandType = cmdType;
        sqlCmd.CommandText = SQL;       
        sqlCmd.Parameters.AddRange(paras.ToArray());
        //Thực thi với phương thức ExecuteNonQuery
        if (sqlCmd.ExecuteNonQuery() > 0)
            result = true;
        else
            result = false;
        //Đóng kết nối
        Close();
        //Trả kết quả về cho phương thức
        return result;
    }
}