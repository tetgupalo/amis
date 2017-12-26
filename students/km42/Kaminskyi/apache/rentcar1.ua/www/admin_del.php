<?php 

$app_id = $_POST['app_id'];
include_once 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
$req = oci_parse($conn, 'DELETE APPLICATION_TABLE_V
								WHERE "APPLICATION_ID"  = :id');

oci_bind_by_name($req, ":id", $app_id);
$key = oci_execute($req);
if($key)
{
	header("Location: person_room.html");exit;
}
else
{
	echo "Error";
}
?>