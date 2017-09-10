<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="dsbaiviet.aspx.cs" Inherits="THPT_Site.admin.qlbv.dsbaiviet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="title">Quản lý Danh mục</h3>
    <div>

        <table cellpadding="5" cellspacing="5" class="auto-style1">
            <tr>
                <td style="text-align: right">
                    <asp:LinkButton ID="btnThem" runat="server" Font-Bold="True" OnClick="btnThem_Click">+ Thêm mới</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Nhập tiêu đề bài viết:
                    <asp:TextBox ID="txtTuKhoa" runat="server" Width="197px"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="Tìm" Width="44px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chọn thể loại:
                    <asp:DropDownList ID="ddlTheLoai" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="ddlTheLoai_SelectedIndexChanged" Width="189px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdBaiViet" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="data-table" EmptyDataText="Không có dữ liệu" OnPageIndexChanging="grdBaiViet_PageIndexChanging" OnRowCommand="grdBaiViet_RowCommand" PageSize="20" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="MaBV" HeaderText="#Mã BV">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="MaBV" DataNavigateUrlFormatString="baiviet.aspx?act=edit&amp;mbv={0}" DataTextField="TieuDe" HeaderText="Tên bài viết">
                                <ItemStyle Width="400px" />
                            </asp:HyperLinkField>
                            <asp:TemplateField HeaderText="Nổi bật">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# (bool)Eval("NoiBat")==true?"~/admin/images/star-on.png":"~/admin/images/star-off.png" %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hiển thị">
                                <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# (bool)Eval("TrangThai")==true?"~/admin/images/hien.png":"~/admin/images/an2.png" %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenLoai" HeaderText="Thể loại">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NgayCapNhat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày cập nhật">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Xóa">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("MaBV") %>' CommandName="xoa" ImageUrl="~/admin/images/trash-icon.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" />
                        <PagerStyle CssClass="gridview-pagination" HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
