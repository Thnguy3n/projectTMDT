<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 2/28/2024
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tablist.jsp" %>
<c:url var="productAPI" value="/api/product"/>
<html>
<head>
    <title>Edit product</title>
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
                                    Sửa đổi hoặc thêm sản phẩm
                                </h1>
                            </div><!-- /.page-header -->
                            <form:form modelAttribute="productEdit" id="listForm" method="GET" var="item"
                                       cssStyle="margin-left: 30px; margin-right: 30px">
                                <div class="row">
                                    <form action="" class="form-horizontal" role="form">
                                        <div class="col-6 ">
                                            <div class="form-group">
                                                <div class="col-xs-3">Tên sản phẩm</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="title"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Giá sản phẩm</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="price"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Ngày giảm giá</div>
                                                <div class="col-xs-9">
                                                    <form:input type="datetime-local" class="form-control"
                                                                path="start_discount"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Discount</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="discount"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 no-padding-right">Hình ảnh</label>
                                                <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                                <div class="col-sm-9">
                                                    <c:if test="${not empty productEdit.image}">
                                                        <c:set var="imagePath" value="/repository${productEdit.image}"/>
                                                        <img src="${imagePath}" id="viewImage" width="300px"
                                                             height="300px">
                                                    </c:if>
                                                    <c:if test="${empty productEdit.image}">
                                                        <img src="/admin/img/defaul.png" id="viewImage" width="300px"
                                                             height="300px">
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 ">
                                            <div class="form-group">
                                                <div class="col-xs-3">Danh mục</div>
                                                <div class="col-xs-9">
                                                    <form:select path="categoryId" class="form-control">
                                                        <form:option value="">---Chọn danh mục---</form:option>
                                                        <form:options items="${category}" itemValue="id"
                                                                      itemLabel="name"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Nhà cung cấp</div>
                                                <div class="col-xs-9">
                                                    <form:select path="supplierId" class="form-control">
                                                        <form:option value="">---Chọn nhà cung cấp---</form:option>
                                                        <form:options items="${supplier}" itemValue="id"
                                                                      itemLabel="productName"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Ngày kết thúc giảm giá</div>
                                                <div class="col-xs-9">
                                                    <form:input type="datetime-local" class="form-control"
                                                                path="end_discount"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Số lượng tồn</div>
                                                <div class="col-xs-9">
                                                    <form:input class="form-control" path="inventory"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-3">Mô tả</div>
                                                <div class="col-xs-9">
                                                    <form:textarea rows="6" class="form-control" path="description"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-xs-3"></label>
                                                <div class="col-xs-9">
                                                    <c:if test="${not empty productEdit.id}">
                                                        <button type="button" class="btn btn-primary"
                                                                id="btnAddOrUpdateProduct">Cập
                                                            nhật sản phẩm
                                                        </button>
                                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy
                                                            thao
                                                            tác
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${empty productEdit.id}">
                                                        <button type="button" class="btn btn-primary"
                                                                id="btnAddOrUpdateProduct">Thêm
                                                            mới sản phẩm
                                                        </button>
                                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy
                                                            thao
                                                            tác
                                                        </button>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <form:hidden path="id" id="productId"/>
                                    </form>
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
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddOrUpdateProduct').click(function () {
        var data = {};
        var formData = $('#listForm').serializeArray();

        $.each(formData, function (i, e) {
            if ('' !== e.value && null != e.value) {
                data['' + e.name + ''] = e.value;
            }

        });
        if ('' !== imageBase64) {
            data['imageBase64'] = imageBase64;
            data['imageName'] = imageName;
        } else {
            var fullSrc = $('#viewImage').attr('src');
            var productIndex = fullSrc.indexOf('/product');
            var result1 = productIndex !== -1 ? fullSrc.substring(productIndex) : fullSrc;
            data['image'] = result1;

        }
        addOrUpdate(data);

        function addOrUpdate(data) {
            $.ajax({
                type: "POST",
                url: "${productAPI}",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function (respond) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Thêm mới sản phẩm thành công.',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 3000
                    }).then(() => {
                        window.location.href = "/admin/product-list";
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
            window.location.href = "/admin/product-list";
        });
    })

    function addOrupdate(data) {
        $.ajax({
            type: "POST",
            url: "${productAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.info("success!");

            },
            error: function (respond) {
                console.info("Fail!")
                console.log(respond);
            }
        });
    }

    $('#bntCancel').click(function () {
        window.location.href = "/admin/product-list";
    });

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>


</body>
</html>
