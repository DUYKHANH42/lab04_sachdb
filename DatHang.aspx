<%@ Page Title="" Language="C#" MasterPageFile="~/01.Master" AutoEventWireup="true" CodeBehind="DatHang.aspx.cs" Inherits="lab04_sachdb.DatHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="carousel" runat="server">
</asp:Content>
<asp:Content ID="DatHang" ContentPlaceHolderID="NoiDung" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="section-header align-center">
                <h2 class=" text-center  fw-bold text-succees " style="font-family: roboto;">CHI TIẾT ĐƠN ĐẶT HÀNG
                </h2>
            </div>
        </div>
        <table class="table table-bordered table-hover text-center align-middle ">
            <thead class="table-light text-nowrap">
                <tr>
                    <th>Hình sản phẩm</th>
                    <th>Tên sách</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpCart" runat="server">
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
                                <%# Eval("SoLuong") %> 
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
        <div class="card-footer text-end">
            <strong>Tổng tiền: <b></b></strong>
            <asp:Label ID="lblTongTien" CssClass="text-danger fw-bold" runat="server" Text=""></asp:Label>
        </div>
        <div class="card shadow-sm mt-4">
            <h2 class=" text-center  fw-bold text-succees " style="font-family: roboto;">THÔNG TIN ĐẶT HÀNG</h2>
            <div class="card-body p-0">
                <asp:DetailsView ID="dtvKhachHang"
                    runat="server"
                    CssClass="table table-bordered table-striped mb-0"
                    AutoGenerateRows="False"
                    DataSourceID="dsKH">
                    <Fields>
                        <asp:BoundField DataField="HoTenKH" HeaderText="Họ tên khách hàng" />
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                        <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" />
                        <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt hàng"
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="NgayGiaoHang" HeaderText="Ngày giao hàng dự kiến"
                            DataFormatString="{0:dd/MM/yyyy}" />
                    </Fields>
                    <EmptyDataTemplate> 
                        <div>Không có đơn hàng nào! Hãy bắt đầu mua sắm <asp:HyperLink runat="server" ID="hplMuaSach" NavigateUrl="~/Product.aspx"  Text="tại đây"></asp:HyperLink></div>
                    </EmptyDataTemplate>
                </asp:DetailsView>

            </div>
            <div>
                <asp:Button ID="btnDatHang"
                    runat="server"
                    CssClass="btn btn-info rounded-3"
                    Text="Đặt Hàng" OnClick="btnDatHang_Click"
                     />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsKH" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreDBConnectionString %>"
        SelectCommand="SELECT 
     HoTenKH,
     DiaChi,
     DienThoai AS SoDienThoai,
     GETDATE() AS NgayDatHang,
     DATEADD(day,3,GETDATE()) AS NgayGiaoHang
 FROM KhachHang
 WHERE MaKH = @MaKH">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="MaKH" SessionField="MaKH" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
