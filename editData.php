<?php


$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}


$id = $_POST["id"];
$name = $_POST["name"];
$rol = $_POST["rol"];
$dif = $_POST["diff"];
$des = $_POST["des"];

$consultaData = "UPDATE champions SET `nombre` = '$name', `rol` = '$rol[0]', `difficulty` = '$dif[0]', `descripcion` = '$des'  WHERE `id` = $id" ;


$championName = mysqli_query($conexion,$consultaData);

?>

<a id='delet' name='delet' href ='003editando.php?id=$champion[id]'>BORRAR</a><br><br></div> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styles.css">
    <title>003editando</title>
</head>
<body>
    <h4>CAMPEÓN ACTUALIZADO CORRECTAMENTE</h4>
    <a href="002campeones.php"><button id="back">VOLVER</button></a>
</body>