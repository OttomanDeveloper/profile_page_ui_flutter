<?php

function getDatabase()
{
    $hostName = "localhost"; // Enter Host Name Here
    $hostUser = "root"; // Enter Host Username Here
    $hostPass = ""; //  Enter Host Password Here
    $database = "profile_tutorial"; // Enter Database Name Here

    $pdo = new PDO("mysql:host={$hostName};dbname={$database}", $hostUser, $hostPass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $pdo;

}
