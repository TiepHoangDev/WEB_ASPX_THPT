<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="THPT_Site.admin._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="title">Truy cập nhanh</h3>
    <div class="dtable">
      <div class="drow">
          <div class="dcell">
              <a href="qlbv/baiviet.aspx?act=add">
                  <img src="images/article-new.png" />
                  <p>Thêm bài viết mới</p>
              </a>
          </div>
          <div class="dcell">
              <a href="qltl/dstheloai.aspx">
                  <img src="images/category.png" />
                  <p>Quản lý thể loại</p>
              </a>
          </div>
          <div class="dcell">
              <a href="#">
                  <img src="images/image_add.png" />
                  <p>Thêm thư viện ảnh</p>
              </a>
          </div>
      </div>  
       <div class="drow">
          <div class="dcell">
              <a href="qllh/dslienhe.aspx">
                  <img src="images/contact.png" />
                  <p>Quản lý liên hệ</p>
              </a>
          </div>
          <div class="dcell">
              <a href="qlbm/dsbomon.aspx">
                  <img src="images/users-icon.png" />
                  <p>Quản lý bộ môn</p>
              </a>
          </div>
           <div class="dcell">
              <a href="qllh/dslienhe.aspx">
                  <img src="images/contact.png" />
                  <p>Quản lý liên kết</p>
              </a>
          </div>
      </div>
        
    </div>
</asp:Content>
