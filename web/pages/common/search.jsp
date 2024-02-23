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
    <h2>tss dikany</h2>

    <div class="card">
        <div class="card-body">

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

            <% if ( nbCartesFound != 0 ) { %>
            <div id="matchingCartes">
                <div class="row">
                    <div class="col-lg-12 d-flex align-items-stretch">
                        <div class="card w-100">
                            <div class="card-body p-4">

                                <%
                                    if ( mine != null ) {
                                %>
                                <h5 class="card-title fw-semibold mb-4">Mes Cartes</h5>
                                <div class="table-responsive">

                                    <table class="table text-nowrap mb-0 align-middle">
                                        <thead class="text-dark fs-4">
                                        <tr>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Id</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Nom Model</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Estimation Personnelle</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Prix sur le Marche</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Date Fabrication</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Actions</h6>
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <% for ( InfoCarte carte : mine ) { %>
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0"><%= carte.getIdCarte() %>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <a href="infoModel?action=1&idModelCarte=<%= carte.getIdModelCarte() %>">
                                                    <h6 class="fw-semibold mb-0"><%= carte.getNomModelCarte() %>
                                                    </h6>
                                                </a>
                                            </td>
                                            <td class="border-bottom-0">
                                                <span class="fw-semibold mb-0 fs-4"><mark><%= carte.getPrixProprio() %></mark></span>
                                                <span class="mb-0 fw-normal">Ariary MG</span>
                                            </td>
                                            <td class="border-bottom-0">
                                                <span class="fw-semibold mb-0 fs-4"><mark><%= carte.getPrixMarche() %></mark></span>
                                                <span class="mb-0 fw-normal">Ariary MG</span>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-bolder"><%= carte.getDateFabrication() %>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="d-flex align-items-center gap-2">
                                                    <a href="mesCartes?action=3&idCarte=<%= carte.getIdCarte() %>">
                                                        <span class="badge bg-success rounded-3 fw-semibold">Estimer</span>
                                                    </a>
                                                    <a href="mesCartes?action=2&idCarte=<%= carte.getIdCarte() %>">
                                                        <span class="badge bg-danger rounded-3 fw-semibold">Jetter</span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>

                                </div>
<%--                                <div id="founded-mine"></div>--%>
<%--                                <script>--%>
<%--                                    const headers = ['Id', 'Nom Model', 'Estimation Personnelle', 'Prix sur le Marche', 'Date de Fabrication', 'Actions'];--%>
<%--                                    // add data--%>
<%--                                    const midContainer = generateTableMidContainer(headers, data);--%>
<%--                                    document.getElementById("founded-mine").appendChild(midContainer);--%>
<%--                                </script>--%>
                                <%
                                    }
                                    if ( others != null ) {
                                %>
<%--                                <div id="founded-others"></div>--%>
<%--                                <script>--%>
<%--                                    --%>
<%--                                </script>--%>
                                <h5 class="card-title fw-semibold mb-4">Autres</h5>
                                <div class="table-responsive">

                                    <table class="table text-nowrap mb-0 align-middle">
                                        <thead class="text-dark fs-4">
                                        <tr>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Id</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Nom Model</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Estimation Personnelle</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Prix sur le Marche</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Date Fabrication</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Proprietaire</h6>
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <% for ( InfoCarte carte : others ) { %>
                                        <tr>
                                            <td class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0"><%= carte.getIdCarte() %>
                                                </h6>
                                            </td>
                                            <td class="border-bottom-0">
                                                <a href="infoModel?action=1&idModelCarte=<%= carte.getIdModelCarte() %>">
                                                    <h6 class="fw-semibold mb-0"><%= carte.getNomModelCarte() %>
                                                    </h6>
                                                </a>
                                            </td>
                                            <td class="border-bottom-0">
                                                <span class="fw-semibold mb-0 fs-4"><mark><%= carte.getPrixProprio() %></mark></span>
                                                <span class="mb-0 fw-normal">Ariary MG</span>
                                            </td>
                                            <td class="border-bottom-0">
                                                <span class="fw-semibold mb-0 fs-4"><mark><%= carte.getPrixMarche() %></mark></span>
                                                <span class="mb-0 fw-normal">Ariary MG</span>
                                            </td>
                                            <td class="border-bottom-0">
                                                <p class="mb-0 fw-bolder"><%= carte.getDateFabrication() %>
                                                </p>
                                            </td>
                                            <td class="border-bottom-0">
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="fw-semibold">
                                                        <mark><%= carte.getNomUser() %></mark>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>

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