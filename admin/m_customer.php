<?php 
include 'header.php';

if(isset($_GET['page'])){
	$kode = $_GET['kode'];
	$result = mysqli_query($conn, "DELETE FROM customer WHERE kode_customer = '$kode'");

	if($result){
		echo "
		<script>
		alert('DATA BERHASIL DIHAPUS');
		window.location = 'm_customer.php';
		</script>
		";
	}
}

?>


<div class="container">
	<h2 style=" width: 100%; border-bottom: 4px solid gray"><b>Data Customer</b></h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">Kode Customer</th>
				<th scope="col">Nama</th>
				<th scope="col">Email</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<?php 
			$result = mysqli_query($conn, "SELECT * FROM customer order by kode_customer asc");
			$no =1;
			while ($row = mysqli_fetch_assoc($result)) {
				?>
				<tr>

					<th scope="row"><?php echo $no; ?></th>
					<td><?= $row['kode_customer'];  ?></td>
					<td><?= $row['nama'];  ?></td>
					<td><?= $row['email'];  ?></td>
					<td><a href="m_customer.php?kode=<?php echo $row['kode_customer'];?>&page=del" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menghapus Data ?')"><i class="glyphicon glyphicon-trash"></i> </a></td>
				</tr>
				<?php 
				$no++;
			}
			?>
		</tbody>
	</table>

</div>
<!-- Button trigger modal -->
<div class="container">
    <!-- Tombol Print -->
    <button onclick="printPage()" class="btn btn-primary float-right"><i class="glyphicon glyphicon-print"></i> Print</button>
	</div>

	<script>
	function printPage() {
		window.print();
	}
	</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<?php 
include 'footer.php';
?>
