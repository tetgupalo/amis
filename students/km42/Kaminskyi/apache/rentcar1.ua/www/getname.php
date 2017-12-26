<?php 

 if (isset($_COOKIE['user_id']))
 
	{
		include_once 'get_conn.php';
		$conn_at = get_conn_atr('connection.txt');
		$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
		$st = oci_parse($conn, 'select "FIRSTNAME", "LASTNAME" from USER_TABLE_V where "LOGIN" = :login');
		$em = $_COOKIE['user_id'];
		oci_bind_by_name($st, ":login", $em);
		$row = oci_execute($st);
		$nrow = oci_fetch_all($st, $res);
		if($nrow>0)
		{	for ($i = 0; $i < $nrow; $i++) 
			{
				foreach ($res as $data) 
				{
					echo '<h3>',$data[$i],'</h3>';
				}
			}
		}
	
	}

?>