<?php
    //  вс€ процедура работает на сесси€х. »менно в ней хран€тс€ данные  пользовател€, пока он находитс€ на сайте. ќчень важно запустить их в  самом начале странички!!!
    session_start();
    ?>
    <html>
    <head>
    <title>Site</title>
    </head>
    <body>
    <h2>Site</h2>
    <form action="testreg.php" method="post">

    <!--****  testreg.php - это адрес обработчика. “о есть, после нажати€ на кнопку  "¬ойти", данные из полей отправ€тс€ на страничку testreg.php методом  "post" ***** -->
 <p>
    <label>Login:<br></label>
    <input name="login" type="text" size="15" maxlength="15">
    </p>

    <p>

    <label>Password:<br></label>
    <input name="password" type="password" size="15" maxlength="15">
    </p>

    <p>
    <input type="submit" name="submit" value="Go">

    <!--****  нопочка (type="submit") отправл€ет данные на страничку testreg.php ***** --> 
<br>
 <!--**** ссылка на регистрацию, ведь как-то же должны гости туда попадать ***** --> 

    </p></form>
    <br>
    <?php
    // ѕровер€ем, пусты ли переменные логина и id пользовател€
    if (empty($_SESSION['login']) or empty($_SESSION['id']))
    {
    // ≈сли пусты, то мы не выводим ссылку
    echo "Fuck you GOST<br><a href='#'>Call me baybe +380986218875</a>";
    }
    else
    {

    // ≈сли не пусты, то мы выводим ссылку
    echo "All OK ".$_SESSION['login']."<br><a  href='http://tvpavlovsk.sk6.ru/'>GO</a>";
    }
    ?>
    </body>
    </html>