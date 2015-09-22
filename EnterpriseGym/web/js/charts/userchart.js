function pie(title, label, data) {

    // Build the chart
    $('#userchart').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: title
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
        series: [{
                type: 'pie',
                name: label,
                data: [
                    ['Brute Force', 25],
                    ['XXS', 25],
                    {
                        name: 'Injection',
                        y: 25,
                        sliced: true,
                        selected: true
                    },
                    ['Indirect Object Reference', 25],
                ]
            }]
    });
}