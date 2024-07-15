<%@ page import="java.util.List" %>
<%@ page import="views.InfoModel" %>
<%
    List<InfoModel> models = ( List<InfoModel> ) request.getAttribute( "models" );
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
<section id="list-models">
    <div class="card">
        <div class="card-body">
            <div id="list-info-models">
                <script>
                    const headers = ['Id', 'Model', 'Pokemon', 'Rang', 'Serie', 'Prix sur le Marche', 'Date Sortie du Model', 'Action'];
                    const data = [
                        <% for ( InfoModel model : models ) { %>
                        {
                            idModelCarte: <%= model.getIdModelCarte() %>,
                            NomModelCarte: '<%= model.getNomModel() %>',
                            idPokemon: <%= model.getIdPokemon() %>,
                            NomPokemon: '<%= model.getNomPokemon() %>',
                            NomRang: '<%= model.getNomRang() %>',
                            idSerie: <%= model.getIdSerie() %>,
                            NomSerie: '<%= model.getNomSerie() %>',
                            prixMarche: <%= model.getPrixMarche() %>,
                            dateSortieModel: '<%= model.getDateSortieModel() %>'
                        },
                        <% } %>
                    ];
                    const table = generateTableTopContainer("Liste des Models", headers, data, "listInfoModel");
                    document.getElementById("list-info-models").appendChild(table);
                </script>
            </div>

            <div>
                <button type="button" class="btn btn-success m-1">
                    <a href="modelsUp?action=3">
                        Add new Model
                    </a>
                </button>
                <div class="<%= notificationClass %>" role="alert">
                    <%= notification %>
                </div>
            </div>
        </div>
    </div>
</section>