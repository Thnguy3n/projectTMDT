<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/2/2025
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tablist.jsp" %>
<div class="modal modalCentered fade form-sign-in modal-part-content" id="register">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <div class="demo-title">Đăng ký</div>
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div id="errorAlertRegister" class="alert alert-danger alert-dismissible fade show d-none" role="alert">
                <div class="d-flex align-items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16">
                        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                    </svg>
                    <div id="error-container-register">
                        <!-- Nội dung lỗi sẽ được hiển thị tại đây -->
                    </div>
                </div>
            </div>
            <div class="tf-login-form">
                <form class="" id="formRegister">
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="text" name="userName"
                               id="userName">
                        <label class="tf-field-label">Tên đăng nhập *</label>
                    </div>
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="text" name="fullName"
                               id="fullName">
                        <label class="tf-field-label">Họ tên *</label>
                    </div>
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="email" name="email" id="email">
                        <label class="tf-field-label">Email *</label>
                    </div>
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="text" name="phone" id="phone">
                        <label class="tf-field-label">Số điện thoại *</label>
                    </div>
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="password" name="password"
                               id="password">
                        <label class="tf-field-label">Mật khẩu *</label>
                    </div>
                    <div class="bottom">
                        <div class="w-100">
                            <button id="btnRegister" class="tf-btn btn-fill animate-hover-btn radius-3 w-100 justify-content-center">
                                <span>Đăng ký</span>
                            </button>
                        </div>
                        <div class="w-100">
                            <a href="#login" data-bs-toggle="modal" class="btn-link fw-6 w-100 link">
                                Quay lại trang đăng nhập
                                <i class="icon icon-arrow1-top-left"></i>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--OTP--%>
<div class="modal modalCentered fade form-sign-in modal-part-content" id="verified">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <div class="demo-title">Xác thực OTP</div>
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div class="tf-login-form">
                <form class="" id="Otp">
                    <div class="tf-field style-1">
                        <input class="tf-field-input tf-input" placeholder=" " type="text" name="otp"
                               id="">
                        <label class="tf-field-label">Mã OTP *</label>
                    </div>
                    <div class="bottom">
                        <div class="w-100">
                            <button id="btnVerified" class="tf-btn btn-fill animate-hover-btn radius-3 w-100 justify-content-center">
                                <span>Xác nhận</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $("#btnRegister").click(function (event) {
        event.preventDefault();
        var roleCode = "CUSTOMER";
        var formData = $("#formRegister").serializeArray();
        formData.push({ name: "roleCode", value: roleCode });
        var dataArray = {};
        $.each(formData, function (i, v) {
            dataArray["" + v.name + ""] = v.value;
        });
        addUser(dataArray);
        function addUser(data) {
            $.ajax({
                url: 'api/user/Register',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (res) {
                    console.log(res);
                    $('#register').modal('hide');
                    $('#verified').modal('show');
                    $("#btnVerified").click(function (event){
                        event.preventDefault();
                        const email = document.getElementById("email").value;
                        var formData = $("#Otp").serializeArray();
                        formData.unshift({ name: "email", value: email });
                        var dataArray = {};
                        $.each(formData, function (i, v) {
                            dataArray["" + v.name + ""] = v.value;
                        });
                        verifiedOTP(dataArray)
                        function verifiedOTP(data){
                            $.ajax({
                                url: 'api/user/verify',
                                type: 'POST',
                                contentType: 'application/json',
                                data: JSON.stringify(data),
                                success: function (res) {
                                    $('#verified').modal('hide');
                                    $('#login').modal('show');
                                },
                                error: function (res) {
                                    console.log("fail");
                                }
                            });
                        }
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
                        errorMessages = "Số điện thoại không đúng định dạng.";
                    }
                    document.getElementById("error-container-register").innerHTML = errorMessages;
                    $('#errorAlertRegister').removeClass('d-none');
                    setTimeout(function() {
                        $('#errorAlertRegister').addClass('d-none');
                    }, 5000);
                }
            });
        }
    });



</script>
