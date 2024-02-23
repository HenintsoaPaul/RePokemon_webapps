<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><%= request.getParameter("title") %></title>
  <link rel="shortcut icon" type="image/png" href="web/assets/images/logos/favicon.png"/>
  <link rel="stylesheet" href="web/assets/css/styles.min.css"/>

  <script src="web/assets/js/mine/tab-generator.js"></script>
</head>

<body>
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">

  <jsp:include page='parts/side-bar.jsp' />

  <div class="body-wrapper">
    <jsp:include page='parts/header.jsp' />

    <jsp:include page='<%= request.getParameter("content") %>' />
  </div>
</div>
<script src="web/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="web/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="web/assets/js/sidebarmenu.js"></script>
<script src="web/assets/js/app.min.js"></script>
<script src="web/assets/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>