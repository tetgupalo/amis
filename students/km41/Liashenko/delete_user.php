<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<title>Видалити користувача</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />

</head>
<body>

 <?php include"../db.php"; ?>
 <br><a href="admin.php">Головна сторінка</a><br>
 
<?php
$result=mysqli_query($link,"DELETE FROM users WHERE USER_ID='$_POST[id]'");
if($result==true)
{
echo "Информация из БД успешно удалена!";

}
else	
{
echo "При удалении информации из БД произошла ошибка!";
}
?>

    <!-- Document ends. -->
  </div>
</div>
</body>
</html>
