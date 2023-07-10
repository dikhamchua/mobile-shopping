<%-- 
    Document   : profile
    Created on : Feb 9, 2023, 4:57:23 PM
    Author     : PHAM KHAC VINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserProfile Page</title>
        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
              integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Page level plugin CSS-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap4.min.css">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <!-- Navbar -->
        <jsp:include page="navbar.jsp"></jsp:include>
            <div id="wrapper">
                <!--Sidebar--> 
            <jsp:include page="sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <h4>Thông tin của bạn</h4>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 justify-content-center">
                                        <form class="justify-content-center" action="${pageContext.request.contextPath}/dashboard?action=profile" method="POST">
                                            <!-- Username -->
                                            <div class="form-group justify-content-center row">
                                                <label for="username" class="col-2 col-form-label">Tài khoản</label>
                                                <div class="col-6">
                                                    <input id="username" name="username" placeholder="Tài khoản" readonly class="form-control here"
                                                           type="text" value="${sessionScope.account.username}">
                                            </div>
                                        </div>
                                        <!-- Email -->
                                        <div class="form-group justify-content-center row">
                                            <label for="email" class="col-2 col-form-label">Email</label>
                                            <div class="col-6">
                                                <input id="email" name="email" placeholder="Email" readonly class="form-control here" 
                                                       type="text" value="${sessionScope.account.email}">
                                            </div>
                                        </div>
                                        <!-- Address -->
                                        <div class="form-group justify-content-center row">
                                            <label for="address" class="col-2 col-form-label">Địa chỉ</label>
                                            <div class="col-6">
                                                <input id="address" name="address" placeholder="Địa chỉ" 
                                                       class="form-control here" type="text"
                                                       value="${sessionScope.account.address}">
                                            </div>
                                        </div>

                                        <!-- Save button -->
                                        <div class="form-group justify-content-center row">
                                            <div class="offset-4 col-8">
                                                <button name="submit" type="submit" class="btn btn-primary">Lưu thông tin</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Scroll to Top Button-->
        <%--<jsp:include page="../../common/scrollTopButton.jsp"></jsp:include>--%>
        <jsp:include page="scrollTopButton.jsp"></jsp:include>

            <!-- Logout Modal-->
        <jsp:include page="logOutModal.jsp"></jsp:include>

        </body>

        <!-- Bootstrap core JavaScript-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
                integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

        <!-- Core plugin JavaScript-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap4.min.js"></script>

        <!-- Custom scripts for all pages-->
        <!--<script src="../../../js/sb-admin.js"></script>-->
        <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
</html>
