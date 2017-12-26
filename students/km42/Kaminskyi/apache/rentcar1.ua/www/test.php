<html> 
<p>If PHP is working, you will see "Hello World" below:<hr> 

<?php 

$conn = oci_connect('NAZAZR_TEST', 'test', 'localhost/XE');
if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}


$rating_start = 0;
$dr_li_date = date_format(date_create($_POST['driver_licence_date']),"d-M-Y ");
$birthday_u = date_format(date_create($_POST['birthday']),"d-M-Y ");


$s = OCIParse($conn, 'insert into USER_TABLE_V values (:role, :email, :login, :pass, :driver_licence, :number_driver_licence, :firstname, :lastname, :phone, :birthday, :rating)'); 
  OCIBindByName($s, ":role", $_POST['user_role']); 
  OCIBindByName($s, ":email",$_POST['email']); 
  OCIBindByName($s, ":login", $_POST['login']); 
  OCIBindByName($s, ":pass",$_POST['pass']); 
  OCIBindByName($s, ":driver_licence", $dr_li_date); 
  OCIBindByName($s, ":number_driver_licence",$_POST['driver_licence_number']); 
  OCIBindByName($s, ":firstname", $_POST['first_name']); 
  OCIBindByName($s, ":lastname",$_POST['family_name']); 
  OCIBindByName($s, ":phone", $_POST['phone']); 
  OCIBindByName($s, ":birthday",$birthday_u); 
  OCIBindByName($s, ":rating", $rating_start); 
  OCIExecute($s, OCI_DEFAULT); 



$user_in = OCIParse($conn, 'SELECT * FROM USER_TABLE_V WHERE "ROLE" = :role and "PASSWORD" = :pass and "LOGIN" =:login'); 
  OCIBindByName($user_in, ":role", $_POST['user_role']); 
  OCIBindByName($user_in, ":login",$_POST['user_log']); 
  OCIBindByName($user_in, ":pass",$_POST['user_pass']); 
  OCIExecute($user_in, OCI_DEFAULT);
  
$result = oci_fetch_array($user_in, OCI_ASSOC);

if ($result) {
    // The password matches: the user can use the application
    // Set the user name to be used as the client identifier in
    // future HTTP requests:
    $_SESSION['user_id'] = $_POST['user_log'];
	setcookie('user_id', $_POST['user_log'], time()+3600); 
	header("Location: index.html"); exit;
  }
  else {
	header("Location: registration.html"); exit;
    // No rows matched so login failed
  }

	

?>
</html>