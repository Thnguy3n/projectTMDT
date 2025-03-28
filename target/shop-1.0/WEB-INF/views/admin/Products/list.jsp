<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/6/2024
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<c:url var="productListURL" value="/admin/product-list"/>
<c:url var="productAPI" value="/api/product"/>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <form:form modelAttribute="productRequest" id="listForm" method="GET" var="item">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Quản lý sản phẩm</h1>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách sản phẩm</h6>
                    </div>
                    <div class="card-header py-3">
                        <h6 class="m-0 ">
                            <a href="/admin/product-edit" class="btn btn-success btn-icon-split">
                                <span class="text">Thêm mới sản phẩm </span>
                            </a></h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <display:table name="product" cellspacing="0" cellpadding="0" requestURI="${productListURL}"
                                           id="tableList"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;"
                            >
                                <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="title" title="Tên sản phẩm"/>
                                <display:column headerClass="text-left" property="categoryName" title="Danh mục"/>
                                <display:column headerClass="text-left" property="inventory" title="Hàng tồn kho"/>
                                <display:column headerClass="text-left" property="supplierName" title="Nhà cung cấp"/>
                                <display:column headerClass="text-left" title="Giảm giá">
                                    <c:out value="${tableList.discount}"/>%
                                </display:column>
                                <<display:column headerClass="text-left" title="Giá tiền">
                                <c:out value="${tableList.price}"/> VNĐ
                            </display:column>
                                <display:column title="Thao tác">
                                    <a href="/admin/product-edit-${tableList.id}">
                                        <button type="button" class="btn btn-xs btn-info">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </button>
                                    </a>
                                    <button class="btn btn-xs btn-danger" title="Xóa sản phẩm"
                                            onclick="deleteProduct(${tableList.id})">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </display:column>
                            </display:table>
                            <input type="hidden" name="Product" id="productId" value="">
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
        </form:form>


    </div>
    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Đồ án phầm mềm 2024</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
<script>
    $('#btnSearchProduct').click(function (e) {
        e.preventDefault();
        $('#listForm').submit()
    });

    function deleteProduct(id) {
        var productId = [id];
        deleteProducts(productId);
    };

    $('#btnDeleteProduct').click(function (e) {
        e.preventDefault();
        var data = {};
        data['productId'] = $('#productId').val();
        var productIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteProducts(productIds);
    });

    function deleteProducts(data) {
        $.ajax({
            type: "DELETE",
            url: "${productAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
            },
            error: function (respond) {
                console.log("fail");
                window.location.href = "<c:url value="/admin/product-list?message=success"/> ";
            }
        });
    }
</script>

