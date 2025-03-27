<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/6/2024
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .slider-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
    }

    .slider {
        position: relative;
        height: 6px;
        background: #e9ecef;
        border-radius: 5px;
        margin: 25px 0;
    }

    .slider .progress {
        height: 6px;
        background: #333;
        border-radius: 0;
        position: absolute;
        left: 25%;
        right: 25%;
    }

    .range-input {
        position: relative;
    }

    .range-input input {
        position: absolute;
        top: -15px;
        height: 6px;
        width: 100%;
        background: none;
        pointer-events: none;
        -webkit-appearance: none;
        margin: 0;
        z-index: 5;
    }

    input[type="range"]::-webkit-slider-thumb {
        height: 24px;
        width: 24px;
        border-radius: 50%;
        pointer-events: auto;
        -webkit-appearance: none;
        background: white;
        cursor: pointer;
        border: 2px solid #333;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        margin-top: -10px;
    }

    input[type="range"]::-moz-range-thumb {
        height: 24px;
        width: 24px;
        border-radius: 50%;
        pointer-events: auto;
        -moz-appearance: none;
        background: white;
        cursor: pointer;
        border: 2px solid #333;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .price-input {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .price-input .field {
        width: auto;
    }

    .field input {
        width: 130px;
        height: 38px;
        outline: none;
        border-radius: 5px;
        text-align: center;
        border: 1px solid #ced4da;
        font-size: 16px;
        font-weight: 500;
    }

    .min-max-labels {
        display: flex;
        justify-content: space-between;
        margin-top: 5px;
        font-size: 14px;
        color: #666;
    }

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
<!-- preload -->
<div class="preload preload-container">
    <div class="preload-logo">
        <div class="spinner"></div>
    </div>
