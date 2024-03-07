<%@ page import="java.util.List" %>
<%@ page import="entities.Serie" %>
<%
    List<Serie> matchingSeries = null;
    int nbSeriesFound = 0;

    if ( request.getAttribute( "results" ) != null ) {
        matchingSeries = ( List<Serie> ) request.getAttribute( "results" );
        nbSeriesFound = matchingSeries.size();
    }
%>
<section id="found-serie">
    <% if ( nbSeriesFound != 0 ) { %>
    <div class="row">
        <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body p-4">
                    <div id="f-serie">
                        <script>
                            const headers = ['Id', 'Nom Serie', 'Nombre episodes', 'Debut Serie', 'Fin Serie'];
                            const data = [
                                <% for ( Serie serie : matchingSeries ) { %>
                                {
                                    idSerie: <%= serie.getIdSerie() %>,
                                    NomSerie: '<%= serie.getNomSerie() %>',
                                    NbEpisode: <%=  serie.getNbEpisode() %>,
                                    DateDebutSerie: '<%= serie.getDateDebutSerie() %>',
                                    DateFinSerie: '<%= serie.getDateFinSerie() %>'
                                },
                                <% } %>
                            ];
                            const table = generateTableMidContainer("Matching Series", headers, data, "searchSeries");
                            document.getElementById("f-serie").appendChild(table);
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</section>