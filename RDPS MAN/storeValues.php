<?php
    $host='localhost';
    $user='root';
    $password='root';
    $dbname= 'sqlphpswift';
    
    
    
    $connection = mysqli_connect($host,$user,$password,$dbname);
    
    $userName = $_POST['a'];
    $password = $_POST['b'];
    
    
    
    // Check connection
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    
    $query = "INSERT INTO sqltable (`userName`, `password`)
    VALUES ('$userName','$password')";
    
    if($connection->query($query) === TRUE){
        echo "new record created";
    } else {
        echo "Error: " . $query . "<br>" . $connection->error;
    }
    
    $connection->close();
    ?>
