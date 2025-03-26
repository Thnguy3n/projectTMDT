<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/3/2024
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/tablist.jsp" %>
<style>
    .card-product .product-img {
        display: block;
        overflow: hidden;
        width: 100%;
        max-width: 300px;
        height: 300px;
    }

    .card-product .product-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
</style>
<div class="preload preload-container">
    <div class="preload-logo">
        <div class="spinner"></div>
    </div>
</div>
<!-- /preload -->
<div id="wrapper">
    <!-- slider -->
    <div class="tf-slideshow slider-radius slider-effect-fade position-relative" style="height: fit-content">
        <div class="swiper tf-sw-slideshow" data-preview="1" data-tablet="1" data-mobile="1" data-centered="false"
             data-space="0" data-loop="true" data-auto-play="false" data-delay="2000" data-speed="1000">
            <div class="swiper-wrapper">
                <c:forEach items="${Sliders}" var="item">
                    <div class="swiper-slide" lazy="true">
                        <div class="wrap-slider">
                            <img class="lazyload"
                                 src="/repository${item.image}"
                                 alt="hp-slideshow-01">
                        </div>
                    </div>
                </c:forEach>
<%--                <div class="swiper-slide" lazy="true">--%>
<%--                    <div class="wrap-slider">--%>
<%--                        <img class="lazyload"--%>
<%--                             src="https://theme.hstatic.net/200000690725/1001078549/14/slide_3_img.jpg?v=536"--%>
<%--                             alt="hp-slideshow-01">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="swiper-slide" lazy="true">--%>
<%--                    <div class="wrap-slider row-end">--%>
<%--                        <img class="lazyload"--%>
<%--                             src="https://theme.hstatic.net/200000690725/1001078549/14/slide_4_img.jpg?v=536"--%>
<%--                             alt="hp-slideshow-02">--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="swiper-slide" lazy="true">--%>
<%--                    <div class="wrap-slider">--%>
<%--                        <img class="lazyload"--%>
<%--                             src="https://theme.hstatic.net/200000690725/1001078549/14/slide_1_img.jpg?v=536"--%>
<%--                             alt="hp-slideshow-03">--%>

