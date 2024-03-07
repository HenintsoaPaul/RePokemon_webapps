<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="entities.Serie" %>
<%@ page import="entities.ModelCarte" %>
<%@ page import="views.InfoCarte" %>
<%
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );
    List<ModelCarte> modelsCartes = ( List<ModelCarte> ) request.getAttribute( "modelsCartes" );

    Map<String, List<InfoCarte>> matchingCartes = null;
    List<InfoCarte> mine = null, others = null;
    int nbCartesFound = 0;

    if ( request.getAttribute( "matchingCartes" ) != null ) {
        matchingCartes = ( Map<String, List<InfoCarte>> ) request.getAttribute( "matchingCartes" );
        mine = matchingCartes.get( "mine" );
        others = matchingCartes.get( "others" );

        for ( String key : matchingCartes.keySet() ) {
            if ( matchingCartes.get( key ) != null ) {
                nbCartesFound = matchingCartes.get( key ).size();
                break;
            }
        }
    }
%>
<section id="search-user">
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">

            <%-- Begining Search Form --%>
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="search">
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">

                                        <%-- Nom Models --%>
                                        <div class="mb-3">
                                            <h3 class="form-label">Models Cartes</h3>
                                            <div class="form-selectgroup form-selectgroup-pills">
                                                <% for ( ModelCarte modelCarte : modelsCartes ) { %>
                                                <div>
                                                    <label class="form-selectgroup-item">
                                                        <input type="checkbox" name="idModelCarte"
                                                               value="<%= modelCarte.getIdModelCarte() %>"
                                                               class="form-selectgroup-input">
                                                        <span class="form-selectgroup-label"><%= modelCarte.getNomModel() %></span>
                                                    </label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>

                                        <%-- Prix Models --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Prix marche (en Ariary MG)</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="prixMarcheMin" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="prixMarcheMin" name="prixMarcheMin"
                                                               placeholder="Minimum" value="0" required>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="prixMarcheMax" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="prixMarcheMax" name="prixMarcheMax"
                                                               placeholder="Maximum" value="9999999999" required>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- Date Sortie Models --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Date Sortie Model entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="debutIntvDateSortieModel" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="debutIntvDateSortieModel"
                                                               name="debutIntvDateSortieModel">
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="finIntvDateSortieModel" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="finIntvDateSortieModel"
                                                               name="finIntvDateSortieModel">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5 col-md-12">
                                <div class="card">
                                    <div class="card-body">

                                        <%-- Nom Series --%>
                                        <div class="mb-3">
                                            <h3 class="form-label">Series</h3>
                                            <div class="form-selectgroup form-selectgroup-pills">
                                                <% for ( Serie serie : series ) { %>
                                                <div>
                                                    <label class="form-selectgroup-item">
                                                        <input type="checkbox" name="idSerie"
                                                               value="<%= serie.getIdSerie() %>"
                                                               class="form-selectgroup-input">
                                                        <span class="form-selectgroup-label"><%= serie.getNomSerie() %></span>
                                                    </label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
            <%-- Ending Search Form --%>

            <% if ( nbCartesFound != 0 ) { %>
            <div id="matchingCartes">
                <div class="row">
                    <div class="col-lg-12 d-flex align-items-stretch">
                        <div class="card w-100">
                            <div class="card-body p-4">

                                <%
                                    if ( mine != null ) {
                                %>
                                <div id="founded-mine">
                                    <script>
                                        const headers = ['Id', 'Nom Model', 'Estimation Personnelle', 'Prix sur le Marche', 'Date de Fabrication', 'Date Sortie du Model', 'Actions'];
                                        const data = [
                                            <% for ( InfoCarte carte : mine ) { %>
                                            {
                                                idCarte: <%= carte.getIdCarte() %>,
                                                idModelCarte: <%= carte.getIdModelCarte() %>,
                                                NomModelCarte: '<%= carte.getNomModelCarte() %>',
                                                PrixProprio: <%= carte.getPrixProprio() %>,
                                                PrixMarche: <%= carte.getPrixMarche() %>,
                                                DateFabrication: '<%= carte.getDateFabrication() %>',
                                                DateSortieModel: '<%= carte.getDateSortieModel() %>'
                                            },
                                            <% } %>
                                        ];
                                        const table = generateTableMidContainer("Mes Cartes", headers, data, "searchMine");
                                        document.getElementById("founded-mine").appendChild(table);
                                    </script>
                                </div>

                                <%
                                    } if ( others != null ) {
                                %>
                                <div id="founded-others">
                                    <script>
                                        const headers2 = ['Id', 'Nom Model', 'Estimation Personnelle', 'Prix sur le Marche', 'Date de Fabrication', 'Date Sortie du Model', 'Proprietaire'];
                                        const data2 = [
                                            <% for ( InfoCarte carte : others ) { %>
                                            {
                                                idCarte: <%= carte.getIdCarte() %>,
                                                idModelCarte: <%= carte.getIdModelCarte() %>,
                                                NomModelCarte: '<%= carte.getNomModelCarte() %>',
                                                PrixProprio: <%= carte.getPrixProprio() %>,
                                                PrixMarche: <%= carte.getPrixMarche() %>,
                                                DateFabrication: '<%= carte.getDateFabrication() %>',
                                                DateSortieModel: '<%= carte.getDateSortieModel() %>',
                                                NomUser: '<%= carte.getNomUser() %>'
                                            },
                                            <% } %>
                                        ];
                                        const table2 = generateTableMidContainer("Autres", headers2, data2, "searchOthers");
                                        document.getElementById("founded-others").appendChild(table2);
                                    </script>
                                </div>
                                <% } %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

        </div>
    </div>

</section>