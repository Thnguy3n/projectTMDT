<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/13/2024
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<c:url var="formUrl" value="/admin/user-list"/>
<c:url var="userAPI" value="/api/user"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <form:form modelAttribute="model" action="${formUrl}" id="listForm" method="GET">
            <div class="container-fluid">
                <h1 class="h3 mb-2 text-gray-800">Quản lý tài khoản </h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách tài khoản</h6>
                    </div>
                    <div class="card-header py-3">
                        <a flag="info"
                           class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                           data-toggle="tooltip"
                            <%--title='<spring:message code="label.user.add"/>'--%>
                           title="Thêm người dùng"
                           href='<c:url value="/admin/user-edit"/>'>
                            <span>
                                <i class="fa fa-plus-circle bigger-110 purple"></i>
                            </span>
                        </a>
                        <button id="btnDelete" type="button" disabled
                                class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                data-toggle="tooltip"
                                title="Xóa bài viết" onclick="warningBeforeDelete()">
                            <span>
                                <i class="fa-solid fa-trash"></i>
                            </span>
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                           requestURI="${formUrl}" partialList="true" sort="external"
                                           size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                           id="tableList" pagesize="${model.maxPageItems}"
                                           export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="userName" title="Tên"/>
                                <display:column headerClass="text-left" property="fullName" title="full name"/>
                                <display:column headerClass="col-actions" title="Thao tác">
                                    <security:authorize access="hasRole('MANAGER')">
                                        <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                           title="Cập nhật người dùng"
                                           href='<c:url value="/admin/user-edit-${tableList.id}"/>'>
                                            <i class="ace-icon fa fa-pencil bigger-120" aria-hidden="true"></i>
                                        </a>
                                     </security:authorize>
                                    <c:if test="${tableList.roleCode == 'MANAGER'}">
                                        <p>Không đươc thao tác</p>
                                    </c:if>
                                </display:column>
                            </display:table>
                        </div>
                    </div>
                </div>
            </div>


        </form:form>
    </div>
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Đồ án phầm mềm 2024</span>
            </div>
        </div>
    </footer>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var someJsVar = "<c:out value='${addOrEditNews}'/>";
        $('#btnSearch').click(function () {
            $('#listForm').submit();
        });
    });
    $(document).ready(function () {
        // Kích hoạt nút delete khi có ít nhất một checkbox được chọn
        $('input[name="checkList"]').on('change', function () {
            var isAnyChecked = $('input[name="checkList"]:checked').length > 0;
            $('#btnDelete').prop('disabled', !isAnyChecked);
        });
    });

    function warningBeforeDelete() {
        showAlertBeforeDelete(function () {
            var dataArray = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteUser(dataArray);
        });
    }


    function deleteUser(data) {
        $.ajax({
            url: '${userAPI}/',
            type: 'DELETE',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value='/admin/user-list?message=delete_success'/>";
            },
            error: function (res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/user-list?message=error_system'/>";
            }
        });
    }
</script>
</body>
</html>