<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
        <div class="wrap-pagination">
            <div class="container">
                <div class="sw-dots line-white-pagination sw-pagination-slider justify-content-center"></div>
            </div>
        </div>
    </div>
    <!-- /slider -->
    <!-- Collection -->

    <section class="flat-spacing-10 flat-testimonial">
        <div class="container" style="    height: max-content;">
            <div class="wrap-carousel style-2">
                <div class="swiper tf-sw-testimonial" data-preview="6" data-tablet="4" data-mobile="2"
                     data-space-lg="30" data-space-md="15">
                    <div class="swiper-wrapper" style="justify-content: center">
                        <div class="swiper-slide" style="height: max-content">
                            <div class="collection-item-circle has-bg hover-img">
                                <a href="/product-category-1" class="collection-image img-style">
                                    <img class="lazyload" alt="collection-img"
                                         src="https://theme.hstatic.net/200000690725/1001078549/14/home_category_7_img.jpg?v=536">
                                </a>
                                <div class="collection-content text-center">
                                    <a href="/product-category-1" class="link title fw-6">Áo thun</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" style="height: max-content">
                            <div class="collection-item-circle has-bg hover-img">
                                <a href="/product-category-2" class="collection-image img-style">
                                    <img class="lazyload" alt="collection-img"
                                         src="https://theme.hstatic.net/200000690725/1001078549/14/home_category_1_img.jpg?v=536">
                                </a>
                                <div class="collection-content text-center">
                                    <a href="/product-category-2" class="link title fw-6">Áo khoác</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" style="height: max-content">
                            <div class="collection-item-circle has-bg hover-img">
                                <a href="/product-category-3" class="collection-image img-style">
                                    <img class="lazyload" alt="collection-img"
                                         src="https://theme.hstatic.net/200000690725/1001078549/14/home_category_5_img.jpg?v=536">
                                </a>
                                <div class="collection-content text-center">
                                    <a href="/product-category-3" class="link title fw-6">Quần tây</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" style="height: max-content">
                            <div class="collection-item-circle has-bg hover-img">
                                <a href="/product-category-4" class="collection-image img-style">
                                    <img class="lazyload" alt="collection-img"
                                         src="https://theme.hstatic.net/200000690725/1001078549/14/home_category_3_img.jpg?v=536">
                                </a>
                                <div class="collection-content text-center">
                                    <a href="/product-category-4" class="link title fw-6">Quần Jean</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="nav-sw nav-next-slider nav-next-testimonial lg"><span class="icon icon-arrow-left"></span>
                </div>
                <div class="nav-sw nav-prev-slider nav-prev-testimonial lg"><span class="icon icon-arrow-right"></span>
                </div>
                <div class="sw-dots style-2 sw-pagination-testimonial justify-content-center"></div>
            </div>
        </div>
    </section>

    <section style="height: fit-content">
        <div class="container-full">
            <div class="bg_grey-5 radius-60 flat-spacing-21 " style="">
                <div class="flat-title">
                    <span class="title fw-6 wow fadeInUp" data-wow-delay="0s"> Giảm giá mạnh!!! </span>
                </div>
                <div class="container">
                    <div class="wrap-carousel wrap-sw-2">
                        <div class="swiper tf-sw-product-sell wrap-sw-over" data-preview="4" data-tablet="3"
                             data-mobile="2" data-space-lg="30" data-space-md="15" data-pagination="2"
                             data-pagination-md="3" data-pagination-lg="3">
                            <div class="swiper-wrapper" style="width: fit-content;">
                                <c:forEach items="${Bigsale}" var="item">
                                    <div class="swiper-slide" lazy="true">
                                        <div class="card-product bg_white radius-20">
                                            <div class="card-product-wrapper">
                                                <a href="<c:url value="product-detail-${item.id}"/>"
                                                   class="product-img">
                                                    <img class="lazyload img-product"
                                                         src="/repository${item.image}"
                                                         data-src="/repository${item.image}" alt="image-product">
                                                    <img class="lazyload img-hover"
                                                         data-src="/repository${item.image}"
                                                         src="/repository${item.image}" alt="image-product">
                                                </a>
                                                <div class="list-product-btn">
                                                    <a href="javascript:void(0);"
                                                       class="box-icon bg_white wishlist btn-icon-action">
                                                        <span class="icon icon-heart"></span>
                                                        <span class="tooltip">Add to Wishlist</span>
                                                        <span class="icon icon-delete"></span>
                                                    </a>
                                                    <a href="#quick_view" data-bs-toggle="modal"
                                                       class="box-icon bg_white quickview tf-btn-loading">
                                                        <span class="icon icon-view"></span>
                                                        <span class="tooltip">Quick View</span>
                                                    </a>
                                                </div>
                                                <div class="on-sale-wrap text-end">
                                                    <div class="on-sale-item">Sale</div>
                                                </div>
                                            </div>
                                            <div class="card-product-info has-padding">
                                                <a href="<c:url value="product-detail-${item.id}"/>"
                                                   class="title link">${item.title}</a>
                                                <span class="price">
                                                    <span class="fw-4 text-sale"><fmt:formatNumber value="${item.price}"
                                                                                                   pattern="#,###"/> VNĐ </span>
                                                    <span class="text_primary">
                                                    <fmt:formatNumber value="${ item.price-(item.price*item.discount/100)}" pattern="#,###"/> VNĐ
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="nav-sw nav-next-slider nav-next-product box-icon w_46 round"><span
                                class="icon icon-arrow-left"></span></div>
                        <div class="nav-sw nav-prev-slider nav-prev-product box-icon w_46 round"><span
                                class="icon icon-arrow-right"></span></div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Icon box -->
    <section class="flat-spacing-9 flat-iconbox-v2" style="height: fit-content">
        <div class="container">
            <div class="wrap-carousel wrap-mobile wow fadeInUp" data-wow-delay="0s">
                <div class="swiper tf-sw-mobile" data-preview="1" data-space="15">
                    <div class="swiper-wrapper wrap-iconbox">
                        <div class="swiper-slide">
                            <div class="tf-icon-box text-center">
                                <div class="icon">
                                    <i class="icon-shipping"></i>
                                </div>
                                <div class="content">
                                    <div class="title fw-6">Miễn phí giao hàng cao cấp</div>
                                    <p>Miễn phí vận chuyển cho đơn hàng từ 300.000đ trở lên tại Việt Nam và 500.000đ tại
                                        Hà Nội.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="tf-icon-box text-center">
                                <div class="icon">
                                    <i class="icon-safe"></i>
                                </div>
                                <div class="content">
                                    <div class="title fw-6">Bảo vệ sản phẩm</div>
                                    <p>An tâm với chế độ bảo hành từ nhà sản xuất, đảm bảo sản phẩm của bạn luôn được
                                        bảo vệ.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="tf-icon-box text-center">
                                <div class="icon">
                                    <i class="icon-return"></i>
                                </div>
                                <div class="content">
                                    <div class="title fw-6">Miễn phí đổi trả trong 14 ngày</div>
                                    <p>Chúng tôi cung cấp chính sách đổi trả trong 14 ngày, giúp bạn yên tâm mua sắm.
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="sw-dots style-2 sw-pagination-mb justify-content-center"></div>
            </div>

        </div>
    </section>
    <!-- /Icon box -->
    <!-- brand -->
    <section class="flat-spacing-5 pt_0" style="height: fit-content">
        <div class="container" style="padding-top: 50px">
            <div class="swiper tf-sw-brand" data-loop="false" data-play="false" data-preview="6" data-tablet="3"
                 data-mobile="2" data-space-lg="0" data-space-md="0">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="brand-item">
                            <img class="lazyload" data-src="images/brand/brand-01.png" src="images/brand/brand-01.png"
                                 alt="image-brand">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="brand-item">
                            <img class="lazyload" data-src="images/brand/brand-02.png" src="images/brand/brand-02.png"
                                 alt="image-brand">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="brand-item">
                            <img class="lazyload" data-src="images/brand/brand-03.png" src="images/brand/brand-03.png"
                                 alt="image-brand">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="brand-item">
                            <img class="lazyload" data-src="images/brand/brand-04.png" src="images/brand/brand-04.png"
                                 alt="image-brand">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="brand-item">
                            <img class="lazyload" data-src="images/brand/brand-05.png" src="images/brand/brand-05.png"
                                 alt="image-brand">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="brand-item">
                            <img class="lazyload" data-src="images/brand/brand-06.png" src="images/brand/brand-06.png"
                                 alt="image-brand">
                        </div>
                    </div>
                </div>
            </div>
            <div class="sw-dots style-2 sw-pagination-brand justify-content-center"></div>
        </div>
    </section>
    <!-- /brand -->

