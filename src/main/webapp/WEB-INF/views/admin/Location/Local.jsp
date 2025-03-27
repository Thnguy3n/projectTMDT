<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/4/2025
  Time: 6:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/tablist.jsp" %>
<%@ page import="com.javabackend.shop.security.utils.SecurityUtils" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="container py-5">
    <div class="row ">
        <div class="col-12">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="card-title mb-4">Thêm địa chỉ cửa hàng</h3>
                    <form class="needs-validation" novalidate>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Tên cửa hàng</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" required>
                            </div>
                        </div>


                        <div class="d-grid gap-2">
                            <button type="button" class="btn btn-outline-primary">Locate on Map</button>
                            <button type="submit" class="btn btn-primary">Add Store</button>
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
                    <h3 class="card-title mb-4">Stored Locations</h3>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Store Name</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Main Store</td>
                                <td>123 Main St</td>
                                <td>Los Angeles</td>
                                <td>CA</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-2">Edit</button>
                                    <button class="btn btn-sm btn-outline-danger me-2">Delete</button>
                                    <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                                            data-bs-target="#locationModal">View Location
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="locationModalLabel">Vị trí</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                    <div class="google-map margin-bottom-30">
                        <div class="maps_iframe">
                            <iframe style="width: 100%;"
                                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7838.214138986561!2d106.657662!3d10.803111!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529aa381a52b1%3A0x9eba1cde4c171da3!2zNTEgR2nhuqNpIFBow7NuZywgUGjGsOG7nW5nIDQsIFTDom4gQsOsbmgsIEjhu5MgQ2jDrSBNaW5oIDcwMDAwLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1741100498259!5m2!1svi!2sus"
                                    width="600" height="450" style="border:0;" allowfullscreen=""
                                    loading="lazy"></iframe>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
