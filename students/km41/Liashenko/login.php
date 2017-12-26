<?php
	include "db.php";
	
	session_start();//не забываем во всех файлах писать session_start
		if (isset($_POST['login']) && isset($_POST['password'])){
    //немного профильтруем логин
	$login = mysqli_real_escape_string($link,htmlspecialchars($_POST['login']));
    //хешируем пароль т.к. в базе именно хеш
	$password = md5(trim($_POST['password']));
     // проверяем введенные данные
    $query = "SELECT USER_ID, LOGIN FROM users WHERE LOGIN= 'login' AND PASSWORD = 'password' LIMIT 1";
    $sql = mysqli_query($link,$query) or die(mysqli_error($link));
    // если такой пользователь есть
    if (mysqli_num_rows($sql) == 1) {
        $row = mysqli_fetch_assoc($sql);
		header("Location: index.php");
		echo "ZBS";
		
		//ставим метку в сессии 
		$_SESSION['user_id'] = $row['USER_ID'];
		$_SESSION['login'] = $row['LOGIN'];
		//ставим куки и время их хранения 1 дней
		setcookie("CookieMy", $row['login'], time()+60*60*24*1);
		 
		
   }
    else 
	{
        //если пользователя нет, то пусть пробует еще
		header("Location: login.php"); 
    }
}
//проверяем сессию, если она есть, то значит уже авторизовались
if (isset($_SESSION['user_id'])){
	echo htmlspecialchars($_SESSION['login'])." <br />"."Вы авторизованы <br />
	Т.е. мы проверили сессию и можем открыть доступ к определенным данным";
	
} else {
	$login = '';
	//проверяем куку, может он уже заходил сюда
	if (isset($_COOKIE['CookieMy'])){
		$login = htmlspecialchars($_COOKIE['CookieMy']);
	}
	
	//простая формочка
	print <<<html
<form action="login.php" method="POST">
		Логин <input name="login" type="text" value = $login><br>
		Пароль <input name="password" type="password"><br>
		<input name="submit" type="submit" value="Войти">
	</form>
html;
}
?>