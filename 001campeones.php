<?php 

// CONNECTION TO BBDD WITH  mysqli_connect()
$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}


// ACCESS TO THE DATA OF THE BBDD

$consulta = "SELECT * FROM `champions`"; // MYSQL QUERY
$lista_champions = mysqli_query($conexion,$consulta); // mysqli_query() ALLOW US TO GET THE DATA DEPENDING ON QUERY AND THE BBDD NAME

    if($lista_champions){ // WE CONTROL THAT WE HAVE VALUES
        foreach ($lista_champions as $champion) { // SHOW EACH VALUE OF THE COLLECTION
           echo "Champion data<br><br> $champion[id] , $champion[nombre]<br><br>";
        }
    }




?>