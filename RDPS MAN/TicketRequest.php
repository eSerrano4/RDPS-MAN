<?php
    /**
     * Created by PhpStorm.
     * User: eric
     * Date: 4/24/17
     * Time: 5:16 PM
     */
    
    $host='localhost';
    $user='root';
    $password='root';
    $dbname= 'sqlphpswift';
    
    
    
    $connection = mysqli_connect($host,$user,$password,$dbname);
    
    $roomNumbers = $_POST['a'];
    $TicketRequested = $_POST['b'];
    
    
    
    // Check connection
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    
    $query = "INSERT INTO ticketRequest (`roomNumber`, `ticketRequest`)
    VALUES ('$roomNumbers','$TicketRequested')";
    
    if($connection->query($query) === TRUE){
        echo "new record created";
    } else {
        echo "Error: " . $query . "<br>" . $connection->error;
    }
    
    $connection->close();
    ?>
