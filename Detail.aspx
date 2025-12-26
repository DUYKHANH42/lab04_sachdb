<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="lab04_sachdb.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="carousel" runat="server">
</asp:Content>
<asp:Content ID="Detaul" ContentPlaceHolderID="NoiDung" runat="server">
    <section id="featured-books" class="py-1 my-1">
        <div class="section-header align-center">
            <h3 class="section-title text-center bg-light fw-bold text-primary border " style="font-family: roboto;">THÔNG TIN CHI TIẾT
            </h3>
        </div>
        <div class="container">
            <div class="product-list" data-aos="fade-up">
                <asp:Repeater ID="rptSach" runat="server" DataSourceID="dsSach">
                    <ItemTemplate>
                        <div class="product-item ">
                            <div class="row">
                                <figure class="product-style col-md-3 mb-4">
                                    <img src="assets/<%# Eval("AnhBia") %>"
                                        alt="Books" style="object-fit: cover;"
                                        class="img-fluid product-item" />
                                </figure>

                                <figcaption class="col-md-8 mb-4 " style="text-align: left">
                                    <h3 style="font-family: roboto">Tên Sách<b>: <%# Eval("TenSach") %> </b></h3>
                                    <h3 style="font-family: roboto">Tên Chủ Đề<b>: <%# Eval("tenchude") %> </b></h3>
                                    <h3 style="font-family: roboto; display: none">mã Chủ Đề<b>: <%# Eval("macd") %> </b></h3>
                                    <h3 style="font-family: roboto">Tên Nhà Xuất Bản<b>: <%# Eval("tennxb") %> </b></h3>
                                    <h3 style="font-family: roboto">Mô tả<b>: <%# Eval("mota") %> </b></h3>
                                    <div class="item-price">
                                        Giá bán: <span style="color: red; font-weight: bold"><%# Eval("Dongia", "{0:N0} đ") %></span>
                                    </div>
                                    <button type="button"
                                        class="add-to-cart btn-danger"
                                        data-product-tile="add-to-cart" data-masach="<%# Eval("MaSach") %>">
                                        <i class="icon icon-clipboard"></i>Add to Cart
                                    </button>
                                </figcaption>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="section-header align-left w-100">
            <h2 class=" text-left bg-light fw-bold text-primary  " style="font-family: roboto;">SÁCH CÙNG CHỦ ĐỀ
            </h2>
        </div>
            <%--<div class="section-header align-left d-block" >
                <h2 class="" style="font-family: roboto;">
                </h2>
            </div>--%>
              <div class="product-list" data-aos="fade-up">
                <asp:ListView ID="lstSach" runat="server" DataKeyNames="MaSach" DataSourceID="dsSachTheoChuDe">
                    <ItemTemplate>
                        <div class="col-md-3 align-left border bg-light">
                            <div class="product-item">
                                <figure class="product-style">
                                    <img src="assets/<%# Eval("AnhBia") %>"
                                        alt="Books"
                                        class="img-fluid product-item " />

                                    <button type="button"
                                        class="add-to-cart"
                                        data-product-tile="add-to-cart">
                                        <i class="icon icon-clipboard"></i>Add to Cart
                                    </button>
                                </figure>

                                <figcaption>
                                    <h4 style="font-family: roboto;" class="book-title"><%# Eval("TenSach") %></h4>
                                    <div class="item-price ">
                                        Giá bán: <span style="color: red; font-weight: bold"><%# Eval("Dongia", "{0:N0} đ") %></span>
                                    </div>
                                    <asp:HyperLink
                                        runat="server"
                                        NavigateUrl='<%# "~/Detail.aspx?masach=" + Eval("masach") +"&macd="+Eval("macd")  %>'
                                        CssClass="btn btn-primary btnDetail"
                                        Text="Xem Chi Tiết" /></figcaption>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div class="col-12 text-center">
                            <p>Không có sách nào.</p>
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div class="row ">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                  </div>

        </div>
    </section>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreDBConnectionString %>"
        ProviderName="<%$ ConnectionStrings:BookStoreDBConnectionString.ProviderName %>"
        SelectCommand="SELECT sach.*,ChuDe.Tenchude, NhaXuatBan.TenNXB 
                       FROM [Sach] inner join ChuDe on Sach.macd = ChuDe.macd
                                   inner join NhaXuatBan on Sach.MaNXB = NhaXuatBan.MaNXB
                       WHERE ([MaSach] = @masach )">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaSach" QueryStringField="masach" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSachTheoChuDe" runat="server"
        ConnectionString='<%$ ConnectionStrings:BookStoreDBConnectionString %>'
        ProviderName='<%$ ConnectionStrings:BookStoreDBConnectionString.ProviderName %>' SelectCommand="SELECT top 5 * FROM [Sach] WHERE ([MaCD] = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="macd" Name="MaCD" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
