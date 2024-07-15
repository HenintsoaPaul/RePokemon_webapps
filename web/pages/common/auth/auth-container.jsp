<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String title = request.getParameter("title"), content = request.getParameter("content");
%>
<html>
<head>
    <title><%= title %></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="web/assets/images/pokemons/pkg.svg"/>
    <link rel="stylesheet" href="web/assets/css/styles.min.css"/>
    <link rel="stylesheet" href="web/assets/css/mine.css"/>
</head>
<body>
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
        <div class="d-flex align-items-center justify-content-center w-100">
            <div class="row justify-content-center w-100">
                <div class="col-md-8 col-lg-6 col-xxl-3">
                    <div class="card mb-0">
                        <div class="card-body">

                            <jsp:include page="<%= content %>"/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="web/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="web/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
