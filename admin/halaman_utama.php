<?php 
include 'header.php';
// pesanan baru 
$result1 = mysqli_query($conn, "SELECT distinct invoice FROM produksi WHERE terima = 0 and tolak = 0");
$jml1 = mysqli_num_rows($result1);

// pesanan dibatalkan/ditolak
$result2 = mysqli_query($conn, "SELECT distinct invoice FROM produksi WHERE  tolak = 1");
$jml2 = mysqli_num_rows($result2);

// pesanan diterima
$result3 = mysqli_query($conn, "SELECT distinct invoice FROM produksi WHERE  terima = 1");
$jml3 = mysqli_num_rows($result3);

$data = [$jml1, $jml2, $jml3];
?>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <canvas id="myChart" width="400" height="300"></canvas> <!-- Chart canvas with smaller dimensions -->
        </div>
        <div class="col-md-6">
            <div style="background-color: #dfdfdf; padding: 20px;">
                <h4>Pesanan Baru: <?= $data[0] ?></h4>
                <h4>Pesanan Ditolak: <?= $data[1] ?></h4>
                <h4>Pesanan Diterima: <?= $data[2] ?></h4>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Pesanan Baru', 'Pesanan Ditolak', 'Pesanan Diterima'],
            datasets: [{
                label: 'Jumlah Pesanan',
                data: <?= json_encode($data) ?>,
                backgroundColor: [
                    'rgba(0, 0, 255, 0.5)',
                    'rgba(255, 0, 0, 0.5)',
                    'rgba(0, 255, 0, 0.5)'
                ]
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>
<div class="container">
</div>
<!-- Tombol Print -->
<button onclick="printPage()" class="btn btn-primary" style="position: fixed; bottom: 20px; right: 20px;"><i class="glyphicon glyphicon-print"></i> Print</button>

<script>
function printPage() {
    window.print();
}
</script>

<br>
<br>
<br>
<br>
<?php 
include 'footer.php';
?>