</div>
<!-- /preload -->
<div id="wrapper">
    <!-- top-bar -->
    <div class="tf-top-bar bg_white line">
        <div class="px_15 lg-px_40">
            <div class="tf-top-bar_wrap grid-3 gap-30 align-items-center">
                <ul class="tf-top-bar_item tf-social-icon d-flex gap-10">
                    <li><a href="#" class="box-icon w_28 round social-facebook bg_line"><i
                            class="icon fs-12 icon-fb"></i></a></li>
                    <li><a href="#" class="box-icon w_28 round social-twiter bg_line"><i
                            class="icon fs-10 icon-Icon-x"></i></a></li>
                    <li><a href="#" class="box-icon w_28 round social-instagram bg_line"><i
                            class="icon fs-12 icon-instagram"></i></a></li>
                    <li><a href="#" class="box-icon w_28 round social-tiktok bg_line"><i
                            class="icon fs-12 icon-tiktok"></i></a></li>
                    <li><a href="#" class="box-icon w_28 round social-pinterest bg_line"><i
                            class="icon fs-12 icon-pinterest-1"></i></a></li>
                </ul>
                <div class="text-center overflow-hidden">
                    <div class="swiper tf-sw-top_bar" data-preview="1" data-space="0" data-loop="true" data-speed="1000"
                         data-delay="2000">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <p class="top-bar-text fw-5">Khuyến mãi thời trang mùa xuân <a href="shop-default.html"
                                                                                               title="all collection"
                                                                                               class="tf-btn btn-line">Mua
                                    ngay<i class="icon icon-arrow1-top-left"></i></a></p>
                            </div>
                            <div class="swiper-slide">
                                <p class="top-bar-text fw-5">Khuyến mại mùa hè giảm giá 70%</p>
                            </div>
                            <div class="swiper-slide">
                                <p class="top-bar-text fw-5">Đã đến lúc làm mới tủ đồ của bạn.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- /top-bar -->
    <!-- header -->
    <!-- /header -->

    <!-- page-title -->
    <div class="tf-page-title">
        <div class="container-full">
            <div class="row">
                <div class="col-12">
                    <div class="heading text-center">Hàng mới về</div>
                    <p class="text-center text-2 text_black-2 mt_5">Mua sắm qua bộ sưu tập thời trang mới nhất của chúng
                        tôi</p>
                </div>
            </div>
        </div>
    </div>
    <!-- /page-title -->
    <section class="flat-spacing-1">
        <div class="container">
            <div class="tf-shop-control grid-3 align-items-center">
                <div class="tf-control-filter">
                    <!-- <a href="#filterShop" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft" class="tf-btn-filter"><span class="icon icon-filter"></span><span class="text">Filter</span></a> -->
                </div>
                <ul class="tf-control-layout d-flex justify-content-center">
                    <li class="tf-view-layout-switch sw-layout-2" data-value-grid="grid-2">
                        <div class="item"><span class="icon icon-grid-2"></span></div>
                    </li>
                    <li class="tf-view-layout-switch sw-layout-3 active" data-value-grid="grid-3">
                        <div class="item"><span class="icon icon-grid-3"></span></div>
                    </li>
                    <li class="tf-view-layout-switch sw-layout-4" data-value-grid="grid-4">
                        <div class="item"><span class="icon icon-grid-4"></span></div>
                    </li>
                </ul>

                <div class="tf-control-sorting d-flex justify-content-end">
                    <div class="tf-dropdown-sort" data-bs-toggle="dropdown">
                        <div class="btn-select">
                            <span class="text-sort-value">Sắp xếp</span>
                            <span class="icon icon-arrow-down"></span>
                        </div>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#!" data-sort="price-asc">Giá: Tăng dần</a></li>
                            <li><a class="dropdown-item" href="#!" data-sort="price-desc">Giá: Giảm dần</a></li>
                            <li><a class="dropdown-item" href="#!" data-sort="name-asc">Tên: A-Z</a></li>
                            <li><a class="dropdown-item" href="#!" data-sort="name-desc">Tên: Z-A</a></li>
                            <li><a class="dropdown-item" href="#!" data-sort="oldest">Cũ nhất</a></li>
                            <li><a class="dropdown-item" href="#!" data-sort="newest">Mới nhất</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tf-row-flex">
                <aside class="tf-shop-sidebar wrap-sidebar-mobile">
                    <div class="widget-facet wd-categories">
                        <div class="facet-title" data-bs-target="#categories" data-bs-toggle="collapse"
                             aria-expanded="true" aria-controls="categories">
                            <span>Danh mục sản phẩm</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="categories" class="collapse show">
                            <ul class="list-categoris current-scrollbar mb_36">
                                <li class="cate-item current"><a href="#"><span>Thời trang</span>&nbsp;<span>(31)</span></a>
                                </li>
                                <c:forEach items="${categoryList}" var="item">
                                    <li class="cate-item"><a
                                            href="/product-category-${item.id}"><span>${item.name}</span>&nbsp;<span></span></a>
                                    </li>
                                    <input type="hidden" name="Category" id="categoryId" value="">
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="widget-facet " style="padding-bottom: 20px;">
                        <div class="price-input">
                            <div class="field">
                                <input type="text" class="input-min" value="772,665đ" readonly>
                            </div>
                            <div class="field">
                                <input type="text" class="input-max" value="2,320,055đ" readonly>
                            </div>
                        </div>
                        <div class="slider">
                            <div class="progress"></div>
                        </div>
                        <div class="range-input">
                            <input type="range" class="range-min" min="0" max="3000000" value="0" step="1000">
                            <input type="range" class="range-max" min="0" max="3000000" value="3000000" step="1000">
                        </div>
                        <div class="min-max-labels">
                            <span>0đ</span>
                            <span>3,000,000đ</span>
                        </div>
                    </div>
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#shipping" data-bs-toggle="collapse"
                             aria-expanded="true" aria-controls="shipping">
                            <span>Vận chuyển & Giao hàng</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="shipping" class="collapse show">
                            <ul class="widget-iconbox-list mb_36">
                                <li class="iconbox-item">
                                    <div class="box-icon w_50 round">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="16"
                                             viewBox="0 0 24 16" fill="none">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                  d="M0 1C0 0.447715 0.447715 0 1 0H15.5C16.0523 0 16.5 0.447715 16.5 1V3.5H19.7857C20.099 3.5 20.3943 3.64687 20.5833 3.89679L23.7976 8.14679C23.9289 8.32046 24 8.53225 24 8.75V13C24 13.5523 23.5523 14 23 14H20.3293C19.9174 15.1652 18.8062 16 17.5 16C16.1938 16 15.0826 15.1652 14.6707 14H8.82929C8.41745 15.1652 7.3062 16 6 16C4.69378 16 3.58255 15.1652 3.17071 14H1C0.447715 14 0 13.5523 0 13V1ZM3.17071 12C3.58255 10.8348 4.69378 10 6 10C7.3062 10 8.41745 10.8348 8.82929 12H14.5V2H2V12H3.17071ZM16.5 10.1707V5.5H19.2882L22 9.08557V12H20.3293C19.9174 10.8348 18.8062 10 17.5 10C17.1494 10 16.8128 10.0602 16.5 10.1707ZM6 12C5.44772 12 5 12.4477 5 13C5 13.5523 5.44772 14 6 14C6.55227 14 7 13.5523 7 13C7 12.4477 6.55227 12 6 12ZM17.5 12C16.9477 12 16.5 12.4477 16.5 13C16.5 13.5523 16.9477 14 17.5 14C18.0523 14 18.5 13.5523 18.5 13C18.5 12.4477 18.0523 12 17.5 12Z"
                                                  fill="black"/>
                                        </svg>
                                    </div>
                                    <div class="iconbox-content">
                                        <h4 class="iconbox-title">Miễn phí vận chuyển</h4>
                                        <p class="iconbox-desc">Miễn phí cho tất cả các đơn hàng của Việt Nam</p>
                                    </div>
                                </li>
                                <li class="iconbox-item">
                                    <div class="box-icon w_50 round">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none">
                                            <path d="M14.9074 23.9572C13.9179 23.9561 12.9418 23.7273 12.0548 23.2887C9.58879 22.0801 7.33175 20.4851 5.36912 18.5641C3.44812 16.6015 1.85314 14.3444 0.644541 11.8784C0.0604334 10.6753 -0.133278 9.31981 0.0904706 8.0013C0.314219 6.68278 0.94425 5.46709 1.89254 4.52406L3.43026 2.98635C3.79573 2.62231 4.29056 2.41791 4.8064 2.41791C5.32225 2.41791 5.81707 2.62231 6.18255 2.98635L8.47798 5.29292C8.80356 5.62725 8.99924 6.06673 9.02988 6.5324C9.06052 6.99806 8.92409 7.45939 8.64512 7.83349L7.53084 9.3935C8.04739 11.0793 8.9739 12.6107 10.2274 13.8506C11.4467 15.0497 12.9375 15.9366 14.5731 16.4358L16.1331 15.3215C16.5094 15.041 16.9738 14.9047 17.4421 14.9374C17.9103 14.9701 18.3512 15.1696 18.6849 15.4998L20.9803 17.7952C21.3443 18.1607 21.5487 18.6555 21.5487 19.1714C21.5487 19.6872 21.3443 20.182 20.9803 20.5475L19.4426 22.0852C18.8467 22.6799 18.1394 23.1513 17.3613 23.4725C16.5831 23.7937 15.7493 23.9584 14.9074 23.9572ZM4.81197 4.08949C4.77414 4.08932 4.7367 4.09717 4.70212 4.11254C4.66755 4.1279 4.63663 4.15043 4.6114 4.17863L3.07369 5.70521C2.36974 6.40573 1.90384 7.30983 1.74187 8.28965C1.5799 9.26947 1.73006 10.2754 2.17111 11.1652C3.32229 13.4583 4.82631 15.5564 6.62826 17.3829C8.45481 19.1849 10.5529 20.6889 12.846 21.8401C13.7358 22.2811 14.7417 22.4313 15.7215 22.2693C16.7014 22.1074 17.6055 21.6415 18.306 20.9375L19.788 19.3552C19.8146 19.3302 19.8359 19.3 19.8504 19.2665C19.8649 19.2329 19.8724 19.1968 19.8724 19.1602C19.8724 19.1237 19.8649 19.0875 19.8504 19.054C19.8359 19.0204 19.8146 18.9902 19.788 18.9652L17.5594 16.6698C17.5086 16.6251 17.4432 16.6005 17.3756 16.6005C17.3079 16.6005 17.2425 16.6251 17.1917 16.6698L15.3197 18.0849C15.2278 18.1524 15.123 18.2002 15.0117 18.2251C14.9005 18.25 14.7853 18.2516 14.6734 18.2298C12.5479 17.7079 10.6152 16.5908 9.10198 15.0095C7.46364 13.4857 6.30245 11.5194 5.75912 9.34893C5.73795 9.23701 5.73988 9.12196 5.76479 9.01082C5.7897 8.89968 5.83707 8.79481 5.90398 8.70264L7.31912 6.83064C7.36378 6.7798 7.38841 6.71445 7.38841 6.64678C7.38841 6.57911 7.36378 6.51376 7.31912 6.46292L5.0014 4.17863C4.97837 4.15071 4.94944 4.12824 4.91668 4.11282C4.88393 4.09741 4.84817 4.08944 4.81197 4.08949ZM22.8857 14.2072C23.611 12.833 23.9933 11.3039 24 9.75007C24 8.46686 23.7467 7.19627 23.2546 6.01116C22.7626 4.82605 22.0414 3.74973 21.1325 2.84392C20.2236 1.93811 19.1448 1.22063 17.958 0.732616C16.7712 0.244602 15.4998 -0.00434226 14.2166 5.73114e-05C12.6627 0.00678991 11.1336 0.389078 9.75941 1.11434C9.57002 1.2205 9.42792 1.39451 9.36175 1.60129C9.29558 1.80807 9.31026 2.03225 9.40284 2.22863C9.50889 2.41806 9.68365 2.55953 9.89102 2.62381C10.0984 2.6881 10.3225 2.67029 10.5171 2.57406C11.6525 1.98346 12.9144 1.67754 14.1943 1.68263C16.3379 1.67967 18.395 2.52761 19.9139 4.04023C21.4328 5.55285 22.2892 7.60647 22.2951 9.75007C22.3002 11.0299 21.9943 12.2918 21.4037 13.4272C21.3075 13.6218 21.2897 13.846 21.354 14.0533C21.4182 14.2607 21.5597 14.4354 21.7491 14.5415C21.8713 14.5986 22.0043 14.629 22.1391 14.6306C22.2898 14.6318 22.4381 14.5933 22.5692 14.519C22.7002 14.4447 22.8094 14.3371 22.8857 14.2072ZM16.4451 11.9786C16.5822 11.8254 16.6579 11.6271 16.6579 11.4215C16.6579 11.2159 16.5822 11.0176 16.4451 10.8644L15.0523 9.40464V6.40721C15.0523 6.18556 14.9642 5.97299 14.8075 5.81627C14.6508 5.65954 14.4382 5.57149 14.2166 5.57149C13.9949 5.57149 13.7823 5.65954 13.6256 5.81627C13.4689 5.97299 13.3808 6.18556 13.3808 6.40721V9.75007C13.381 9.97164 13.4692 10.1841 13.626 10.3406L15.3308 11.9786C15.4841 12.1157 15.6824 12.1915 15.888 12.1915C16.0936 12.1915 16.2919 12.1157 16.4451 11.9786Z"
                                                  fill="black"/>
                                        </svg>
                                    </div>
                                    <div class="iconbox-content">
                                        <h4 class="iconbox-title">Hỗ trợ cao cấp</h4>
                                        <p class="iconbox-desc">Hỗ trợ 24/7</p>
                                    </div>
                                </li>
                                <li class="iconbox-item">
                                    <div class="box-icon w_50 round">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none">
                                            <path d="M24 12C24 18.6173 18.6173 24 12 24C5.3827 24 0 18.6173 0 12C0 11.778 0.0882058 11.565 0.245213 11.408C0.40222 11.251 0.615168 11.1628 0.837209 11.1628C1.05925 11.1628 1.2722 11.251 1.42921 11.408C1.58621 11.565 1.67442 11.778 1.67442 12C1.67442 17.693 6.30698 22.3256 12 22.3256C17.693 22.3256 22.3256 17.693 22.3256 12C22.3256 6.30698 17.693 1.67442 12 1.67442C9.32224 1.68284 6.75254 2.73153 4.83349 4.59907H7.44558C7.66762 4.59907 7.88057 4.68728 8.03758 4.84428C8.19458 5.00129 8.28279 5.21424 8.28279 5.43628C8.28279 5.65832 8.19458 5.87127 8.03758 6.02828C7.88057 6.18528 7.66762 6.27349 7.44558 6.27349H2.98047C2.75842 6.27349 2.54548 6.18528 2.38847 6.02828C2.23146 5.87127 2.14326 5.65832 2.14326 5.43628V0.971163C2.14326 0.749121 2.23146 0.536174 2.38847 0.379166C2.54548 0.222159 2.75842 0.133953 2.98047 0.133953C3.20251 0.133953 3.41545 0.222159 3.57246 0.379166C3.72947 0.536174 3.81767 0.749121 3.81767 0.971163V3.27516C6.01451 1.20893 8.93247 0 12 0C18.6173 0 24 5.3827 24 12ZM12 5.02326C11.778 5.02326 11.565 5.11146 11.408 5.26847C11.251 5.42548 11.1628 5.63842 11.1628 5.86047V6.70437C10.6777 6.71712 10.2038 6.85211 9.78477 7.09685C9.36579 7.34158 9.01537 7.68813 8.76601 8.10437C8.51664 8.52061 8.3764 8.99307 8.35827 9.47795C8.34015 9.96283 8.44473 10.4444 8.66233 10.8781C9.00614 11.568 9.6 12.0837 10.3323 12.3271L13.1375 13.2625C13.4456 13.3641 13.6956 13.5807 13.8407 13.8709C13.9859 14.1611 14.0082 14.4904 13.9055 14.7974C13.8254 15.0393 13.6711 15.2498 13.4644 15.3989C13.2578 15.548 13.0094 15.6281 12.7546 15.6279H11.5312C11.193 15.6282 10.8632 15.5219 10.5889 15.3242C10.3146 15.1264 10.1095 14.8471 10.003 14.5261C9.96816 14.4218 9.91313 14.3253 9.84102 14.2422C9.76891 14.1591 9.68114 14.091 9.58272 14.0418C9.4843 13.9926 9.37716 13.9633 9.2674 13.9555C9.15765 13.9477 9.04744 13.9616 8.94307 13.9965C8.8387 14.0313 8.7422 14.0863 8.6591 14.1584C8.57599 14.2305 8.5079 14.3183 8.45872 14.4167C8.40953 14.5151 8.38022 14.6223 8.37244 14.732C8.36466 14.8418 8.37858 14.952 8.4134 15.0564C8.6122 15.6496 8.97661 16.1736 9.46359 16.5664C9.95057 16.9593 10.5398 17.2045 11.1617 17.2733V18.1395C11.1617 18.3616 11.2499 18.5745 11.4069 18.7315C11.5639 18.8885 11.7768 18.9767 11.9989 18.9767C12.2209 18.9767 12.4339 18.8885 12.5909 18.7315C12.7479 18.5745 12.8361 18.3616 12.8361 18.1395V17.2956C13.321 17.2828 13.7948 17.1478 14.2137 16.9031C14.6325 16.6584 14.9828 16.312 15.2322 15.8959C15.4815 15.4799 15.6218 15.0076 15.64 14.5229C15.6583 14.0381 15.5539 13.5566 15.3366 13.123C15.168 12.7829 14.9336 12.4798 14.6469 12.231C14.3602 11.9823 14.027 11.793 13.6666 11.674L10.8614 10.7386C10.5533 10.6359 10.3033 10.4193 10.1581 10.1291C10.013 9.83888 9.9907 9.5107 10.0934 9.20261C10.1735 8.96071 10.3278 8.75022 10.5344 8.60111C10.7411 8.45201 10.9895 8.37186 11.2443 8.37209H12.4666C13.1609 8.37209 13.776 8.81526 13.9959 9.47386C14.0662 9.68465 14.2174 9.85888 14.4162 9.95821C14.6149 10.0575 14.845 10.0738 15.0558 10.0035C15.2666 9.93322 15.4408 9.78205 15.5402 9.58328C15.6395 9.38451 15.6558 9.15442 15.5855 8.94363C15.3866 8.35022 15.022 7.82614 14.5348 7.43329C14.0476 7.04045 13.4582 6.79526 12.8361 6.7267V5.86047C12.8361 5.63842 12.7479 5.42548 12.5909 5.26847C12.4339 5.11146 12.2209 5.02326 11.9989 5.02326H12Z"
                                                  fill="black"/>
                                        </svg>
                                    </div>
                                    <div class="iconbox-content">
                                        <h4 class="iconbox-title">Trả lại trong vòng 30 ngày</h4>
                                        <p class="iconbox-desc">Bạn có 30 ngày để trả lại</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#follow" data-bs-toggle="collapse" aria-expanded="true"
                             aria-controls="follow">
                            <span>Follow us</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="follow" class="collapse show">
                            <ul class="tf-social-icon d-flex gap-10">
                                <li><a href="#" class="box-icon w_34 round bg_line social-facebook"><i
                                        class="icon fs-14 icon-fb"></i></a></li>
                                <li><a href="#" class="box-icon w_34 round bg_line social-twiter"><i
                                        class="icon fs-12 icon-Icon-x"></i></a></li>
                                <li><a href="#" class="box-icon w_34 round bg_line social-instagram"><i
                                        class="icon fs-14 icon-instagram"></i></a></li>
                                <li><a href="#" class="box-icon w_34 round bg_line social-tiktok"><i
                                        class="icon fs-14 icon-tiktok"></i></a></li>
                                <li><a href="#" class="box-icon w_34 round bg_line social-pinterest"><i
                                        class="icon fs-14 icon-pinterest-1"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </aside>
                <div class="tf-shop-content">
                    <form:form modelAttribute="product" method="GET" var="item">
                        <div class="grid-layout wrapper-shop" data-grid="grid-3">
                            <c:forEach items="${productList}" var="item">
                                <div class="card-product">
                                    <div class="card-product-wrapper">
                                        <a href="<c:url value="product-detail-${item.id}"/> " class="product-img">
                                            <img class="lazyload img-product"
                                                 data-src="/repository${item.image}"
                                                 src="/repository${item.image}" alt="image-product">
                                            <img class="lazyload img-hover"
                                                 data-src="/repository${item.image}"
                                                 src="/repository${item.image}" alt="image-product">
                                        </a>
                                        <div class="list-product-btn absolute-2">
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
                                    </div>
                                    <div class="card-product-info">
                                        <a href="<c:url value="product-detail-${item.id}"/> "
                                           class="title link">${item.title}</a>
                                        <span class="price">
                                            <fmt:formatNumber value="${item.price}" pattern="#,###"/> VNĐ
                                        </span>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:forEach items="${productList1}" var="item">
                                <div class="card-product">
                                    <div class="card-product-wrapper">
                                        <a href="<c:url value="product-detail-${item.id}"/> " class="product-img">
                                            <img class="lazyload img-product"
                                                 data-src="/repository${item.image}"
                                                 src="/repository${item.image}" alt="image-product">
                                            <img class="lazyload img-hover"
                                                 data-src="/repository${item.image}"
                                                 src="/repository${item.image}" alt="image-product">
                                        </a>
                                        <div class="list-product-btn absolute-2">
                                            <a href="#quick_add" data-bs-toggle="modal"
                                               class="box-icon bg_white quick-add tf-btn-loading">
                                                <span class="icon icon-bag"></span>
                                                <span class="tooltip">Quick Add</span>
                                            </a>
                                            <a href="javascript:void(0);"
                                               class="box-icon bg_white wishlist btn-icon-action">
                                                <span class="icon icon-heart"></span>
                                                <span class="tooltip">Add to Wishlist</span>
                                                <span class="icon icon-delete"></span>
                                            </a>
                                            <a href="#compare" data-bs-toggle="offcanvas"
                                               aria-controls="offcanvasLeft"
                                               class="box-icon bg_white compare btn-icon-action">
                                                <span class="icon icon-compare"></span>
                                                <span class="tooltip">Add to Compare</span>
                                                <span class="icon icon-check"></span>
                                            </a>
                                            <a href="#quick_view" data-bs-toggle="modal"
                                               class="box-icon bg_white quickview tf-btn-loading">
                                                <span class="icon icon-view"></span>
                                                <span class="tooltip">Quick View</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-product-info">
                                        <a href="<c:url value="product-detail-${item.id}"/>"
                                           class="title link">${item.title}</a>
                                        <span class="price">
                                            <fmt:formatNumber value="${item.price}" pattern="#,###"/> VNĐ
                                        </span>
                                    </div>
                                </div>
                            </c:forEach>
                            <input type="hidden" name="Product" id="productId" value="">
                        </div>
                    </form:form>
                    <!-- pagination -->
