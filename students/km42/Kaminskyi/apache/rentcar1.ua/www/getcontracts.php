<?php 

 if (isset($_COOKIE['user_id']))
 
	{
		$start_str = '<div class="row text-center margin-b-40">
                    <div class="col-sm-6 col-sm-offset-3">
                        <h2>History</h2>
                        <p>Here you can see your items</p>
                    </div>
                </div>
                <!--// end row -->

                <div class="row">';
		$end_str = '</div>';
		
		
		$id = $_COOKIE['user_id'];
		include_once 'get_conn.php';
		$conn_at = get_conn_atr('connection.txt');
		$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
		
		$role_request = 'SELECT "ROLE" FROM "USER" WHERE "LOGIN" = :login';
		$try_get_role = oci_parse($conn, $role_request);
		oci_bind_by_name($try_get_role, ":login", $id);
		oci_execute($try_get_role);
		$numb_role = oci_fetch_all($try_get_role, $role);
		
		if (($numb_role == 1) and ($role['ROLE'][0] == 'user'))
		{
			
			$q = 'SELECT APPLICATION_TABLE_V."CAR_BRAND", APPLICATION_TABLE_V."CAR_MODEL",  APPLICATION_TABLE_V."PRICE_PER_DAY", BOOK_CAR."MEETING POINT", APPLICATION_TABLE_V."APPLICATION_ID", BOOK_CAR."START_DATE", BOOK_CAR."FINISH_DATE"
				FROM "USER" JOIN BOOK_CAR
				ON  "USER"."EMAIL" = BOOK_CAR."EMAIL" and "USER"."ROLE" = BOOK_CAR."ROLE"
				JOIN APPLICATION_TABLE_V
				ON APPLICATION_TABLE_V."EMAIL" = BOOK_CAR."APP_EMAIL"  and APPLICATION_TABLE_V."ROLE" = BOOK_CAR."APP_ROLE" and APPLICATION_TABLE_V."APPLICATION_ID" = BOOK_CAR."APPLICATION_ID"
				WHERE  "USER".LOGIN = :login';
			$st = oci_parse($conn, $q);
			
			oci_bind_by_name($st, ":login", $id);
			$row = oci_execute($st);
			
			$nrow = oci_fetch_all($st, $res);
			//echo '<h3>',$res['MEETING POINT'][$i], '</h3>';
			$str_res = '';
			if($nrow>0)
			{	for ($i = 0; $i < $nrow; $i++) 
				{	
						$get_path = oci_parse($conn, 'SELECT PHOTO FROM PHOTO_V WHERE "APPLICATION_ID" = :id');
									oci_bind_by_name($get_path, ":id", $res['APPLICATION_ID'][$i]);
									oci_execute($get_path);
									$nph = oci_fetch_all($get_path, $res_id);
									if ($nph != 0 )
									{
										$path_to_ph = str_replace("C:/apache/rentcar1.ua/www", "", trim($res_id['PHOTO'][0]));
									}
									else
									{
										$path_to_ph = '/img/uploads/NO_PHOTO.jpg';
									}
					
						$str_res.= '<div class="col-sm-4 sm-margin-b-50">
							<div class="margin-b-20">
								<img class="img-responsive wow fadeIn" src="'.$path_to_ph.'" alt="Car_photo" data-wow-duration=".3" data-wow-delay=".1s" width ="400" height="300">
							</div>
							<h4><a href="#">'.$res['CAR_BRAND'][$i].' '.$res['CAR_MODEL'][$i]. '</a> <span class="text-uppercase margin-l-20">'.$res['PRICE_PER_DAY'][$i].' UAN/DAY'.'</span></h4>
							<p> Meeting point ->'.$res['MEETING POINT'][$i].'</p>
							<h5>START DATE ->'.$res['START_DATE'][$i].' </h5>
							<h5>FINISH DATE ->'.$res['FINISH_DATE'][$i].' </h5>
							<form action="one_car.html" method="get"><input type="hidden" name = "app_id" value="'.$res['APPLICATION_ID'][$i].'" ><button type="submit"><h5>Read More</h5></button> </form>
						</div>';
					
				}
				
			}
			echo $start_str.$str_res.$end_str;
		}
		else 
		{
			
				$start_str = '<div class="row text-center margin-b-40">
						<div class="col-sm-6 col-sm-offset-3">
							<h2>APPLICATION</h2>
							<p>Here you can see your items</p>
							<a href="add_application.html">Add new item</a>
						</div>
					</div>
					<!--// end row -->

					<div class="row">';
				$end_str = '</div>';
				//LESSOR room
				if (($numb_role == 1) and ($role['ROLE'][0] == 'lessor'))
				{
				
					$q = 'SELECT APPLICATION_TABLE_V."CAR_BRAND", APPLICATION_TABLE_V."CAR_MODEL",  APPLICATION_TABLE_V."PRICE_PER_DAY", APPLICATION_TABLE_V."APPLICATION_STATUS", APPLICATION_TABLE_V."APPLICATION_ID"
						FROM "USER" JOIN APPLICATION_TABLE_V
						ON APPLICATION_TABLE_V."EMAIL" = "USER"."EMAIL"  and APPLICATION_TABLE_V."ROLE" = "USER"."ROLE" 
						WHERE  "USER".LOGIN = :login';
					$st = oci_parse($conn, $q);
					
					oci_bind_by_name($st, ":login", $id);
					$row = oci_execute($st);
					
					$nrow = oci_fetch_all($st, $res);
					//echo '<h3>',$res['MEETING POINT'][$i], '</h3>';
					$str_res = '';
					if($nrow>0)
					{	for ($i = 0; $i < $nrow; $i++) 
						{
								$get_path = oci_parse($conn, 'SELECT PHOTO FROM PHOTO_V WHERE "APPLICATION_ID" = :id');
									oci_bind_by_name($get_path, ":id", $res['APPLICATION_ID'][$i]);
									oci_execute($get_path);
									$nph = oci_fetch_all($get_path, $res_id);
									if ($nph != 0 )
									{
										$path_to_ph = str_replace("C:/apache/rentcar1.ua/www", "", trim($res_id['PHOTO'][0]));
									}
									else
									{
										$path_to_ph = '/img/uploads/NO_PHOTO.jpg';
									}
							
								$str_res.= '<div class="col-sm-4 sm-margin-b-50">
									<div class="margin-b-20">
										<img class="img-responsive wow fadeIn" src="'.$path_to_ph.'" alt="Car_photo" data-wow-duration=".3" data-wow-delay=".1s" width ="400" height="300">
									</div>
									<h4><a href="#">'.$res['CAR_BRAND'][$i].' '.$res['CAR_MODEL'][$i]. '</a> <span class="text-uppercase margin-l-20"> price '.$res['PRICE_PER_DAY'][$i].' UAN/DAY'.'</span></h4>
									<p> APPLICATION_STATUS  ->  '.$res['APPLICATION_STATUS'][$i].'</p>
									<form action="one_car.html" method="get"><input type="hidden" name = "app_id" value="'.$res['APPLICATION_ID'][$i].'" ><button type="submit"><h5>Read More</h5></button> </form>
									<form action="change.html" method="get">
										
										
										<input type="hidden" name="app_id" value="'.$res['APPLICATION_ID'][$i].'"/>
										<button type="submit"><h5>CHANGE DATA</h5></button> 
									</form>
								</div>';
							
						}
						
					}
					echo $start_str.$str_res.$end_str;
				}
				
			
			else
			{
				$start_str = '<div class="row text-center margin-b-40">
									<div class="col-sm-6 col-sm-offset-3">
										<h2>NEW APPLICATION</h2>
										<p>Here you can see new items from users</p>
										
									</div>
								</div>
								<!--// end row -->

					<div class="row">';
				$end_str = '</div>';
				// ADMIN Properties
				$qq = 'SELECT APPLICATION_TABLE_V."CAR_BRAND", APPLICATION_TABLE_V."CAR_MODEL",  APPLICATION_TABLE_V."PRICE_PER_DAY", APPLICATION_TABLE_V."LAST_TECHNICAL_INSPECTION", APPLICATION_TABLE_V."CAR_YEAR", APPLICATION_TABLE_V."APPLICATION_ID"
						FROM APPLICATION_TABLE_V
						WHERE APPLICATION_TABLE_V."APPLICATION_STATUS" = 1';
				$new_ap = oci_parse($conn, $qq);
				oci_execute($new_ap);
				$nrow = oci_fetch_all($new_ap, $res);
				$str_res = '';
					if($nrow>0)
					{	for ($i = 0; $i < $nrow; $i++) 
						{
								$get_path = oci_parse($conn, 'SELECT PHOTO FROM PHOTO_V WHERE "APPLICATION_ID" = :id');
									oci_bind_by_name($get_path, ":id", $res['APPLICATION_ID'][$i]);
									oci_execute($get_path);
									$nph = oci_fetch_all($get_path, $res_id);
									if ($nph != 0 )
									{
										$path_to_ph = str_replace("C:/apache/rentcar1.ua/www", "", trim($res_id['PHOTO'][0]));
									}
									else
									{
										$path_to_ph = '/img/uploads/NO_PHOTO.jpg';
									}
							
							
								$str_res.= '<div class="col-sm-4 sm-margin-b-50">
										<div class="margin-b-20">
											<img class="img-responsive wow fadeIn" src="'.$path_to_ph.'" alt="Car_photo" data-wow-duration=".3" data-wow-delay=".1s" width ="400" height="300">
										</div>
										<h4><a href="#">'.$res['CAR_BRAND'][$i].' '.$res['CAR_MODEL'][$i]. '</a> <span class="text-uppercase margin-l-20"> price '.$res['PRICE_PER_DAY'][$i].' UAN/DAY'.'</span></h4>
										
										<p> Car year                  ->  '.$res['CAR_YEAR'][$i].'</p>
										<p> Last technical inspection -   '.$res['LAST_TECHNICAL_INSPECTION'][$i].'></p>
										<p> Last technical inspection date ->  '.$res['LAST_TECHNICAL_INSPECTION'][$i].'</p>
										
										<form action="one_car.html" method="get"><input type="hidden" name = "app_id" value="'.$res['APPLICATION_ID'][$i].'" ><button type="submit"><h5>Read More</h5></button> </form>
										<form action="admin_del.php" method="post">
										
											<input type="hidden" name="app_id" value="'.$res['APPLICATION_ID'][$i].'"/>
											<button type="submit"><h5>DELETE APPLICATION</h5></button> 
											</form>
											<form action="admin_accept.php" method="post">
										
											<input type="hidden" name="app_id" value="'.$res['APPLICATION_ID'][$i].'"/>
											<button type="submit"><h5>ACCEPT APPLICATION</h5></button> 
											</form>
										</div>
									';
							
						}
						
					}
					echo $start_str.$str_res.$end_str;
				
				
				
				
			}
		}
	
	}

?>