</div>

<!-- gotop -->
<div class="progress-wrap">
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"
              style="transition: stroke-dashoffset 10ms linear 0s; stroke-dasharray: 307.919, 307.919; stroke-dashoffset: 286.138;"></path>
    </svg>
</div>
<!-- /gotop -->


<!-- modalDemo -->
<div class="modal fade modalDemo" id="modalDemo">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <h5 class="demo-title">Ultimate HTML Theme</h5>
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div class="mega-menu">
                <div class="row-demo">
                    <div class="demo-item">
                        <a href="index.html">
                            <div class="demo-image position-relative">
                                <img class="lazyload" data-src="images/demo/home-01.jpg" src="images/demo/home-01.jpg"
                                     alt="home-01">
                                <div class="demo-label">
                                    <span class="demo-new">New</span>
                                    <span>Trend</span>
                                </div>
                            </div>
                            <span class="demo-name">Home Fashion 01</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-multi-brand.html">
                            <div class="demo-image position-relative">
                                <img class="lazyload" data-src="images/demo/home-multi-brand.jpg"
                                     src="images/demo/home-multi-brand.jpg" alt="home-multi-brand">
                                <div class="demo-label">
                                    <span class="demo-new">New</span>
                                    <span class="demo-hot">Hot</span>
                                </div>
                            </div>
                            <span class="demo-name">Home Multi Brand</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-02.html">
                            <div class="demo-image position-relative">
                                <img class="lazyload" data-src="images/demo/home-02.jpg" src="images/demo/home-02.jpg"
                                     alt="home-02">
                                <div class="demo-label">
                                    <span class="demo-hot">Hot</span>
                                </div>
                            </div>
                            <span class="demo-name">Home Fashion 02</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-03.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-03.jpg" src="images/demo/home-03.jpg"
                                     alt="home-03">
                            </div>
                            <span class="demo-name">Home Fashion 03</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-04.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-04.jpg" src="images/demo/home-04.jpg"
                                     alt="home-04">
                            </div>
                            <span class="demo-name">Home Fashion 04</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-05.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-05.jpg" src="images/demo/home-05.jpg"
                                     alt="home-05">
                            </div>
                            <span class="demo-name">Home Fashion 05</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-06.html">
                            <div class="demo-image position-relative">
                                <img class="lazyload" data-src="images/demo/home-06.jpg" src="images/demo/home-06.jpg"
                                     alt="home-06">
                                <div class="demo-label">
                                    <span class="demo-new">New</span>
                                </div>
                            </div>
                            <span class="demo-name">Home Fashion 06</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-07.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-07.jpg" src="images/demo/home-07.jpg"
                                     alt="home-07">
                            </div>
                            <span class="demo-name">Home Fashion 07</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-08.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-08.jpg" src="images/demo/home-08.jpg"
                                     alt="home-08">
                            </div>
                            <span class="demo-name">Home Fashion 08</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-skincare.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-skincare.jpg"
                                     src="images/demo/home-skincare.jpg" alt="home-skincare">
                            </div>
                            <span class="demo-name">Home Skincare</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-headphone.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-headphone.jpg"
                                     src="images/demo/home-headphone.jpg" alt="home-headphone">
                            </div>
                            <span class="demo-name">Home Headphone</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-giftcard.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-giftcard.jpg"
                                     src="images/demo/home-giftcard.jpg" alt="home-gift-card">
                            </div>
                            <span class="demo-name">Home Gift Card</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-furniture.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-furniture.jpg"
                                     src="images/demo/home-furniture.jpg" alt="home-furniture">
                            </div>
                            <span class="demo-name">Home Furniture</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-furniture-02.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-furniture2.jpg"
                                     src="images/demo/home-furniture2.jpg" alt="home-furniture-2">
                            </div>
                            <span class="demo-name">Home Furniture 2</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-skateboard.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-skateboard.jpg"
                                     src="images/demo/home-skateboard.jpg" alt="home-skateboard">
                            </div>
                            <span class="demo-name">Home Skateboard</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-stroller.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-stroller.jpg"
                                     src="images/demo/home-stroller.jpg" alt="home-stroller">
                            </div>
                            <span class="demo-name">Home Stroller</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-decor.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-decor.jpg"
                                     src="images/demo/home-decor.jpg" alt="home-decor">
                            </div>
                            <span class="demo-name">Home Decor</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-electronic.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-electronic.jpg"
                                     src="images/demo/home-electronic.jpg" alt="home-electronic">
                            </div>
                            <span class="demo-name">Home Electronic</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-setup-gear.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-setup-gear.jpg"
                                     src="images/demo/home-setup-gear.jpg" alt="home-setup-gear">
                            </div>
                            <span class="demo-name">Home Setup Gear</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-dog-accessories.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-dog-accessories.jpg"
                                     src="images/demo/home-dog-accessories.jpg" alt="home-dog-accessories">
                            </div>
                            <span class="demo-name">Home Dog Accessories</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-kitchen-wear.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-kitchen.jpg"
                                     src="images/demo/home-kitchen.jpg" alt="home-kitchen-wear">
                            </div>
                            <span class="demo-name">Home Kitchen Wear</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-phonecase.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-phonecase.jpg"
                                     src="images/demo/home-phonecase.jpg" alt="home-phonecase">
                            </div>
                            <span class="demo-name">Home Phonecase</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-paddle-boards.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home_paddle_board.jpg"
                                     src="images/demo/home_paddle_board.jpg" alt="home-paddle_board">
                            </div>
                            <span class="demo-name">Home Paddle Boards</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-glasses.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-glasses.jpg"
                                     src="images/demo/home-glasses.jpg" alt="home-glasses">
                            </div>
                            <span class="demo-name">Home Glasses</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-pod-store.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-pod-store.jpg"
                                     src="images/demo/home-pod-store.jpg" alt="home-pod-store">
                            </div>
                            <span class="demo-name">Home POD Store</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-activewear.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-activewear.jpg"
                                     src="images/demo/home-activewear.jpg" alt="home-activewear">
                            </div>
                            <span class="demo-name">Activewear</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-handbag.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-handbag.jpg"
                                     src="images/demo/home-handbag.jpg" alt="home-handbag">
                            </div>
                            <span class="demo-name">Home Handbag</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-tee.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-tee.jpg" src="images/demo/home-tee.jpg"
                                     alt="home-tee">
                            </div>
                            <span class="demo-name">Home Tee</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-sock.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-socks.jpg"
                                     src="images/demo/home-socks.jpg" alt="home-sock">
                            </div>
                            <span class="demo-name">Home Sock</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-jewerly.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-jewelry.jpg"
                                     src="images/demo/home-jewelry.jpg" alt="home-jewelry">
                            </div>
                            <span class="demo-name">Home Jewelry</span>
                        </a>
                    </div>
                    <div class="demo-item">
                        <a href="home-sneaker.html">
                            <div class="demo-image">
                                <img class="lazyload" data-src="images/demo/home-sneaker.jpg"
                                     src="images/demo/home-sneaker.jpg" alt="home-sneaker">
                            </div>
                            <span class="demo-name">Home Sneaker</span>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- /modalDemo -->

