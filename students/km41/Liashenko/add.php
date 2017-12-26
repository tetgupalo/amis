
<head>
<title>Добавить пользователя</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<!-- Перевірка полів на пустоту -->
<script language="javascript">
function Formdata(data)
{
if (data.login != null && data.login.value.length == 0 )
	{
	alert('Заповніть поле "Логін"');
	return false;
	}
else if(data.password != null && data.password.value.length == 0 )
	{
	alert('Заповніть поле "Пароль"');
	return false;
	}
}
</script>
<!-------------------------------->
	<meta charset="utf-8">
	<br><a href="admin.php">Головна сторінка</a>

		<body>
		 <?php include"../db.php"; ?>
		 
		<form action="add_user.php?type=<?php echo $_GET['type']?>" method="post">
<br>
		Логін:</br >
		<input type="text" name="login" size="60"/></br></br>
		Пароль:</br>
		<input type="text" name="password" maxlength="4" size="60"/></br></br>
		Права:</br >
		<select name="root">
			<option value="USER">USER</option>
			<option value="ADMIN">ADMIN</option>
		</select></br></br>
		Телефон:</br >
		<input maxlength="13" placeholder="0**-***-**-**" type="tel" name="number" size="60"/></input></br></br>
		Кредитка:</br>
		<input type="text" maxlength="19" name="card" placeholder="0000-0000-0000-0000"  size="60"/></br></br>

		<input type="submit" name="submit" onClick="return Formdata(this.form)" value="Добавить"/>
		
		</form>	  
		</body>

</html>