<%--                    <ul class="tf-pagination-wrap tf-pagination-list">--%>
<%--                        <c:if test="${currentPage > 0}">--%>
<%--                            <li class="active">--%>
<%--                                <a href="${pageContext.request.contextPath}/product-category?page=${currentPage - 1}&size=${pageSize}"--%>
<%--                                   class="pagination-link">&laquo;</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>
<%--                        <c:forEach var="i" begin="0" end="${totalPages - 1}">--%>
<%--                            <li class="page-item ${i == currentPage ? 'active' : ''}">--%>
<%--                                <a href="${pageContext.request.contextPath}/product-category?page=${i}&size=${pageSize}"--%>
<%--                                   class="pagination-link animate-hover-btn">${i + 1}</a>--%>
<%--                            </li>--%>
<%--                        </c:forEach>--%>
<%--                        <c:if test="${currentPage < totalPages - 1}">--%>
<%--                            <li class="active">--%>
<%--                                <a href="${pageContext.request.contextPath}/product-category?page=${currentPage + 1}&size=${pageSize}"--%>
<%--                                   class="pagination-link">&raquo;</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>
<%--                    </ul>--%>
                    <ul class="tf-pagination-wrap tf-pagination-list">
                        <c:if test="${currentPage > 0}">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/product-category<c:if test="${not empty categoryId}">-${categoryId}</c:if>?page=${currentPage - 1}&size=${pageSize}"
                                   class="pagination-link">&laquo;</a>
                            </li>
                        </c:if>

                        <c:forEach var="i" begin="0" end="${totalPages - 1}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a href="${pageContext.request.contextPath}/product-category<c:if test="${not empty categoryId}">-${categoryId}</c:if>?page=${i}&size=${pageSize}"
                                   class="pagination-link animate-hover-btn">${i + 1}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages - 1}">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/product-category<c:if test="${not empty categoryId}">-${categoryId}</c:if>?page=${currentPage + 1}&size=${pageSize}"
                                   class="pagination-link">&raquo;</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>

        </div>
    </section>
    <div class="btn-sidebar-style2">
        <button data-bs-toggle="offcanvas" data-bs-target="#sidebarmobile" aria-controls="offcanvas"><i
                class="icon icon-sidebar-2"></i></button>
    </div>


