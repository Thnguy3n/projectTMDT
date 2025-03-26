<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/6/2024
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- preload -->
<div class="preload preload-container">
    <div class="preload-logo">
        <div class="spinner"></div>
    </div>
</div>
<!-- /preload -->
<div id="wrapper">

    <!-- Header -->
    <!-- /Header -->
    <!-- breadcrumb -->
    <div class="tf-breadcrumb">
        <div class="container">
            <div class="tf-breadcrumb-wrap d-flex justify-content-between flex-wrap align-items-center">

                <div class="tf-breadcrumb-prev-next">
                    <a href="#" class="tf-breadcrumb-prev hover-tooltip center">
                        <i class="icon icon-arrow-left"></i>
                        <!-- <span class="tooltip">Cotton jersey top</span> -->
                    </a>
                    <a href="#" class="tf-breadcrumb-back hover-tooltip center">
                        <i class="icon icon-shop"></i>
                        <!-- <span class="tooltip">Back to Women</span> -->
                    </a>
                    <a href="#" class="tf-breadcrumb-next hover-tooltip center">
                        <i class="icon icon-arrow-right"></i>
                        <!-- <span class="tooltip">Cotton jersey top</span> -->
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
    <!-- default -->
    <section class="flat-spacing-4 pt_0">
        <div class="tf-main-product section-image-zoom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tf-product-media-wrap sticky-top">
                            <div class="thumbs-slider">
                                <div class="swiper tf-product-media-thumbs other-image-zoom"
                                     data-direction="vertical">
                                    <div class="swiper-wrapper stagger-wrap">
                                        <div class="swiper-slide stagger-item">
                                            <div class="item">
                                                <img class="lazyload" data-src="/repository${productDTO.image}"
                                                     src="/repository${productDTO.image}" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper tf-product-media-main" id="gallery-swiper-started">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <a href="/repository${productDTO.image}" target="_blank" class="item"
                                               data-pswp-width="770px" data-pswp-height="1075px">
                                                <img class="tf-image-zoom lazyload"
                                                     data-zoom="/repository${productDTO.image}"
                                                     data-src="/repository${productDTO.image}"
                                                     src="/repository${productDTO.image}" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="swiper-button-next button-style-arrow thumbs-next"></div>
                                    <div class="swiper-button-prev button-style-arrow thumbs-prev"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="tf-product-info-wrap position-relative">
                            <div class="tf-zoom-main"></div>
                            <div class="tf-product-info-list other-image-zoom">
                                <div class="tf-product-info-title">
                                    <h5>${productDTO.title}</h5>
                                </div>
                                <div class="tf-product-info-badges">
                                    <div class="badges">Best seller</div>
                                    <div class="product-status-content">
                                        <i class="icon-lightning"></i>
                                        <p class="fw-6">Bán nhanh! Đã có rất nhiều người mua sản phẩm này trong giỏ
                                            hàng</p>
                                    </div>
                                </div>
                                <div class="tf-product-info-price">
                                    <c:if test="${RemainingDiscountTime!=0}">
                                        <div class="price-on-sale">
                                            <c:set var="salePrice"
                                                   value="${productDTO.price-(productDTO.price * (productDTO.discount/100))}"/>
                                            <fmt:formatNumber value="${salePrice}" type="number" groupingUsed="true"/>
                                            VNĐ
                                        </div>
                                        <div class="compare-at-price">
                                            <fmt:formatNumber value="${productDTO.price}" pattern="#,###"/> VNĐ
                                        </div>
                                        <div class="badges-on-sale"><span>${productDTO.discount}</span>% OFF</div>
                                    </c:if>

                                    <c:if test="${RemainingDiscountTime==0}">
                                        <div class="price">
                                            <fmt:formatNumber value="${productDTO.price}" pattern="#,###"/> VNĐ
                                        </div>
                                    </c:if>
                                </div>

                                <div class="tf-product-info-liveview">
                                    <div class="liveview-count"></div>
                                    <p class="fw-6">Mọi người đang xem ngay bây giờ</p>
                                </div>

                                <c:if test="${RemainingDiscountTime!=0}">
                                    <div class="tf-product-info-countdown">
                                        <div class="countdown-wrap">
                                            <div class="countdown-title">
                                                <i class="icon-time tf-ani-tada"></i>
                                                <p>NHANH LÊN! KHUYẾN MẠI KẾT THÚC SAU:</p>

                                            </div>

                                            <div class="tf-countdown style-1">
                                                <div hidden="hidden"
                                                     id="start-Discount">${productDTO.start_discount}</div>
                                                <div hidden="hidden" id="end-Discount">${productDTO.end_discount}</div>
                                                <div class="js-countdown" data-timer="${RemainingDiscountTime}"
                                                     data-labels="Ngày :,Giờ :,Phút :,Giây"></div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="tf-product-info-variant-picker">
                                    <div class="variant-picker-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="variant-picker-label">
                                                Size: <span class="fw-6 variant-picker-label-value"
                                                            id="selectedSize">S</span>
                                            </div>
                                            <a href="#find_size" data-bs-toggle="modal" class="find-size fw-6">Tìm kích
                                                thước của bạn</a>
                                        </div>
                                        <div class="variant-picker-values">
                                            <input type="radio" name="size" id="values-s" value="S" checked>
                                            <label class="style-text" for="values-s" data-value="S"><p>S</p></label>
                                            <input type="radio" name="size" id="values-m" value="M">
                                            <label class="style-text" for="values-m" data-value="M"><p>M</p></label>
                                            <input type="radio" name="size" id="values-l" value="L">
                                            <label class="style-text" for="values-l" data-value="L"><p>L</p></label>
                                            <input type="radio" name="size" id="values-xl" value="XL">
                                            <label class="style-text" for="values-xl" data-value="XL"><p>XL</p></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="tf-product-info-quantity">
                                    <div class="quantity-title fw-6">Số lượng</div>
                                    <div class="wg-quantity">
                                        <span id="minus-btn" class="btn-quantity">-</span>
                                        <input type="text" name="quantity" id="quantity" value="1">
                                        <span id="plus-btn" class="btn-quantity">+</span>
                                    </div>
                                </div>
                                <security:authorize access="isAuthenticated()">
                                    <%--                                <c:if test="${productDTO.inventory =0 }"></c:if>--%>
                                    <div class="tf-product-info-buy-button">
                                        <form class="">
                                            <button onclick="addToCart()"
                                                    class="tf-btn btn-fill justify-content-center fw-6 fs-16 flex-grow-1 animate-hover-btn ">
                                                <span>Thêm vào giỏ hàng &nbsp;</span></button>
                                            <a href="javascript:void(0);"
                                               class="tf-product-btn-wishlist hover-tooltip box-icon bg_white wishlist btn-icon-action">
                                                <span class="icon icon-heart"></span>
                                                <span class="tooltip">Thêm vào danh sách mong muốn</span>
                                                <span class="icon icon-delete"></span>
                                            </a>
                                            <a href="#compare" data-bs-toggle="offcanvas"
                                               aria-controls="offcanvasLeft"
                                               class="tf-product-btn-wishlist hover-tooltip box-icon bg_white compare btn-icon-action">
                                                <span class="icon icon-compare"></span>
                                                <span class="tooltip">Thêm vào so sánh</span>
                                                <span class="icon icon-check"></span>
                                            </a>
                                            <div class="w-100">
                                                <a href="#" class="btns-full fs-16">Mua bằng <img
                                                        style="max-width: 50px; max-height: 30px"
                                                        src="images/payments/Logo-VNPAY-QR-1.webp"
                                                        alt=""></a>
                                                <a href="#" class="payment-more-option">Nhiều lựa chọn thanh toán
                                                    hơn</a>
                                            </div>
                                        </form>
                                    </div>
                                </security:authorize>
                                <div class="tf-product-info-extra-link">

                                    <a href="#ask_question" data-bs-toggle="modal"
                                       class="tf-product-extra-icon">
                                        <div class="icon">
                                            <i class="icon-question"></i>
                                        </div>
                                        <div class="text fw-6">Đặt câu hỏi</div>
                                    </a>
                                    <a href="#delivery_return" data-bs-toggle="modal"
                                       class="tf-product-extra-icon">
                                        <div class="icon">
                                            <svg class="d-inline-block" xmlns="http://www.w3.org/2000/svg"
                                                 width="22"
                                                 height="18" viewBox="0 0 22 18" fill="currentColor">
                                                <path d="M21.7872 10.4724C21.7872 9.73685 21.5432 9.00864 21.1002 8.4217L18.7221 5.27043C18.2421 4.63481 17.4804 4.25532 16.684 4.25532H14.9787V2.54885C14.9787 1.14111 13.8334 0 12.4255 0H9.95745V1.69779H12.4255C12.8948 1.69779 13.2766 2.07962 13.2766 2.54885V14.5957H8.15145C7.80021 13.6052 6.85421 12.8936 5.74468 12.8936C4.63515 12.8936 3.68915 13.6052 3.33792 14.5957H2.55319C2.08396 14.5957 1.70213 14.2139 1.70213 13.7447V2.54885C1.70213 2.07962 2.08396 1.69779 2.55319 1.69779H9.95745V0H2.55319C1.14528 0 0 1.14111 0 2.54885V13.7447C0 15.1526 1.14528 16.2979 2.55319 16.2979H3.33792C3.68915 17.2884 4.63515 18 5.74468 18C6.85421 18 7.80021 17.2884 8.15145 16.2979H13.423C13.7742 17.2884 14.7202 18 15.8297 18C16.9393 18 17.8853 17.2884 18.2365 16.2979H21.7872V10.4724ZM16.684 5.95745C16.9494 5.95745 17.2034 6.08396 17.3634 6.29574L19.5166 9.14894H14.9787V5.95745H16.684ZM5.74468 16.2979C5.27545 16.2979 4.89362 15.916 4.89362 15.4468C4.89362 14.9776 5.27545 14.5957 5.74468 14.5957C6.21392 14.5957 6.59575 14.9776 6.59575 15.4468C6.59575 15.916 6.21392 16.2979 5.74468 16.2979ZM15.8298 16.2979C15.3606 16.2979 14.9787 15.916 14.9787 15.4468C14.9787 14.9776 15.3606 14.5957 15.8298 14.5957C16.299 14.5957 16.6809 14.9776 16.6809 15.4468C16.6809 15.916 16.299 16.2979 15.8298 16.2979ZM18.2366 14.5957C17.8853 13.6052 16.9393 12.8936 15.8298 12.8936C15.5398 12.8935 15.252 12.943 14.9787 13.04V10.8511H20.0851V14.5957H18.2366Z"></path>
                                            </svg>
                                        </div>
                                        <div class="text fw-6">Giao hàng & Trả lại</div>
                                    </a>
                                    <a href="#share_social" data-bs-toggle="modal"
                                       class="tf-product-extra-icon">
                                        <div class="icon">
                                            <i class="icon-share"></i>
                                        </div>
                                        <div class="text fw-6">Chia sẻ</div>
                                    </a>
                                </div>
                                <div class="tf-product-info-delivery-return">
                                    <div class="row">
                                        <div class="col-xl-6 col-12">
                                            <div class="tf-product-delivery">
                                                <div class="icon">
                                                    <i class="icon-delivery-time"></i>
                                                </div>
                                                <p>Thời gian giao hàng ước tính: <span
                                                        class="fw-7">12-26 ngày</span>
                                                    (Quốc tế), <span class="fw-7">3-6 ngày</span> (Việt Nam).
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-12">
                                            <div class="tf-product-delivery mb-0">
                                                <div class="icon">
                                                    <i class="icon-return-order"></i>
                                                </div>
                                                <p>Trả hàng trong vòng <span class="fw-7">30 ngày</span> kể từ
                                                    ngày mua.
                                                    Thuế và phí không được hoàn lại.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tf-product-info-trust-seal">
                                    <div class="tf-product-trust-mess">
                                        <i class="icon-safe"></i>
                                        <p class="fw-6">Đảm bảo an toàn <br> Thanh toán</p>
                                    </div>
                                    <div class="tf-payment">
                                        <img src="images/payments/visa.png" alt="">
                                        <img src="images/payments/img-1.png" alt="">
                                        <img src="images/payments/img-2.png" alt="">
                                        <img src="images/payments/img-3.png" alt="">
                                        <img src="images/payments/img-4.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /default -->
    <!-- tabs -->
    <section class="flat-spacing-17 pt_0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="widget-tabs style-has-border">
                        <ul class="widget-menu-tab">
                            <li class="item-title active">
                                <span class="inner">Mô tả</span>
                            </li>
                            <li class="item-title">
                                <span class="inner">Đánh giá</span>
                            </li>
                            <li class="item-title">
                                <span class="inner">Vận chuyển</span>
                            </li>
                            <li class="item-title">
                                <span class="inner">Chính sách trả hàng</span>
                            </li>
                        </ul>
                        <div class="widget-content-tab">
                            <div class="widget-content-inner active">
                                <div class="">
                                    <p class="mb_30">
                                        Áo sơ mi tay cài nút và kiểu dáng thoải mái. Được may đo bằng vải có kết cấu
                                        nhăn, mềm mại được làm từ sợi Lencoze LENZING™ ECOVERO™ — sợi gỗ có nguồn gốc
                                        có trách nhiệm
                                        được sản xuất thông qua quy trình giảm tác động đến rừng, đa dạng sinh học và
                                        nguồn cung cấp nước.
                                    </p>
                                    <div class="tf-product-des-demo">
                                        <div class="right">
                                            <h3 class="fs-16 fw-5">Đặc trưng</h3>
                                            <ul>
                                                <li>Nút cài phía trước</li>
                                                <li>Tay áo có thể điều chỉnh</li>
                                                <li>Huy hiệu thêu Babaton ở vạt áo và viền áo</li>
                                            </ul>
                                            <h3 class="fs-16 fw-5">Chăm sóc vật liệu</h3>
                                            <ul class="mb-0">
                                                <li>Thành phần: 100% LENZING™ ECOVERO™ Viscose</li>
                                                <li>Bảo quản: Giặt tay</li>
                                                <li>Nhập khẩu</li>
                                            </ul>
                                        </div>
                                        <div class="left">
                                            <h3 class="fs-16 fw-5">Chăm sóc vật liệu</h3>
                                            <div class="d-flex gap-10 mb_15 align-items-center">
                                                <div class="icon">
                                                    <i class="icon-machine"></i>
                                                </div>
                                                <span>Giặt máy tối đa 30ºC. Vắt ngắn.</span>
                                            </div>
                                            <div class="d-flex gap-10 mb_15 align-items-center">
                                                <div class="icon">
                                                    <i class="icon-iron"></i>
                                                </div>
                                                <span>Sắt tối đa 110ºC.</span>
                                            </div>
                                            <div class="d-flex gap-10 mb_15 align-items-center">
                                                <div class="icon">
                                                    <i class="icon-bleach"></i>
                                                </div>
                                                <span>Không tẩy/tẩy.</span>
                                            </div>
                                            <div class="d-flex gap-10 mb_15 align-items-center">
                                                <div class="icon">
                                                    <i class="icon-dry-clean"></i>
                                                </div>
                                                <span>Không giặt khô.</span>
                                            </div>
                                            <div class="d-flex gap-10 align-items-center">
                                                <div class="icon">
                                                    <i class="icon-tumble-dry"></i>
                                                </div>
                                                <span>Sấy khô ở nhiệt độ vừa phải.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-inner">
                                <table class="tf-pr-attrs">
                                    <tbody>
                                    <tr class="tf-attr-pa-color">
                                        <th class="tf-attr-label">Màu</th>
                                        <td class="tf-attr-value">
                                            <p>Trắng, Hồng, Đen</p>
                                        </td>
                                    </tr>
                                    <tr class="tf-attr-pa-size">
                                        <th class="tf-attr-label">Kích cỡ</th>
                                        <td class="tf-attr-value">
                                            <p>S, M, L, XL</p>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="widget-content-inner">
                                <div class="tf-page-privacy-policy">
                                    <div class="title">Chính sách của Công ty TNHH Tư nhân</div>
                                    <p>Công ty TNHH Tư nhân và mỗi công ty con, công ty mẹ và công ty liên kết tương ứng
                                        của họ được coi là vận hành Trang web này ("chúng tôi") nhận ra rằng bạn quan
                                        tâm đến cách thông tin về bạn được sử dụng và chia sẻ. Chúng tôi đã tạo Chính
                                        sách bảo mật này để thông báo cho bạn thông tin nào chúng tôi thu thập trên
                                        Trang web, cách chúng tôi sử dụng thông tin của bạn và các lựa chọn bạn có về
                                        cách thông tin của bạn được thu thập và sử dụng. Vui lòng đọc kỹ Chính sách bảo
                                        mật này. Việc bạn sử dụng Trang web cho thấy bạn đã đọc và chấp nhận các thông
                                        lệ về quyền riêng tư của chúng tôi, như được nêu trong Chính sách quyền riêng tư
                                        này.</p>
                                    <p>Xin lưu ý rằng các thông lệ được mô tả trong Chính sách quyền riêng tư này áp
                                        dụng cho thông tin do chúng tôi hoặc các công ty con, chi nhánh hoặc đại lý của
                                        chúng tôi thu thập: (i) thông qua Trang web này, (ii) khi áp dụng, thông qua Bộ
                                        phận dịch vụ khách hàng của chúng tôi liên quan đến Trang web này, (iii) thông
                                        qua thông tin được cung cấp cho chúng tôi tại các cửa hàng bán lẻ độc lập của
                                        chúng tôi và (iv) thông qua thông tin được cung cấp cho chúng tôi cùng với các
                                        chương trình khuyến mãi tiếp thị và rút thăm trúng thưởng.</p>
                                    <p>Chúng tôi không chịu trách nhiệm về nội dung hoặc các thông lệ về quyền riêng tư
                                        trên bất kỳ trang web nào.</p>
                                    <p>Chúng tôi có toàn quyền quyết định sửa đổi, cập nhật, bổ sung, ngừng, xóa hoặc
                                        thay đổi bất kỳ phần nào của Chính sách quyền riêng tư này, toàn bộ hoặc một
                                        phần, bất kỳ lúc nào. Khi chúng tôi sửa đổi Chính sách bảo mật này, chúng tôi sẽ
                                        sửa đổi ngày "cập nhật lần cuối" nằm ở đầu Chính sách bảo mật này.</p>
                                    <p>Nếu bạn cung cấp thông tin cho chúng tôi hoặc truy cập hoặc sử dụng Trang web
                                        theo bất kỳ cách nào sau khi Chính sách bảo mật này đã được thay đổi, bạn sẽ
                                        được coi là đã đồng ý và chấp thuận vô điều kiện với những thay đổi đó. Phiên
                                        bản mới nhất của Chính sách bảo mật này sẽ có trên Trang web và sẽ thay thế tất
                                        cả các phiên bản trước đó của Chính sách bảo mật này.</p>
                                    <p>Nếu bạn có bất kỳ câu hỏi nào liên quan đến Chính sách bảo mật này, bạn nên liên
                                        hệ với Bộ phận dịch vụ khách hàng của chúng tôi qua email tại
                                        marketing@company.com</p>
                                </div>
                            </div>
                            <div class="widget-content-inner">
                                <ul class="d-flex justify-content-center mb_18">
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M8.7 30.7h22.7c.3 0 .6-.2.7-.6l4-25.3c-.1-.4-.3-.7-.7-.8s-.7.2-.8.6L34 8.9l-3-1.1c-2.4-.9-5.1-.5-7.2 1-2.3 1.6-5.3 1.6-7.6 0-2.1-1.5-4.8-1.9-7.2-1L6 8.9l-.7-4.3c0-.4-.4-.7-.7-.6-.4.1-.6.4-.6.8l4 25.3c.1.3.3.6.7.6zm.8-21.6c2-.7 4.2-.4 6 .8 1.4 1 3 1.5 4.6 1.5s3.2-.5 4.6-1.5c1.7-1.2 4-1.6 6-.8l3.3 1.2-3 19.1H9.2l-3-19.1 3.3-1.2zM32 32H8c-.4 0-.7.3-.7.7s.3.7.7.7h24c.4 0 .7-.3.7-.7s-.3-.7-.7-.7zm0 2.7H8c-.4 0-.7.3-.7.7s.3.6.7.6h24c.4 0 .7-.3.7-.7s-.3-.6-.7-.6zm-17.9-8.9c-1 0-1.8-.3-2.4-.6l.1-2.1c.6.4 1.4.6 2 .6.8 0 1.2-.4 1.2-1.3s-.4-1.3-1.3-1.3h-1.3l.2-1.9h1.1c.6 0 1-.3 1-1.3 0-.8-.4-1.2-1.1-1.2s-1.2.2-1.9.4l-.2-1.9c.7-.4 1.5-.6 2.3-.6 2 0 3 1.3 3 2.9 0 1.2-.4 1.9-1.1 2.3 1 .4 1.3 1.4 1.3 2.5.3 1.8-.6 3.5-2.9 3.5zm4-5.5c0-3.9 1.2-5.5 3.2-5.5s3.2 1.6 3.2 5.5-1.2 5.5-3.2 5.5-3.2-1.6-3.2-5.5zm4.1 0c0-2-.1-3.5-.9-3.5s-1 1.5-1 3.5.1 3.5 1 3.5c.8 0 .9-1.5.9-3.5zm4.5-1.4c-.9 0-1.5-.8-1.5-2.1s.6-2.1 1.5-2.1 1.5.8 1.5 2.1-.5 2.1-1.5 2.1zm0-.8c.4 0 .7-.5.7-1.2s-.2-1.2-.7-1.2-.7.5-.7 1.2.3 1.2.7 1.2z">
                                            </path>
                                        </svg>
                                    </li>
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M36.7 31.1l-2.8-1.3-4.7-9.1 7.5-3.5c.4-.2.6-.6.4-1s-.6-.5-1-.4l-7.5 3.5-7.8-15c-.3-.5-1.1-.5-1.4 0l-7.8 15L4 15.9c-.4-.2-.8 0-1 .4s0 .8.4 1l7.5 3.5-4.7 9.1-2.8 1.3c-.4.2-.6.6-.4 1 .1.3.4.4.7.4.1 0 .2 0 .3-.1l1-.4-1.5 2.8c-.1.2-.1.5 0 .8.1.2.4.3.7.3h31.7c.3 0 .5-.1.7-.4.1-.2.1-.5 0-.8L35.1 32l1 .4c.1 0 .2.1.3.1.3 0 .6-.2.7-.4.1-.3 0-.8-.4-1zm-5.1-2.3l-9.8-4.6 6-2.8 3.8 7.4zM20 6.4L27.1 20 20 23.3 12.9 20 20 6.4zm-7.8 15l6 2.8-9.8 4.6 3.8-7.4zm22.4 13.1H5.4L7.2 31 20 25l12.8 6 1.8 3.5z">
                                            </path>
                                        </svg>
                                    </li>
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M5.9 5.9v28.2h28.2V5.9H5.9zM19.1 20l-8.3 8.3c-2-2.2-3.2-5.1-3.2-8.3s1.2-6.1 3.2-8.3l8.3 8.3zm-7.4-9.3c2.2-2 5.1-3.2 8.3-3.2s6.1 1.2 8.3 3.2L20 19.1l-8.3-8.4zM20 20.9l8.3 8.3c-2.2 2-5.1 3.2-8.3 3.2s-6.1-1.2-8.3-3.2l8.3-8.3zm.9-.9l8.3-8.3c2 2.2 3.2 5.1 3.2 8.3s-1.2 6.1-3.2 8.3L20.9 20zm8.4-10.2c-1.2-1.1-2.6-2-4.1-2.6h6.6l-2.5 2.6zm-18.6 0L8.2 7.2h6.6c-1.5.6-2.9 1.5-4.1 2.6zm-.9.9c-1.1 1.2-2 2.6-2.6 4.1V8.2l2.6 2.5zM7.2 25.2c.6 1.5 1.5 2.9 2.6 4.1l-2.6 2.6v-6.7zm3.5 5c1.2 1.1 2.6 2 4.1 2.6H8.2l2.5-2.6zm18.6 0l2.6 2.6h-6.6c1.4-.6 2.8-1.5 4-2.6zm.9-.9c1.1-1.2 2-2.6 2.6-4.1v6.6l-2.6-2.5zm2.6-14.5c-.6-1.5-1.5-2.9-2.6-4.1l2.6-2.6v6.7z">
                                            </path>
                                        </svg>
                                    </li>
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M35.1 33.6L33.2 6.2c0-.4-.3-.7-.7-.7H13.9c-.4 0-.7.3-.7.7s.3.7.7.7h18l.7 10.5H20.8c-8.8.2-15.9 7.5-15.9 16.4 0 .4.3.7.7.7h28.9c.2 0 .4-.1.5-.2s.2-.3.2-.5v-.2h-.1zm-28.8-.5C6.7 25.3 13 19 20.8 18.9h11.9l1 14.2H6.3zm11.2-6.8c0 1.2-1 2.1-2.1 2.1s-2.1-1-2.1-2.1 1-2.1 2.1-2.1 2.1 1 2.1 2.1zm6.3 0c0 1.2-1 2.1-2.1 2.1-1.2 0-2.1-1-2.1-2.1s1-2.1 2.1-2.1 2.1 1 2.1 2.1z">
                                            </path>
                                        </svg>
                                    </li>
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M20 33.8c7.6 0 13.8-6.2 13.8-13.8S27.6 6.2 20 6.2 6.2 12.4 6.2 20 12.4 33.8 20 33.8zm0-26.3c6.9 0 12.5 5.6 12.5 12.5S26.9 32.5 20 32.5 7.5 26.9 7.5 20 13.1 7.5 20 7.5zm-.4 15h.5c1.8 0 3-1.1 3-3.7 0-2.2-1.1-3.6-3.1-3.6h-2.6v10.6h2.2v-3.3zm0-5.2h.4c.6 0 .9.5.9 1.7 0 1.1-.3 1.7-.9 1.7h-.4v-3.4z">
                                            </path>
                                        </svg>
                                    </li>
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M30.2 29.3c2.2-2.5 3.6-5.7 3.6-9.3s-1.4-6.8-3.6-9.3l3.6-3.6c.3-.3.3-.7 0-.9-.3-.3-.7-.3-.9 0l-3.6 3.6c-2.5-2.2-5.7-3.6-9.3-3.6s-6.8 1.4-9.3 3.6L7.1 6.2c-.3-.3-.7-.3-.9 0-.3.3-.3.7 0 .9l3.6 3.6c-2.2 2.5-3.6 5.7-3.6 9.3s1.4 6.8 3.6 9.3l-3.6 3.6c-.3.3-.3.7 0 .9.1.1.3.2.5.2s.3-.1.5-.2l3.6-3.6c2.5 2.2 5.7 3.6 9.3 3.6s6.8-1.4 9.3-3.6l3.6 3.6c.1.1.3.2.5.2s.3-.1.5-.2c.3-.3.3-.7 0-.9l-3.8-3.6z">
                                            </path>
                                        </svg>
                                    </li>
                                    <li class="">
                                        <svg viewBox="0 0 40 40" width="35px" height="35px" color="#222" margin="5px">
                                            <path fill="currentColor"
                                                  d="M34.1 34.1H5.9V5.9h28.2v28.2zM7.2 32.8h25.6V7.2H7.2v25.6zm13.5-18.3a.68.68 0 0 0-.7-.7.68.68 0 0 0-.7.7v10.9a.68.68 0 0 0 .7.7.68.68 0 0 0 .7-.7V14.5z">
                                            </path>
                                        </svg>
                                    </li>
                                </ul>
                                <p class="text-center text-paragraph">LT01: 70% len, 15% polyester, 10% polyamide, 5%
                                    acrylic 900 Gram/tấn</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /tabs -->
    <!-- product -->
    <section class="flat-spacing-1 pt_0" style="height: fit-content">
        <div class="container">
            <div class="flat-title">
                <span class="title"> -Giảm giá mạnh !!!!- </span>
            </div>
            <div class="hover-sw-nav hover-sw-2">
                <div class="swiper tf-sw-product-sell wrap-sw-over" data-preview="4" data-tablet="3" data-mobile="2"
                     data-space-lg="30" data-space-md="15" data-pagination="2" data-pagination-md="3"
                     data-pagination-lg="3">
                    <div class="swiper-wrapper">
                        <c:forEach items="${Bigsale2}" var="item">
                            <div class="swiper-slide" lazy="true">
                                <div class="card-product">
                                    <div class="card-product-wrapper">
                                        <a href="<c:url value="product-detail-${item.id}"/> " class="product-img">
                                            <img class="lazyload img-product" data-src="/repository${item.image}"
                                                 src="/repository${item.image}" alt="image-product">
                                        </a>
                                        <div class="list-product-btn">
                                            <a href="#quick_add" data-bs-toggle="modal"
                                               class="box-icon bg_white quick-add tf-btn-loading">
                                                <span class="icon icon-bag"></span>
                                                <span class="tooltip">Quick Add</span>
                                            </a>
                                        </div>
                                        <div class="size-list">
                                            <span>S</span>
                                            <span>M</span>
                                            <span>L</span>
                                            <span>XL</span>
                                        </div>
                                    </div>
                                    <div class="card-product-info">
                                        <div class="card-product-info has-padding">
                                            <a href="<c:url value="product-detail-${item.id}"/> "
                                               class="title link">${item.title}</a>
                                            <span class="price"><span
                                                    class="fw-4 text-sale"><fmt:formatNumber value="${item.price}"
                                                                                             pattern="#,###"/> VNĐ</span> <span
                                                    class="text_primary"><c:set var="salePrice"
                                                                                value="${item.price-(item.price * (item.discount/100))}"/>
                                                                         <fmt:formatNumber value="${salePrice}"
                                                                                           type="number"
                                                                                           groupingUsed="true"/> VNĐ</span>
                                            </span>
                                        </div>
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
                <div class="sw-dots style-2 sw-pagination-product justify-content-center"></div>
            </div>
        </div>
    </section>
    <!-- /product -->
    <!-- recent -->
    <!-- /recent -->
    <!-- footer -->

    <!-- /footer -->

