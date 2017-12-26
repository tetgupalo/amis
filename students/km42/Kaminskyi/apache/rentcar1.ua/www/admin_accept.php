<?php 

$app_id = $_POST['app_id'];
include 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
$req = oci_parse($conn, 'UPDATE APPLICATION_TABLE_V
								SET "APPLICATION_STATUS" = :ap_status
								WHERE "APPLICATION_ID"  = :id');
$status = 2;							
oci_bind_by_name($req, ":ap_status", $status);
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