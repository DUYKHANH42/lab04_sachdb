<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="lab04_sachdb.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="carousel" runat="server">
    <section id="billboard">

        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <button class="prev slick-arrow">
                        <i class="icon icon-arrow-left"></i>
                    </button>

                    <div class="main-slider pattern-overlay">
                        <div class="slider-item">
                            <div class="banner-content">
                                <h2 class="banner-title">Life of the Wild</h2>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet, libero
								ipsum enim pharetra hac. Urna commodo, lacus ut magna velit eleifend. Amet, quis
								urna, a eu.
                                </p>
                                <div class="btn-wrap">
                                    <a href="#" class="btn btn-outline-accent btn-accent-arrow">Read More<i
                                        class="icon icon-ns-arrow-right"></i></a>
                                </div>
                            </div>
                            <!--banner-content-->
                            <img src="assets/main-banner1.jpg" alt="banner" class="banner-image">
                        </div>
                        <!--slider-item-->

                        <div class="slider-item">
                            <div class="banner-content">
                                <h2 class="banner-title">Birds gonna be Happy</h2>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet, libero
								ipsum enim pharetra hac. Urna commodo, lacus ut magna velit eleifend. Amet, quis
								urna, a eu.
                                </p>
                                <div class="btn-wrap">
                                    <a href="#" class="btn btn-outline-accent btn-accent-arrow">Read More<i
                                        class="icon icon-ns-arrow-right"></i></a>
                                </div>
                            </div>
                            <!--banner-content-->
                            <img src="assets/main-banner2.jpg" alt="banner" class="banner-image">
                        </div>
                        <!--slider-item-->

                    </div>
                    <!--slider-->

                    <button class="next slick-arrow">
                        <i class="icon icon-arrow-right"></i>
                    </button>

                </div>
            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="TrangChu" ContentPlaceHolderID="NoiDung" runat="server">
    <section id="featured-books" class="py-5 my-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="section-header align-center">
                        <div class="title">
                            <span>Some quality items</span>
                        </div>
                        <h2 class="section-title">Featured Books</h2>
                    </div>

                    <div class="product-list" data-aos="fade-up">
                        <div class="row">

                            <asp:ListView ID="lstSach" runat="server" DataKeyNames="MaSach" DataSourceID="dsSach">

                                <ItemTemplate>
                                    <div class="col-md-4 mb-4">
                                        <div class="product-item">
                                            <figure class="product-style">
                                                <img src="assets/<%# Eval("AnhBia") %>"
                                                    alt="Books" style="object-fit: cover;"
                                                    class="img-fluid product-item" />

                                                <button type="button"
                                                    class="add-to-cart"
                                                    data-product-tile="add-to-cart">
                                                    Add to Cart
                                                </button>
                                            </figure>

                                            <figcaption>
                                                <h3 style="font-family: roboto"><%# Eval("TenSach") %></h3>
                                                <div class="item-price">
                                                    Giá bán: <span style="color: red; font-weight: bold"><%# Eval("Dongia", "{0:N0} đ") %></span>
                                                </div>
                                                    <asp:Button ID="btnDetail" PostBackUrl="~/Detail.aspx" runat="server" CssClass=" btn btn-center btn-primary btnDetail" Text="Xem Chi Tiết" />
                                            </figcaption>
                                        </div>
                                    </div>
                                </ItemTemplate>

                                <EmptyDataTemplate>
                                    <div class="col-12 text-center">
                                        <p>Không có sách nào.</p>
                                    </div>
                                </EmptyDataTemplate>

                            </asp:ListView>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreDBConnectionString %>"
        ProviderName="<%$ ConnectionStrings:BookStoreDBConnectionString.ProviderName %>"
        SelectCommand="SELECT TOP 6 * FROM [Sach] ORDER BY [Ngaycapnhat] desc"></asp:SqlDataSource>
</asp:Content>
