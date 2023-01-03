<?php 

// CONNECTION TO BBDD WITH  mysqli_connect()
$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}

// ACCESS TO THE DATA OF THE BBDD

if(isset($_GET["sort"])){ // IF $_GET["sort"] IS NOT EMPTY
    $sortCase = $_GET["sort"];
    $consulta = "";
    switch ($sortCase) {
        case 0:
            $consulta = "SELECT * FROM `champions` ORDER BY id DESC"; // ACCESS TO THE DATA OF THE BBDD
            break;
        
        case 1:
            $consulta = "SELECT * FROM `champions` ORDER BY 'id' ASC" ; // MYSQL QUERY
        break;
    }

    $lista_champions = mysqli_query($conexion,$consulta); // mysqli_query() ALLOW US TO GET THE DATA DEPENDING ON QUERY AND THE BBDD NAME
    
}else{ // IF $_GET["sort"] IS NOT EMPTY
    $consulta = "SELECT * FROM `champions`"; // MYSQL QUERY
    $lista_champions = mysqli_query($conexion,$consulta); // mysqli_query() ALLOW US TO GET THE DATA DEPENDING ON QUERY AND THE BBDD NAME
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Styles.css">
    <title>003campeones</title>
</head>
<body>
<div id='fields-container'>
    <?php
    print "<table>";
        foreach ($lista_champions as $champion) {
            echo "<div id='fields'>
            <p id='desc'><</p>
            <p id='asc'><</p>
            <div class='field'>
            '$champion[nombre]'
        </div>
        <div class='field'>
            '$champion[rol]'
        </div>
        <div class='field'>
            '$champion[difficulty]'
        </div>
        <div class='field'>
            '$champion[descripcion]'
        </div>
        </div>";
        }
        print "</table>";
    ?>
 </div>

 <script>
    const ascDOM = document.getElementById("asc") // GET THE arrow REFERENCE
    const descDOM = document.getElementById("desc") // GET THE arrow REFERENCE

    ascDOM.onclick = () =>{ // WHEN CLIKC LOCATION REPLACE WITH 0 OR 1. DEPENDS ON THE ARROW
        location.replace("003campeones.php?sort=1")
    }
    descDOM.onclick = () =>{
        location.replace("003campeones.php?sort=0")
    }
 </script>

</body>
</html>