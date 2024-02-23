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

                    <div id="info-model">
                        <script>
                            const headers = ['Id', 'Model', 'Pokemon', 'Rang', 'Serie', 'Prix sur le Marche', 'Date Sortie du Model'];
                            const data = [
                                {
                                    idModelCarte: <%= infoModel.getIdModelCarte() %>,
                                    NomModelCarte: '<%= infoModel.getNomModel() %>',
                                    idPokemon: <%= infoModel.getIdPokemon() %>,
                                    NomPokemon: '<%= infoModel.getNomPokemon() %>',
                                    NomRang: '<%= infoModel.getNomRang() %>',
                                    idSerie: <%= infoModel.getIdSerie() %>,
                                    NomSerie: '<%= infoModel.getNomSerie() %>',
                                    prixMarche: <%= infoModel.getPrixMarche() %>,
                                    dateSortieModel: '<%= infoModel.getDateSortieModel() %>'
                                }
                            ];
                            const table = generateTableTopContainer("Information Model", headers, data, "infoModel");
                            document.getElementById("info-model").appendChild(table);
                        </script>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
