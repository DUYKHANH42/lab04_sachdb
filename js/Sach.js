function showAlert(title, message, icon = "info") {
    Swal.fire({
        title: title,
        text: message,
        icon: icon,
        confirmButtonColor: "#0963a3"
    });
}

$(document).on("click", ".add-to-cart", function (e) {
    e.preventDefault();
    let maSach = $(this).data("masach");
    if (!maSach) {
        showAlert("Lỗi", "Không tìm thấy mã sách!", "error");
        return;
    }
    $.ajax({
        url: "Detail.aspx/AddToCart", 
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ maSach: maSach }),

        success: function (res) {
            if (res.d && res.d.success) {
                showAlert("Thành công", res.d.message, "success");
                let count = document.getElementById("cartCount");
                let current = parseInt(count.innerText.replace(/[()]/g, '')) || 0;
                count.innerText = "(" + (current + 1) + ")";
               
            } else {
                showAlert("Lỗi", res.d.message || "Không thể thêm vào giỏ hàng", "error");
            }
        },

        error: function () {
            showAlert("Lỗi", "Không thể kết nối server!", "error");
        }
    });
});
