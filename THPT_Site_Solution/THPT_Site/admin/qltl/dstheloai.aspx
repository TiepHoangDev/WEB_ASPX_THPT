﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="dstheloai.aspx.cs" Inherits="THPT_Site.admin.qltl.dslienhe" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="title">Quản lý thể loại</h3>
    <div>

        <table cellpadding="5" cellspacing="5" class="auto-style1">
            <tr>
                <td style="text-align: right">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" OnClick="btnThem_Click">
                        + Thêm mới</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Tìm kiếm tên thể loại:
                    <asp:TextBox ID="TextBox1" runat="server" Width="197px"></asp:TextBox>
                    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="btnTim_Click" Text="Tìm" Width="44px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="data-table" 
                        EmptyDataText="Không có dữ liệu" OnPageIndexChanging="grd_PageIndexChanging" 
                        OnRowCommand="grd_RowCommand" PageSize="20" Width="100%">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="MaLoai" DataNavigateUrlFormatString="theloai.aspx?key={0}"
                                DataTextField="TenLoai" HeaderText="Tên thể loại">
                                <ItemStyle Width="80px" />
                            </asp:HyperLinkField>

                            <asp:BoundField DataField="MoTa" HeaderText="#Mô tả">
                                <ItemStyle Width="400px" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Xóa">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("MaLoai") %>' 
                                        CommandName="xoa" ImageUrl="~/admin/images/trash-icon.png" />
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
