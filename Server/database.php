<?php

$servername = "localhost:3306";
$username = "root";
$archivo = fopen("pw.txt", "r");
$password = fgets($archivo);
fclose($archivo);

//conexió al servidor MySQL
$link = mysqli_connect($servername, $username, $password);
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

?>