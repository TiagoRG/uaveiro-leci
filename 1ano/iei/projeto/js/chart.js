var type = "line"; // line graphic by default

function graphic(element) {
    let e = document.getElementById( "selection" );
    type = e.options[e.selectedIndex].value;
}

function draw() {
    $("#myGraph").highcharts({
        chart: { type: type },
        title: { text: "Temperatures Average" },
        xAxis: { categories: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
                "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
        },
        series:[
            {
                name: "Lisboa",
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
            },
            {
                name: "Aveiro",
                data: [5.0, 6.2, 8.4, 10.7, 13.5, 16.5, 16.9, 21.7, 22.7, 16.2, 12.5, 7.6]
            },
            {
                name: "Leiria - No Data",
                data: []
            }
        ]
    });
}