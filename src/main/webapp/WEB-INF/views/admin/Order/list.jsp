<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/7/2024
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<c:url var="orderListURL" value="/admin/order-list"/>
<c:url var="orderAPI" value="/api/order"/>
<style>
    .tf-pagination-wrap {
        display: flex;
        list-style: none;
        padding: 0;
    }

    .tf-pagination-list li {
        margin: 0 5px;
    }

    .tf-pagination-list li.active a {
        font-weight: bold;
        color: #007bff;
    }

    .pagination-link {
        text-decoration: none;
        color: #333;
        padding: 5px 10px;
    }

    .animate-hover-btn:hover {
        color: #007bff;
        transition: color 0.3s;
    }
</style>
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <form:form modelAttribute="orderSearchRequest" id="listForm" method="GET" var="item">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Quản lý đơn hàng</h1>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách đơn hàng</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <display:table name="orderPageContent" cellspacing="0" cellpadding="0" id="tableList"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column title="<fieldset class='form-group'>
                                <input type='checkbox' id='checkAll' class='check-box-element'>
                                </fieldset>" class="center select-cell" headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="userEntity.fullName"
                                                title="Người đặt"/>
                                <display:column headerClass="text-left" property="fullName" title="Tên người nhận"/>
                                <display:column headerClass="text-left" property="phoneNumber" title="SĐT giao"/>
                                <display:column headerClass="text-left" property="email" title="Email"/>
                                <display:column headerClass="text-left" property="address" title="Địa chỉ giao hàng"/>
                                <display:column headerClass="text-left" property="createdDate" title="Ngày đặt"/>
                                <display:column headerClass="text-left" property="status" title="Trạng thái"/>
                                <display:column title="Thao tác">
                                    <button type="button" class="btn btn-xs btn-info" data-bs-toggle="modal"
                                            data-bs-target="#infoModal" onclick="loadOrderInfo(${tableList.id})">
                                        <i class="ace-icon fa fa-eye"></i>
                                    </button>
                                    <button type="button" class="btn btn-xs btn-info">
                                        <a href="/api/order/${tableList.id}/pdf">PDF</a>
                                    </button>
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger" title="Xóa sản phẩm"
                                                onclick="deleteOrder(${tableList.id})">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </security:authorize>
                                </display:column>
                            </display:table>

                            <ul class="pagination">
                                <c:if test="${currentPage > 0}">
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/admin/order-list?page=${currentPage - 1}&size=${pageSize}"
                                           class="page-link">&laquo;</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a href="${pageContext.request.contextPath}/admin/order-list?page=${i}&size=${pageSize}"
                                           class="page-link">${i + 1}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${currentPage < totalPages - 1}">
                                    <li class="page-item">
                                        <a href="${pageContext.request.contextPath}/admin/order-list?page=${currentPage + 1}&size=${pageSize}"
                                           class="page-link">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--modal view order item--%>
            <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="infoModalLabel">Chi tiết hóa đơn</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="orderDetails">

                        </div>
                        <div class="modal-body" style="font-weight: bold" id="ordertotal">

                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>

        </form:form>
    </div>
</div>
<script>
    function loadOrderInfo(id) {
        fetch(`${orderAPI}/` + id)
            .then(response => response.json())
            .then(data => {
                if (Array.isArray(data)) {
                    let orderDetailsHTML = "";
                    let grandTotal = 0;
                    let shipBasefee = 0;
                    data.forEach(item => {
                        orderDetailsHTML += `
                        <div class="order-item">
                            <p><strong>Tên sản phẩm:</strong> ` + item.productTitle + `</p>
                            <p><strong>Size:</strong> ` + item.size + `</p>
                            <p><strong>Số lượng:</strong> ` + item.quantity + `</p>
                            <p><strong>Giá tiền:</strong> ` + item.price + `</p>
                            <p><strong>Tổng tiền:</strong> ` + item.total + `</p>
                            <hr>
                        </div>
                    `;
                        shipBasefee = item.shipBaseFee
                        grandTotal += item.total;
                    });
                    grandTotal+=shipBasefee;
                    document.getElementById("orderDetails").innerHTML = orderDetailsHTML;
                    document.getElementById("ordertotal").innerHTML =
                        `Phí vận chuyển: ` + shipBasefee.toLocaleString() + ` VND<br>` +
                        `Tổng số tiền: ` + grandTotal.toLocaleString() + ` VND`;
                } else {
                    document.getElementById("orderDetails").innerHTML = "<p>Không có dữ liệu đơn hàng.</p>";
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById("orderDetails").innerHTML = `<p>Không thể tải thông tin đơn hàng.</p>`;
                document.getElementById("ordertotal").innerHTML = "";
            });
    }

    function deleteOrder(id) {
        if (confirm("Bạn có chắc chắn muốn xóa đơn hàng này không?")) {
            $.ajax({
                type: "DELETE",
                url: `${orderAPI}/` + id,
                contentType: "application/json",
                success: function (response) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Đơn hàng của bạn đã được xóa thành công.',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 3000
                    }).then(() => {
                        location.reload();
                    });
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Error Details:", textStatus, errorThrown);
                    Swal.fire({
                        title: 'Thất bại!',
                        text: 'Đã có lỗi xảy ra khi xóa đơn hàng. Vui lòng thử lại.',
                        icon: 'error',
                        confirmButtonText: 'OK',
                        timer: 5000
                    }).then(() => {
                        window.location.href = "/admin/order-list";
                    });
                }
            });
        } else {
            console.log("Người dùng đã hủy xóa.");
        }

    }


</script>