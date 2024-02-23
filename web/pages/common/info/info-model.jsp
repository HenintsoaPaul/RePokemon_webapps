<%@page import="views.InfoModel" %>
<%
    InfoModel infoModel = ( InfoModel ) request.getAttribute( "infoModel" );
%>
<section id="info-model-user">
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">

                    <h5 class="card-title fw-semibold mb-4">Info ModelCarte</h5>

                    <div id="listCartes">
                        <div class="row">
                            <div class="col-lg-10 d-flex align-items-stretch">
                                <div class="card w-100">
                                    <div class="card-body p-4">
                                        <h5 class="card-title fw-semibold mb-4">Info ModelCarte</h5>
                                        <div class="table-responsive">

                                            <table class="table text-nowrap mb-0 align-middle">
                                                <thead class="text-dark fs-4">
                                                <tr>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Id</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Model</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Pokemon</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Rang</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Serie</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Prix sur le Marche</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Date Sortie Model</h6>
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <tr>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0"><%= infoModel.getIdModelCarte() %>
                                                        </h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0"><%= infoModel.getNomModel() %>
                                                        </h6>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <a href="infoPokemon?action=1&idPokemon=<%= infoModel.getIdPokemon() %>">
                                                            <h6 class="fw-semibold mb-0"><%= infoModel.getNomPokemon() %>
                                                            </h6>
                                                        </a>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="badge bg-danger rounded-3 fw-semibold"><%= infoModel.getNomRang() %></span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <a href="infoSerie?action=1&idSerie=<%= infoModel.getIdSerie() %>">
                                                            <h6 class="mb-0 fw-normal"><%= infoModel.getNomSerie() %>
                                                            </h6>
                                                        </a>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <span class="fw-semibold mb-0 fs-4"><mark><%= infoModel.getPrixMarche() %></mark></span>
                                                        <span class="mb-0 fw-normal">Ariary MG</span>
                                                    </td>
                                                    <td class="border-bottom-0">
                                                        <p class="mb-0 fw-bolder"><%= infoModel.getDateSortieModel() %>
                                                        </p>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
