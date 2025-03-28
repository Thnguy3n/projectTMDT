<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/25/2024
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tablist.jsp" %>
<c:url var="categoryAPI" value="/api/category"/>
<html>
<head>
    <title>Edit category</title>
</head>
<body>
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <div class="container-fluid">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <div class="breadcrumbs" id="breadcrumbs">
                            <script type="text/javascript">
                                try {
                                    ace.settings.check('breadcrumbs', 'fixed')
                                } catch (e) {
                                }
                            </script>

                            <ul class="breadcrumb">
                                <li>
                                    <i class="ace-icon fa fa-home home-icon"></i>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">Dashboard</li>
                            </ul><!-- /.breadcrumb -->
                        </div>

                        <div class="page-content">
                            <div class="page-header">
                                <h1 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                                    Sửa đổi hoặc thêm danh mục
                                </h1>
                            </div><!-- /.page-header -->
                            <form:form modelAttribute="categoryEdit" id="listForm" method="GET" var="item"
                                       cssStyle="margin-left: 30px;">
                                <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                                    <div class="col-xs-12">
                                        <form action="" class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <div class="col-xs-3">Tên danh mục</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="name"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-3"></label>
                                                <div class="col-xs-9">
                                                    <c:if test="${not empty categoryEdit.id}">
                                                        <button type="button" class="btn btn-primary"
                                                                id="btnAddOrUpdateCategory">Cập
                                                            nhật danh mục
                                                        </button>
                                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy
                                                            thao
                                                            tác
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${empty categoryEdit.id}">
                                                        <button type="button" class="btn btn-primary"
                                                                id="btnAddOrUpdateCategory">Thêm
                                                            mới danh mục
                                                        </button>
                                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy
                                                            thao
                                                            tác
                                                        </button>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <form:hidden path="id" id="categoryId"/>
                                        </form>

                                    </div>
                                </div>

                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script>
    $('#btnAddOrUpdateCategory').click(function (e) {
        e.preventDefault();

        var data = {};
        var formData = $('#listForm').serializeArray();

        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        })
        addOrUpdate(data);
    });

    function addOrUpdate(data) {
        $.ajax({
            type: "POST",
            url: "${categoryAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                Swal.fire({
                    title: 'Thành công!',
                    text: 'Đơn hàng của bạn đã được đặt thành công.',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    timer: 3000
                }).then(() => {
                    window.location.href = "/admin/category-list";
                });
            },
            error: function (respond) {
                console.log("fail");
                console.log(respond);
            }
        });
    }

    $('#btnCancel').click(function () {
        window.location.href = "/admin/category-list";
    });
</script>
</body>
</html>