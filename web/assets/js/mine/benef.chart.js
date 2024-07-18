function setBenefice( idBenefice, idChart, mesAchats, mesVentes ) {
    const sumAchats = mesAchats.reduce( ( a, b ) => a + b, 0 );
    const sumVentes = mesVentes.reduce( ( a, b ) => a + b, 0 );

    renderChartBenef( idChart, [sumAchats, sumVentes] );

    const benef = sumVentes - sumAchats;
    const formattedBenef = " Ar " + new Intl.NumberFormat().format( benef );

    const benefElmnt = document.querySelector( idBenefice );
    benefElmnt.innerHTML = "";
    benefElmnt.appendChild( createArrow( benef ) );
    benefElmnt.appendChild( document.createTextNode(formattedBenef) );
}

function createText( formattedBenef ) {
    let spanElement = document.createElement( 'span' );
    spanElement.innerHTML = formattedBenef;
    return spanElement;
}

function createArrow( benef ) {
    const direction = benef > 0 ? "up" : "down";
    const state = benef > 0 ? "success" : "danger";

    let spanElement = document.createElement( 'span' );
    spanElement.className = "me-1 rounded-circle round-20 d-flex align-items-center justify-content-center bg-light-" + state;

    let iconElement = document.createElement( 'i' );
    iconElement.className = "ti ti-arrow-" + direction + " text-" + state;

    spanElement.appendChild( iconElement );
    return spanElement;
}

function renderChartBenef( idChart, updatedSeries ) {
    const updatedChartConfig = {
        color: "#adb5bd",
        series: updatedSeries,
        labels: ["Achats", "Ventes"],
        chart: {
            width: 180,
            type: "donut",
            fontFamily: "Plus Jakarta Sans', sans-serif",
            foreColor: "#adb0bb",
        },
        plotOptions: {
            pie: {
                startAngle: 0,
                endAngle: 360,
                donut: {
                    size: '75%',
                },
            },
        },
        stroke: {
            show: false,
        },

        dataLabels: {
            enabled: false,
        },

        legend: {
            show: false,
        },
        colors: ["#49FFFF", "#5D87FF"],

        responsive: [
            {
                breakpoint: 991,
                options: {
                    chart: {
                        width: 150,
                    },
                },
            },
        ],
        tooltip: {
            theme: "dark",
            fillSeriesColor: false,
        },
    };

    var chart = new ApexCharts( document.querySelector( idChart ), updatedChartConfig );
    chart.render();
}