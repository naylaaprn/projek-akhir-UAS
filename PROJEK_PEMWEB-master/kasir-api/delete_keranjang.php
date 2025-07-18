<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json");

require_once 'config.php';

$data = json_decode(file_get_contents("php://input"), true);
$id = $data['id'];

$stmt = $conn->prepare("DELETE FROM keranjangs WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

echo json_encode(["status" => "success", "message" => "Item dihapus"]);