</div>

<!-- gotop -->
<div class="progress-wrap">
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"
              style="transition: stroke-dashoffset 10ms linear 0s; stroke-dasharray: 307.919, 307.919; stroke-dashoffset: 286.138;"></path>
    </svg>
</div>
<!-- /gotop -->


<!-- Filter -->
<div class="offcanvas offcanvas-start canvas-filter" id="filterShop">
    <div class="canvas-wrapper">
        <header class="canvas-header">
            <div class="filter-icon">
                <span class="icon icon-filter"></span>
                <span>Filter</span>
            </div>
            <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
        </header>
        <div class="canvas-body">
            <div class="widget-facet wd-categories">
                <div class="facet-title" data-bs-target="#categories" data-bs-toggle="collapse" aria-expanded="true"
                     aria-controls="categories">
                    <span>Product categories</span>
                    <span class="icon icon-arrow-up"></span>
                </div>
                <div id="categories" class="collapse show">
                    <ul class="list-categoris current-scrollbar mb_36">
                        <li class="cate-item current"><a href="shop-default.html"><span>Fashion</span></a></li>
                        <li class="cate-item"><a href="shop-default.html"><span>Men</span></a></li>
                        <li class="cate-item"><a href="shop-default.html"><span>Women</span></a></li>
                        <li class="cate-item"><a href="shop-default.html"><span>Denim</span></a></li>
                        <li class="cate-item"><a href="shop-default.html"><span>Dress</span></a></li>
                    </ul>
                </div>
            </div>
            <form action="#" id="facet-filter-form" class="facet-filter-form">
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#availability" data-bs-toggle="collapse"
                         aria-expanded="true" aria-controls="availability">
                        <span>Availability</span>
                        <span class="icon icon-arrow-up"></span>
                    </div>
                    <div id="availability" class="collapse show">
                        <ul class="tf-filter-group current-scrollbar mb_36">
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="availability" class="tf-check" id="availability-1">
                                <label for="availability-1"
                                       class="label"><span>In stock</span>&nbsp;<span>(14)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="availability" class="tf-check" id="availability-2">
                                <label for="availability-2"
                                       class="label"><span>Out of stock</span>&nbsp;<span>(2)</span></label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#price" data-bs-toggle="collapse" aria-expanded="true"
                         aria-controls="price">
                        <span>Price</span>
                        <span class="icon icon-arrow-up"></span>
                    </div>
                    <div id="price" class="collapse show">
                        <div class="widget-price">
                            <div id="slider-range"></div>
                            <div class="box-title-price">
                                <span class="title-price">Price :</span>
                                <div class="caption-price">
                                    <div>
                                        <span>$</span>
                                        <span id="slider-range-value1" class=""></span>
                                    </div>
                                    <span>-</span>
                                    <div>
                                        <span>$</span>
                                        <span id="slider-range-value2" class=""></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#brand" data-bs-toggle="collapse" aria-expanded="true"
                         aria-controls="brand">
                        <span>Brand</span>
                        <span class="icon icon-arrow-up"></span>
                    </div>
                    <div id="brand" class="collapse show">
                        <ul class="tf-filter-group current-scrollbar mb_36">
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="brand" class="tf-check" id="brand-1">
                                <label for="brand-1" class="label"><span>Ecomus</span>&nbsp;<span>(8)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="brand" class="tf-check" id="brand-2">
                                <label for="brand-2" class="label"><span>M&H</span>&nbsp;<span>(8)</span></label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#color" data-bs-toggle="collapse" aria-expanded="true"
                         aria-controls="color">
                        <span>Color</span>
                        <span class="icon icon-arrow-up"></span>
                    </div>
                    <div id="color" class="collapse show">
                        <ul class="tf-filter-group filter-color current-scrollbar mb_36">
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_beige" id="beige">
                                <label for="beige" class="label"><span>Beige</span>&nbsp;<span>(3)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_dark" id="black">
                                <label for="black" class="label"><span>Black</span>&nbsp;<span>(18)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_blue-2" id="blue">
                                <label for="blue" class="label"><span>Blue</span>&nbsp;<span>(3)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_brown" id="brown">
                                <label for="brown" class="label"><span>Brown</span>&nbsp;<span>(3)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_cream" id="cream">
                                <label for="cream" class="label"><span>Cream</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_dark-beige" id="dark-beige">
                                <label for="dark-beige"
                                       class="label"><span>Dark Beige</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_dark-blue" id="dark-blue">
                                <label for="dark-blue"
                                       class="label"><span>Dark Blue</span>&nbsp;<span>(3)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_dark-green" id="dark-green">
                                <label for="dark-green"
                                       class="label"><span>Dark Green</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_dark-grey" id="dark-grey">
                                <label for="dark-grey"
                                       class="label"><span>Dark Grey</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_grey" id="grey">
                                <label for="grey" class="label"><span>Grey</span>&nbsp;<span>(2)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_light-blue" id="light-blue">
                                <label for="light-blue"
                                       class="label"><span>Light Blue</span>&nbsp;<span>(5)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_light-green" id="light-green">
                                <label for="light-green"
                                       class="label"><span>Light Green</span>&nbsp;<span>(3)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_light-grey" id="light-grey">
                                <label for="light-grey"
                                       class="label"><span>Light Grey</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_light-pink" id="light-pink">
                                <label for="light-pink"
                                       class="label"><span>Light Pink</span>&nbsp;<span>(2)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_purple" id="light-purple">
                                <label for="light-purple" class="label"><span>Light Purple</span>&nbsp;<span>(2)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_light-yellow"
                                       id="light-yellow">
                                <label for="light-yellow" class="label"><span>Light Yellow</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_orange" id="orange">
                                <label for="orange" class="label"><span>Orange</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_pink" id="pink">
                                <label for="pink" class="label"><span>Pink</span>&nbsp;<span>(2)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_taupe" id="taupe">
                                <label for="taupe" class="label"><span>Taupe</span>&nbsp;<span>(1)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_white" id="white">
                                <label for="white" class="label"><span>White</span>&nbsp;<span>(14)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="color" class="tf-check-color bg_yellow" id="yellow">
                                <label for="yellow" class="label"><span>Yellow</span>&nbsp;<span>(1)</span></label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#size" data-bs-toggle="collapse" aria-expanded="true"
                         aria-controls="size">
                        <span>Size</span>
                        <span class="icon icon-arrow-up"></span>
                    </div>
                    <div id="size" class="collapse show">
                        <ul class="tf-filter-group current-scrollbar">
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="size" class="tf-check" id="s">
                                <label for="s" class="label"><span>S</span>&nbsp;<span>(7)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="size" class="tf-check" id="m">
                                <label for="m" class="label"><span>M</span>&nbsp;<span>(8)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="size" class="tf-check" id="l">
                                <label for="l" class="label"><span>L</span>&nbsp;<span>(8)</span></label>
                            </li>
                            <li class="list-item d-flex gap-12 align-items-center">
                                <input type="radio" name="size" class="tf-check" id="xl">
                                <label for="xl" class="label"><span>XL</span>&nbsp;<span>(6)</span></label>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<!-- End Filter -->


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

