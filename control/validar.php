<?php
include('conexion.php');
if (isset($_POST['login'])) {
	//VARIABLES DEL USUARIO
$usuario = $_POST['txtusuario'];
$pass = $_POST['txtpass'];
//VALIDAR CONTENIDO EN LAS VARIABLES O CAJAS DE TEXTO
if (empty($usuario) | empty($pass)) 
	{
	header("Location: ../index.html");
	exit();
	}
//VALIDANDO EXISTENCIA DEL USUARIO
$sql = mysql_query("SELECT * from usuarios where usuario = '$usuario' and pass = '$pass' ");
if ($row = mysql_fetch_array($sql)) 
		{
		session_start();
		$_SESSION['usuario'] = $usuario;
		header("Location: ../perfil.php");
		}else
			{
			header("Location: ../index.html");
			exit();
		}
}
?>