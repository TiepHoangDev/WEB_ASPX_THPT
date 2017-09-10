<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="dslienhe.aspx.cs" Inherits="THPT_Site.admin.qllh.dslienhe" %>

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
    <h3 class="title">Quản lý liên hệ</h3>
    <div>
        <table cellpadding="5" cellspacing="5" class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Tìm kiếm Người gửi:
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
                            <asp:BoundField DataField="NgayGui" HeaderText="#Ngày gửi">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Email" HeaderText="#Email">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>

                             <asp:BoundField DataField="NguoiGui" HeaderText="#Người gửi">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>

                            <asp:BoundField DataField="TieuDe" HeaderText="#Tiêu đề">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>

                            <asp:BoundField DataField="NoiDung" HeaderText="#Nội dung">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>

                            <asp:BoundField DataField="DienThoai" HeaderText="#Điện thoại">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Xóa">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ID") %>' 
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
