<!-- javascript init -->
// General configuration for the charts with Line gradientStroke
gradientChartOptionsConfiguration =  {
  maintainAspectRatio: false,
  legend: {
        display: false
   },

   tooltips: {
     backgroundColor: '#fff',
     titleFontColor: '#333',
     bodyFontColor: '#666',
     bodySpacing: 4,
     xPadding: 12,
     mode: "nearest",
     intersect: 0,
     position: "nearest"
   },
   responsive: true,
   scales:{
     yAxes: [{
       barPercentage: 1.6,
           gridLines: {
             drawBorder: false,
               color: 'rgba(29,140,248,0.0)',
               zeroLineColor: "transparent",
           },
           ticks: {
             suggestedMin:50,
             suggestedMax: 110,
               padding: 20,
               fontColor: "#9a9a9a"
           }
         }],

     xAxes: [{
       barPercentage: 1.6,
           gridLines: {
             drawBorder: false,
               color: 'rgba(220,53,69,0.1)',
               zeroLineColor: "transparent",
           },
           ticks: {
               padding: 20,
               fontColor: "#9a9a9a"
           }
         }]
     }
};

var ctx = document.getElementById("lineChartExample").getContext("2d");

var gradientStroke = ctx.createLinearGradient(0,230,0,50);

gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors

var data = {
  labels: ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'],
  datasets: [{
    label: "Data",
    fill: true,
    backgroundColor: gradientStroke,
    borderColor: '#d048b6',
    borderWidth: 2,
    borderDash: [],
    borderDashOffset: 0.0,
    pointBackgroundColor: '#d048b6',
    pointBorderColor:'rgba(255,255,255,0)',
    pointHoverBackgroundColor: '#d048b6',
    pointBorderWidth: 20,
    pointHoverRadius: 4,
    pointHoverBorderWidth: 15,
    pointRadius: 4,
    data: [ 60,110,70,100, 75, 90, 80, 100, 70, 80, 120, 80],
  }]
};

var myChart = new Chart(ctx, {
  type: 'line',
  data: data,
  options: gradientChartOptionsConfiguration
});