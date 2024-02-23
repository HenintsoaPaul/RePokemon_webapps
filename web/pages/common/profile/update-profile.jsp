<%@page import="entites.User"%>
<%
    User user = (User) request.getAttribute("connectedUser");
    List<Status> statusList = (Status) request.getParameter("statusList");
%>
<section id="update-user">
    <form method="post" action="">
        <p><label for="nomUser">
            UserName : <input type="text" name="nomUser" value="<%= user.getNomUser() %>" required>
        </label></p>
        <p><label for="password">
            Password : <input type="password" name="password" value="<%= user.getPassword() %>" required>
        </label></p>
        <p><label for="isAdmin">
            Status : <select name="isAdmin" required>
                <option value="">...</option>
                <%
                String selected = "";
                for (Status status : statusList) {
                    if (status.getIdStatus() == User.getIdStatus()) selected = "selected";
                    %>
                    <option value="<%= status.getIdStatus() %>" <%= selected %> ><%= status.getNomStatus() %></option>
                    <%}
                    selected = "";
                %>
            </select>
        </label></p>
        <p>
            <input type="submit" value="Modifier">
        </p>
    </form>
</section>