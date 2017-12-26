<html>
<?php 

include_once 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);

if (!$conn) {
		$e = oci_error();
		trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
	}


	$sel = OCIParse($conn, 'SELECT "EMAIL", "ROLE" FROM "USER" WHERE "LOGIN" = :login');
	$log = $_COOKIE['user_id'];	
	oci_bind_by_name($sel, ":login", $log);
	oci_execute($sel);
	$nrow = oci_fetch_all($sel, $res);
	
	
	$email = $res['EMAIL'][0];
	$role = $res['ROLE'][0];
	
	
	

	$start_status = 0;
	$car_year = date_format(date_create($_POST['car_year']),"d-M-Y");
	$last_technical_insp = date_format(date_create($_POST['last_technical_inspection']),"d-M-Y ");
	

	
	$s = OCIParse($conn, 'BEGIN RENT_CAR_PKG.ADD_APP_DATA(:state_name, :role, :email, :application_id, :engine_number, :body_number, :app_status, :car_brand, :car_model, :car_year, :last_technical_i, :prise_per_day,  :result); END;'); 
	 
	  $car_s = trim($_POST['car_state']);
	  OCIBindByName($s, ":state_name", $car_s); 
	  OCIBindByName($s, ":role", $role); 
	  OCIBindByName($s, ":email",$email); 
	  OCIBindByName($s, ":application_id",$start_status); 
	  
		$en_num = mb_strtoupper(trim($_POST['engine_number']));
	  OCIBindByName($s, ":engine_number", $en_num); 
		$bd_num = mb_strtoupper(trim($_POST['body_number']));
	  OCIBindByName($s, ":body_number", $bd_num); 
	  OCIBindByName($s, ":app_status",$start_status); 
		$cb = mb_strtoupper(trim($_POST['car_brand']));
	  OCIBindByName($s, ":car_brand", $cb); 
		$cm = mb_strtoupper(trim($_POST['car_model']));
	  OCIBindByName($s, ":car_model",$cm); 
	  OCIBindByName($s, ":car_year", $car_year); 
	  OCIBindByName($s, ":last_technical_i", $last_technical_insp); 
		$ppd = trim($_POST['price_per_day']);
	  OCIBindByName($s, ":prise_per_day",$ppd);
	  OCIBindByName($s, ":result",$result1);
	  $key_test = OCIExecute($s, OCI_NO_AUTO_COMMIT); 
	  
	  $uploaddir = 'C:/apache/rentcar1.ua/www/img/uploads/ '.$en_num;
	  if (!is_dir($uploaddir))
	  {
		  mkdir($uploaddir, 0700);
		  
	  }
	  $uploaddir.='/ ';
	  $uploadfile = $uploaddir . basename($_FILES['photo1']['name']);
	  $file_path = $uploadfile;
		
		if (move_uploaded_file($_FILES['photo1']['tmp_name'], $uploadfile) and $result1 == 1) 
		{
			
			if ($key_test )
				{ 
					
					$ch = 'BEGIN RENT_CAR_PKG.ADD_PHOTO_PROC(:state_name, :role, :email, :application_id, :ph_name, :photo,  :body_number, :engine_number,  :result); END;';
					$add_ph = oci_parse($conn, $ch);	
		
					OCIBindByName($add_ph, ":state_name", $car_s); 
					OCIBindByName($add_ph, ":role", $role); 
					OCIBindByName($add_ph, ":email",$email); 
					OCIBindByName($add_ph, ":application_id",$start_status); 
					OCIBindByName($add_ph, ":ph_name", $_FILES['photo1']['name']);
					OCIBindByName($add_ph, ":photo", $file_path);
					OCIBindByName($add_ph, ":engine_number", $en_num); 
					OCIBindByName($add_ph, ":body_number", $bd_num);
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
								oci_commit($conn);
								unlink($uploadfile);
								echo '<h4> SORRY. WE HAVE SOME PROBLEM WITH YOUR PHOTO. '.$e['message'].'</h4>
								<form action="add_application.html"> <button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
							}
							else
							{
								
								echo '<h4> CONGRATULATION INFO WERE SAVED</h4>
								<form action="person_room.html"> <button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
							}
						
					}
					else 
					{
						oci_rollback($conn);
						oci_commit($conn);
						unlink($uploadfile);
						echo '<h4> SORRY. WE HAVE SOME PROBLEM WITH YOUR PHOTO.</h4>
						<form action="add_application.html"> <button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
					}
						
				}
				else 
				{
					oci_rollback($conn);
					oci_commit($conn);
					unlink($uploadfile);
					echo '<h4> SORRY. WE HAVE SOME PROBLEM.</h4>
					<form action="add_application.html"> <button type= "submit" ><h3>I get you, let\'s continue!</h3></button></form>';
					
				}
		} 
		else 
		{
			
			oci_rollback($conn);
			oci_commit($conn);
			unlink($uploadfile);
			echo "<h1>CANN\'T ADD INFORMATION (PHOTO ERROR). PLEASE TRY AGAINE</h1>";
			echo '<form action = "person_room.html"  method="get">  <button type="submit" class="login-button"><h4 > I get you, lets continue) </h4></button></form>';
			
		}
		
		
	   

	

	

?>
</html>
