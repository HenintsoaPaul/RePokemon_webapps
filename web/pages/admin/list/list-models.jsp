<%@ page import="java.util.List" %>
<%@ page import="views.InfoModel" %>
<%
    List<InfoModel> models = ( List<InfoModel> ) request.getAttribute( "models" );
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
        </div>
    </div>
</section>