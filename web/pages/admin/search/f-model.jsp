<%@ page import="java.util.List" %>
<%@ page import="views.InfoModel" %>
<%
    List<InfoModel> matchingModels = null;
    int nbModelsFound = 0;

    if ( request.getAttribute( "results" ) != null ) {
        matchingModels = ( List<InfoModel> ) request.getAttribute( "results" );
        nbModelsFound = matchingModels.size();
    }
%>
<section id="found-model">
    <% if ( nbModelsFound != 0 ) { %>
    <div class="row">
        <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body p-4">
                    <div id="f-model">
                        <script>
                            const headers = ['Id', 'Nom Model', 'Prix sur le Marche', 'Date Sortie du Model', 'Pokemon', 'Rang', 'Serie'];
                            const data = [
                                <% for ( InfoModel model : matchingModels ) { %>
                                {
                                    idModelCarte: <%= model.getIdModelCarte() %>,
                                    NomModelCarte: '<%= model.getNomModel() %>',
                                    PrixMarche: <%= model.getPrixMarche() %>,
                                    DateSortieModel: '<%= model.getDateSortieModel() %>',
                                    NomPokemon: '<%= model.getNomPokemon() %>',
                                    NomRang: '<%= model.getNomRang() %>',
                                    NomSerie: '<%= model.getNomSerie() %>',
                                },
                                <% } %>
                            ];
                            const table = generateTableMidContainer("Matching Models", headers, data, "searchModels");
                            document.getElementById("f-model").appendChild(table);
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</section>