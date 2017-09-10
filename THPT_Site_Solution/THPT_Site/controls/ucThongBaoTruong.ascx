<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucThongBaoTruong.ascx.cs" Inherits="THPT_Site.controls.ucThongBaoTruong" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 37px;
    }
</style>

<asp:DataList ID="dtlThongBaoTruong" runat="server">
    <ItemTemplate>
        <table cellpadding="5" cellspacing="5" class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl='<%# Eval("Anh","~/upload/tintuc/{0}") %>' Width="36px" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaBV","~/thongbao/chitietthongbao.aspx?id={0}") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