<!-- modal compare -->
<div class="offcanvas offcanvas-bottom canvas-compare" id="compare">
    <div class="canvas-wrapper">
        <header class="canvas-header">
            <div class="close-popup">
                <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
            </div>
        </header>
        <div class="canvas-body">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="tf-compare-list">
                            <div class="tf-compare-head">
                                <div class="title">Compare Products</div>
                            </div>
                            <div class="tf-compare-offcanvas">
                                <div class="tf-compare-item">
                                    <div class="position-relative">
                                        <div class="icon">
                                            <i class="icon-close"></i>
                                        </div>
                                        <a href="product-detail.html">
                                            <img class="radius-3" src="images/products/orange-1.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="tf-compare-item">
                                    <div class="position-relative">
                                        <div class="icon">
                                            <i class="icon-close"></i>
                                        </div>
                                        <a href="product-detail.html">
                                            <img class="radius-3" src="images/products/pink-1.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="tf-compare-buttons">
                                <div class="tf-compare-buttons-wrap">
                                    <a href="compare.html"
                                       class="tf-btn radius-3 btn-fill justify-content-center fw-6 fs-14 flex-grow-1 animate-hover-btn ">Compare</a>
                                    <div class="tf-compapre-button-clear-all link">
                                        Clear All
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /modal compare -->

