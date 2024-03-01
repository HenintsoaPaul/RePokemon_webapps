<%@ page import="java.util.List" %>
<%@ page import="views.InfoCarte" %>
<%
    List<InfoCarte> cartes = ( List<InfoCarte> ) request.getAttribute( "cartes" );
    String delMsg = "", delMsgClass = "";
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
<section id="list-cartes">
    <div class="card">
        <div class="card-body">
            <div id="list-info-cartes">
                <script>
                    const header = ['Id', 'Model', 'Prix Proprio', 'Prix sur le Marche', 'Date de Fabrication', 'Date Sortie du Model', 'Proprietaire', 'Actions'];
                    const data = [
                        <% for ( InfoCarte carte : cartes ) { %>
                        {
                            idCarte: <%= carte.getIdCarte() %>,
                            NomModelCarte: '<%= carte.getNomModelCarte() %>',
                            PrixProprio: <%= carte.getPrixProprio() %>,
                            PrixMarche: <%= carte.getPrixMarche() %>,
                            DateFabrication: '<%= carte.getDateFabrication() %>',
                            DateSortieModel: '<%= carte.getDateSortieModel() %>',
                            NomUser: '<%= carte.getNomUser() %>'
                        },
                        <% } %>
                    ];
                    const table = generateTableTopContainer("Liste des Cartes", header, data, "listInfoCarte");
                    document.getElementById("list-info-cartes").appendChild(table);
                </script>
            </div>

            <div>
                <button type="button" class="btn btn-success m-1">
                    <a href="cartesUp?action=3">
                        Add new Carte
                    </a>
                </button>
                <div class="<%= delMsgClass %>" role="alert">
                    <%= delMsg %>
                </div>
            </div>
        </div>
    </div>
</section>
