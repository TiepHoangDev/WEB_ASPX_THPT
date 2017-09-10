<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTaiNguyenHocTap.ascx.cs" Inherits="THPT_Site.controls.ucTaiNguyenHocTap" %>
<style>
    #ucTaiNguyenHocTap_DataList1 td{
        height:55px;
    }
    .img-50{
        width: 50px;
        height: 50px;
        border: 1px #0094ff solid;
        float: left;
        margin: 2px;
    }
</style>
<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
        <img src='<%# Eval("Anh","/upload/tintuc/{0}") %>' alt="Alternate Text" class="img-50" runat="server" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaBV","{0}") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>