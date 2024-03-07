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
                                <select class="form-select">
                                    <option value="1">March 2023</option>
                                    <option value="2">April 2023</option>
                                    <option value="3">May 2023</option>
                                    <option value="4">June 2023</option>
                                </select>
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

    console.log(`idUser = ${idUser}`);
    console.log(ventes);

    let mesAchats = [], mesVentes = [], dateTransaction = [];
    ventes.forEach(vente => {
        if (vente.idUser_vendeur === idUser) {
            mesVentes.push(vente.montantVente);
            dateTransaction.push(vente.dateVente);
        } else if (vente.idUser_acheteur === idUser) {
            mesAchats.push(vente.montantVente);
            dateTransaction.push(vente.dateVente);
        }
    });


    var chart = {
        series: [
            {
                name: "Earnings :",
                data: mesVentes
            },
            {
                name: "Expense :",
                data: mesAchats
            },
        ],

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
        markers: {size: 0},

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
            categories: dateTransaction,
            labels: {
                style: {cssClass: "grey--text lighten-2--text fill-color"},
            },
        },


        yaxis: {
            show: true,
            min: 0,
            max: 1000,
            tickAmount: 10,
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
                    },
                }
            }
        ]


    };

    var chart = new ApexCharts(document.querySelector("#chart"), chart);
    chart.render();
</script>