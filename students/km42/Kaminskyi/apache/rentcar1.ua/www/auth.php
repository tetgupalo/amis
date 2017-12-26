<?php

 if (isset($_COOKIE['user_id'])){
	include_once 'get_conn.php';
	$conn_at = get_conn_atr('connection.txt');
	$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
	
	$st = oci_parse($conn, 'select "LOGIN" from USER_TABLE_V where "LOGIN" = :login');
	$em = $_COOKIE['user_id'];
	oci_bind_by_name($st, ":login", $em);
	$row = oci_execute($st);
	$nrow = oci_fetch_all($st, $res);
	if($nrow>0){
		for ($i = 0; $i < $nrow; $i++) {
			echo '<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover">Hello,</a></li>';
		foreach ($res as $data) {
			echo '<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="person_room.html">',$data[$i],'</a></li>';
		}
	
 }
	echo '<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="logout.php">Logout</a></li>';	
	}
 }
 else { echo
	'<li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="login.html">LOGIN</a></li>
     <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="registration.html">REGISTRATION</a></li>
	 ';
 }
?>
