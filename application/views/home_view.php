<?php defined('BASEPATH') OR exit('No direct script access allowed');?>

			<div class = "navbar-fixed">
				<nav>
					<div class="nav-wrapper grey darken-4">
						<a href = "index.html" class = "left" style = "padding-left:50px; font-weight: 600;">SPIRALPROJECTS</a>
					</div>
				</nav>
			</div>
		
			<div class = "row" style="height:500px;">
				<div id = "map"></div>	
			</div>



			<div class="row">
					<div class="col s2">
						<div class="container">
							<h3><span class="blue-text text-darken-2" id="numberprojects"></span></h3><span class="blue-text text-darken-2" id="numberprojectsword" ></span>
						</div>
					</div>
					<div class="col s2">
						<div class="container">
							<h3><span class="blue-text text-darken-2" id="numcomplete"></span></h3><span class="blue-text text-darken-2" id="numcompleteword" ></span>
						</div>
					</div>
					<div class="col s2">
						<div class="container">
							<h3><span class="blue-text text-darken-2" id="numincomplete"></span></h3><span class="blue-text text-darken-2" id="numincompleteword" ></span>
						</div>
					</div>
			</div>
		    <div class="row">
		      <div class="col s12 m6">
		        <div class="card-panel">
		          	<table id="datatable" class="table table-striped">
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


<!--SCRIPTS-->


