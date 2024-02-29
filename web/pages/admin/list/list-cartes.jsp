<%@ page import="java.util.List" %>
<%@ page import="views.InfoCarte" %>
<%
    List<InfoCarte> cartes = ( List<InfoCarte> ) request.getAttribute( "cartes" );
%>
<br>
<br>
<br>
<div class="card">
    <section id="list-cartes">
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
            </div>
        </div>
    </section>
</div>
