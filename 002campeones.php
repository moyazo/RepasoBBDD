
<?php 


$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}


// CONSULTA A BBDD

$consulta = "SELECT * FROM `champions`";
$lista_champions = mysqli_query($conexion,$consulta);

    


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/styles.css">
    <title>002campeones</title>
</head>
<body>

<?php 


if($lista_champions){
    foreach ($lista_champions as $champion) {
       echo "Champion data<br><br> $champion[id] , $champion[name] <a href =003editando.php?id=$champion[id]>HOLA</a> <a href =''>ADIOS</a><br><br> ";
    }
}

?>


</body>
</html>
