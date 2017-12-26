<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<title>Додавання користувача</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />

</head>
<body>

 <?php include "../db.php" ?>
 <br><a href="admin.php">Головна сторінка</a><br>
 
 <?php 
 $result=mysqli_query($link,"UPDATE users SET LOGIN='$_POST[login]',PASSWORD='$_POST[password]',ROOT='$_POST[root]', NUMBER='$_POST[number]', CARD='$_POST[card]' WHERE USER_ID='$_GET[id]'");

 if($result==true)
 {
echo "Информация в БД успешно изменена!";

 }

else
	
{
echo "При изменении информации в БД произошла ошибка!";
}

 ?>
    <!-- Document ends. -->

</body>
</html>
