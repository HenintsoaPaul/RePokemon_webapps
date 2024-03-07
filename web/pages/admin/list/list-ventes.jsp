<%@ page import="java.util.List" %>
<%@ page import="views.InfoVente" %>
<%
    List<InfoVente> ventes = ( List<InfoVente> ) request.getAttribute( "ventes" );
    String notification = "", notificationClass = "";
    if ( request.getParameter( "delCode" ) != null ) {
        int delCode = Integer.parseInt( request.getParameter( "delCode" ) );
        switch ( delCode ) {
            case 1:
                notification = "Success!";
                notificationClass = "alert alert-success";
                break;
            case 0:
                notification = "Oops! Something wrong happened...";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<br>
<br>
<br>
<section id="list-ventes">
    <div class="card">
        <div class="card-body">
            <div id="list-info-ventes">
                <script>
                    const header = ['Id', 'Date de Vente', 'Montant', 'Id Carte', 'Acheteur', 'Vendeur', 'Actions'];
                    const data = [
                        <% for ( InfoVente vente : ventes ) { %>
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
                    const table = generateTableTopContainer("Liste des Ventes", header, data, "listInfoVente");
                    document.getElementById("list-info-ventes").appendChild(table);
                </script>
            </div>

            <div>
                <button type="button" class="btn btn-success m-1">
                    <a href="ventesUp?action=3">
                        Add new Vente
                    </a>
                </button>
                <div class="<%= notificationClass %>" role="alert">
                    <%= notification %>
                </div>
            </div>
        </div>
    </div>
</section>
