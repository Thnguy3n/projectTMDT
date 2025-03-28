<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/4/2024
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    /* Tổng thể thiết kế của trang */
    .page-container {
        font-family: Arial, sans-serif;
        background-color: #f4f7fa;
        padding: 20px;
    }

    /* Container chứa form */
    .form-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin: 25px auto;
    }

    /* Tiêu đề form */
    .form-title {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    /* Nhãn cho các input */
    .form-label {
        font-size: 16px;
        color: #555;
        margin-bottom: 8px;
        display: block;
    }

    /* Các input number và select */
    .form-input, .form-select {
        width: 100%;
        padding: 12px; /* Tăng padding để form rộng hơn */
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    /* Focus vào input và select */
    .form-input:focus, .form-select:focus {
        outline: none;
        border-color: #007BFF;
    }

    /* Nút bấm */
    .form-button {
        width: 100%;
        padding: 14px; /* Tăng padding để nút bấm lớn hơn */
        background-color: #007BFF;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    /* Hover vào nút bấm */
    .form-button:hover {
        background-color: #0056b3;
    }

    /* Nhóm form */
    .form-group {
    }

    /* Xếp các form-group thành hàng ngang */
    .form-row {
        display: flex;
        gap: 20px; /* Khoảng cách giữa các form group */
        justify-content: space-between;
        flex-wrap: wrap;
    }

    /* Đảm bảo mỗi input chiếm khoảng 32% chiều rộng */
    .form-group-inline {
        flex: 1 1 32%; /* Mỗi item chiếm khoảng 1/3 chiều rộng */
        min-width: 250px; /* Đảm bảo không bị quá nhỏ */
    }

    /* Định dạng cho select */
    .form-select {
        cursor: pointer;
    }

</style>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Thống kê doanh thu</h1>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                        class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
            </div>
            <div class="form-container">
                <form action="/admin/home" method="get">
                    <div class="form-row">
                        <div class="form-group form-group-inline">
                            <label for="year" class="form-label">Năm:</label>
                            <input type="number" name="year" id="year" class="form-input" value="${year}" required>
                        </div>

                        <div class="form-group form-group-inline">
                            <label for="month" class="form-label">Tháng:</label>
                            <input type="number" name="month" id="month" class="form-input" value="${month}"
                                   placeholder="Tất cả" min="1" max="12">
                        </div>

                        <div class="form-group form-group-inline">
                            <label for="status" class="form-label">Trạng Thái:</label>
                            <select name="status" id="status" class="form-select">
                                <option value="Doanh thu">Doanh thu</option>
                                <option value="Chưa thanh toán">Chưa thanh toán</option>
                                <option value="Đang xử lý">Đang xử lý</option>
                                <option value="Đã giao hàng">Đã giao hàng</option>
                            </select>
                        </div>
                        <button type="submit" class="form-button" onclick="fetchRevenue()">Xem Thống Kê</button>

                    </div>

                    <%--                    <button type="submit" class="form-button">Xem Thống Kê</button>--%>
                </form>
            </div>

            <!-- Content Row -->
            <div class="row">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <c:forEach var="entry" items="${monthlyRevenue}">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Doanh thu tháng ${entry.key}
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <fmt:formatNumber value="${entry.value}" pattern="#,###"/> VNĐ
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Thống kê số lượng hóa đơn
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            ${orderCount}
                                        </div>
                                    </div>

                                </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Thống kê số lượng sản phẩm
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            ${ProductCount}
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Content Row -->

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your Website 2021</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
    function fetchRevenue() {
        const year = new Date().getFullYear(); // Giả sử là năm hiện tại, bạn có thể lấy từ input nếu muốn
        const month = document.getElementById("month").value || null; // Lấy giá trị tháng nếu có
        const status = document.getElementById("status").value;
        fetch(`/admin/monthly-revenue?year=${year}&month=${month}&status=${status}`)
            .then(response => response.json())
            .then(data => {
                displayRevenueData(data);
            })
            .catch(error => console.error("Error fetching data:", error));
    }

    function combineRevenueData(data1, data2) {
        const revenueMap = new Map();
        data1.forEach(item => {
            revenueMap.set(item.month, item.totalRevenue);
        });
        data2.forEach(item => {
            if (revenueMap.has(item.month)) {
                revenueMap.set(item.month, revenueMap.get(item.month) + item.totalRevenue);
            } else {
                revenueMap.set(item.month, item.totalRevenue);
            }
        });
        return Array.from(revenueMap, ([month, totalRevenue]) => ({month, totalRevenue}));
    }

    function displayRevenueData(data) {
        let resultHtml = "<table><tr><th>Tháng</th><th>Doanh thu</th></tr>";
        data.forEach(item => {
            resultHtml += `<tr><td>${item.month}</td><td>${item.totalRevenue}</td></tr>`;
        });
        resultHtml += "</table>";

        document.getElementById("revenueResult").innerHTML = resultHtml;
    }

</script>
<!-- Logout Modal-->