</div>

<!-- gotop -->
<div class="progress-wrap">
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"
              style="transition: stroke-dashoffset 10ms linear 0s; stroke-dasharray: 307.919, 307.919; stroke-dashoffset: 286.138;"></path>
    </svg>
</div>
<!-- /gotop -->
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
    <input type="hidden" name="Product" id="productId" value="${productDTO.id}">
    <input type="hidden" name="discountStatus" id="discountStatus" value="${DiscountStatus}">


</div>
<!-- /modal find_size -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    document.querySelectorAll('input[name="size"]').forEach((input) => {
        input.addEventListener('change', (event) => {
            document.getElementById('selectedSize').innerText = event.target.value;
        });
    });
    document.getElementById('plus-btn').addEventListener('click', () => {
        const quantityInput = document.getElementById('quantity');
        quantityInput.value = parseInt(quantityInput.value) + 1;
    });

    document.getElementById('minus-btn').addEventListener('click', () => {
        const quantityInput = document.getElementById('quantity');
        if (parseInt(quantityInput.value) > 1) {
            quantityInput.value = parseInt(quantityInput.value) - 1;
        }
    });


    async function addToCart() {
        const selectedSize = document.querySelector('input[name="size"]:checked').value;
        const quantity = parseInt(document.getElementById('quantity').value);
        const productId = document.getElementById('productId').value;
        const discountStatus= document.getElementById('discountStatus').value;

        const cartItem = {
            productId: productId,
            size: selectedSize,
            quantity: quantity,
            discount_status: discountStatus
        };

        try {
            const response = await fetch(`/api/cart/addOrUpdate?&isUpdateQuantity=false`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(cartItem)
            });

            if (response.ok) {
                alert(`Đã thêm sản phẩm vào giỏ hàng!`);
            } else {
                alert("Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng.");
            }
        } catch (error) {
            console.error('Error:', error);
            alert(`Đã thêm sản phẩm vào giỏ hàng!`);
        }
    }

</script>

<!-- Javascript -->
<script defer type="text/javascript" src="js/swiper-bundle.min.js"></script>
<script defer type="text/javascript" src="js/carousel.js"></script>
<script defer type="text/javascript" src="js/count-down.js"></script>
<script defer type="text/javascript" src="js/lazysize.min.js"></script>
<script defer type="text/javascript" src="js/bootstrap-select.min.js"></script>
<script defer type="text/javascript" src="js/drift.min.js"></script>
<script defer type="text/javascript" src="js/wow.min.js"></script>
<script defer type="text/javascript" src="js/main.js"></script>
<script defer type="module" src="js/model-viewer.min.js"></script>
<script defer type="module" src="js/zoom.js"></script>

