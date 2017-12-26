<!DOCTYPE html>

<html lang="en" class="no-js">
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8"/>
        <title>"Easy_drive"</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta content="" name="description"/>
        <meta content="" name="author"/>

        <!-- GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- PAGE LEVEL PLUGIN STYLES -->
        <link href="css/animate.css" rel="stylesheet">
        <link href="vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css"/>

        <!-- THEME STYLES -->
        <link href="css/layout.min.css" rel="stylesheet" type="text/css"/>

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico"/>

    </head>
	
    <!-- END HEAD -->

	
    <!-- BODY -->
    <body id="body" data-spy="scroll" data-target=".header">
		<?php //include '/login.php';?>
        <!--========== HEADER ==========-->
        <header class="header navbar-fixed-top">
            <!-- Navbar -->
            <nav class="navbar" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="menu-container js_nav-item">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="toggle-icon"></span>
                        </button>

                        <!-- Logo -->
                        <div class="logo">
                            <a class="logo-wrap" href="#body">
                                <img class="logo-img logo-img-main" src="img/my_logo/logo.png" alt="Asentus Logo">
                                <img class="logo-img logo-img-active" src="img/my_logo/logo-dark.png" alt="Asentus Logo">
                            </a>
                        </div>
                        <!-- End Logo -->
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse nav-collapse">
                        <div class="menu-container">
                            <ul class="nav navbar-nav navbar-nav-right">
                                <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="index.php">Home</a></li>
                                <?php include 'auth.php';?>
                                
                            </ul>
                        </div>
                    </div>
                    <!-- End Navbar Collapse -->
                </div>
            </nav>
            <!-- Navbar -->
        </header>
        <!--========== END HEADER ==========-->

        <!--========== SLIDER ==========-->
        <div class="promo-block">
            <div class="container">
                <div class="margin-b-40">
                    <h1 class="promo-block-title"> Car rent service</h1>
                    <p class="promo-block-text">You came to the right ... place</p>
                </div>
                
            </div>
        </div>
        <!--========== SLIDER ==========-->

		<div class = "search">
			<form name = "form_search" method="GET" action ="index.php">
			<select name="car_brand" size="1" >
				  <option value=""></option>
				  <option value="Volvo">Volvo</option>
				  <option value="BMW">BMW</option>
				  <option value="FIAT">FIAT</option>
				  <option value="AUDI">AUDI</option>
				  <option value='TOYOTA'>TOYOTA</option> 
				  <option value="SUBARU">SUBARU</option> 	
				  <option value="MERCEDES">MERCEDES</option> 				  
			</select>
			<input type="date" name="car_year_start">
			<input type="date" name="car_year_end">
			
			<input type="number" name="scale_state_start" min="1" max="10" value= '1'>
			<input type="number" name="scale_state_end" min="1" max="10" value= '10'>
			<input type="date" name="start_date">
			<input type="date" name="finish_date">
			<input type="text" id="price_start" name="price_per_day_start" placeholder = "50 UAN/DAY" value= '0'>
			<input type="text" id="price_end" name="price_per_day_end" placeholder = "30000 UAN/DAY" value= '300000'>
			<button type="submit" name="search" value= 'T'><i > Search</i></button>
			
			</form>
			
			
		</div>
        <!--========== PAGE LAYOUT ==========-->
        <!-- Products -->
        <div id="products">
            <div class="container content-lg">
                <div class="row text-center margin-b-40">
                    <div class="col-sm-6 col-sm-offset-3">
                        <h2>Available cars</h2>
                    </div>
                </div>
                <!--// end row -->

                <div class="row">
                    <!-- Latest Products -->
                    <?php 
					
					if (!isset($_GET['start_date']) and !isset($_GET['finish_date']) and !isset($_GET['price_per_day_start']) and !isset($_GET['price_per_day_end']) and !isset($_GET['scale_state_end']) and !isset($_GET['scale_state_start']) and !isset($_GET['car_year_start']) and !isset($_GET['car_year_end']) and !isset($_GET['car_brand']) )
					{
						include_once 'getitems.php';
					} 
					else
					{
						include_once 'get_conn.php';
						$conn_at = get_conn_atr('connection.txt');
						$conn = oci_pconnect($conn_at[0], $conn_at[1], $conn_at[2]);
						$str_s = '';
						
						if (isset($_GET['price_per_day_start']))
						{
							//$str_s.= 'and ( APPLICATION_TABLE_V."PRICE_PER_DAY" >= :price_per_day_start )';
							$price_per_day_start = trim($_GET['price_per_day_start']);
						}
						else
						{
							$price_per_day_start = 0;
						}
						
						if (isset($_GET['price_per_day_end']))
						{
							//$str_s.= 'and ( APPLICATION_TABLE_V."PRICE_PER_DAY" <= :price_per_day_end )';
							$price_per_day_end = trim($_GET['price_per_day_end']);
							
						}
						else
						{
							$price_per_day_end = 300000;
						}
						if (isset($_GET['scale_state_end']))
						{
							//$str_s.= 'and ("STATE"."SCALE" <= :scale_state_end )';
							$scale_state_end = trim($_GET['scale_state_end']);
						}
						else
						{
							$scale_state_end = 10;
						}
						
						if (isset($_GET['scale_state_start']))
						{
							//$str_s.= 'and ("STATE"."SCALE" >= :scale_state_start)';
							$scale_state_start = trim($_GET['scale_state_start']);
						}
						else
						{
							$scale_state_start = 1;
						}
						
						if (isset($_GET['car_year_start']) and trim(date_format(date_create($_GET['car_year_start']),"d-M-Y ")) != trim(date("d-M-Y")))
						{
							//$str_s.= 'and (APPLICATION_TABLE_V."CAR_YEAR"  >= :car_year_start)';
							$car_year_start = date_format(date_create($_GET['car_year_start']),"d-M-Y ");
							
						}
						else
						{
							$car_year_start = date_format(date_create('01-01-1960'),"d-M-Y ");
						}
						
						if (isset($_GET['car_year_end']))
						{
							//$str_s.= 'and ( APPLICATION_TABLE_V."CAR_YEAR" <= :car_year_end)';
							$car_year_end = date_format(date_create($_GET['car_year_end']),"d-M-Y ");
							
						}
						else
						{
							$car_year_end = date_format(date_create(date("d-M-Y"),"d-M-Y "));
						}
						
						if (isset($_GET['car_brand']) and $_GET['car_brand'] != '')
						{
							$str_s.= 'WHERE (UPPER(car_brand_c) LIKE UPPER(:car_brand))';
							$car_brand = trim($_GET['car_brand']);
						}
						else
						{
							$car_brand = '';
						}
		
			
							$filter = 'SELECT car_brand_c, car_model_c, pr_per_daty_c, st_name_c, car_year_c,last_t_i_c, app_id_c, scale_c  FROM TABLE(FILTER_INFO_f(:start_t, :finish_t, :price_per_day_start, :price_per_day_end, :scale_state_start, :scale_state_end, :car_year_start, :car_year_end))'.$str_s;
								
							 
							$req_with_filter = oci_parse($conn, $filter);
							$start_d = date_format(date_create($_GET['start_date']),"d-M-Y ");
							$finish_d = date_format(date_create($_GET['finish_date']),"d-M-Y ");
							
							oci_bind_by_name($req_with_filter, ":start_t", $start_d );
							oci_bind_by_name($req_with_filter, ":finish_t", $finish_d);
							
							oci_bind_by_name($req_with_filter, ":price_per_day_start", $price_per_day_start );
							oci_bind_by_name($req_with_filter, ":price_per_day_end", $price_per_day_end );
							oci_bind_by_name($req_with_filter, ":scale_state_end", $scale_state_end );
							if (isset($car_brand) and $car_brand != '')
							{
								oci_bind_by_name($req_with_filter, ":car_brand", $car_brand );
							}
							oci_bind_by_name($req_with_filter, ":scale_state_start", $scale_state_start );
							
							oci_bind_by_name($req_with_filter, ":car_year_end", $car_year_end );
							oci_bind_by_name($req_with_filter, ":car_year_start", $car_year_start );
						
							
							
							
							oci_execute($req_with_filter);
							
							$nrow = oci_fetch_all($req_with_filter, $res, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_NUM);
							$str_res = '';
							if($nrow>0)
							{	for ($i = 0; $i < $nrow; $i++) 
								{
										$get_path = oci_parse($conn, ' SELECT PHOTO FROM PHOTO_V WHERE "APPLICATION_ID" = :id ');
										oci_bind_by_name($get_path, ":id", $res[$i][6]);
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
											<h4><a href="#">'.$res[$i][0].' '.$res[$i][1]. '</a> <span class="text-uppercase margin-l-20"> price '.$res[$i][2].' UAN/DAY'.'</span></h4>
											<p> Car state ->  '.$res[$i][3].'</p>
											<p> Car year ->  '.$res[$i][4].'</p>
											<p> Last technical inspection date ->  '.$res[$i][5].'</p>
											<!--<a class="link" href="#">Read More</a>-->
											<form action="one_car.html" method="GET">
											
												<input type="hidden" name="app_id" value="'.$res[$i][6].'"/>
												<button type="submit"><h5>Read More</h5></button> 
											</form>
										</div>';
									
								}
								echo $str_res;
							}
			
						
					}?>
                    <!-- End Latest Products -->

                    

                    
                </div>
                <!--// end row -->
            </div>

        </div>
        <!-- End Products -->



        

   
        <!-- End Testimonials -->
            
       
        <!--========== END PAGE LAYOUT ==========-->

        <!--========== FOOTER ==========-->
        <footer class="footer">
            <!-- Links -->
            <div class="section-seperator">
                <div class="content-md container">
                    <div class="row">
                        <div class="col-sm-2 sm-margin-b-30">
                            <!-- List -->
                            <ul class="list-unstyled footer-list">
                                <li class="footer-list-item"><a href="#">Home</a></li>
                                <li class="footer-list-item"><a href="#">About</a></li>
                                <li class="footer-list-item"><a href="#">Contact</a></li>
                            </ul>
                            <!-- End List -->
                        </div>
                        <div class="col-sm-2 sm-margin-b-30">
                            <!-- List -->
                            <ul class="list-unstyled footer-list">
                                <li class="footer-list-item"><a href="#">Facebook</a></li>
                            </ul>
                            <!-- End List -->
                        </div>
                        <div class="col-sm-3">
                            <!-- List -->
                            <ul class="list-unstyled footer-list">
                                <li class="footer-list-item"><a href="#">Privacy Policy</a></li>
                                <li class="footer-list-item"><a href="#">Terms &amp; Conditions</a></li>
                            </ul>
                            <!-- End List -->
                        </div>
                    </div>
                    <!--// end row -->
                </div>
            </div>
            <!-- End Links -->

            <!-- Copyright -->
            <div class="content container">
                <div class="row">
                    <div class="col-xs-6">
                        <img class="footer-logo" src="img/my_logo/logo-dark.png" alt="Rent_car Logo">
                    </div>
                    <div class="col-xs-6 text-right">
                        <p class="margin-b-0"><a class="fweight-700" >Car rent service</a> Nazar Kaminskyi </p>
                    </div>
                </div>
                <!--// end row -->
            </div>
            <!-- End Copyright -->
        </footer>
        <!--========== END FOOTER ==========-->

        <!-- Back To Top -->
        <a href="javascript:void(0);" class="js-back-to-top back-to-top">Top</a>

        <!-- JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
        <!-- CORE PLUGINS -->
        <script src="vendor/jquery.min.js" type="text/javascript"></script>
        <script src="vendor/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <!-- PAGE LEVEL PLUGINS -->
        <script src="vendor/jquery.easing.js" type="text/javascript"></script>
        <script src="vendor/jquery.back-to-top.js" type="text/javascript"></script>
        <script src="vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
        <script src="vendor/jquery.wow.min.js" type="text/javascript"></script>
        <script src="vendor/swiper/js/swiper.jquery.min.js" type="text/javascript"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js" type="text/javascript"></script>
        <script src="vendor/masonry/jquery.masonry.pkgd.min.js" type="text/javascript"></script>
        <script src="vendor/masonry/imagesloaded.pkgd.min.js" type="text/javascript"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsXUGTFS09pLVdsYEE9YrO2y4IAncAO2U&amp;callback=initMap" async defer></script>

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="js/layout.min.js" type="text/javascript"></script>
        <script src="js/components/wow.min.js" type="text/javascript"></script>
        <script src="js/components/swiper.min.js" type="text/javascript"></script>
        <script src="js/components/maginific-popup.min.js" type="text/javascript"></script>
        <script src="js/components/masonry.min.js" type="text/javascript"></script>
        <script src="js/components/gmap.min.js" type="text/javascript"></script>

    </body>
    <!-- END BODY -->
</html>


