<%@page import="views.InfoCarte" %>
<%@page import="java.util.List" %>
<%
    List<InfoCarte> mesCartes = ( List<InfoCarte> ) request.getAttribute( "mesCartes" );

    String jetMsg = "", jetMsgClass = "";
    if ( request.getParameter( "jetCode" ) != null ) {
        int jetCode = Integer.parseInt( request.getParameter( "jetCode" ) );
        switch ( jetCode ) {
            case 1:
                jetMsg = "Carte jetter successfully!";
                jetMsgClass = "alert alert-success";
                break;
            case 0:
                jetMsg = "Oops! Something wrong happened during Rejet Carte.";
                jetMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="stock-user">
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title fw-semibold mb-4">Collection</h5>
                    <div class="alert alert-primary" role="alert">
                        <p>Welcome to your collection</p>
                    </div>
                    <% if ( mesCartes != null ) { %>
                    <div class="<%= jetMsgClass %>" role="alert">
                        <p><%= jetMsg %>
                        </p>
                    </div>
                    <div id="listCartes">
                        <div class="row">
                            <div class="col-lg-10 d-flex align-items-stretch">
                                <div class="card w-100">
                                    <div class="card-body p-4">
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
                                                <% for ( InfoCarte maCarte : mesCartes ) { %>
                                                <tr>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0"><%= maCarte.getIdCarte() %>
                                                        </h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <a href="infoModel?action=1&idModelCarte=<%= maCarte.getIdModelCarte() %>">
                                                            <h6 class="fw-semibold mb-0"><%= maCarte.getNomModelCarte() %>
                                                            </h6>
                                                        </a>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="fw-semibold mb-0 fs-4"><mark><%= maCarte.getPrixProprio() %></mark></span>
                                                        <span class="mb-0 fw-normal">Ariary MG</span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="fw-semibold mb-0 fs-4"><mark><%= maCarte.getPrixMarche() %></mark></span>
                                                        <span class="mb-0 fw-normal">Ariary MG</span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <p class="mb-0 fw-bolder"><%= maCarte.getDateFabrication() %>
                                                        </p>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <div class="d-flex align-items-center gap-2">
                                                            <a href="mesCartes?action=3&idCarte=<%= maCarte.getIdCarte() %>">
                                                                <span class="badge bg-success rounded-3 fw-semibold">Estimer</span>
                                                            </a>
                                                            <a href="mesCartes?action=2&idCarte=<%= maCarte.getIdCarte() %>">
                                                                <span class="badge bg-danger rounded-3 fw-semibold">Jetter</span>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } %>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                    else { %>
                    <div class="<%= jetMsgClass %>" role="alert">
                        <p>
                            <mark>Aucune carte</mark>
                            n'est dans votre collection pour le moment
                        </p>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>