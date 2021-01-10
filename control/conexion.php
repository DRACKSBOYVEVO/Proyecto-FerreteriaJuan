<?php
	$db='tec';
	$con=mysql_connect('localhost','root','') or die('Problema con la conexion');
	mysql_select_db($db,$con)or die('Problema con la base de datos');
?>