<!-- modal quick_add -->
<div class="modal fade modalDemo" id="quick_add">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div class="wrap">
                <div class="tf-product-info-item">
                    <div class="image">
                        <img src="images/products/orange-1.jpg" alt="">
                    </div>
                    <div class="content">
                        <a href="product-detail.html">Ribbed Tank Top</a>
                        <div class="tf-product-info-price">
                            <!-- <div class="price-on-sale">$8.00</div>
                                              <div class="compare-at-price">$10.00</div>
                                              <div class="badges-on-sale"><span>20</span>% OFF</div> -->
                            <div class="price">$18.00</div>
                        </div>
                    </div>
                </div>
                <div class="tf-product-info-variant-picker mb_15">
                    <div class="variant-picker-item">
                        <div class="variant-picker-label">
                            Color: <span class="fw-6 variant-picker-label-value">Orange</span>
                        </div>
                        <div class="variant-picker-values">
                            <input id="values-orange" type="radio" name="color" checked>
                            <label class="hover-tooltip radius-60" for="values-orange" data-value="Orange">
                                <span class="btn-checkbox bg-color-orange"></span>
                                <span class="tooltip">Orange</span>
                            </label>
                            <input id="values-black" type="radio" name="color">
                            <label class=" hover-tooltip radius-60" for="values-black" data-value="Black">
                                <span class="btn-checkbox bg-color-black"></span>
                                <span class="tooltip">Black</span>
                            </label>
                            <input id="values-white" type="radio" name="color">
                            <label class="hover-tooltip radius-60" for="values-white" data-value="White">
                                <span class="btn-checkbox bg-color-white"></span>
                                <span class="tooltip">White</span>
                            </label>
                        </div>
                    </div>
                    <div class="variant-picker-item">
                        <div class="variant-picker-label">
                            Size: <span class="fw-6 variant-picker-label-value">S</span>
                        </div>
                        <div class="variant-picker-values">
                            <input type="radio" name="size" id="values-s" checked>
                            <label class="style-text" for="values-s" data-value="S">
                                <p>S</p>
                            </label>
                            <input type="radio" name="size" id="values-m">
                            <label class="style-text" for="values-m" data-value="M">
                                <p>M</p>
                            </label>
                            <input type="radio" name="size" id="values-l">
                            <label class="style-text" for="values-l" data-value="L">
                                <p>L</p>
                            </label>
                            <input type="radio" name="size" id="values-xl">
                            <label class="style-text" for="values-xl" data-value="XL">
                                <p>XL</p>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="tf-product-info-quantity mb_15">
                    <div class="quantity-title fw-6">Quantity</div>
                    <div class="wg-quantity">
                        <span class="btn-quantity minus-btn">-</span>
                        <input type="text" name="number" value="1">
                        <span class="btn-quantity plus-btn">+</span>
                    </div>
                </div>
                <div class="tf-product-info-buy-button">
                    <form class="">
                        <a href="#"
                           class="tf-btn btn-fill justify-content-center fw-6 fs-16 flex-grow-1 animate-hover-btn "><span>Add to cart -&nbsp;</span><span
                                class="tf-qty-price">$18.00</span></a>
                        <div class="tf-product-btn-wishlist btn-icon-action">
                            <i class="icon-heart"></i>
                            <i class="icon-delete"></i>
                        </div>
                        <a href="#compare" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft"
                           class="tf-product-btn-wishlist box-icon bg_white compare btn-icon-action">
                            <span class="icon icon-compare"></span>
                            <span class="icon icon-check"></span>
                        </a>
                        <div class="w-100">
                            <a href="#" class="btns-full">Buy with <img src="images/payments/paypal.png" alt=""></a>
                            <a href="#" class="payment-more-option">More payment options</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /modal quick_add -->

