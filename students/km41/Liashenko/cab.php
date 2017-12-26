	<html>
		<title>SITE</title>
		<body>
		
		</body>
	</html>
<?php
	 session_start();
	 include "db.php";
	 $user_ids = $_SESSION['id'];
	 $result = mysqli_query($link,"SELECT USER_ID, LOGIN FROM users WHERE USER_ID='$user_ids'");
	 $myrow = mysqli_fetch_array($result);
	 $login = $myrow['LOGIN'];	 	
	 echo $_SESSION['id'];
	 echo $login;
	 
$see_info = mysqli_query($link, "SELECT * FROM status where USER_ID = '$user_ids'");
while($myrows = mysqli_fetch_array($see_info)) 
{
echo <<<HERE
<table border='1';>
</br>
<tr>
<th>Останній період оплати:</th>
<td>$myrows[Data]</td>
</td>
</tr>


<tr>
<th>До оплати:</th>
<td>$myrows[Price]</td>
</td>
</tr>

<tr>
<th>Статус платежу:</th>
<td>$myrows[Status]</td>
</tr>

</table>
HERE;
}


?>