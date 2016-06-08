<?php
  /* Clase que permite conectarnos a la BD*/
  // Clase Conexión extiende de la clase de php mysqli
  class ConnectionDB extends mysqli {
      public function __construct(){
          parent::__construct('localhost','root','1234','gimnasio');
          $this->query("SET NAMES 'utf8';");
          $this->connect_errno ? die('Error con la conexion') : $x = 'conectado!';
          unset($x);
      }
      public function recorrer($y){
          return mysqli_fetch_array($y);
      }
      public function rows($y){
          return mysqli_num_rows($y);
      }
  }
?>
