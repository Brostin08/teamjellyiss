<?php defined('BASEPATH') OR exit('No direct script access allowed');?>



		<div class = "navbar-fixed" style="">
			<nav>
				<div class="nav-wrapper grey darken-4">
					<a href = "<?php echo base_url()?>Home" class = "left hide-on-med-and-down" style = "padding-left:50px; font-weight: 600;"><i class = "fa fa-spinner fa-spin" style = "display: inline-block; font-size:18px;padding-right:2px;"></i> SPIRALPROJECTS</a>
					<ul id="nav-mobile" class="right hide-on-med-and-down fonts">
						<li><a href="#map">MAP</a></li>
						<li><a href="#count">COUNT</a></li>
						<li><a href="#report">REPORTS</a></li>
						<li><a href="#data">DATA</a></li>
						<li><a href="#about">ABOUT US</a></li>
					</ul>
					<ul id="nav-mobile" class="center hide-on-large-only">
						<li><a href = "<?php echo base_url()?>Home" class = "center-align" style = "font-weight: 600;"><i class = "fa fa-spinner fa-spin" style = "display: inline-block; font-size:18px;padding-right:2px;"></i> SPIRALPROJECTS</a></li>
					</ul>

				</div>
			</nav>
		</div>

		
		<div class = "row" style="margin-bottom: 0px;" id = "map">
			<div id = "map"></div>	
		</div>

		<div class="page-header" id = "count" style="background: url(<?php echo base_url()?>/assets/images/page-header.jpg) no-repeat center center fixed;">
			<div class = "container">
				<div class="row">
					<div class="col s4" style="margin-top: 30px;">
						<div class="card-panel blur">
							<h2 class = "center"><span class="blue-text text-darken-2" id="numberprojects"></span></h2>
							<h6 class = "center"><span class="blue-text text-darken-2" id="numberprojectsword" ></span></h6>
						</div>
					</div>
					<div class="col s4" style="margin-top: 30px;">
						<div class="card-panel blur">
							<h2 class = "center"><span class="green-text lighten-1" id="numcomplete"></span></h2>
							<h6 class = "center"><span class="green-text lighten-1" id="numcompleteword" ></span></h6>
						</div>
					</div>
					<div class="col s4" style="margin-top: 30px;">
						<div class="card-panel blur">
							<h2 class = "center"><span class="red-text accent-4" id="numincomplete"></span></h2>
							<h6 class = "center"><span class="red-text accent-4" id="numincompleteword" ></span></h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<div class="container">
			<div class="row" id = "report">
		   		<div class="col s12">
		   			<div id="myfirstchart" style="height: 250px;"></div>
		   		</div>
		   	</div>
		   	<div class="row" id = "data">
		      	<div class="col s12">
		       		<div class="card-panel">
		       			
				          	<table id="myTable" class="table table-striped">
							    <thead>
							      <tr>
							        <th>Project Name</th>
							        <th>Location</th>
							        <th>Status</th>
							      </tr>
							    </thead>

							    <tbody>
							    <?php
								    if($data)
								    {	
								  

									    foreach($data['result'] as $d)
									    {

									      echo '<tr>';
									        echo '<td>'.$d->project_name.'</td>';
									        echo '<td>'.$d->project_location.'</td>';
									        echo '<td>'.$d->status_percent.'%'.'</td>';
									      echo '</tr>';

									    }
								    }
							    ?>
							    </tbody>
							</table>
						
					</div>
				</div>
			</div>
		</div>

		<div class="page-header" style="background: url(<?php echo base_url()?>/assets/images/foorter-header.jpg) no-repeat center center fixed;">
			<div class="container">
				<h3 class="white-text" id="about">About Us</h3>
				<p class="white-text">Ikaw na ang icing sa ibabaw ng buttercup ko!</p>
			</div>
		</div>

	
		<footer class="page-footer grey darken-4">
			<div class="footer-copyright">
				<div class="container center">
					© 2015 Copyright Jellly ISS #hackmybuttercup
				</div>
			</div>
		</footer>




<!--SCRIPTS-->