<!-- modal quick_view -->
<div class="modal fade modalDemo" id="quick_view">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div class="wrap">
                <div class="tf-product-media-wrap">
                    <div class="swiper tf-single-slide">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="item">
                                    <img src="images/products/orange-1.jpg" alt="">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="item">
                                    <img src="images/products/pink-1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next button-style-arrow single-slide-prev"></div>
                        <div class="swiper-button-prev button-style-arrow single-slide-next"></div>
                    </div>
                </div>
                <div class="tf-product-info-wrap position-relative">
                    <div class="tf-product-info-list">
                        <div class="tf-product-info-title">
                            <h5><a class="link" href="product-detail.html">Ribbed Tank Top</a></h5>
                        </div>
                        <div class="tf-product-info-badges">
                            <div class="badges text-uppercase">Best seller</div>
                            <div class="product-status-content">
                                <i class="icon-lightning"></i>
                                <p class="fw-6">Selling fast! 48 people have this in their carts.</p>
                            </div>
                        </div>
                        <div class="tf-product-info-price">
                            <div class="price">$18.00</div>
                        </div>
                        <div class="tf-product-description">
                            <p>Nunc arcu faucibus a et lorem eu a mauris adipiscing conubia ac aptent ligula facilisis a
                                auctor habitant parturient a a.Interdum fermentum.</p>
                        </div>
                        <div class="tf-product-info-variant-picker">
                            <div class="variant-picker-item">
                                <div class="variant-picker-label">
                                    Color: <span class="fw-6 variant-picker-label-value">Orange</span>
                                </div>
                                <div class="variant-picker-values">
                                    <input id="values-orange-1" type="radio" name="color-1" checked>
                                    <label class="hover-tooltip radius-60" for="values-orange-1" data-value="Orange">
                                        <span class="btn-checkbox bg-color-orange"></span>
                                        <span class="tooltip">Orange</span>
                                    </label>
                                    <input id="values-black-1" type="radio" name="color-1">
                                    <label class=" hover-tooltip radius-60" for="values-black-1" data-value="Black">
                                        <span class="btn-checkbox bg-color-black"></span>
                                        <span class="tooltip">Black</span>
                                    </label>
                                    <input id="values-white-1" type="radio" name="color-1">
                                    <label class="hover-tooltip radius-60" for="values-white-1" data-value="White">
                                        <span class="btn-checkbox bg-color-white"></span>
                                        <span class="tooltip">White</span>
                                    </label>
                                </div>
                            </div>
                            <div class="variant-picker-item">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="variant-picker-label">
                                        Size: <span class="fw-6 variant-picker-label-value">S</span>
                                    </div>
                                    <div class="find-size btn-choose-size fw-6">Find your size</div>
                                </div>
                                <div class="variant-picker-values">
                                    <input type="radio" name="size-1" id="values-s-1" checked>
                                    <label class="style-text" for="values-s-1" data-value="S">
                                        <p>S</p>
                                    </label>
                                    <input type="radio" name="size-1" id="values-m-1">
                                    <label class="style-text" for="values-m-1" data-value="M">
                                        <p>M</p>
                                    </label>
                                    <input type="radio" name="size-1" id="values-l-1">
                                    <label class="style-text" for="values-l-1" data-value="L">
                                        <p>L</p>
                                    </label>
                                    <input type="radio" name="size-1" id="values-xl-1">
                                    <label class="style-text" for="values-xl-1" data-value="XL">
                                        <p>XL</p>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="tf-product-info-quantity">
                            <div class="quantity-title fw-6">Quantity</div>
                            <div class="wg-quantity">
                                <span class="btn-quantity minus-btn">-</span>
                                <input type="text" name="number" value="1">
                                <span class="btn-quantity plus-btn">+</span>
                            </div>
                        </div>
                        <div class="tf-product-info-buy-button">
                            <form class="">
                                <a href="#"
                                   class="tf-btn btn-fill justify-content-center fw-6 fs-16 flex-grow-1 animate-hover-btn "><span>Add to cart -&nbsp;</span><span
                                        class="tf-qty-price">$8.00</span></a>
                                <a href="javascript:void(0);"
                                   class="tf-product-btn-wishlist hover-tooltip box-icon bg_white wishlist btn-icon-action">
                                    <span class="icon icon-heart"></span>
                                    <span class="tooltip">Add to Wishlist</span>
                                    <span class="icon icon-delete"></span>
                                </a>
                                <a href="#compare" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft"
                                   class="tf-product-btn-wishlist hover-tooltip box-icon bg_white compare btn-icon-action">
                                    <span class="icon icon-compare"></span>
                                    <span class="tooltip">Add to Compare</span>
                                    <span class="icon icon-check"></span>
                                </a>
                                <div class="w-100">
                                    <a href="#" class="btns-full">Buy with <img src="images/payments/paypal.png" alt=""></a>
                                    <a href="#" class="payment-more-option">More payment options</a>
                                </div>
                            </form>
                        </div>
                        <div>
                            <a href="product-detail.html" class="tf-btn fw-6 btn-line">View full details<i
                                    class="icon icon-arrow1-top-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /modal quick_view -->

