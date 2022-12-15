<?php


$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}


$id = $_POST["id"];
$name = $_POST["name"];
$rol = $_POST["rol"];
$dif = $_POST["diff "];
$des = $_POST["des"];




$consultaData = "UPDATE champions SET `name` = $name, `rol` = $rol, `difficulty` = $dif, `descripton` = $des  WHERE id = $id" ;


$championName = mysqli_query($conexion,$consultaData);







?>