<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="ListCart.aspx.cs" Inherits="lab04_sachdb.ListCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="carousel" runat="server">
</asp:Content>

<asp:Content ID="GioHang" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="section-header align-center">
                <h2 class=" text-center  fw-bold text-succees " style="font-family: roboto;">GIỎ HÀNG CỦA BẠN
                </h2>
            </div>

            <div class="card-body p-0">
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Ảnh</th>
                            <th>Tên sách</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rpCart" runat="server">
                            <ItemTemplate>
                                <tr class="align-top ">
                                    <td class="text-center" style="width: 120px;">
                                        <img src="assets/<%# Eval("AnhBia") %>"
                                            alt="Books"
                                            class="img-fluid rounded"
                                            style="object-fit: cover; height: 80%; width: 80%;" />
                                    </td>
                                    <td class="text-start">
                                        <%# Eval("TenSach") %>
                                    </td>
                                    <td style="width: 120px;">
                                        <input type="number" min="1" value="<%# Eval("SoLuong") %>"
                                            class="form-control text-center txtSoLuong" />
                                    </td>
                                    <td>
                                        <%# Eval("DonGia", "{0:N0}") %> đ
                                    </td>
                                    <td>
                                    <%# (Convert.ToDecimal(Eval("DonGia")) * Convert.ToInt32(Eval("SoLuong"))).ToString("N0") + " đ" %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>

            <div class="card-footer text-end">
                <strong>Tổng tiền: <b></b></strong>
                <span id="totalMoney" class="text-danger fw-bold"></span>
            </div>
        </div>
    </div>
</asp:Content>
