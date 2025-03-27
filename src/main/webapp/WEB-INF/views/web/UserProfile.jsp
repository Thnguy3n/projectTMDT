<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/10/2025
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tablist.jsp" %>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->

        <nav class="col-md-3 col-lg-2 d-md-block  sidebar">
            <div class="position-sticky pt-3">
                <div class="text-center mb-4">
                    <img src="images/logo/img.png"
                         class="rounded-circle profile-img" alt="Profile Picture">
                    <h5 class="mt-3">${userDTO.fullName}</h5>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#personal">Thông tin người dùng</a>
                    </li>
                    <li class="nav-item mt-4">
                        <a class="dropdown-item" href="#" data-bs-toggle="modal"
                           data-bs-target="#logoutModal">
                            <button class="btn btn-outline-danger w-100">Đăng xuất</button>
                        </a>
                    </li>

                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="container py-4">
                <!-- Personal Information -->
                <section id="personal" class="mb-5">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4>Thông tin người dùng</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <form:form id="formEdit" class="form-horizontal" modelAttribute="userDTO" >
                                        <div class="form-group" style="margin: 10px">
                                            <div class="col-sm-9" style="display: flex">
                                                <label class="col-sm-3 control-label no-padding-right">
                                                    Tên đầy đủ:
                                                </label>
                                                <form:input path="fullName" id="fullName" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin: 10px">
                                            <div class="col-sm-9" style="display: flex">
                                                <label class="col-sm-3 control-label no-padding-right">
                                                    Email:
                                                </label>
                                                <form:input path="email" id="email" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group" style="margin: 10px">
                                            <div class="col-sm-9" style="display: flex">
                                                <label class="col-sm-3 control-label no-padding-right">
                                                    Số điện thoại:
                                                </label>
                                                <form:input path="phone" id="phone" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <p style="margin: 10px"><strong>Ngày tạo:</strong> ${userDTO.createdDate}</p>
                                        <button class="btn btn-primary btn-sm" id="btnAddOrUpdateUsers"
                                                style="margin-left: 250px;">Chỉnh sửa hồ sơ
                                        </button>
                                        <form:hidden path="id" id="userId" />
                                    </form:form>

                                </div>
                                <div class="col-md-6">
                                    <div class="upload-section text-center">
                                        <img src="images/logo/img.png"
                                             class="rounded-circle mb-3" alt="Profile Picture">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </div>
</div>

<script>
    $("#btnAddOrUpdateUsers").click(function (event) {
        event.preventDefault();
        var formData = $("#formEdit").serializeArray();
        var dataArray = {};
        var userId = $('#userId').val();
        $.each(formData, function (i, v) {
            dataArray[v.name] = v.value;
        });
        updateUser(dataArray, userId);
        function updateUser(data, id) {
            $.ajax({
                url: '/api/profile/' + id,
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (res) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Chỉnh sửa thông tin thành công.',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 3000
                    }).then(() => {
                        location.reload();
                    });
                },
                error: function (res) {
                    console.log("fail");
                }
            });
        }
    });



</script>