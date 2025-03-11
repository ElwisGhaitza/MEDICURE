<?php 
// Mengimpor file koneksi dan mendefinisikan variabel-variabel dari input form
include '../../koneksi/koneksi.php';
$kode = $_POST['kode'];
$nm_produk = $_POST['nama'];
$harga = $_POST['harga'];
$desk = $_POST['desk'];
$nama_gambar = $_FILES['files']['name'];
$size_gambar = $_FILES['files']['size'];
$tmp_file = $_FILES['files']['tmp_name'];
$eror = $_FILES['files']['error'];
$type = $_FILES['files']['type'];

// Jika tidak ada file gambar yang diupload, hanya update data produk
if($eror === 4){
	// Update data produk
	$result = mysqli_query($conn, "UPDATE produk SET nama = '$nm_produk', deskripsi = '$desk', harga = '$harga' where kode_produk = '$kode'");
	// Redirect ke halaman m_produk.php jika update berhasil
	if($result){
		echo "
		<script>
		alert('PRODUK BERHASIL DIEDIT');
		window.location = '../m_produk.php';
		</script>
		";
	}die;
}

// Validasi ekstensi gambar yang diunggah dan jika tidak sesuai, tampilkan pesan error dan redirect kembali ke halaman edit_produk.php
$ekstensiGambar = array('jpg','jpeg','png');
$ekstensiGambarValid = explode(".", $nama_gambar);
$ekstensiGambarValid = strtolower(end($ekstensiGambarValid));

if(!in_array($ekstensiGambarValid, $ekstensiGambar)){
	echo "<script>
	alert('EKSTENSI GAMBAR HARUS JPG, JPEG, PNG');
	window.location = '../edit_produk.php?kode=".$kode."';
	</script>
	"; die;
}

// Validasi ukuran gambar dan Jika tidak sesuai, tampilkan pesan error dan redirect kembali ke halaman tm_produk.php
if($size_gambar > 1000000){
	echo "
	<script>
	alert('UKURAN GAMBAR TERLALU BESAR');
	window.location = '../tm_produk.php';
	</script>
	";	die;
}

$namaGambarBaru = uniqid();
$namaGambarBaru.=".";
$namaGambarBaru.=$ekstensiGambarValid;

// Mengambil nama gambar produk yang sudah ada dari database
$gambar = mysqli_query($conn, "SELECT image from produk where kode_produk = '$kode'");
$tgambar = mysqli_fetch_assoc($gambar);
// Memeriksa apakah gambar produk yang sudah ada ada di dalam folder, jika ya, maka dihapus
if (file_exists("../../image/produk/".$tgambar['image'])) {
	unlink("../../image/produk/".$tgambar['image']);

	// Pindahkan gambar baru ke folder produk
	move_uploaded_file($tmp_file, "../../image/produk/".$namaGambarBaru);

	// Update data produk, termasuk nama gambar baru
	$result = mysqli_query($conn, "UPDATE produk SET nama = '$nm_produk', image = '$namaGambarBaru' ,deskripsi = '$desk', harga = '$harga' where kode_produk = '$kode'");
	if($result){
		//Menampilkan pesan berhasil dan mengarahkan ke halaman m_produk.php
		echo "
		<script>
		alert('PRODUK BERHASIL DIEDIT');
		window.location = '../m_produk.php';
		</script>
		";}

}else{
// Jika gambar produk yang lama tidak ada di dalam folder, langsung memindahkan gambar baru ke folder produk
move_uploaded_file($tmp_file, "../../image/produk/".$namaGambarBaru);
	// Update data produk, termasuk nama gambar baru
	$result = mysqli_query($conn, "UPDATE produk SET nama = '$nm_produk', image = '$namaGambarBaru' ,deskripsi = '$desk', harga = '$harga' where kode_produk = '$kode'");

	if($result){
		//Menampilkan pesan berhasil dan mengarahkan ke halaman m_produk.php
		echo "
		<script>
		alert('PRODUK BERHASIL DIEDIT');
		window.location = '../m_produk.php';
		</script>
		";
	}
}
?>