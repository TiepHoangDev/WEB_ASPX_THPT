<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="theloai.aspx.cs" Inherits="THPT_Site.admin.qltl.theloai" %>

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
                            <asp:Button ID="btnLuu" runat="server" ForeColor="Black" Height="25px" OnClick="btnLuu_Click" Text="Lưu" Width="109px" />
                            &nbsp;<asp:Button ID="btnQuayLai" runat="server" ForeColor="Black" Height="25px" OnClick="btnQuayLai_Click" Text="Quay lại" Width="62px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="2" style="vertical-align: top">
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Style="font-size: medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Tên thể loại <span class="auto-style3">(*)</span></td>
                        <td>
                            <asp:TextBox ID="txtTenLoai" runat="server" Height="23px" MaxLength="150" Width="624px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">Mô tả</td>
                        <td>
                            <asp:TextBox ID="txtMoTa" runat="server" Font-Names="Arial" Height="83px" MaxLength="300" TextMode="MultiLine" Width="626px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
