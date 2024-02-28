<%@ page import="views.InfoVente" %>
<%
    InfoVente infoVente = ( InfoVente ) request.getAttribute( "infoVente" );

    String upMsg = "", upMsgClass = "";
    if ( request.getParameter( "upMsg" ) != null ) {
        upMsg = request.getParameter( "upMsg" );
        upMsgClass = "alert alert-danger";
    }
    else if ( request.getParameter( "upCode" ) != null ) {
        int upCode = Integer.parseInt( request.getParameter( "upCode" ) );
        switch ( upCode ) {
            case 1:
                upMsg = "Success!";
                upMsgClass = "alert alert-success";
                break;
            case 0:
                upMsg = "Oops! Something wrong happened.";
                upMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="up-vente">
    <br>
    <br>
    <br>

    <div class="card">

        <div class="card-body">
            <div id="infoVente">
                <script>
                    const header = ['Id', 'Date Vente', 'Montant', 'Id Carte', 'Acheteur', 'Vendeur'];
                    const data = [
                        {
                            idVente: <%= infoVente.getIdVente() %>,
                            DateVente: '<%= infoVente.getDateVente() %>',
                            MontantVente: <%= infoVente.getMontantVente() %>,
                            idCarte: <%= infoVente.getIdCarte() %>,
                            NomAcheteur: '<%= infoVente.getNomAcheteur() %>',
                            NomVendeur: '<%= infoVente.getNomVendeur() %>'
                        },
                    ];
                    const table = generateTableTopContainer("Informations Vente", header, data, "infoVente");
                    document.getElementById("infoVente").appendChild(table);
                </script>
            </div>
        </div>

        <div class="col-lg-10">
            <div class="card-body">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="bilan?idVente=<%= infoVente.getIdVente() %>">
                            <div class="row">
                                <h3 class="form-label">Update Vente</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="dateVente" class="form-label">Date Vente</label>
                                                <input type="date" class="form-control" id="dateVente"
                                                       name="dateVente"
                                                       required value="<%= infoVente.getDateVente() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="montantVente" class="form-label">Prix de Vente</label>
                                                <input type="number" step="any" class="form-control" id="montantVente"
                                                       name="montantVente"
                                                       required value="<%= infoVente.getMontantVente() %>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-success">Update</button>
                            </div>

                            <br>
                            <div class="<%= upMsgClass %>" role="alert">
                                <%= upMsg %>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

    </div>
</section>