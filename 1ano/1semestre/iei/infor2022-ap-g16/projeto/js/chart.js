$("#grafico-ataques-anuais").highcharts({
    chart: { type: "column" },
    title: { text: "Ciberataques Anuais" },
    xAxis: { categories: ["2016", "2017", "2018", "2019", "2020", "2021", "2022 (primeira metade)"] },
    series:[
        {
            name: "Ciberataques (milhões)",
            data: [638, 183.6, 206.4, 187.9, 304.6, 623.3, 236.1]
        }
    ]
});