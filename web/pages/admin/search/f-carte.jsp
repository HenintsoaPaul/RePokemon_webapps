<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="views.InfoCarte" %>
<%
    Map<String, List<InfoCarte>> matchingCartes = null;
    List<InfoCarte> mine = null, others = null;
    int nbCartesFound = 0;

    if ( request.getAttribute( "results" ) != null ) {
        matchingCartes = ( Map<String, List<InfoCarte>> ) request.getAttribute( "results" );
        mine = matchingCartes.get( "mines" );
        others = matchingCartes.get( "others" );

        for ( String key : matchingCartes.keySet() ) {
            if ( matchingCartes.get( key ) != null ) {
                nbCartesFound = matchingCartes.get( key ).size();
                break;
            }
        }
    }
%>
<script>
    const cartes = <%= matchingCartes %>;
    console.log(cartes);
    console.log(JSON.parse(cartes))
</script>
<section id="found-carte">
    <% if ( nbCartesFound != 0 ) { %>
    <div class="row">
        <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body p-4">
                    <%
                        if ( mine != null ) {
                    %>
                    <div id="f-mine">
                        <script>
                            const headers = ['Id', 'Nom Model', 'Estimation Personnelle', 'Prix sur le Marche', 'Date de Fabrication', 'Date Sortie du Model', 'Actions'];
                            const data = [
                                <% for ( InfoCarte carte : mine ) { %>
                                {
                                    idCarte: <%= carte.getIdCarte() %>,
                                    idModelCarte: <%= carte.getIdModelCarte() %>,
                                    NomModelCarte: '<%= carte.getNomModelCarte() %>',
                                    PrixProprio: <%= carte.getPrixProprio() %>,
                                    PrixMarche: <%= carte.getPrixMarche() %>,
                                    DateFabrication: '<%= carte.getDateFabrication() %>',
                                    DateSortieModel: '<%= carte.getDateSortieModel() %>'
                                },
                                <% } %>
                            ];
                            const table = generateTableMidContainer("Mes Cartes", headers, data, "searchMine");
                            document.getElementById("f-mine").appendChild(table);
                        </script>
                    </div>
                    <%
                        } if ( others != null ) {
                    %>
                    <div id="f-others">
                        <script>
                            const headers2 = ['Id', 'Nom Model', 'Estimation Personnelle', 'Prix sur le Marche', 'Date de Fabrication', 'Date Sortie du Model', 'Proprietaire'];
                            const data2 = [
                                <% for ( InfoCarte carte : others ) { %>
                                {
                                    idCarte: <%= carte.getIdCarte() %>,
                                    idModelCarte: <%= carte.getIdModelCarte() %>,
                                    NomModelCarte: '<%= carte.getNomModelCarte() %>',
                                    PrixProprio: <%= carte.getPrixProprio() %>,
                                    PrixMarche: <%= carte.getPrixMarche() %>,
                                    DateFabrication: '<%= carte.getDateFabrication() %>',
                                    DateSortieModel: '<%= carte.getDateSortieModel() %>',
                                    NomUser: '<%= carte.getNomUser() %>'
                                },
                                <% } %>
                            ];
                            const table2 = generateTableMidContainer("Autres", headers2, data2, "searchOthers");
                            document.getElementById("f-others").appendChild(table2);
                        </script>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</section>