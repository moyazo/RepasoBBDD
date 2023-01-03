<?php 


$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}
if(isset($_GET["sort"])){
    $sortCase = $_GET["sort"];
    $consulta = "";
    switch ($sortCase) {
        case 0:
            $consulta = "SELECT * FROM `champions` ORDER BY id DESC";
            break;
        
        case 1:
            $consulta = "SELECT * FROM `champions` ORDER BY 'id' ASC" ;
        break;
    }

    $lista_champions = mysqli_query($conexion,$consulta);
    
}else{
    $consulta = "SELECT * FROM `champions`";
    $lista_champions = mysqli_query($conexion,$consulta);
}







// CONSULTA A BBDD


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
    const ascDOM = document.getElementById("asc")
    const descDOM = document.getElementById("desc")

    ascDOM.onclick = () =>{
        location.replace("003campeones.php?sort=1")
    }
    descDOM.onclick = () =>{
        location.replace("003campeones.php?sort=0")
    }
 </script>

</body>
</html>