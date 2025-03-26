<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<%@ include file="/common/tablist.jsp" %>
<%--

  Created by IntelliJ IDEA.
  User: HP
  Date: 3/5/2025
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
        <div class="container " style="    max-width: 1250px;">
            <div class="row ">
                <div class="col-12">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h3 class="card-title mb-4">Thêm slider</h3>
                            <form class="needs-validation" novalidate id="listForm">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Tên slider</label>
                                        <input type="text" class="form-control" name="title" id="title" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="col-sm-3 no-padding-right">Hình ảnh</label>
                                        <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                        <div class="col-sm-9">
                                            <img src="" id="viewImage" width="200px"
                                                 height="200px">
                                        </div>
                                    </div>
                                </div>
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary" id="btnAddSlide">Thêm mới</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h3 class="card-title mb-4">Danh sách slides</h3>
                            <div class="table-responsive">
                                <div class="table-responsive">
                                    <display:table name="slidesDTOS" cellspacing="0" cellpadding="0"
                                                   requestURI="${slidesDTOS}"
                                                   id="tableList"
                                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                   style="margin: 3em 0 1.5em;"
                                    >
                                        <display:column headerClass="text-left" property="title" title="Tên sản phẩm"/>
                                        <display:column title="Thao tác">
                                            <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                                                    data-bs-target="#locationModal"
                                                    onclick="updateModalContent('${tableList.image}')">Xem slider
                                            </button>
                                            <button class="btn btn-xs btn-danger" title="Xóa sản phẩm"
                                                    onclick="deleteProduct(${tableList.id})">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                            <c:if test="${tableList.isActive ==1}">
                                                <button class="btn btn-xs btn-primary" onclick="useSlide(${tableList.id},'no')">
                                                    <i class="fa-solid fa-close"></i>
                                                </button>
                                            </c:if>
                                            <c:if test="${tableList.isActive ==0}">
                                                <button class="btn btn-xs btn-info" onclick="useSlide(${tableList.id},'yes')">
                                                    <i class="fa-solid fa-check"></i>
                                                </button>
                                            </c:if>
                                        </display:column>
                                    </display:table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="locationModalLabel">Slider</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="google-map margin-bottom-30">
                            <div class="maps_iframe">
                                <img id="modalImage" style="width: 750px;
                                                            height: 320px;"
                                     class="lazyload" src="" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddSlide').click(function () {
        var data = {};
        var formData = $('#listForm').serializeArray();

        $.each(formData, function (i, e) {
            if ('' !== e.value && null != e.value) {
                data['' + e.name + ''] = e.value;
            }

        });
        if ('' !== imageBase64) {
            data['imageBase64'] = imageBase64;
            data['imageName'] = imageName;
        } else {
            var fullSrc = $('#viewImage').attr('src');
            var productIndex = fullSrc.indexOf('/product');
            var result1 = productIndex !== -1 ? fullSrc.substring(productIndex) : fullSrc;
            data['image'] = result1;

        }
        addOrUpdate(data);

        function addOrUpdate(data) {
            $.ajax({
                type: "POST",
                url: "/api/slides",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function (respond) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Thêm mới sản phẩm thành công.',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 3000
                    }).then(() => {
                        window.location.href = "/admin/slide";
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
                        errorMessages = "Lỗi không xác định.";
                    }

                    Swal.fire({
                        title: 'Lỗi!',
                        html: errorMessages,
                        icon: 'error',
                        confirmButtonText: 'OK',
                        timer: 10000
                    });
                }
            });
        };

    })


    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function updateModalContent(imagePath) {
        document.getElementById("modalImage").src = "/repository" + imagePath;
    }

    function useSlide(id, req) {
        let dataToSend = JSON.stringify({ id: id, req: req });

        console.log("Data being sent:", dataToSend); // Kiểm tra dữ liệu JSON

        $.ajax({
            type: "POST",
            url: "/api/slides/use",
            data: dataToSend,
            contentType: "application/json",
            dataType: "json",
            success: function (respond) {
                Swal.fire({
                    title: 'Thành công!',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    timer: 3000
                }).then(() => {
                    window.location.href = "/admin/slide";
                });
            },
            error: function (respond) {
                Swal.fire({
                    title: 'Thành công!',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    timer: 3000
                }).then(() => {
                    window.location.href = "/admin/slide";
                });
            }
        });
    }
</script>

