<?php
    /**
     * Created by PhpStorm.
     * User: eric
     * Date: 4/17/17
     * Time: 1:31 PM
     */
    require("Conn.php");
    require("MySQLDao.php");
    $email = ($_POST["email"]);
    $password = ($_POST["password"]);
    $returnValue = array();
    
    if(empty($email) || empty($password))
    {
        $returnValue["status"] = "error";
        $returnValue["message"] = "Missing required field";
        echo json_encode($returnValue);
        return;
    }
    
    $secure_password = md5($password);
    
    $dao = new MySQLDao();
    $dao->openConnection();
    $userDetails = $dao->getUserDetailsWithPassword($email,$secure_password);
    
    if(!empty($userDetails))
    {
        $returnValue["status"] = "Success";
        $returnValue["message"] = "User is registered";
        echo json_encode($returnValue);
    } else {
        
        $returnValue["status"] = "error";
        $returnValue["message"] = "User is not found";
        echo json_encode($returnValue);
    }
    
    $dao->closeConnection();
    
    ?>
