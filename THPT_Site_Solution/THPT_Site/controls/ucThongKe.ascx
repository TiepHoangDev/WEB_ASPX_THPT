<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucThongKe.ascx.cs" Inherits="THPT_Site.controls.ucThongKe" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 18px;
    }
</style>

<table cellpadding="5" cellspacing="5" class="auto-style1">
    <tr>
        <td class="auto-style2">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/chart_bar.png" />
        </td>
        <td>
            <asp:Label ID="lblTongLuotTruyCap" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/user.png" />
        </td>
        <td>
            <asp:Label ID="lblTongLuotOnline" runat="server"></asp:Label>
        </td>
    </tr>
</table>

