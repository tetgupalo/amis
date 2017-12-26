<?php 
$app_id = $_POST['app_id'];
include_once 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
$inprosses = oci_parse($conn, 'SELECT "CONTRACT_NUMBER", "FINISH_DATE" FROM BOOK_CAR_V WHERE ((SELECT SYSDATE FROM DUAL) >= BOOK_CAR_V."START_DATE" and (SELECT SYSDATE FROM DUAL) <= BOOK_CAR_V."FINISH_DATE") and "APPLICATION_ID" = :id');
oci_bind_by_name($inprosses, ":id", $app_id);
oci_execute($inprosses, OCI_NO_AUTO_COMMIT);
$ncontr = oci_fetch_all($inprosses, $r);

if ($ncontr == 0)
{
	//$k = oci_parse($conn, 'SELECT "ROLE" , "EMAIL" FROM USER_TABLE_V WHERE "LOGIN" = :log');
	//oci_bind_by_name($k, ":log", $_COOKIE['user_id']);
	///oci_execute($k);
	//oci_fetch_all($k, $roem);
	// Якщо заявка по машині зараз вільна , то можна поміняти інфу, інакше ні
	$ch = 'BEGIN RENT_CAR_PKG.UPDATE_APP_INFO(:state_name, :role, :email, :id, :en_num, :bd_num, :app_status, :car_brand, :car_model, :car_year, :last_t_i, :price_per_day,  :result); END;';
	$st = oci_parse($conn, $ch);
	oci_bind_by_name($st, ":state_name", $_POST['car_state']);
	oci_bind_by_name($st, ":role", $_COOKIE['user_role']);
	oci_bind_by_name($st, ":email", $_COOKIE['user_email']);
	oci_bind_by_name($st, ":id", $app_id);
	oci_bind_by_name($st, ":en_num", $_POST['engine_number']);
	oci_bind_by_name($st, ":bd_num", $_POST['body_number']);
	$app_status = 1;
	oci_bind_by_name($st, ":app_status", $app_status);
	
	oci_bind_by_name($st, ":car_brand", $_POST['car_brand']);
	oci_bind_by_name($st, ":car_model", $_POST['car_model']);
	
	$car_year = date_format(date_create($_POST['car_year']),"d-M-Y");
	$last_technical_insp = date_format(date_create($_POST['last_technical_inspection']),"d-M-Y ");
	
	oci_bind_by_name($st, ":car_year", $car_year);
	oci_bind_by_name($st, ":last_t_i", $last_technical_insp);
	oci_bind_by_name($st, ":price_per_day", $_POST['price_per_day']);
	oci_bind_by_name($st, ":result", $result, 32);
	oci_execute($st, OCI_NO_AUTO_COMMIT);
	if ($result == 1)
	{
		if ($_FILES['photo1']['name'] != '')
		{	
			$uploaddir = 'C:/apache/rentcar1.ua/www/img/uploads/ '.$_POST['engine_number'];
			if (!is_dir($uploaddir))
			{
			    mkdir($uploaddir, 0700);
				  
			}
			$uploaddir.='/ ';
			$uploadfile = $uploaddir . basename($_FILES['photo1']['name']);
			$file_path = $uploadfile;
			if (move_uploaded_file($_FILES['photo1']['tmp_name'], $uploadfile)) 
			{
								$add_ph = oci_parse($conn, 'BEGIN RENT_CAR_PKG.ADD_PHOTO_PROC(:state_name, :role, :email, :application_id, :ph_name, :photo,  :body_number, :engine_number,  :result); END;');	
					
								OCIBindByName($add_ph, ":state_name", $_POST['car_state']); 
								OCIBindByName($add_ph, ":role", $_COOKIE['user_role']); 
								OCIBindByName($add_ph, ":email",$_COOKIE['user_email']); 
								OCIBindByName($add_ph, ":application_id",$app_id); 
								OCIBindByName($add_ph, ":ph_name", $_FILES['photo1']['name']);
								OCIBindByName($add_ph, ":photo", $file_path);
								OCIBindByName($add_ph, ":engine_number", $_POST['engine_number']); 
								OCIBindByName($add_ph, ":body_number", $_POST['body_number']); 
								oci_bind_by_name($add_ph, ":result", $result, 32);
					
								
								$key_test_1 = OCIExecute($add_ph, OCI_NO_AUTO_COMMIT);   
			

				
								if ($key_test_1 and $result == 1)
								{ 
									$r = oci_commit($conn);
										if (!$r) 
										{
											$e = oci_error($conn);
											trigger_error(htmlentities($e['message']), E_USER_ERROR);
											oci_rollback($conn);
											unlink($uploadfile);
											oci_commit($conn);
											echo '<h4> SORRY. WE HAVE SOME PROBLEM. '.$e['message'].'</h4>
											<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
										}
										else
										{
											echo '<h1> GOOD JOB. CHANGES WERE SAVED.</h1>';
											oci_commit($conn);
											echo '<form action = "person_room.html"  method="get">  <button type="submit" class="login-button"><i > I get you, lets continue) </i></button></form>';
										}
								}
								else 
								{
									oci_rollback($conn);
									oci_commit($conn);
									unlink($uploadfile);
									echo '<h4> SORRY. WE HAVE SOME PROBLEM.</h4>
									<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
								}
			
		  }
		  else
		  {
			oci_rollback($conn);
			oci_commit($conn);
			unlink($uploadfile);
			echo "<h1>CANN\'T ADD INFORMATION (PHOTO ERROR). PLEASE TRY AGAINE</h1>";
			echo '<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
		  }
		}
		else
		{
			oci_commit($conn);
			echo "<h1>GOOD JOB. CHANGES WERE SAVED2</h1>";
			echo '<form action="person_room.html" method="GET"> <button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
		}
	}
	else
	{
		oci_rollback($conn);
		oci_commit($conn);
		echo '<h1> CAN\'T SAVE CHANGES. PLEASE ENTER CORRECT INFORMATION </h1>';
		echo '	<form action="change.html" method="GET"> <input type="hidden" name="app_id" value="'.$app_id.'"/><button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
			
	}
	
	
	
	
}
else
{
	echo '<h1>Can\'t change your application at this moment. Try it after '.$r['FINISH_DATE'][$ncontr-1].'. </h1>';
	echo '<form action = "person_room.html"  method="get">  <button type="submit" class="login-button"><i > I get you, lets continue) </i></button></form>';
}


?>