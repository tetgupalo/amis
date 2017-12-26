<?php

function get_conn_atr($file_name)
{
	$fp = fopen($file_name, "r"); // Открываем файл в режиме чтения
	if ($fp) 
	{
	$conn_arr = array();
	for ($i = 0; $i < 3; $i++)
	{
		if(!feof($fp))
		{
			$conn_arr[$i] = trim(fgets($fp, 999));
		}
	}
		
	}
	else echo "Ошибка при открытии файла";
	fclose($fp);

	return $conn_arr;
}

?>