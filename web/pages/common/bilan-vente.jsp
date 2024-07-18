<%@ page import="java.util.List" %>
<%@ page import="views.InfoVente" %>
<%
    List<InfoVente> ventes = ( List<InfoVente> ) request.getAttribute( "infoVentes" );

    int idUser = ( int ) request.getSession().getAttribute( "idUser" );
    String jsonVentes = ( String ) request.getAttribute( "jsonVentes" );

    String msg = "", msgClass = "";
    if ( request.getParameter( "deleteCode" ) != null ) {
        int deleteCode = Integer.parseInt( request.getParameter( "deleteCode" ) );
        switch ( deleteCode ) {
            case 1:
                msg = "Deleted Successfully!";
                msgClass = "alert alert-success";
                break;
            case 0:
                msg = "Oops! Something wrong happened.";
                msgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="bilan-section">
    <br>
    <br>
    <br>
    <br>

    <div class="container-fluid">
        <%-- Chart JS --%>
        <div class="row">
            <div class="col-lg-8 d-flex align-items-strech">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                            <div class="mb-3 mb-sm-0">
                                <h5 class="card-title fw-semibold">Mes Transactions</h5>
                            </div>
                            <div>
                                <form>
                                    <select class="form-select" id="year_select">
                                        <option value="-">Tout</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                    </select>
                                </form>
                            </div>
                        </div>
                        <div id="chart"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="row">
                  <div class="col-lg-12">
                    <!-- Yearly Breakup -->
                    <div class="card overflow-hidden">
                      <div class="card-body p-4">
                        <h4 class="card-title mb-9 fw-semibold">Benefices</h4>
                        <div class="row align-items-center">
                          <div class="col-8">
                            <h1 class="fw-semibold mb-3 d-flex flex-row align-items-center" id="benef">
                            </h1>
                          </div>
                          <div class="col-4">
                            <div class="d-flex justify-content-center">
                              <div id="benef-chart"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>
              </div>

        </div>
        <%-- Chart JS --%>

        <%-- List Vente --%>
        <div id="list-ventes">
            <div class="<%= msgClass %>" role="alert">
                <%= msg %>
            </div>
            <script>
                const header = ['Id', 'Date Vente', 'Montant', 'Id Carte', 'Id Acheteur', 'Id Vendeur', 'Actions'];
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
                const table = generateTableTopContainer("Toutes les transactions", header, data, "listVente");
                document.getElementById("list-ventes").appendChild(table);
            </script>
        </div>
        <%-- List Vente --%>
    </div>
</section>
<script src="web/assets/js/mine/benef.chart.js"></script>
<script src="web/assets/js/mine/transaction.chart.js"></script>
<script src="web/assets/js/mine/dashboard.js"></script>
<script>
    const idUser = <%= idUser %>;
    const ventes = <%= jsonVentes %>;

    const select = document.getElementById("year_select");
    select.addEventListener('change', () => {
        const yearSelected = select.value === "-" ? 
            undefined : select.value;
        const filteredVentes = yearSelected ? 
            ventes.filter(v => getYear(v.dateVente) === yearSelected) : ventes;
        updateChart( '#chart', '#benef', '#benef-chart', idUser, filteredVentes);
    });

    function getYear( date ) {
        return new Date( date ).getFullYear().toString();
    }
    
    updateChart( '#chart', '#benef', '#benef-chart', idUser, ventes);
    let chart = null;
</script>
