<%@page import="entites.User"%>
<%
    User user = (User) request.getAttribute("connectedUser");
    String card = "";
    if (user.isAdmin()) {
        int tailleCollection = 0;
        tailleCollection = ((Integer) request.getAttribute("tailleCollection")).intValue();
        card = tailleCollection == 1 ? "carte" : "cartes";
        card = tailleCollection + " " + card;
    }
%>
<section id="profile">
    <p>
        UserName : <strong><%= user.getNomUser() %></strong>
    </p>
    <p>
        Status : <strong><%= user.isAdmin %></strong>
    </p>
    <%
        if (card != null) {%>
            <p>
                Vous avez <strong><%= card %></strong> dans votre collection.
            </p>
        <%}
    %>
    <p>
        <a href="update-user.jsp">Modifier mes informations personnelles</a>
    </p>
</section>