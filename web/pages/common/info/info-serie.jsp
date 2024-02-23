<%@page import="entities.Serie" %>
<%
    Serie serie = ( Serie ) request.getAttribute( "serie" );
%>
<section id="info-serie-user">
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title fw-semibold mb-4">Info Serie</h5>
                    <div class="row">
                        <div class="col-lg-7 col-md-8 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">

                                    <div id="infoSerie">
                                        <script>
                                            const header = ['Id', 'Nom Serie', 'Date Debut', 'Date Fin'];
                                            const data = [
                                                {
                                                    idSerie: <%= serie.getIdSerie() %>,
                                                    NomSerie: '<%= serie.getNomSerie() %>',
                                                    DateDebut: '<%= serie.getDateDebutSerie() %>',
                                                    DateFin: '<%= serie.getDateFinSerie() %>'
                                                }
                                            ];
                                            const table = generateTableMidContainer("Information Serie", header, data, "infoSerie");
                                            document.getElementById("infoSerie").appendChild(table);
                                        </script>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Synopsys</h5>
                                    <p class="card-text"><%= serie.getSynopsys() %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
