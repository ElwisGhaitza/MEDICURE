<?php 
	include 'header.php';
 ?>
<div class="container" style="padding-bottom: 300px;">
	<h2 class="bg-success text-center" style="padding: 10px;">Checkout Berhasil</h2>
	<h4 class="text-center" style="font-weight: bold;">Terimakasih Sudah Berbelanja di MEDICURE, Pesananmu sedang diproses. Have a nice day 🥰 </h4>
	<h5 class="text-center" style="font-weight:">Mohon konfirmasi pembayaran Anda pesanan akan diproses selama 1x24 jam setelah konfirmasi pemensanan dilakukan❗</h5>
	<br>
<br>
<br>
<br>	
<div class="text-center">
		<a href="keranjang.php" class="btn btn-danger btn-lg">Kembali</a>
		<a href="bukti.php?kode_cs=<?= $kode_cs; ?>" class="btn btn-success btn-lg">Lihat Bukti</a>
</div>
</div>
 <?php 
	include 'footer.php';
 ?>
