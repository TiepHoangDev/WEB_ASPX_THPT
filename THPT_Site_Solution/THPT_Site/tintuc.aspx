<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tintuc.aspx.cs" Inherits="THPT_Site.tintuc" %>

<%@ Register Src="~/controls/ucThongBaoTruong.ascx" TagPrefix="uc1" TagName="ucThongBaoTruong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/scripts/jquery-1.11.3.min.js"></script>
    <link href="/styles/tintuc.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-box">
        <h4>TIN HOẠT ĐỘNG TRƯỜNG</h4>
        <div class="content-box-body tintuc">
            <ul>
                <asp:Repeater ID="rptTinTuc" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="tittle">
                                <a href='<%# Eval("MaBV","/tintuc.aspx/{0}") %>'>
                                    <h3><%# Eval("TieuDe") %></h3>
                                </a>
                            </div>
                            <div class="tintuc-content">
                                <img src='<%#Eval("Anh","/upload/tintuc/{0}") %>' alt="<%# Eval("TieuDe") %>" />
                                <p><%# Eval("TomTat") %></p>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <%#sPage %>
        </div>
    </div>
</asp:Content>
