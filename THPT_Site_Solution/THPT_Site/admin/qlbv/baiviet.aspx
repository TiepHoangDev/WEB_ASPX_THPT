<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="baiviet.aspx.cs" Inherits="THPT_Site.admin.qlbv.baiviet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: small;
        }
        .auto-style3 {
            font-size: medium;
            color: #FF0000;
        }
        .auto-style4 {
            font-size: x-small;
            color: #669999;
        }
    </style>

    <script src="../../ckeditor/ckeditor.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="5" cellspacing="5" class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="5" cellspacing="5" class="auto-style1">
                    <tr>
                        <td class="auto-style2" colspan="2" style="text-align: right">
                            <asp:Button ID="btnLuu" runat="server" ForeColor="Black" Height="25px" OnClick="btnLuu_Click" Text="Lưu bài viết" Width="109px" />
                            &nbsp;<asp:Button ID="btnQuayLai" runat="server" ForeColor="Black" Height="25px" OnClick="btnQuayLai_Click" Text="Quay lại" Width="62px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="2" style="vertical-align: top">
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" style="font-size: medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Tiêu đề <span class="auto-style3">(*)</span></td>
                        <td>
                            <asp:TextBox ID="txtTieuDe" runat="server" Height="23px" MaxLength="150" Width="624px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">Tóm tắt</td>
                        <td>
                            <asp:TextBox ID="txtTomTat" runat="server" Font-Names="Arial" Height="83px" MaxLength="300" TextMode="MultiLine" Width="626px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Nổi bật</td>
                        <td>
                            <asp:DropDownList ID="ddlNoiBat" runat="server" Height="22px">
                                <asp:ListItem Value="true">Yes</asp:ListItem>
                                <asp:ListItem Value="false">No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Trạng thái</td>
                        <td>
                            <asp:DropDownList ID="ddlTT" runat="server" Height="22px" Width="76px">
                                <asp:ListItem Value="true">Hiện</asp:ListItem>
                                <asp:ListItem Value="false">Ẩn</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Ảnh đại diện</td>
                        <td>
                            <asp:FileUpload ID="fuAnh" runat="server" />
                            &nbsp;<asp:Button ID="btnUpload" runat="server" Height="25px" OnClick="btnUpload_Click" Text="Tải lên" Width="56px" />
                            &nbsp;<asp:Label ID="lblUploadText" runat="server" Font-Bold="True" style="font-size: x-small"></asp:Label>
                            <br />
                            <span class="auto-style4">(Dung lượng ảnh không quá 1MB)</span></td>
                    </tr>
                    <tr>
                        <td>Thể loại</td>
                        <td>
                            <asp:DropDownList ID="ddlTheLoai" runat="server" Height="21px" Width="195px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">Nội dung</td>
                        <td>
                            <textarea id="ckNoiDung" runat="server" rows="10" cols="30"></textarea>
                            <script type="text/javascript">
                                CKEDITOR.replace('ckNoiDung');
                            </script>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
