<?php

$envSettings = [];
    if (file_exists(dirname(__FILE__).'/.env')) { /*als de file met de naam FILE is gevonden gaat hij naar de settings*/
        $envSettings = parse_ini_file(dirname(__FILE__).'/.env');
    }

    $schema=$envSettings["DB_SCHEMA_NAME"];
    $user=$envSettings["DB_USER"];
    $password=$envSettings["DB_PASSWORD"];
    $host=$envSettings["DB_HOST"];


?>