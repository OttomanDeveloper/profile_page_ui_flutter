<?php

require_once './db.php';

if (isset($_POST['image'])) {

    $image = $_POST['image'];

    $stmt = getDatabase()->prepare("INSERT INTO images (image) VALUES (?)");
    $stmt->execute([$image]);
    echo json_encode("Image Uploaded");

} else {
    echo json_encode("Invalid Request");
}
