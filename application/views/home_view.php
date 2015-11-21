<?php defined('BASEPATH') OR exit('No direct script access allowed');?>

			<div class = "navbar-fixed">
				<nav>
					<div class="nav-wrapper grey darken-4">
						<a href = "index.html" class = "left" style = "padding-left:50px; font-weight: 600;">SPIRALPROJECTS</a>
					</div>
				</nav>
			</div>
		
			<div class = "row">
				<div id = "map"></div>	
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


