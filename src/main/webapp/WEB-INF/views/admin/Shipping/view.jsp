<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/6/2025
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <div class="d-flex">
            <div class="main-content p-4 w-100">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>Quản lý tiền phương thức vận chuyển</h2>
                    <a href="/admin/shipping-edit">
                        <button class="btn btn-primary" >
                            <i class="bi bi-plus-circle me-2"></i>Thêm mới
                        </button>
                    </a>

                </div>
                <!-- Shipments Table -->
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <display:table name="ShippingMethodDTOs" cellspacing="0" cellpadding="0" requestURI="${ShippingMethodDTOs}"
                                           id="tableList"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;"
                            >

                                <display:column headerClass="text-left" property="title" title="Phương thức vận chuyển"/>
                                <display:column headerClass="text-left" property="basefee" title="Phí vận chuyển"/>
                                <display:column headerClass="text-left" property="createdDate" title="Ngày tạo"/>
                                <display:column headerClass="text-left" property="createdBy" title="Người tạo"/>
                                <display:column title="Thao tác">
                                    <a href="/admin/shipping-edit-${tableList.id}">
                                        <button class="btn btn-xs btn-info">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </button>
                                    </a>
                                    <button class="btn btn-xs btn-danger" title="Xóa sản phẩm"
                                            onclick="deleteShippingMethod(${tableList.id})">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </display:column>
                            </display:table>
                        </div>

                        <!-- Pagination -->
                        <nav class="mt-3">
                            <ul class="pagination justify-content-end">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    function deleteShippingMethod(data) {
        $.ajax({
            type: "DELETE",
            url: "/api/shipping/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                location.reload();
            },
            error: function (respond) {
                console.log("fail");
                location.reload();
            }
        });
    }
</script>