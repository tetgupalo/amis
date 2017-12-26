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
			echo '<span><strong>Skills: </strong></span>
								<span class="label label-warning">HTML5/CSS</span>
								<span class="label label-info">Adobe CS 5.5</span>
								<span class="label label-info">Microsoft Office</span>
								<span class="label label-success">Windows XP, Vista, 7</span>
							</center>
							<hr>
							<center>
							<p class="text-left"><strong>Bio: </strong><br>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sem dui, tempor sit amet commodo a, vulputate vel tellus.</p>
							<br>
							</center>';
		}
	
	}

?>