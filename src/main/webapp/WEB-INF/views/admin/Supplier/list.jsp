<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/25/2024
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<c:url var="supplierListURL" value="/admin/supplier-list"/>
<c:url var="supplierAPI" value="/api/supplier"/>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <form:form modelAttribute="supplier" id="listForm" method="GET" var="item">


            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Quản lý nhà cung cấp</h1>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách nhà cung cấp</h6>
                    </div>
                    <div class="card-header py-3">
                        <h6 class="m-0 ">
                            <a href="/admin/supplier-edit" class="btn btn-success btn-icon-split">
                                <span class="text">Thêm mới nhà cung cấp </span>
                            </a></h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <display:table name="supplier1" cellspacing="0" cellpadding="0" requestURI="${supplierListURL}"
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
                                <display:column headerClass="text-left" property="productName" title="Tên nhà cung cấp "/>
                                <display:column headerClass="text-left" property="quantity" title="Số lượng nhập "/>
                                <display:column headerClass="text-left" property="createdDate" title="Ngày nhập "/>
                                <display:column headerClass="text-left" property="createdBy" title="Người nhập "/>


                                <display:column title="Thao tác">
                                    <a href="/admin/supplier-edit-${tableList.id}">
                                        <button type="button" class="btn btn-xs btn-info">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </button>
                                    </a>
                                    <button class="btn btn-xs btn-danger" title="Xóa nhà cung cấp"
                                            onclick="deleteSupplier(${tableList.id})">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </display:column>
                            </display:table>
                            <input type="hidden" name="Supplier" id="supplierId" value="">
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
    $('#btnSearchSupplier').click(function (e) {
        e.preventDefault();
        $('#listForm').submit()
    });

    function deleteSupplier(id) {
        var supplierId = [id];
        deleteSuppliers(supplierId);
    };

    $('#btnDeleteSupplier').click(function (e) {
        e.preventDefault();
        var data = {};
        data['supplierId'] = $('#supplierId').val();
        var supplierIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteSuppliers(supplierIds);
    });

    function deleteSuppliers(data) {
        $.ajax({
            type: "DELETE",
            url: "${supplierAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
            },
            error: function (respond) {
                console.log("fail");
                window.location.href = "<c:url value="/admin/supplier-list?message=success"/> ";
            }
        });
    }
</script>