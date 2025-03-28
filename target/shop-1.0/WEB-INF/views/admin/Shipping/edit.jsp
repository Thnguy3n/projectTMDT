<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/6/2025
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
        <div class="d-flex">
            <div class="main-content p-4 w-100">
                <div class="d-flex justify-content-between align-items-center ">
                    <h2>Thêm mới phương thức vận chuyển</h2>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <form:form modelAttribute="shippingMethodDTO" method="GET" id="shipmentForm"
                                        style="padding: 10px">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Tên phương thức</label>
                                        <form:input class="form-control" path="title"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Giá cơ bản</label>
                                        <form:input class="form-control" path="basefee"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Mô tả</label>
                                        <form:textarea class="form-control" path="description" cssStyle="height: 350px"/>
                                    </div>
                                </div>
                            </form:form>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                        href="/admin/shipping">Quay về
                                </button>
                                <button type="submit" id="btnAddShippingMethod" class="btn btn-primary">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $('#btnAddShippingMethod').click(function () {
        var data = {};
        var formData = $('#shipmentForm').serializeArray();

        $.each(formData, function (i, e) {
            if ('' !== e.value && null != e.value) {
                data['' + e.name + ''] = e.value;
            }

        });
        addOrUpdate(data);

        function addOrUpdate(data) {
            $.ajax({
                type: "POST",
                url: "/api/shipping",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function (respond) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Thêm mới phương thức vận chuyển.',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 3000
                    }).then(() => {
                        window.location.href = "/admin/shipping";
                    });
                },
                error: function (respond) {
                    let errorMessages = '';
                    if (respond.responseJSON) {
                        const errors = respond.responseJSON;
                        for (let field in errors) {
                            if (errors.hasOwnProperty(field)) {
                                errorMessages += errors[field] + "<br>";
                            }
                        }
                    } else {
                        errorMessages = "Lỗi không xác định.";
                    }

                    Swal.fire({
                        title: 'Lỗi!',
                        html: errorMessages,
                        icon: 'error',
                        confirmButtonText: 'OK',
                        timer: 10000
                    });
                }
            });
        };

        $('#btnCancel').click(function () {
            window.location.href = "/admin/shipping";
        });
    })
</script>
