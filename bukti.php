<?php
include 'header.php';
$kd = mysqli_real_escape_string($conn, $_GET['kode_cs']);
$cs = mysqli_query($conn, "SELECT * FROM customer WHERE kode_customer = '$kd'");
$rows = mysqli_fetch_assoc($cs);
?>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript">
	// perintah membuat fungsi print 
	function Print() {
		var printDokumen = document.getElementById("nota").innerHTML;
		var originalDokumen = document.body.innerHTML;
		document.body.innerHTML = printDokumen;
		window.print();
		document.body.innerHTML = originalDokumen;
	}
</script>

<div id="nota" class="container" style="padding-bottom: 200px">
	<br><br><br><br>
	<div class="row">
		<div class="col-md-6">
			<h4> <b>Detail Pesanan</b></h4>
			<h5>Nama &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;: <?= $rows['nama']; ?></h5>
			<h5>Email &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;: <?= $rows['email']; ?></h5>
			<h5>No. Telepon&ensp;&ensp;&ensp;&ensp;: <?= $rows['telp']; ?></h5><br>
			<table class="table table-stripped">
				<tr>
					<th>No</th>
					<th>Nama</th>
					<th>Harga</th>
					<th>Qty</th>
					<th>Sub Total</th>
				</tr>
				<?php
				$result = mysqli_query($conn, "SELECT * FROM produksi WHERE kode_customer = '$kd'");
				$no = 1;
				$hasil = 0;
				while ($row = mysqli_fetch_assoc($result)) {
				?>
					<tr>
						<td><?= $no; ?></td>
						<td><?= $row['nama_produk']; ?></td>
						<td>Rp.<?= number_format($row['harga']); ?></td>
						<td><?= $row['qty']; ?></td>
						<td>Rp.<?= number_format($row['harga'] * $row['qty']);  ?></td>
					</tr>
				<?php
					$total = $row['harga'] * $row['qty'];
					$hasil += $total;
					$no++;
				}
				?>
				<tr>
					<td colspan="5" style="text-align: right; font-weight: bold;">Total Belanja = <?= number_format($hasil); ?></td>
				</tr>

			</table>
		</div>

	</div>
	<div class="row">
		<div class="col-md-6 bg-warning">
			<h5>Mohon konfirmasi pembayaran Anda pesanan akan diproses selama 1x24 jam setelah konfirmasi pemensanan dilakukan.</h5>
		</div>
	</div>
	<br>
	<form action="proses/order.php" method="POST">
		<a href="keranjang.php" class="btn btn-danger">Kembali</a>
		<button onclick="Print()" type="submit" class="btn btn-left btn-success">Cetak Nota</button>
	</form>
</div>
<?php
include 'footer.php';
?>