<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLienKetWebsite.ascx.cs" Inherits="THPT_Site.controls.ucLienKetWebsite" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 15px;
    }
</style>

<asp:DataList ID="dtLienKetWebsite" runat="server">
    <ItemTemplate>
        <table cellpadding="5" cellspacing="5" class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <img src="/images/link.png" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("URL") %>' Target='<%# Eval("Target") %>' Text='<%# Eval("TenSite") %>'></asp:HyperLink>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>