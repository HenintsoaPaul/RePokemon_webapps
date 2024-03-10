<%@ page import="java.util.List" %>
<%@ page import="views.InfoVente" %>
<%
    List<InfoVente> matchingVentes = null;
    int nbVentesFound = 0;

    if ( request.getAttribute( "results" ) != null ) {
        matchingVentes = ( List<InfoVente> ) request.getAttribute( "results" );
        nbVentesFound = matchingVentes.size();
    }
%>
<section id="found-vente">
    <% if ( nbVentesFound != 0 ) { %>
    <div class="row">
        <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body p-4">
                    <div id="f-vente">
                        <script>
                            const headers = ['Id', 'Date de Vente', 'Montant', 'Id Carte', 'Acheteur', 'Vendeur'];
                            const data = [
                                <% for ( InfoVente vente : matchingVentes ) { %>
                                {
                                    idVente: <%= vente.getIdVente() %>,
                                    DateVente: '<%= vente.getDateVente() %>',
                                    MontantVente: <%= vente.getMontantVente() %>,
                                    idCarte: <%= vente.getIdCarte() %>,
                                    NomAcheteur: '<%= vente.getNomAcheteur() %>',
                                    NomVendeur: '<%= vente.getNomVendeur() %>'
                                },
                                <% } %>
                            ];
                            const table = generateTableMidContainer("Matching Ventes", headers, data, "searchVentes");
                            document.getElementById("f-vente").appendChild(table);
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</section>