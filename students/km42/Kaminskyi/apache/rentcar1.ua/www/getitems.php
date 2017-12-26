<?php 
	
	include_once 'get_conn.php';
	$conn_at = get_conn_atr('connection.txt');
	$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
	

		$q = 'SELECT APPLICATION_TABLE_V."CAR_BRAND", APPLICATION_TABLE_V."CAR_MODEL",  APPLICATION_TABLE_V."PRICE_PER_DAY", APPLICATION_TABLE_V."STATE_NAME", APPLICATION_TABLE_V."CAR_YEAR", APPLICATION_TABLE_V."LAST_TECHNICAL_INSPECTION", APPLICATION_TABLE_V."APPLICATION_ID"
			FROM APPLICATION_TABLE_V 			
			WHERE  APPLICATION_TABLE_V."APPLICATION_STATUS" != 1';
		$st = oci_parse($conn, $q);
		
		
		$row = oci_execute($st);
		
		
		
		$nrow = oci_fetch_all($st, $res);
		
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
						<p> Car state ->  '.$res['STATE_NAME'][$i].'</p>
						
						<p> Car year ->  '.$res['CAR_YEAR'][$i].'</p>
						<p> Last technical inspection date ->  '.$res['LAST_TECHNICAL_INSPECTION'][$i].'</p>
						<!--<a class="link" href="#">Read More</a>-->
						<form action="one_car.html" method="get">
						<a href="#" onclick="parentNode.submit();">Read More</a>
							<input type="hidden" name="app_id" value="'.$res['APPLICATION_ID'][$i].'"/>
						</form>
					</div>';
				
			}
			echo $str_res;
		}
	
			
	
?>
