
        <footer>
        </footer>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/Materialize/dist/js/materialize.min.js"></script>
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
                    zoom: 12
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
                            echo'      content: \'<button>Report</button>\'';
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




    <body>
</html>