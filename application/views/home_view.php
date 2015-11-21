<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="content-wrapper">
        <div class="container">
        		<table class="table table-striped datatables">
				    <thead>
				      <tr>
				        <th>ID</th>
				        <th>Project Name</th>
				        <th>Location</th>
				        <th>Status</th>
				      </tr>
				    </thead>

				    <tbody>
				    <?php
				    if($data)
				    {	
				  

					    foreach($data as $d)
					    {

					      echo '<tr>';
					        echo '<td>'.$d->project_id.'</td>';
					        echo '<td>'.$d->project_name.'</td>';
					        echo '<td>'.$d->project_location.'</td>';
					        echo '<td>'.$d->status_percent.'% nigga'.'</td>';
					      echo '</tr>';

					    }
				    }
				      ?>
				    </tbody>

				  </table>
		</div>
</div>
    <!-- CONTENT-WRAPPER SECTION END-->


<script type="text/javascript">
$(document).ready(function() {
    wwTable = $('.datatables').DataTable();
} );
</script>