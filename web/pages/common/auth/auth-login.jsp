<%@page import="entities.supp.Status" %>
<%@page import="java.util.List" %>
<%
    List<Status> statusList = (List<Status>) request.getAttribute("statusList");
    String errorMsg = "", errorClass="";
    if ( request.getParameter("loginErrorMsg") != null ) {
        errorMsg = request.getParameter("loginErrorMsg");
        errorClass = "alert alert-danger";
    }
%>
<section>
    <a href="about.html" class="text-nowrap logo-img text-center d-block py-3 w-100">
        <img src="web/assets/images/logos/dark-logo.svg" width="180" alt="">
    </a>

    <p class="text-center">Gotta Collect 'em all!</p>

    <form action="userAuthf" method="POST">
        <div class="<%= errorClass %>" role="alert">
            <%= errorMsg %>
        </div>

        <div class="mb-3">
            <label for="nomUser" class="form-label">Username</label>
            <input type="text" class="form-control" id="nomUser" name="nomUser" required>
        </div>

        <div class="mb-4">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="mb-4">
            <label for="idStatus" class="form-label">Sign In as</label>
            <select class="form-select" id="idStatus" name="idStatus" required>
                <option value="">Select a Status</option>
                <% for ( Status status: statusList ) { %>
                <option value="<%= status.getIdStatus() %>"> <%= status.getNomStatus() %> </option>
                <% } %>
            </select>
        </div>

        <p>
            <input class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2" type="submit"
                   value="Sign In">
        </p>

        <div class="d-flex align-items-center justify-content-center">
            <p class="fs-4 mb-0 fw-bold">New to RePokemon?</p>
            <a class="text-primary fw-bold ms-2" href="auth-register.jsp">
                Create an account
            </a>
        </div>
    </form>
</section>