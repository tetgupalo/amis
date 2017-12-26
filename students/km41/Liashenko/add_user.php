
<html>
<head>
<title>Добавление пользователя</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />

</head>
<body>
<div id="holder">

 <br><a href="admin.php">Головна сторінка</a><br>
 <?php 
 include "../db.php";

 
 $result=mysqli_query($link,"INSERT INTO users (LOGIN,PASSWORD,ROOT,NUMBER,CARD) VALUES('$_POST[login]','$_POST[password]','$_POST[root]','$_POST[number]','$_POST[card]')");
 
 if($result==true)
 {
echo "Информация в БД успешно добавлена!";
 }
else	
{
echo "При вставке информации в БД произошла ошибка!";
}

 ?>
    <!-- Document ends. -->
  </div>
</div>
</body>
</html>
