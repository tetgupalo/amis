<html>
<?php 
include_once 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);

if (!$conn) {
		$e = oci_error();
		trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
	}



	$user_in = OCIParse($conn, 'SELECT * FROM USER_TABLE_V WHERE "ROLE" = :role and ("EMAIL" = :email or "LOGIN" =:login)'); 
	  OCIBindByName($user_in, ":role", $_POST['user_role']); 
	  OCIBindByName($user_in, ":login",$_POST['login']); 
	  OCIBindByName($user_in, ":email",$_POST['email']); 
	  OCIExecute($user_in);
	  
	$result = oci_fetch_array($user_in, OCI_ASSOC);

if ($result) {
		echo '  <script type="text/javascript">
					  alert("THIS USER ALREADY EXIST!!")
				</script>';
							
				
				echo '<h3> THIS USER ALREADY EXIST </h3>';
				echo '<form action = "registration.html" ><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
			
}
else {

		$rating_start = 0;
		$dr_li_date = date_format(date_create($_POST['driver_licence_date']),"d-M-Y ");
		$birthday_u = date_format(date_create($_POST['birthday']),"d-M-Y ");

		
		$s = OCIParse($conn, 'BEGIN RENT_CAR_PKG.ADD_USER_DATA(:role, :email, :login, :pass, :driver_licence, :number_driver_licence, :firstname, :lastname, :phone, :birthday, :rating,:result); END;' ); 
		  OCIBindByName($s, ":role", $_POST['user_role']); 
		  OCIBindByName($s, ":email",$_POST['email']); 
		  OCIBindByName($s, ":login", $_POST['login']); 
		  OCIBindByName($s, ":pass",$_POST['pass']); 
		  OCIBindByName($s, ":driver_licence", $dr_li_date); 
		  $driver_licence = mb_strtoupper($_POST['driver_licence_number']);
		  OCIBindByName($s, ":number_driver_licence",$driver_licence); 
		  OCIBindByName($s, ":firstname", $_POST['first_name']); 
		  OCIBindByName($s, ":lastname",$_POST['family_name']); 
		  OCIBindByName($s, ":phone", $_POST['phone']); 
		  OCIBindByName($s, ":birthday",$birthday_u); 
		  OCIBindByName($s, ":rating", $rating_start); 
		  OCIBindByName($s, ":result",$result111);
		  $r = OCIExecute($s, OCI_NO_AUTO_COMMIT); 
			
			echo $result111;
			echo $_POST['user_role'].'  '.$_POST['email'].'  '.$_POST['login'].'  '.$_POST['pass'].'  '.$driver_licence.'  '.$_POST['first_name'].'  '.$_POST['phone'].'  '.$birthday_u;

		 
		if ($r and $result111 == 1) {
			
				oci_commit($conn);
				$user_in = OCIParse($conn, 'SELECT * FROM USER_TABLE_V WHERE "ROLE" = :role and "PASSWORD" = :pass and "LOGIN" =:login'); 
				  OCIBindByName($user_in, ":role", $_POST['user_role']); 
				  OCIBindByName($user_in, ":login",$_POST['login']); 
				  OCIBindByName($user_in, ":pass",$_POST['pass']); 
				  OCIExecute($user_in);
				  
				$result = oci_fetch_array($user_in, OCI_ASSOC);

				if ($result)
				{
					// The password matches: the user can use the application
					// Set the user name to be used as the client identifier in
					// future HTTP requests:
					$_SESSION['user_id'] = $_POST['login'];
					setcookie('user_id', $_POST['login'], time()+3600); 
					header("Location: person_room.html"); exit;
				}
				else 
				{
					  echo '<script type="text/javascript">
								  alert("CAN`T SIGN IN! ERROR!")
							</script>';
						
						
						echo '<h3> No SUCH USER </h3>';
						echo '<form action = "login.html" ><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
					// No rows matched so login failed header("Location: registration.html"); exit;
				}
		}
		else
		{
				
				$e = oci_error();
			echo $e['message'];
			
			oci_rollback($conn);
			oci_commit($conn);
			echo '<h3> NOT VALID INFORMATION </h3>';
			echo '<form action = "registration.html" ><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
		}

		

	}

	

?>
</html>
