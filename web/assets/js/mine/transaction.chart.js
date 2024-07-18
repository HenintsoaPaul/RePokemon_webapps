function renderChartMesTransactions( idChart, xaxisData, yaxisData ) {
    const chartContainer = document.querySelector( idChart );
    chartContainer.innerHTML = '';

    const updatedChartConfig = {
        series: xaxisData,
        chart: {
            type: "bar",
            height: 500,
            offsetX: -15,
            toolbar: { show: true },
            foreColor: "#adb0bb",
            fontFamily: 'inherit',
            sparkline: { enabled: false },
        },
        chart: {
            type: "bar",
            height: 350,
            offsetX: -15,
            toolbar: { show: true },
            foreColor: "#adb0bb",
            fontFamily: 'inherit',
            sparkline: { enabled: false },
        },
        colors: ["#5D87FF", "#49FFFF"],
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
                style: { cssClass: "grey--text lighten-2--text fill-color" },
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
        tooltip: { theme: "light" },
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

    const updatedChart = new ApexCharts( chartContainer, updatedChartConfig );
    updatedChart.render();
}