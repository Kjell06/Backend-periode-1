<?php

include 'dbdata.php';

$conn = ConnectToDataBase($schema, $user, $password, $host);

function ConnectToDataBase($schema, $user, $password, $host) {
    $conn = new mysqli ($host,$user, $password,$schema ) ;
    if($conn->connect_error)
    {
        echo "error/r/n";
    }
    echo "connected/r/n";
    return $conn;

}
?>