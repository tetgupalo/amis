<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<title>Змінити користувача</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />

</head>
<body>
 
<?php include "../db.php" ?>
<br><a href="admin.php">Головна сторінка</a>

<form action="update_form.php?type=<?php echo $_GET['type'] ?>" method="post">
ID:</br>
<input type="text" name="id" size="10"/></br></br>
<input type="submit" value="Далее" name="submit"/></br>


 
<?php
$result = mysqli_query($link,"SELECT * FROM users ORDER BY USER_ID");
while ($myrow = mysqli_fetch_array($result)) 
{
echo <<<HERE
<table border='1';>

</br>
<tr>
<th>ID користувача:</th>
<td>$myrow[USER_ID]</td>
</td>
</tr>


<tr>
<th>Логін користувача:</th>
<td>$myrow[LOGIN]</td>
</td>
</tr>

<tr>
<th>Права користувача:</th>
<td>$myrow[ROOT]</td>
</tr>

<tr>
<th>Номер телефону користувача:</th>
<td>$myrow[NUMBER]</td>
</tr>

<tr>
<th>Кредитка користувача:</th>
<td>$myrow[CARD]</td>
</tr>

</table>
HERE;
}
?>

</body>
</html>
