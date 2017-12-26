<?php 

session_start();//начать новий, або продовжити сеанс роботи
if (isset($_POST['user_log']) && isset($_POST['user_pass'])) {	
	define("ORA_CON_UN", "NAZAZR_TEST");
	define("ORA_CON_PW", "test");
	define("ORA_CON_DB", "localhost/xe");

include_once 'get_conn.php';
$conn_at = get_conn_atr('connection.txt');
$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);

if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}
oci_set_client_identifier($conn, 'NAZAZR_TEST');

$s = OCIParse($conn, 'SELECT * FROM USER_TABLE_V WHERE "ROLE" = :role and "PASSWORD" = :pass and "LOGIN" =:login'); 
  OCIBindByName($s, ":role", $_POST['user_role']); 
  OCIBindByName($s, ":login",$_POST['user_log']); 
  OCIBindByName($s, ":pass",$_POST['user_pass']); 
  OCIExecute($s);

  $result = oci_fetch_all($s, $res);
  echo $result;
  
  if ($result) {
    // The password matches: the user can use the application
    // Set the user name to be used as the client identifier in
    // future HTTP requests:
    $_SESSION['user_id'] = $_POST['user_log'];
	setcookie('user_id', $_POST['user_log'], time()+3600); 
	setcookie('user_email', $res['EMAIL'][0], time()+3600);
	
	setcookie('user_role', $res['ROLE'][0], time()+3600);
	header("Location: person_room.html"); exit;
  }
  else {
	
    echo '<h3> No SUCH USER </h3>';
	echo '<form action = "login.html" ><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
  }
}
?>