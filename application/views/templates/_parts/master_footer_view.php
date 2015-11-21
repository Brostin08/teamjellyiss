
        <footer>
        </footer>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/Materialize/dist/js/materialize.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/Materialize/dist/js/countUp.js"></script>
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script src = "<?php echo base_url()?>bower_components/gmaps/gmaps.js"></script>


    <!--datatables-->
    
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>

        
        <script>
            $(document).ready(function(){


                var map = new GMaps({
                    div: '#map',
                    lat: 14.5824,
                    lng: 120.9783,
                    width: "100%",
                    height: "500px",
                    zoom: 14
                });


                <?php
                    if($data)
                    {
                        foreach($data['result'] as $d)
                        {

                            echo'map.addMarker({';
                            echo'    lat: '.$d->latitude.',';
                            echo'    lng: '.$d->longitude.',';
                            echo'    title: \'Lima\',';
                            echo'    infoWindow: {';
                            echo'      content: \' <ul> <li>Name: '.$d->project_name.'</li><li>Status: '.$d->status_percent.'%'.'</li><li>Contractor: '.$d->project_contractor.'</li><li>Cost: '.$d->project_cost_000.'</li><li>Date Started : '.$d->date_start.'</li><li>Target Completion: '.$d->date_complete_orig.'</li><li>Completion Date: '.$d->date_complete_actual.'</li></ul>\',';
                            echo'    }
                            });';

                        }
                    }
                ?>


                GMaps.geolocate({
                    success: function(position) {
                        map.setCenter(position.coords.latitude, position.coords.longitude);
                    },
                    error: function(error) {
                        alert('Geolocation failed: '+error.message);
                    },
                    not_supported: function() {
                        alert("Your browser does not support geolocation");
                    },
                    always: function(){
                        //alert('pakyu');
                    }

                });

            });
        </script>
                  

        <script type="text/javascript">
        $(document).ready(function() {
            $('#datatable').DataTable();


        } );
        </script>

        <script>
        $(window).on('load', function () {
            var options1 = {
                  useEasing : true,
                  useGrouping : true,
                  separator : ',',
                  decimal : '.',
                  prefix : '',
                  suffix : ''
                };
                var demo1 = new CountUp("numberprojects", 2142, <?php echo $data['num_rows']?>, 0, 4, options1);
                demo1.start();

                $('#numberprojectsword').text(' Projects');

            var options2 = {
                  useEasing : true,
                  useGrouping : true,
                  separator : ',',
                  decimal : '.',
                  prefix : '',
                  suffix : ''
                };
                var demo2 = new CountUp("numcomplete", 2142, <?php echo $num_complete?>, 0, 4, options2);
                demo2.start();

                $('#numcompleteword').text(' Projects Completed');

            var options3 = {
                  useEasing : true,
                  useGrouping : true,
                  separator : ',',
                  decimal : '.',
                  prefix : '',
                  suffix : ''
                };
                var demo3 = new CountUp("numincomplete", 2142, <?php echo $num_incomplete?>, 0, 4, options3);
                demo3.start();

                $('#numincompleteword').text(' Projects Completed');


        })
        </script>




    <body>
</html>