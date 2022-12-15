<?php 


$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}


// CONSULTA A BBDD

$consulta = "SELECT * FROM `champions`";
$lista_champions = mysqli_query($conexion,$consulta);

    if($lista_champions){
        foreach ($lista_champions as $champion) {
           echo "Champion data<br><br> $champion[id] , $champion[name]<br><br>";
        }
    }




?>