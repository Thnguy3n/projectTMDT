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
<c:url var="supplierAPI" value="/api/supplier"/>
<html>
<head>
    <title>Edit supplier</title>
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
                                    Sửa đổi hoặc thêm nhà cung cấp
                                </h1>
                            </div><!-- /.page-header -->
                            <form:form modelAttribute="supplierEdit" id="listForm" method="GET" var="item"
                                       cssStyle="margin-left: 30px;">
                                <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                                    <div class="col-xs-12">
                                        <form action="" class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <div class="col-xs-3">Tên nhà cung cấp</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="productName"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Số lượng nhập</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="quantity"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-xs-3"></label>
                                                <div class="col-xs-9">
                                                    <c:if test="${not empty supplierEdit.id}">
                                                        <button type="button" class="btn btn-primary"
                                                                id="btnAddOrUpdateSupplier">Cập
                                                            nhật nhà cung cấp
                                                        </button>
                                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy
                                                            thao
                                                            tác
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${empty supplierEdit.id}">
                                                        <button type="button" class="btn btn-primary"
                                                                id="btnAddOrUpdateSupplier">Thêm
                                                            mới sản phẩm
                                                        </button>
                                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy
                                                            thao
                                                            tác
                                                        </button>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <form:hidden path="id" id="supplierId"/>
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
    $('#btnAddOrUpdateSupplier').click(function (e) {
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
            url: "${supplierAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("success");
            },
            error: function (respond) {
                console.log("fail");
                console.log(respond);
            }
        });
    }

    $('#btnCancel').click(function () {
        window.location.href = "/admin/supplier-list";
    });
</script>
</body>
</html>