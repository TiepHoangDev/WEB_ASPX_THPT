<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLichLamViec.ascx.cs" Inherits="THPT_Site.controls.ucLichLamViec" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 15px;
    }
</style>

<asp:DataList ID="dtlLichLamViec" runat="server">
    <ItemTemplate>
        <table cellpadding="5" cellspacing="5" class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/calendar.png" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaBV","~/lichlamviec/chitietlichlamviec.aspx?id={0}") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

