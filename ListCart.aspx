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
            </div>
                <table class="table table-bordered table-hover text-center align-middle ">
                    <thead class="table-light text-nowrap">
                        <tr>
                            <th>Ảnh</th>
                            <th>Tên sách</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpCart" runat="server" OnItemCommand="rpCart_ItemCommand">
                            <ItemTemplate>
                                <tr class="align-top  "> 
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
                                        <asp:TextBox ID="txtSoLuong" min="0"
                                        runat="server"
                                        Text='<%# Eval("SoLuong") %>' 
                                        CssClass="form-control text-center" 
                                        TextMode="Number" />
                                    </td>
                                    <td>
                                        <%# Eval("DonGia", "{0:N0}") %> đ
                                    </td>
                                    <td>
                                    <%# (Convert.ToDecimal(Eval("DonGia")) * Convert.ToInt32(Eval("SoLuong"))).ToString("N0") + " đ" %>
                                    </td>
                                    <td class="text-center">
                                    <div class="text-center text-nowrap mx-2">
                                        <asp:Button ID="btnCapNhat"
                                            runat="server"
                                            Text="Cập Nhật"
                                             Width="120px"
                                            CssClass="btn bg-info rounded-3"
                                            CommandName="update"
                                            CommandArgument='<%# Eval("MaSach") %>' />

                                          <asp:Button ID="btnXoa"
                                            runat="server"
                                            Text="Xóa"
                                            CssClass="btn bg-danger rounded-3"
                                            CommandName="delete"
                                            CommandArgument='<%# Eval("MaSach") %>' />
                                    </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            <div class="card-footer text-end">
                <strong>Tổng tiền: <b></b></strong>
                <asp:Label ID="lblTongTien" CssClass="text-danger fw-bold" runat="server" Text=""></asp:Label>

            </div>
             <div class="card-footer text-center">
                  <asp:Button ID="btnXoaAll"
                   runat="server"
                   Text="Xóa Toàn Bộ"
                   CssClass="btn bg-danger rounded-3"
                   CommandName="deleteAll" OnClick="btnXoaAll_Click" />
                 <asp:Button ID="btnDatHang"
                             CssClass="btn bg-info rounded-3"
                             runat="server" Text="Đặt Hàng" OnClick="btnDatHang_Click" />
            </div>
    </div>
</asp:Content>
