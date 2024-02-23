<%@ page import="views.InfoCarte" %>
<%@ page import="java.time.LocalDate" %>
<%
    InfoCarte maCarte = ( InfoCarte ) request.getAttribute( "maCarte" );

    int idCarte = maCarte.getIdCarte(),
            idModelCarte = maCarte.getIdModelCarte();
    String nomModel = maCarte.getNomModelCarte();
    double prixProprio = maCarte.getPrixProprio(),
            prixMarche = maCarte.getPrixMarche();
    LocalDate dateFabrication = maCarte.getDateFabrication();

    String param = "?idCarte=" + idCarte + "&dateFabrication=" + dateFabrication + "&idUser=" + maCarte.getIdUser() + "&idModelCarte=" + idModelCarte;
    String estimationMsg = "", estimationMsgClass = "";

    if ( request.getParameter( "estimationCode" ) != null ) {
        int estimationCode = Integer.parseInt( request.getParameter( "estimationCode" ) );
        switch ( estimationCode ) {
            case 1:
                estimationMsg = "Estimation mise a jour successfully!";
                estimationMsgClass = "alert alert-success";
                break;
            case 0:
                estimationMsg = "Oops! Something wrong happened during Estimation.";
                estimationMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="estimer">
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title fw-semibold mb-4">Form Estimation</h5>

                    <div class="<%= estimationMsgClass %>" role="alert">
                        <p><%= estimationMsg %>
                        </p>
                    </div>

                    <div id="infoCarte">
                        <script>
                            const headers = ['Id', 'Nom Model', 'Estimation Personnelle', 'Prix sur le Marche', 'Date Fabrication'];
                            const data = [
                                {
                                    idCarte: <%= idCarte %>,
                                    idModelCarte: <%= idModelCarte %>,
                                    nomModelCarte: '<%= nomModel %>',
                                    prixProprio: <%= prixProprio %>,
                                    prixMarche: <%= prixMarche %>,
                                    dateFabrication: '<%= dateFabrication %>'
                                }
                            ];
                            const div = generateTableTopContainer("Ma Carte",headers, data, "estimation");
                            document.getElementById("infoCarte").appendChild(div);
                        </script>
                    </div>

                    <div class="row" id="form-estimation">
                        <div class="col-7">
                            <div class="card">
                                <div class="card-body">
                                    <form method="POST" action="mesCartes<%= param %>">
                                        <div class="mb-3">
                                            <label for="estimation" class="form-label">Estimation Personnelle</label>
                                            <div id="emailHelp" class="form-text">Entrer le montant auquel vous estimer
                                                cette carte...
                                            </div>
                                            <div class="row">
                                                <div class="col-8">
                                                    <input type="number" step="any" class="form-control" id="estimation"
                                                           name="estimation" value="<%= maCarte.getPrixProprio() %>"
                                                           required>
                                                </div>
                                                <div class="col-3">
                                                    <span class="fw-semibold mb-4">Ariary MG</span>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>