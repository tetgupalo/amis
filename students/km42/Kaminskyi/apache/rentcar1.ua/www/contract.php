
<?php 
		$app_id = $_GET['app_id'];
		
		include_once 'get_conn.php';
		$conn_at = get_conn_atr('connection.txt');
		$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
		
		// вибираємо інформацію по поточному користувачу
		$select_user_info = oci_parse($conn ,'SELECT "ROLE", "EMAIL" FROM USER_TABLE_V WHERE "LOGIN" = :log');
		oci_bind_by_name($select_user_info, ":log", $_COOKIE['user_id']);
		oci_execute($select_user_info);
		oci_fetch_all($select_user_info, $user);
		$user_role = $user['ROLE'][0];
		$user_email = $user['EMAIL'][0];
		// обираємо водія якщо потрібно..
		if (isset($_GET['driver']) and  $_GET['driver'] == '1')
		{
			$fake = 'driver';
			$op = 'SELECT  USER_TABLE_V."EMAIL" 
											FROM USER_TABLE_V 
											WHERE USER_TABLE_V."ROLE" = :rroolle and USER_TABLE_V."EMAIL" NOT IN 	(SELECT BOOK_CAR_V."USE_EMAIL" 
                                                          FROM BOOK_CAR_V
                                                          WHERE  BOOK_CAR_V."USE_ROLE" = :rroolle and
                                                              (  (   :start_tt >= BOOK_CAR_V."START_DATE" and :start_tt <= BOOK_CAR_V."FINISH_DATE")
															or  (:finish_tt >= BOOK_CAR_V."START_DATE" and :finish_tt <= BOOK_CAR_V."FINISH_DATE")))
													';
													
		
			$select_driver_info = oci_parse($conn ,$op);
			
			$start_driver_date = date_format(date_create($_GET['start_date']),"d-M-Y ");
			$finish_driver_date = date_format(date_create($_GET['finish_date']),"d-M-Y ");
			
			oci_bind_by_name($select_driver_info, ":start_tt", $start_driver_date);
			oci_bind_by_name($select_driver_info, ":finish_tt", $finish_driver_date);
			oci_bind_by_name($select_driver_info, ":rroolle", $fake);
			oci_execute($select_driver_info);
			$nrow = oci_fetch_all($select_driver_info, $result);
			$rrrroooollllleeee = 'driver';
			$sel_drivers = oci_parse($conn ,'SELECT "EMAIL" FROM USER_TABLE_V WHERE "ROLE" = :rol');
			oci_bind_by_name($sel_drivers, ":rol",$rrrroooollllleeee );
			oci_execute($sel_drivers);
			$ndrivers = oci_fetch_all($sel_drivers, $mbdriver);
			$i = 0;
			while ($i < $ndrivers)
			{
				for ($j = 0; $j < $nrow; $j++)
				{
					if($mbdriver['EMAIL'][$i] != $result['EMAIL'][$j])
					{
						$driver_role = 'driver';
						$driver_email = $mbdriver['EMAIL'][$i];
						break;
					}
					
				}
				if (isset($driver_email))
				{
					break;
				}
				
				
				$i = $i + 1;
			}
			
			
			
		}
		else
		{
			$driver_role = NULL;
			$driver_email = NULL;
		}
		
		// Вибираємо інформацію по конкретній машині
		
		$per_dost = 'SELECT APPLICATION_ID 
						FROM BOOK_CAR_V
					    WHERE  APPLICATION_ID = :appp_id  and ((   :start_tt > BOOK_CAR_V."START_DATE" and :start_tt < BOOK_CAR_V."FINISH_DATE")
						or  (:finish_tt >= BOOK_CAR_V."START_DATE" and :finish_tt <= BOOK_CAR_V."FINISH_DATE"))
													';
		
		$available = oci_parse($conn, $per_dost);
		oci_bind_by_name($available, ":appp_id", $app_id);
		
		$start_d = date_format(date_create($_GET['start_date']),"d-M-Y ");
		$finish_d = date_format(date_create($_GET['finish_date']),"d-M-Y ");
		
		oci_bind_by_name($available, ":start_tt", $start_d);
		oci_bind_by_name($available, ":finish_tt", $finish_d);
		oci_execute($available);
		$n = oci_fetch_all($available, $app);
		

		if ($n == 0)
		{
		
		
		
				
				$select_app_info = oci_parse($conn ,'SELECT "STATE_NAME", "ROLE", "EMAIL"  FROM APPLICATION_TABLE_V WHERE "APPLICATION_ID" = :app_id');
				oci_bind_by_name($select_app_info, ":app_id", $app_id);
				oci_execute($select_app_info);
				oci_fetch_all($select_app_info, $app);
				
				
				
				
				$req = 'BEGIN RENT_CAR_PKG.ADD_CONTRACT(:car_state, :app_role, :app_email ,:app_id, :role, :email, :use_role, :use_email, :start_date, :finish_date, :meeting_point,  :result); END;';
				
					
				$st = oci_parse($conn, $req);
				oci_bind_by_name($st, ":car_state", $app['STATE_NAME'][0]);
				oci_bind_by_name($st, ":app_role", $app['ROLE'][0]);
				oci_bind_by_name($st, ":app_email", $app['EMAIL'][0]);
				oci_bind_by_name($st, ":app_id", $app_id);
				oci_bind_by_name($st, ":role", $user_role);
				oci_bind_by_name($st, ":email", $user_email);
				oci_bind_by_name($st, ":use_role", $driver_role);
				oci_bind_by_name($st, ":use_email", $driver_email);
				oci_bind_by_name($st, ":start_date", $start_d);
				oci_bind_by_name($st, ":finish_date", $finish_d);
				oci_bind_by_name($st, ":meeting_point", $_GET['meeting_point']);
				
				oci_bind_by_name($st, ":result", $result, 32);
				oci_execute($st, OCI_NO_AUTO_COMMIT);
					
						
				if($result == 1)
				{
					oci_commit($conn);
					echo '<script type="text/javascript">
														alert("You just rent a car! Congratulation!")
										</script>';
					echo '<h3> CONGRATULATION </h3>';
					echo '<form action = "person_room.html" ><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
					
				}
				else
				{
					oci_rollback($conn);
					oci_commit($conn);
					echo '<script type="text/javascript">
														alert("Error")
										</script>';
					echo '<h3> TRY AGAIN LATER </h3>';
					echo '<form action = "contract.html"  method = "GET"><input type= "hidden" name="app_id" value="'.$app_id.'"><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
					
				}
				
				

				

		}
		else
		{
			
			oci_commit($conn);
			echo '<script type="text/javascript">
														alert("Error")
										</script>';
					echo '<h3> CAR IS UNAVAILABLE AT THIS PERIOD </h3>';
					echo '<form action = "contract.html"  method = "GET"><input type= "hidden" name="app_id" value="'.$app_id.'"><button type = "submit"> <h3>I get you, let`s continue!</h3></button></form>';
					
		}
?>
