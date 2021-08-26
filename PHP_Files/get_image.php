<?php

require_once './db.php';

if (isset($_POST['id'])) {

    $id = $_POST['id'];

    $stmt = getDatabase()->prepare("SELECT * FROM images WHERE id = ?");
    $stmt->execute([$id]);
    echo json_encode($stmt->fetch(PDO::FETCH_ASSOC));

} else {
    echo json_encode("Invalid Request");
}
