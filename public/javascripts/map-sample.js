google.load('visualization', '1', {packages:['intensitymap']});
google.load("visualization", "1", {packages:["corechart"]});

google.setOnLoadCallback(drawChart);
function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', '', 'Country');
    data.addColumn('number', 'Population (mil)', 'a');
    data.addColumn('number', 'Area (km2)', 'b');
    data.addRows(5);
    data.setValue(0, 0, 'CN');
    data.setValue(0, 1, 1324);
    data.setValue(0, 2, 9640821);
    data.setValue(1, 0, 'IN');
    data.setValue(1, 1, 1133);
    data.setValue(1, 2, 3287263);
    data.setValue(2, 0, 'US');
    data.setValue(2, 1, 304);
    data.setValue(2, 2, 9629091);
    data.setValue(3, 0, 'ID');
    data.setValue(3, 1, 232);
    data.setValue(3, 2, 1904569);
    data.setValue(4, 0, 'BR');
    data.setValue(4, 1, 187);
    data.setValue(4, 2, 8514877);

    var chart = new google.visualization.IntensityMap(document.getElementById('intensity-chart'));
    chart.draw(data, {});

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Year');
    data.addColumn('number', 'Sales');
    data.addColumn('number', 'Expenses');
    data.addRows(4);
    data.setValue(0, 0, '2004');
    data.setValue(0, 1, 1000);
    data.setValue(0, 2, 400);
    data.setValue(1, 0, '2005');
    data.setValue(1, 1, 1170);
    data.setValue(1, 2, 460);
    data.setValue(2, 0, '2006');
    data.setValue(2, 1, 860);
    data.setValue(2, 2, 580);
    data.setValue(3, 0, '2007');
    data.setValue(3, 1, 1030);
    data.setValue(3, 2, 540);

    var chart = new google.visualization.LineChart(document.getElementById('timeline-chart'));
    chart.draw(data, {width: 400, height: 240, title: 'Company Performance'});
}
