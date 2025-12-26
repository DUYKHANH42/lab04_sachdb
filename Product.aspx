<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="lab04_sachdb.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="carousel" runat="server"></asp:Content>
<asp:Content ID="TrangChu" ContentPlaceHolderID="NoiDung" runat="server">
    <section id="featured-books" class="py-5 my-5">
        <div class="container">
            <div class="row">
                <asp:FormView
                    ID="fvChuDe"
                    runat="server"
                    DataSourceID="dsChuDe">
                    <ItemTemplate>
                        <div class="section-header align-center">
                            <h2 class="section-title text-center">Sách <%# Eval("TenChuDe") %>
                            </h2>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <div class="product-list" data-aos="fade-up">
                    <div class="row">
                        <asp:ListView ID="lstSach" runat="server" DataKeyNames="MaSach" DataSourceID="dsSach" OnSelectedIndexChanged="lstSach_SelectedIndexChanged">
                            <ItemTemplate>
                                <div class="col-md-4 mb-4">
                                    <div class="product-item">
                                        <figure class="product-style">
                                            <img src="assets/<%# Eval("AnhBia") %>"
                                                alt="Books" style="object-fit: cover;"
                                                class="img-fluid product-item" />

                                            <button type="button"
                                                class="add-to-cart"
                                                data-product-tile="add-to-cart" data-masach="<%# Eval("MaSach") %>">
                                                <i class="icon icon-clipboard"></i>Add to Cart
                                            </button>
                                        </figure>

                                        <figcaption>
                                            <h3 style="font-family: roboto"><%# Eval("TenSach") %></h3>
                                            <div class="item-price">
                                                Giá bán: <span style="color: red; font-weight: bold"><%# Eval("Dongia", "{0:N0} đ") %></span>
                                            </div>
                                           <asp:HyperLink 
                                            runat="server"
                                            NavigateUrl='<%# "~/Detail.aspx?masach=" + Eval("masach") %>'
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
                                <div class="row">
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </div>

                                <div class="text-center mt-4">
                                    <asp:Button 
                                        ID="btnLoadMore"
                                        runat="server"
                                        Text="Xem thêm"
                                        CssClass="btn btn-info" OnClick="btnLoadMore_Click" />
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreDBConnectionString %>"
        ProviderName="<%$ ConnectionStrings:BookStoreDBConnectionString.ProviderName %>"
        SelectCommand="SELECT top 3 * FROM [Sach] WHERE ([MaCD] = @MaCD) order by MaSach">
        <SelectParameters>
            <asp:QueryStringParameter  DefaultValue="5" Name="MaCD" QueryStringField="macd" Type="Int32" />
           
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsChuDe" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreDBConnectionString %>"
        ProviderName="<%$ ConnectionStrings:BookStoreDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ChuDe] WHERE ([MaCD] = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="MaCD" QueryStringField="macd" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
