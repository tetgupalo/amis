<?php
$link = mysqli_connect("localhost", "root","", "admin");

if (!$link) {
    echo "Ошибка: Невозможно установить соединение с MySQL.";
    exit;
}

//echo "Соединение с MySQL установлено!";

//mysqli_close($link);



?>