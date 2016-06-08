<?php
  require('connection.php');
  $db=new ConnectionDB();

  $rut=$db->escape_string($_POST['in-rut']);
  $pass=$db->escape_string($_POST['in-pass']);

  $login= $db->query('select rut_func, passwd, cod_cargo, nombre_func, apellido_func from funcionario');
  $fila= $db->rows($login);

  for ($i=0; $i < $fila; $i++) {
      $funcionario= $db->recorrer($login);
      if ($rut == $funcionario['rut_func'] && $pass == $funcionario['passwd'] ) {
         session_start();
          if($funcionario['cod_cargo'] == 1){
            $_SESSION['name']=$funcionario['nombre_func'];
            $_SESSION['last_name']=$funcionario['apellido_func'];
            header('location: menuCajero.html');
          }else{
            $_SESSION['name']=$funcionario['nombre_func'];
            $_SESSION['last_name']=$funcionario['apellido_func'];
            header('location: menuPreparadorFisico.html');
          }
      }
  }

?>
