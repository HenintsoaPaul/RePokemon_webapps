<%@ page import="views.InfoCarte" %>
<%@ page import="java.util.List" %>
<%
    List<InfoCarte> cartesEnVente = ( List<InfoCarte> ) request.getAttribute( "cartesDesAutresEnVente" );

    String achatMsg = "", achatMsgClass = "";
    if ( request.getParameter( "achatCode" ) != null ) {
        int achatCode = Integer.parseInt( request.getParameter( "achatCode" ) );
        switch ( achatCode ) {
            case 1:
                achatMsg = "Carte achetee successfully!";
                achatMsgClass = "alert alert-success";
                break;
            case 0:
                achatMsg = "Oops! Something wrong happened during Achat.";
                achatMsgClass = "alert alert-danger";
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
                        <p>Welcome to the Market</p>
                    </div>

                    <% if ( cartesEnVente != null ) { %>
                    <div class="<%= achatMsgClass %>" role="alert">
                        <p><%= achatMsg %>
                        </p>
                    </div>
                    <div id="listCartes">
                        <div class="row">
                            <div class="col-lg-12 d-flex align-items-stretch">
                                <div class="card w-100">
                                    <div class="card-body p-4">
                                        <h5 class="card-title fw-semibold mb-4">Cartes en vente sur le marche</h5>
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
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Actions</h6>
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <% for ( InfoCarte infoCarte : cartesEnVente ) { %>
                                                <tr>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0"><%= infoCarte.getIdCarte() %>
                                                        </h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <a href="infoModel?action=1&idModelCarte=<%= infoCarte.getIdModelCarte() %>">
                                                            <h6 class="fw-semibold mb-0"><%= infoCarte.getNomModelCarte() %>
                                                            </h6>
                                                        </a>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="fw-semibold mb-0 fs-4"><mark><%= infoCarte.getPrixProprio() %></mark></span>
                                                        <span class="mb-0 fw-normal">Ariary MG</span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="fw-semibold mb-0 fs-4"><mark><%= infoCarte.getPrixMarche() %></mark></span>
                                                        <span class="mb-0 fw-normal">Ariary MG</span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <p class="mb-0 fw-bolder"><%= infoCarte.getDateFabrication() %>
                                                        </p>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="fw-semibold mb-0 fs-4"><mark><%= infoCarte.getNomUser() %></mark></span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <div class="d-flex align-items-center gap-2">
                                                            <a href="vente?action=2&idCarte=<%= infoCarte.getIdCarte() %>">
                                                                <span class="badge bg-success rounded-3 fw-semibold">Acheter</span>
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
                    <div class="row">
                        <div class="col-lg-10 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    <h5 class="card-title fw-semibold mb-4">
                                        <mark>Aucune</mark>
                                        carte en vente sur le marche pour le moment.
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>