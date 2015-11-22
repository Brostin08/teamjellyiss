
        <footer>
        </footer>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/Materialize/dist/js/materialize.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/Materialize/dist/js/countUp.js"></script>
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script src ="<?php echo base_url()?>bower_components/gmaps/gmaps.js"></script>
        <script src="<?php echo base_url()?>assets/chartist.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url()?>bower_components/smooth-scroll/src/jquery.smooth-scroll.js"></script>

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
                            echo'    title: \''.$d->project_name.'\',';
                            echo'    infoWindow: {';
                            echo'      content: \' <ul> <li> <h6><strong>Name:</strong> '.$d->project_name.'</h6> </li><li> <h6><strong>Status:</strong> '.$d->status_percent.'%'.'</h6> </li><li><strong>Contractor:</strong> '.$d->project_contractor.'</li><li><strong>Cost:</strong> '.$d->project_cost_000.'</li><li><strong>Date Started:</strong> '.$d->date_start.'</li><li><strong>Target Completion:</strong> '.$d->date_complete_orig.'</li><li><strong>Completion Date:</strong> '.$d->date_complete_actual.'</li><li><strong><i class="fa fa-thumbs-up"></i>: </strong> '.$d->like_count.'</li><li><strong><i class="fa fa-thumbs-down"></i>: </strong> '.$d->dislike_count.'</li></ul> <hr> <form accept-charset="utf-8" action="http://localhost/hackercup/Home/send_action" class="form-horizontal" method="post"> <input name="project_id" type="hidden" value="'.$d->project_id.'"> <input class="btn green" name="submit" type="submit" value="like"> <input class="btn red" name="submit" type="submit" value="dislike"> </form>\',';
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
            $(document).ready(function(){
                var table = $('#myTable').DataTable({

                     "lengthChange": false,
                     "pageLength": 5
                });


            });
        </script>

        <script>
            $(document).ready(function(){
                new Morris.Bar({
                  // ID of the element in which to draw the chart.
                  element: 'myfirstchart',
                  // Chart data records -- each entry in this array corresponds to a point on
                  // the chart.
                data: [
                    { y: '2014', a: 2, b: 1 },
                    { y: 'Jan 2015', a: 3,  b: 4 },
                    { y: 'Feb 2015', a: 2,  b: 5 },
                    { y: 'Mar 2015', a: 2,  b: 4 },
                    { y: 'Apr 2015', a: 4,  b: 3 },
                    { y: 'May 2015', a: 5,  b: 2 },
                    { y: 'Jun 2015', a: 2,  b: 1 },
                    { y: 'Jul 2015', a: 2,  b: 2 },
                    { y: 'Aug 2015', a: 1,  b: 4 },
                    { y: 'Sep 2015', a: 1,  b: 1 },
                    { y: 'Oct 2015', a: 1,  b: 1 },
                    { y: 'Nov 2015', a: 1,  b: 2 },
                    { y: 'Dec 2015', a: 3,  b: 3 }
                  ],
                  xkey: 'y',
                  ykeys: ['a', 'b'],
                  labels: ['Overdue Projects', 'On-time Projects']
                });
            });
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
                var demo1 = new CountUp("numberprojects", 3242, <?php echo $data['num_rows']?>, 0, 4, options1);
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
                var demo2 = new CountUp("numcomplete", 2142, <?php echo $num_complete?>, 0, 7, options2);
                demo2.start();

                $('#numcompleteword').text(' Projects completed');

            var options3 = {
                  useEasing : true,
                  useGrouping : true,
                  separator : ',',
                  decimal : '.',
                  prefix : '',
                  suffix : ''
                };
                var demo3 = new CountUp("numincomplete", 4322, <?php echo $num_incomplete?>, 0, 6, options3);
                demo3.start();

                $('#numincompleteword').text(' Projects incomplete');


        })
        </script>

        <script>
            $(document).ready(function(){
                $('li a').smoothScroll();
            });
        </script>





    <body>
</html>