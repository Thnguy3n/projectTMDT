<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/4/2024
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/tablist.jsp" %>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/trang-chu">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin <sup>2</sup></div>
    </a>
    <security:authorize access="hasAnyRole('MANAGER', 'STAFF')">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/product-list"/>">
                <i class="fas fa-fw fa-table"></i>
                <span>Quản lý sản phẩm </span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/user-list"/>">
                <i class="fas fa-fw fa-user"></i>
                <span>Quản lý tài khoản  </span></a>
        </li>
        <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/category-list"/>">
                <i class="fas fa-fw fa-list-alt"></i>
                <span>Quản lý danh mục sản phẩm  </span></a>
        </li>
        <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/supplier-list"/>">
                <i class="fas fa-fw fa-user-friends"></i>
                <span>Quản lý nhà cung cấp  </span></a>
        </li>
        <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/order-list"/>">
                <i class="fas fa-fw fa-notes-medical"></i>
                <span>Quản lý hóa đơn  </span></a>
        </li>
        <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/Location"/>">
                <i class="fas fa-fw fa-home"></i>
                <span>Quản lý hệ thống cửa hàng  </span></a>
        </li>
         <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/slide"/>">
                <i class="fas fa-fw fa-images"></i>
                <span>Quản lý slider  </span></a>
        </li>
          <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/shipping"/>">
                <i class="fas fa-fw fa-shipping-fast"></i>
                <span>Quản lý tiền ship  </span></a>
        </li>
    </security:authorize>
    <security:authorize access="hasAnyRole('SHIPPER','MANAGER')">
        <li class="nav-item">
            <a style="width: 15rem" class="nav-link" href="<c:url value="/admin/Shipper"/>">
                <i class="fas fa-fw fa-shipping-fast"></i>
                <span>Nhận Đơn giao hàng </span></a>
        </li>
    </security:authorize>


    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline ">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>