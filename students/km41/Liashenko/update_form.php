<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<title>Змінити користувача</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />

</head>
<body>


 <?php include "../db.php" ?>

<?php
$result=mysqli_query($link,"SELECT * FROM users WHERE USER_ID='$_POST[id]'");
$myrow=mysqli_fetch_array($result);
?>
	
<form action="update_user.php?type=<?php echo $_GET['type']?>&id=<?php echo $_POST['id']?>" method="post">
Логін користувача:</br>
<input type="text" name="login" value="<?php echo $myrow['LOGIN'] ?>" size="60"/></br></br>
Пароль користувача:</br>
<input type="text" name="password" value="<?php echo $myrow['PASSWORD'] ?>" size="60"/></br></br>
Права користувача:</br>

<select name="root" value="<?php echo $myrow['ROOT'] ?>">
			<option value="USER">USER</option>
			<option value="ADMIN">ADMIN</option>
		</select></br></br>
		
Номер телефону користувача:</br>
<input type="text" name="number" value="<?php echo $myrow['NUMBER'] ?>" size="60"/></br></br>

Кредитка користувача:</br>
<input type="text" name="card" value="<?php echo $myrow['CARD'] ?>" size="60"/></br></br>		

<input type="submit" name="submit" value="Изменить"/>

</form>	 

</body>
</html>
