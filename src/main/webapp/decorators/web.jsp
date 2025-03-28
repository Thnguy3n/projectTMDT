<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="en-US" lang="en-US">
<head>
    <meta charset="utf-8">
    <title>Home page</title>

    <meta name="author" content="themesflat.com">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- font -->
    <link type="text/css" rel="stylesheet" href="fonts/fonts.css">
    <!-- Icons -->
    <link type="text/css" rel="stylesheet" href="fonts/font-icons.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/swiper-bundle.min.css">
    <link type="text/css" rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Favicon and Touch Icons  -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="shortcut icon" href="images/logo/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/logo/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

</head>
<body class="preload-wrapper">
<%@ include file="/common/web/header.jsp" %>

<dec:body/>

<%@ include file="/common/web/footer.jsp" %>

<%@ include file="/WEB-INF/views/web/cart-modal.jsp" %>

<%@ include file="/WEB-INF/views/web/SearchModal.jsp" %>

<%@ include file="/WEB-INF/views/web/Register.jsp" %>



<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc muốn đăng xuất ?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body"> Nhấn chọn "Logout" để thoát .</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="<c:url value='/logout'/>">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- toolbar-bottom -->
<div class="tf-toolbar-bottom type-1150">
    <div class="toolbar-item active">
        <a href="#toolbarShopmb" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft">
            <div class="toolbar-icon">
                <i class="icon-shop"></i>
            </div>
            <div class="toolbar-label">Shop</div>
        </a>
    </div>

    <div class="toolbar-item">
        <a href="#canvasSearch" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft">
            <div class="toolbar-icon">
                <i class="icon-search"></i>
            </div>
            <div class="toolbar-label">Tìm kiếm</div>
        </a>
    </div>
    <div class="toolbar-item">
        <a href="#login" data-bs-toggle="modal">
            <div class="toolbar-icon">
                <i class="icon-account"></i>
            </div>
            <div class="toolbar-label">Tài khoản</div>
        </a>
    </div>
    <div class="toolbar-item">
        <a href="#shoppingCart" data-bs-toggle="modal">
            <div class="toolbar-icon">
                <i class="icon icon-bag"></i><span class="count-box"></span>
            </div>
            <div class="toolbar-label">Giỏ hàng</div>
        </a>
    </div>
</div>
<!-- /toolbar-bottom -->
<!-- toolbarShopmb -->
<div class="offcanvas offcanvas-start canvas-mb toolbar-shop-mobile" id="toolbarShopmb">
    <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
    <div class="mb-canvas-content">
        <div class="mb-body">
            <ul class="nav-ul-mb" id="wrapper-menu-navigation">

                <li class="nav-mb-item">
                    <a href="<c:url value="/product-category"/>" class="tf-category-link mb-menu-link">
                        <i class="fas fa-fw fa-list-alt"></i>
                        <span>Bộ sưu tập</span>
                    </a>
                </li>

            </ul>
        </div>
        <div class="mb-bottom">
        </div>
    </div>
</div>
<!-- /toolbarShopmb -->

<!-- Javascript -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="js/carousel.js"></script>
<script type="text/javascript" src="js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="js/lazysize.min.js"></script>
<script type="text/javascript" src="js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/multiple-modal.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
