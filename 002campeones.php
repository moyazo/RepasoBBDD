
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
    <form id='form'class='sub-container' action='003editando.php' method='get'>
<?php 
    if($lista_champions){ // WE CONTROL THAT WE HAVE VALUES
        foreach ($lista_champions as $champion) { 
        echo "
                <p>Champion data<br><br> $champion[id] , $champion[nombre]</p> 
                <a id='edit' href ='003editando.php?id=$champion[id]'>EDITAR</a> 
                <input hidden value='$champion[id]' name='id'>
                <input hidden value='delet' name='delete'>
                <button type='sumbit' id='btnDelete'>BORRAR</button>
                
                ";
        }
    }

?>
    </form>
</div>

<script>
    const formDOM = document.getElementById("form") // GET THE <form> REFERENCE
    const btnDelete = document.getElementById("btnDelete") // GET THE <button> REFERENCE

    formDOM.onsubmit = (e) => {
        const response = confirm("Deseas borrar el campeón")
        if(response === false){
            e.preventDefault() // WITH e.preventDefault() WE CAN CANCEL THE EVENT OF SUBMIT
            location.replace("002campeones.php") // CHANGE OUR LOCATION WITH location.replace()
        }
    }
</script>


</body>
</html>
