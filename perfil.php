<?php
session_start();
if (isset($_SESSION['usuario'])) {
	echo "";
}else{
	header("Location: index.html");
	exit();
}
echo "Bienvenido ".$_SESSION['usuario']."<br>
<a href='control/cerrar.php'>SALIR</a>";
?>