<!-- Filter sidebar-->
<div class="offcanvas offcanvas-start canvas-filter canvas-sidebar" id="sidebarmobile">
    <div class="canvas-wrapper">
        <header class="canvas-header">
            <span class="title">SIDEBAR PRODUCT</span>
            <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
        </header>
        <div class="canvas-body sidebar-mobile-append">

        </div>

    </div>
</div>
<!-- End Filter sidebar -->

<script>
    const rangeInput = document.querySelectorAll(".range-input input");
    const priceInput = document.querySelectorAll(".price-input input");
    const progress = document.querySelector(".progress");

    let priceGap = 10000;

    function formatCurrency(amount) {
        return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "đ";
    }

    function searchProducts(minVal, maxVal) {
        const path = window.location.pathname;
        let categoryId = null;

        const categoryRegex = /\/product-category-(\d+)/;
        const match = path.match(categoryRegex);
        if (match) {
            categoryId = match[1];
        }

        const requestData = {
            minPrice: minVal,
            maxPrice: maxVal
        };

        if (categoryId) {
            requestData.categoryId = categoryId;
        }

        $.ajax({
            url: "api/filter",
            type: "GET",
            data: requestData,
            success: function (response) {
                updateProductGrid(response);
            },
            error: function (error) {
            }
        });
    }

    function updateValues() {
        let minVal = parseInt(rangeInput[0].value);
        let maxVal = parseInt(rangeInput[1].value);

        if (maxVal - minVal < priceGap) {
            if (event && event.target.className === "range-min") {
                rangeInput[0].value = maxVal - priceGap;
                minVal = maxVal - priceGap;
            } else {
                rangeInput[1].value = minVal + priceGap;
                maxVal = minVal + priceGap;
            }
        }

        priceInput[0].value = formatCurrency(minVal);
        priceInput[1].value = formatCurrency(maxVal);
        let percent1 = (minVal / rangeInput[0].max) * 100;
        let percent2 = 100 - ((maxVal / rangeInput[1].max) * 100);
        progress.style.left = percent1 + "%";
        progress.style.right = percent2 + "%";
    }

    updateValues();

    rangeInput.forEach(input => {
        input.addEventListener("input", updateValues);
    });

    rangeInput.forEach(input => {
        input.addEventListener("mouseup", function () {
            const minVal = parseInt(rangeInput[0].value);
            const maxVal = parseInt(rangeInput[1].value);
            searchProducts(minVal, maxVal);
        });
    });

    function updateProductGrid(products) {
        const grid = $('.grid-layout');
        let productHtml = '';

        products.forEach((item, index) => {
            const formattedPrice = new Intl.NumberFormat('vi-VN').format(item.price) + ' VNĐ';

            productHtml += '<div class="card-product">';
            productHtml += '<div class="card-product-wrapper">';
            productHtml += '<a href="product-detail-' + item.id + '" class="product-img">';
            productHtml += '<img class="lazyload img-product" ' +
                'data-src="/repository' + item.image + '" ' +
                'src="/repository' + item.image + '" ' +
                'alt="' + item.title + '">';
            productHtml += '<img class="lazyload img-hover" ' +
                'data-src="/repository' + item.image + '" ' +
                'src="/repository' + item.image + '" ' +
                'alt="' + item.title + '">';
            productHtml += '</a>';

            productHtml += '<div class="list-product-btn absolute-2">';
            // Quick Add
            productHtml += '<a href="#quick_add" data-bs-toggle="modal" ' +
                'class="box-icon bg_white quick-add tf-btn-loading">';
            productHtml += '<span class="icon icon-bag"></span>';
            productHtml += '<span class="tooltip">Quick Add</span>';
            productHtml += '</a>';

            productHtml += '<a href="javascript:void(0);" ' +
                'class="box-icon bg_white wishlist btn-icon-action">';
            productHtml += '<span class="icon icon-heart"></span>';
            productHtml += '<span class="tooltip">Add to Wishlist</span>';
            productHtml += '<span class="icon icon-delete"></span>';
            productHtml += '</a>';

            productHtml += '<a href="#compare" data-bs-toggle="offcanvas" ' +
                'class="box-icon bg_white compare btn-icon-action">';
            productHtml += '<span class="icon icon-compare"></span>';
            productHtml += '<span class="tooltip">Add to Compare</span>';
            productHtml += '<span class="icon icon-check"></span>';
            productHtml += '</a>';

            productHtml += '<a href="#quick_view" data-bs-toggle="modal" ' +
                'class="box-icon bg_white quickview tf-btn-loading">';
            productHtml += '<span class="icon icon-view"></span>';
            productHtml += '<span class="tooltip">Quick View</span>';
            productHtml += '</a>';
            productHtml += '</div>';

            productHtml += '</div>';

            productHtml += '<div class="card-product-info">';
            productHtml += '<a href="product-detail-' + item.id + '" ' +
                'class="title link">' + item.title + '</a>';
            productHtml += '<span class="price">' + formattedPrice + '</span>';
            productHtml += '</div>';

            productHtml += '</div>';
        });

        grid.html(productHtml);
    }

    document.querySelectorAll('[data-sort]').forEach(item => {
        item.addEventListener('click', async (e) => {
            const sortType = e.target.dataset.sort;
            const path = window.location.pathname;
            let categoryId = null;

            const categoryRegex = /\/product-category-(\d+)/;
            const match = path.match(categoryRegex);
            if (match) {
                categoryId = match[1];
            }
            const requestData = {
                sortType: sortType,
            };

            if (categoryId) {
                requestData.categoryId = categoryId;
            }
            $.ajax({
                url: "api/filter/sort",
                type: "GET",
                data: requestData,
                success: function (response) {
                    updateProductGrid(response);
                },
                error: function (error) {
                }
            });
        })
    })
</script>
<script>
    function formatMoney(amount) {
        return new Intl.NumberFormat('vi-VN').format(amount);
    }
</script>

</html>