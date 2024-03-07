<%@ page import="java.util.List" %>
<%@ page import="entities.Serie" %>
<%
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );
    String notification = "", notificationClass = "";
    if ( request.getParameter( "delCode" ) != null ) {
        int delCode = Integer.parseInt( request.getParameter( "delCode" ) );
        switch ( delCode ) {
            case 1:
                notification = "Success!";
                notificationClass = "alert alert-success";
                break;
            case 0:
                notification = "Oops! Something wrong happened...";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<br>
<br>
<br>
<section id="list-series">
    <div class="card">
        <div class="card-body">
            <div id="list-info-series">
                <script>
                    const headers = ['Id', 'Nom Serie', 'Nombre episodes', 'Debut Serie', 'Fin Serie'];
                    const data = [
                        <% for ( Serie serie : series ) { %>
                        {
                            idSerie: <%= serie.getIdSerie() %>,
                            NomSerie: '<%= serie.getNomSerie() %>',
                            NbEpisode: <%=  serie.getNbEpisode() %>,
                            DateDebutSerie: '<%= serie.getDateDebutSerie() %>',
                            DateFinSerie: '<%= serie.getDateFinSerie() %>'
                        },
                        <% } %>
                    ];
                    const table = generateTableTopContainer("Liste des Series", headers, data, "listSerie");
                    document.getElementById("list-info-series").appendChild(table);
                </script>
            </div>

            <div>
                <button type="button" class="btn btn-success m-1">
                    <a href="seriesUp?action=3">
                        Add new Serie
                    </a>
                </button>
                <div class="<%= notificationClass %>" role="alert">
                    <%= notification %>
                </div>
            </div>
        </div>
    </div>
</section>