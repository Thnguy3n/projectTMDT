<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/15/2025
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<div class="offcanvas offcanvas-end canvas-search" id="canvasSearch">
    <div class="canvas-wrapper">
        <header class="tf-search-head">
            <div class="title fw-5">
                Tìm kiếm
                <div class="close">
                    <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
                </div>
            </div>
            <div class="tf-search-sticky">
                <form class="tf-mini-search-frm" id="formSubmit">
                    <fieldset class="text">
                        <input type="text" placeholder="Tìm kiếm" name="keyword" id="searchInput" tabindex="0" value=""
                               aria-required="true" required>
                    </fieldset>
                    <button type="submit" id="btnSearch"><i class="icon-search"></i></button>
                </form>
            </div>
        </header>
        <div class="canvas-body p-0">
            <div class="tf-search-content">
                <div class="tf-cart-hide-has-results">
                    <div class="tf-col-content">
                        <div class="tf-search-hidden-inner">


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        var debounceTimer;
        let currentRequest = null;
        let currentKeyword = "";
        function formatMoney(amount) {
            return new Intl.NumberFormat('vi-VN').format(amount);
        }
        $('#searchInput').on('keyup', function () {
            const keyword = $(this).val().trim();
            const container = $('.tf-search-hidden-inner');
            currentKeyword = keyword; // Cập nhật keyword hiện tại
            if (currentRequest) {
                currentRequest.abort();
            }
            if (keyword !== '') {
                clearTimeout(debounceTimer);
                debounceTimer = setTimeout(function () {
                    currentRequest = $.ajax({
                        type: "GET",
                        url: "/search",
                        data: { keyword: keyword },
                        success: function (productList) {
                            if (keyword !== currentKeyword) return;
                            let row = '';
                            productList.forEach((item) => {
                                if (item.discountStatus === 1) {
                                    const salePrice = item.price - (item.price * (item.discount / 100));

                                    row += '<div class="tf-loop-item">';
                                    row += '<div class="image">';
                                    row += '<a href="product-detail-' + item.id + '">';
                                    row += '<img src="/repository' + item.image + '" alt="' + item.title + '">';
                                    row += '</a>';
                                    row += '</div>';
                                    row += '<div class="content">';
                                    row += '<a href="product-detail-' + item.id + '">' + item.title + '</a>';
                                    row += '<div class="tf-product-info-price">';
                                    row += '<div class="compare-at-price">' + formatMoney(item.price) + ' VNĐ</div>';
                                    row += '<div class="price-on-sale fw-6">' + formatMoney(salePrice) + ' VNĐ</div>';
                                    row += '</div>';
                                    row += '</div>';
                                    row += '</div>';

                                } else {
                                    row += '<div class="tf-loop-item">';
                                    row += '<div class="image">';
                                    row += '<a href="product-detail-' + item.id + '">';
                                    row += '<img src="/repository' + item.image + '" alt="' + item.title + '">';
                                    row += '</a>';
                                    row += '</div>';
                                    row += '<div class="content">';
                                    row += '<a href="product-detail-' + item.id + '">' + item.title + '</a>';
                                    row += '<div class="tf-product-info-price">';
                                    row += '<div class="price fw-6">' + formatMoney(item.price) + ' VNĐ</div>';
                                    row += '</div>';
                                    row += '</div>';
                                    row += '</div>';
                                }
                            });

                            container.html(row);
                        },
                        error: function (error) {
                            console.error("Lỗi khi tìm kiếm:", error);
                            container.html('<p class="error-message">Lỗi tải kết quả tìm kiếm</p>');
                        }
                    });
                }, 500);
            }
            else {
                container.empty();
            }
        });
    });

</script>