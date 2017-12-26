
<?php
$_SESSION = array();
setcookie('user_id', $_POST['user_id'], time()-1);
header("Location: index.php"); exit;


?>