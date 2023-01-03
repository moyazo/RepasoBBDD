
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
    <link rel="stylesheet" href="Styles.css">
    <title>002campeones</title>
</head>
<body>

<div id="container">
<?php 


if($lista_champions){
    foreach ($lista_champions as $champion) {
       echo "<form id='form'class='sub-container' action='003editando.php' method='get'>
            <p>Champion data<br><br> $champion[id] , $champion[nombre]</p> 
            <a id='edit' href ='003editando.php?id=$champion[id]'>EDITAR</a> 
            <input hidden value='$champion[id]' name='id'>
            <input hidden value='delet' name='delete'>
            <button type='sumbit' id='btnDelete'>BORRAR</button>
            </form>
            ";
    }
}

?>

</div>

<script>
    const formDOM = document.getElementById("form")
    const btnDelete = document.getElementById("btnDelete")

    formDOM.onsubmit = (e) => {
        const response = confirm("Deseas borrar el campeón")
        if(response === false){
            e.preventDefault()
            location.replace("002campeones.php")
        }
    }
</script>


</body>
</html>
