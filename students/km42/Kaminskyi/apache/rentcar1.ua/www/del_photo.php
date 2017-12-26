<?php 
include_once 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
$app_id = $_GET['app_id'];

if(unlink($_GET['photo']))
{
	$ch = 'BEGIN RENT_CAR_PKG.DELETE_PHOTO(:id, :photo, :result); END;';
	$st = oci_parse($conn, $ch);
	oci_bind_by_name($st, ":id", $app_id);
	oci_bind_by_name($st, ":photo", $_GET['photo']);
	oci_bind_by_name($st, ":result", $result, 32);
	$k = oci_execute($st, OCI_NO_AUTO_COMMIT);
	if($k)
	{
		if($result == 1)
		{
			oci_commit($conn);
			echo '<h3>PHOTO WAS DELETED</h3>';
			echo '<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type="submit"> <h3>I get you, let`s continue </h3></button> </form>';
		}
		else
		{
			oci_rollback($conn);
			oci_commit($conn);
			echo '<h3>CAN`T DELETE PHOTO</h3>';
			echo '<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type="submit"> <h3>I get you, let`s continue </h3></button> </form>';
	
		}
	}
	else
	{
		oci_rollback($conn);
		oci_commit($conn);
		echo '<h3>CAN`T DELETE PHOTO</h3>';
		echo '<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type="submit"> <h3>I get you, let`s continue </h3></button> </form>';
	}
	
}
else
{
	echo '<h3>CAN`T DELETE PHOTO</h3>';
	echo '<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type="submit"> <h3>I get you, let`s continue </h3></button> </form>';
}




?>