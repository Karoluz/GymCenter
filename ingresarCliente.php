<?php
	require('connection.php');
	$db= new ConnectionDB();
	$rut= $db->escape_string($_POST['rut']);
	$nombre= $db->escape_string($_POST['nombre']);
	$apellido= $db->escape_string($_POST['apellido']);
	$email= $db->escape_string($_POST['email']);
	$telefono=$db->escape_string($_POST['telefono']);
	$fechanac= $db->escape_string($_POST['fechanac']);
	$sexo= $db->escape_string($_POST['sexo']);
	$estatura= $db->escape_string($_POST['estatura']);
	$peso= $db->escape_string($_POST['peso']);
	$imc= ((float)$peso / ((float)$estatura * (float)$estatura));
	$sql="insert into cliente(rut_cli, nombre_cli, apellido_cli, email, telefono_cli, fecha_nac, cod_sexo, estatura, peso_ini, imc_ini) VALUES ('$rut','$nombre','$apellido','$email','$telefono','$fechanac','$sexo','$estatura','$peso','$imc');";
	if($db->query($sql)){
		header('location: menuCajero.html');
	}else {
		die($db->error);
	}
?>
