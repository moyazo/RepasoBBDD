<?php


$conexion = mysqli_connect("localhost","root","","campeoneslol");

if(mysqli_connect_errno()){
    echo "FAILED TO CONNECT TO MYSQL: ". mysqli_connect_error();
    exit();
}


$id = $_GET["id"];

if(isset($_GET["delete"])){
    
    $consultaDataDelete = "DELETE FROM `champions` WHERE id=$id";
    mysqli_query($conexion,$consultaDataDelete);
    header("Location:002campeones.php");
}else{
    $consultaData = "SELECT * FROM `champions` WHERE id= $id" ;


    $championName = mysqli_query($conexion,$consultaData);
    $name = "";
    $rol = "";
    $difficulty = "";
    $descripcion = "";
    if($championName){
        foreach ($championName as $cname) {
            $name = "$cname[nombre]";
            $rol = "$cname[rol]";
            $difficulty = "$cname[difficulty]";
            $descripcion = "$cname[descripcion]";
        }
    }
}



?>

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

<form action="editData.php" method="post">
    <input hidden value="<?= $id; ?>" name="id">
    <label for="name">Champion name</label>
    <input type="text" name="name" id="name" value="<?php echo $name?>">
    <br><br>

    <label for="rol">Champion Rol</label>
    <select name="rol[]">
        <option  value="Assassin">Assassin</option>
        <option  value="Fighter">Fighter</option>
        <option  value="Wizard">Wizard</option>
        <option  value="Marksmen">Marksmen</option>
        <option  value="Supports">Supports</option>
        <option  value="Tanks">Tanks</option>
    </select>
    <br><br>

    <label for="diff">Champion Difficulty</label>
    <select name="diff[]">
        <option value="Low">Low</option>
        <option value="Moderate">Moderate</option>
        <option value="High">High</option>
    </select>
    <br><br>

    <label for="des">Champion Description</label>
    <textarea type="textarea" name="des" id="des"><?php echo $descripcion;?></textarea>
    <br><br>

    <button type="submit">UPDATE</button>
    
</form>
<br>
<a href="002campeones.php"><button id="back">VOLVER</button></a>
</body>