<!-- modal find_size -->
<div class="modal fade modalDemo tf-product-modal" id="find_size">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="header">
                <div class="demo-title">Size chart</div>
                <span class="icon-close icon-close-popup" data-bs-dismiss="modal"></span>
            </div>
            <div class="tf-rte">
                <div class="tf-table-res-df">
                    <h6>Size guide</h6>
                    <table class="tf-sizeguide-table">
                        <thead>
                        <tr>
                            <th>Size</th>
                            <th>US</th>
                            <th>Bust</th>
                            <th>Waist</th>
                            <th>Low Hip</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>XS</td>
                            <td>2</td>
                            <td>32</td>
                            <td>24 - 25</td>
                            <td>33 - 34</td>
                        </tr>
                        <tr>
                            <td>S</td>
                            <td>4</td>
                            <td>34 - 35</td>
                            <td>26 - 27</td>
                            <td>35 - 26</td>
                        </tr>
                        <tr>
                            <td>M</td>
                            <td>6</td>
                            <td>36 - 37</td>
                            <td>28 - 29</td>
                            <td>38 - 40</td>
                        </tr>
                        <tr>
                            <td>L</td>
                            <td>8</td>
                            <td>38 - 29</td>
                            <td>30 - 31</td>
                            <td>42 - 44</td>
                        </tr>
                        <tr>
                            <td>XL</td>
                            <td>10</td>
                            <td>40 - 41</td>
                            <td>32 - 33</td>
                            <td>45 - 47</td>
                        </tr>
                        <tr>
                            <td>XXL</td>
                            <td>12</td>
                            <td>42 - 43</td>
                            <td>34 - 35</td>
                            <td>48 - 50</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="tf-page-size-chart-content">
                    <div>
                        <h6>Measuring Tips</h6>
                        <div class="title">Bust</div>
                        <p>Measure around the fullest part of your bust.</p>
                        <div class="title">Waist</div>
                        <p>Measure around the narrowest part of your torso.</p>
                        <div class="title">Low Hip</div>
                        <p class="mb-0">With your feet together measure around the fullest part of your hips/rear.
                        </p>
                    </div>
                    <div>
                        <img class="sizechart lazyload" data-src="images/shop/products/size_chart2.jpg"
                             src="images/shop/products/size_chart2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /modal find_size -->