<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/18/2025
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<style>
    .dropdown-item.active {
        background-color: #f8f9fa; /* Màu nền giống hover */
        color: #000; /* Màu chữ giống hover */
    }
</style>
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <!-- Topbar Search -->
    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                   aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="btnSearchCategory">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </div>
    </form>
    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                 aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Search for..." aria-label="Search"
                               aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->

                <span class="badge badge-danger badge-counter" id="count-box"></span>
            </a>
            <!-- Dropdown - Alerts -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                    Notifications
                </h6>
                <div class="notification-content">

                </div>

                <label id="showAll" class="dropdown-item text-center small text-gray-500" href="#">Xem tất cả thông báo</label>
            </div>
        </li>


        <!-- Nav Item - Messages -->
<%--        <li class="nav-item dropdown no-arrow mx-1">--%>
<%--            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"--%>
<%--               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--                <i class="fas fa-envelope fa-fw"></i>--%>
<%--                <!-- Counter - Messages -->--%>
<%--                <span class="badge badge-danger badge-counter">7</span>--%>
<%--            </a>--%>
<%--        </li>--%>

        <div class="topbar-divider d-none d-sm-block"></div>
        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=SecurityUtils.getPrincipal().getFullName()%></span>
                <img class="img-profile rounded-circle"
                     src="img/undraw_profile.svg">
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>
    </ul>
</nav>
<script>

    $('#alertsDropdown').click(function (e) {
        const container = $('.notification-content');
        e.preventDefault();
        $.ajax({
            type: "GET",
            url: "/notifications",
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                let row = '';
                respond.forEach((item) => {
                    const timestamp = item.createdDate;
                    const date = new Date(timestamp);
                        row += '<a class="dropdown-item d-flex align-items-center" >';
                        row += '<div class="mr-3">';
                        row += '<div class="icon-circle bg-primary">';
                        row += '<i class="fas fa-file-alt text-white"></i>';
                        row += '</div>';
                        row += '</div>';
                        row += '<div>';
                        row += '<div class="small text-gray-500">' + date.toLocaleString() + '</div>';
                        row += '<span class="font-weight-bold">' + item.message + '</span>';
                        row += '</div>';
                        row += '</a>';
                });
                container.html(row);
            },
            error: function (respond) {
                console.log("fail");
            }
        });
    });
    $(document).ready(function() {
        countNotifications();
    });
    function countNotifications(){
        $.ajax({
            type: "GET",
            url: "/notifications-count",
            success: function (respond) {
                document.querySelector("#count-box").textContent = respond;
            },
            error: function (respond) {
                console.log("fail");
            }
        });
    }
</script>
<!-- End of Topbar -->