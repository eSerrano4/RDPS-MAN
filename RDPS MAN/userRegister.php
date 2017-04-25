<?php
    /**
     * Created by PhpStorm.
     * User: eric
     * Date: 4/17/17
     * Time: 2:33 PM
     */
    require("Conn.php");
    require("MySQLDao.php");
    
    $email = htmlentities($_POST['a']);
    $password = htmlentities($_POST['b']);
    
    $returnValue = array();
    
    if(empty($email) || empty($password))
    {
        $returnValue["status"] = "error";
        $returnValue["message"] = "Missing required field";
        echo json_encode($returnValue);
        return;
    }
    
    $dao = new MySQLDao();
    $dao->openConnection();
    $userDetails = $dao->getUserDetails($email);
    
    if(!empty($userDetails))
    {
        $returnValue["status"] = "error";
        $returnValue["message"] = "User already exists";
        echo json_encode($returnValue);
        return;
    }
    
    $secure_password = md5($password); // I do this, so that user password cannot be read even by me
    
    $result = $dao->registerUser($email,$secure_password);
    
    if($result)
    {
        $returnValue["status"] = "Success";
        $returnValue["message"] = "User is registered";
        echo json_encode($returnValue);
        return;
    }
    
    $dao->closeConnection();
    
    ?>
