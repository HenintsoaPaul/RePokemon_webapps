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
            <div class="col-lg-12 d-flex align-items-strech">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                            <div class="mb-3 mb-sm-0">
                                <h5 class="card-title fw-semibold">Sales Overview</h5>
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
<script>
    const idUser = <%= idUser %>;
    const ventes = <%= jsonVentes %>;

    const select = document.getElementById("year_select");
    select.addEventListener('change', () => {
        const yearSelected = select.value === "-" ? 
            undefined : select.value;
        const filteredVentes = yearSelected ? 
            ventes.filter(v => getYear(v.dateVente) === yearSelected) : ventes;
        updateChart(filteredVentes);
    });

    
    function getYear(date) {
        return new Date(date).getFullYear().toString();
    }

    function getDateTransaction(ventes) {
        let dateTransaction = [];
        ventes.forEach(vente => {
            if (!dateTransaction.includes(vente.dateVente)) {
                dateTransaction.push(vente.dateVente);
            }
        });
        return dateTransaction;
    }

    function updateChart(ventes) {
        mesAchats = [];
        mesVentes = [];
        dateTransaction = getDateTransaction(ventes);

        dateTransaction.forEach(date => {
            let tempVente = [], tempAchat = [];
            for(let i = 0; i < ventes.length; i++) {
                if (ventes[i].idUser_vendeur === idUser && ventes[i].dateVente === date) {
                    tempVente.push(ventes[i].montantVente);
                } else if (ventes[i].idUser_acheteur === idUser && ventes[i].dateVente === date) {
                    tempAchat.push(ventes[i].montantVente);
                }
            }

            mesVentes.push(tempVente.reduce((a, b) => a + b, 0));
            mesAchats.push(tempAchat.reduce((a, b) => a + b, 0));
        });

        const oldChartElement = document.querySelector("#chart");
        if (oldChartElement) {
            oldChartElement.innerHTML = '';
        }

        const updatedSeries = [
            { name: "Somme Vente", data: mesVentes },
            { name: "Somme Achat", data: mesAchats },
        ];

        renderChart(
            xaxisData = updatedSeries, 
            yaxisData = dateTransaction
        );
    }
    
    function renderChart(xaxisData, yaxisData) {
        const chartContainer = document.querySelector("#chart");
        chartContainer.innerHTML = '';

        const updatedChartConfig = {
            series: xaxisData,
            chart: {
                type: "bar",
                height: 500,
                offsetX: -15,
                toolbar: {show: true},
                foreColor: "#adb0bb",
                fontFamily: 'inherit',
                sparkline: {enabled: false},
            },
            chart: {
                type: "bar",
                height: 500,
                offsetX: -15,
                toolbar: {show: true},
                foreColor: "#adb0bb",
                fontFamily: 'inherit',
                sparkline: {enabled: false},
            },
            colors: ["#5D87FF", "#49BEFF"],
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: "35%",
                    borderRadius: [6],
                    borderRadiusApplication: 'end',
                    borderRadiusWhenStacked: 'all'
                },
            },
            markers: {
                size: 0
            },
            dataLabels: {
                enabled: false,
            },
            legend: {
                show: false,
            },
            grid: {
                borderColor: "rgba(0,0,0,0.1)",
                strokeDashArray: 3,
                xaxis: {
                    lines: {
                        show: false,
                    },
                },
            },
            xaxis: {
                type: "category",
                categories: yaxisData,
                labels: {
                    style: {cssClass: "grey--text lighten-2--text fill-color"},
                },
            },
            yaxis: {
                show: true,
                min: 0,
                max: 60000,
                tickAmount: 5,
                labels: {
                    style: {
                        cssClass: "grey--text lighten-2--text fill-color",
                    },
                },
            },
            stroke: {
                show: true,
                width: 3,
                lineCap: "butt",
                colors: ["transparent"],
            },
            tooltip: {theme: "light"},
            responsive: [
                {
                    breakpoint: 600,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 3,
                            }
                        }
                    }
                }
            ]
        };

        var updatedChart = new ApexCharts(chartContainer, updatedChartConfig);
        updatedChart.render();
    }


    updateChart(ventes);
    var chart = null;
</script>
