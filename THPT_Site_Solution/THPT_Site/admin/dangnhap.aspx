<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="THPT_Site.admin.dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập hệ thống</title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            border: 1px solid #c30707;
        }
        .auto-style2 {
            width: 127px;
        }
        .auto-style3 {
            height: 24px;
        }
        .auto-style4 {
            height: 36px;
        }
        .auto-style5 {
            color: #FFFFFF;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-top: 100px">
    
        <table align="center" cellpadding="2" cellspacing="5" class="auto-style1" style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
            <tr>
                <td colspan="2" class="auto-style4" style="text-align: left; background-color: #D5421E">

                    <span class="auto-style5"><strong>&nbsp; Đăng nhập hệ thống</strong></span>&nbsp;</td>
            </tr>
            
            <tr>
                <td class="auto-style2" rowspan="5" style="text-align: center; padding-right: 10px;">
                    <asp:Image ID="Image1" runat="server" Height="142px" ImageUrl="~/admin/images/dang nhap.png" Width="144px" />
                </td>
                <td>Tên đăng nhập</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtTaiKhoan" runat="server" Width="260px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Mật khẩu</td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: center">
                    <asp:TextBox ID="txtMatKhau" runat="server" Width="261px" TextMode="Password"></asp:TextBox>
                </td>                
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="btnLogin" runat="server" ImageUrl="~/admin/images/login-button.png" OnClick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" style="font-size: small"></asp:Label>
                </td>
            </tr>
        </table>    
    </div>
    </form>
</body>
</html>
