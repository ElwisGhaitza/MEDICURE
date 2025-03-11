<?php 
include 'header.php';
?>
<!-- IMAGE -->
<div class="container-fluid" style="margin: 0;padding: 0;">
	<div class="image" style="margin-top: -21px">
		<img src="image/home/er.png" style="width: 100%;  height: 650px;">
	</div>
</div>
<br>
<br>

<!-- PRODUK TERBARU -->
<div class="container">
	<br>
	<h4 class="text-center" style="font-family: arial; padding-top: 10px; padding-bottom: 10px; font-style: italic; line-height: 29px; border-top: 2px solid #192655; border-bottom: 2px solid #192655;"> MEDICURE adalah platform online tempat Anda dapat mencari, memilih, dan membeli berbagai jenis obat-obatan, suplemen, dan produk kesehatan lainnya secara mudah dan nyaman melalui internet. MEDICURE telah memiliki izin dan lisensi resmi untuk menjual obat, sehingga keamanan dan keaslian produk dapat dipertanggungjawabkan. Dengan website menggunakanMEDICURE, Anda dapat memperoleh akses mudah dan cepat ke produk-produk kesehatan yang Anda butuhkan tanpa harus keluar rumah.</h4>
	<h2 style=" width: 100%; border-bottom: 4px solid #192655; margin-top: 80px;"><b>Produk Kami</b></h2>

	<div class="row">
		<?php 
		$result = mysqli_query($conn, "SELECT * FROM produk");
		while ($row = mysqli_fetch_assoc($result)) {
			?>
			<div class="col-sm-3">
				<div class="thumbnail" style="height: 400px;">
					<img src="image/produk/<?= $row['image']; ?>" style="height: 200px; width: auto;">
					<div class="caption">
						<h3><?= $row['nama'];  ?></h3>
						<h4>Rp.<?= number_format($row['harga']); ?></h4>
						<div class="row">
							<div class="col-md-6">
								<a href="detail_produk.php?produk=<?= $row['kode_produk']; ?>" class="btn btn-warning btn-block">Detail</a> 
							</div>
							<?php if(isset($_SESSION['kd_cs'])){ ?>
								<div class="col-md-6">
									<a href="proses/add.php?produk=<?= $row['kode_produk']; ?>&kd_cs=<?= $kode_cs; ?>&hal=1" class="btn btn-success btn-block" role="button"><i class="glyphicon glyphicon-shopping-cart"></i>Tambah</a>
								</div>
								<?php 
							}
							else{
								?>
								<div class="col-md-6">
									<a href="keranjang.php" class="btn btn-success btn-block" role="button"><i class="glyphicon glyphicon-shopping-cart"></i>Tambah</a>
								</div>

								<?php 
							}
							?>

						</div>

					</div>
				</div>
			</div>
			<?php 
		}
		?>
	</div>

</div>
<br>
<br>
<br>
<br>
<?php 
include 'footer.php';
?>