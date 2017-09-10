<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="THPT_Site._default" %>

<%@ Register Src="~/controls/ucThongBaoTruong.ascx" TagPrefix="uc1" TagName="ucThongBaoTruong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/jquery-1.11.3.min.js"></script>
    <link href="slider/css/animated.css" rel="stylesheet" />
    <link href="slider/assets/css/jSlider.css" rel="stylesheet" />
    <script src="slider/assets/js/jquery.jSlider.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="slide-show">
        <div id="slider1" class="jSlider" data-delay="0">
            <asp:Repeater ID="rptTinNoiBat" runat="server">
                <ItemTemplate>
                    <div>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("MaBV","?id={0}") %>' runat="server">
                            <h3 class="appear-top">'<%# Eval("TieuDe") %></h3>
                            <asp:Image ID="Image1" ImageUrl='<%# Eval("Anh", "~/upload/tintuc/{0}") %>' runat="server" />
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="annoucement annoucement-1">
        <h4>Thông báo trường</h4>
        <uc1:ucThongBaoTruong runat="server" ID="ucThongBaoTruong" />
    </div>
    <div class="annoucement annoucement-2">
        <h4>Thông báo học sinh</h4>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }

            .auto-style2 {
                width: 37px;
            }
        </style>

        <asp:DataList ID="dtThongBaoHocSinh" runat="server">
            <ItemTemplate>
                <table cellpadding="5" cellspacing="5" class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl='<%# Eval("Anh","~/upload/tintuc/{0}") %>' Width="36px" />
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaBV","") %>' Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>

    </div>
    <div class="content-box">
        <h4>Thông tin giáo dục</h4>
        <div class="content-box-body">
            <table>
                <tr>
                    <asp:Repeater ID="rptThongtinGiaoDuc" runat="server">
                        <ItemTemplate>
                            <td class="thumb-news">

                                <a href="#"><%# Eval("TieuDe") %></a>
                                <p class="time"><%# Eval("NgayCapNhat") %></p>
                                <img src='<%# Eval("Anh","/upload/tintuc/{0}") %>' />
                                <p>
                                    <%#Eval("TomTat") %>
                                </p>
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: right">
                        <a class="viewall" href="#">Xem tất cả</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="content-box">
        <h4>Thư viện ảnh</h4>
        <div class="content-box-body">
            <asp:DataList ID="dtAlbum" runat="server" CssClass="table-gallery" RepeatColumns="4">
                <ItemTemplate>
                    <img src='<%# Eval("Anh","/upload/album/{0}") %>' />
                    <a href="#"><%#Eval("TenAlbum") %></a>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
