<!DOCTYPE html>
<html>
<?php 
session_start();
require 'connection.php';
$conn = Connect();
?>
<head>
<link rel="shortcut icon" type="image/png" href="assets/img/P.png.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/w3css/w3.css">
<link rel="stylesheet" type="text/css" href="assets/css/customerlogin.css">
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="assets/css/clientpage.css" />
<link rel="stylesheet" type="text/css" media="screen" href="assets/css/bookingconfirm.css" />
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="color: black">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                    </button>
                <a class="navbar-brand page-scroll" href="index.php">
                   Yacht Rental System </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->

            <?php
                if(isset($_SESSION['login_client'])){
            ?> 
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $_SESSION['login_client']; ?></a>
                    </li>
                    <li>
                    <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Control Panel <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="enteryacht.php">Add Yacht</a></li>
              <li> <a href="enterdriver.php"> Add Driver</a></li>
              <li> <a href="clientview.php">View</a></li>

            </ul>
            </li>
          </ul>
                    </li>
                    <li>
                        <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>
            
            <?php
                }
                else if (isset($_SESSION['login_customer'])){
            ?>
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $_SESSION['login_customer']; ?></a>
                    </li>
                    <ul class="nav navbar-nav">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Marina <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="prereturnyacht.php">Return Now</a></li>
              <li> <a href="mybookings.php"> My Bookings</a></li>
            </ul>
            </li>
          </ul>
                    <li>
                        <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>

            <?php
            }
                else {
            ?>

            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="clientlogin.php">Employee</a>
                    </li>
                    <li>
                        <a href="customerlogin.php">Customer</a>
                    </li>
                    <li>
                        <a href="#"> FAQ </a>
                    </li>
                </ul>
            </div>
                <?php   }
                ?>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<body>

<?php 
$id = $_GET["id"];
$hour = NULL;
$hour_or_days = $conn->real_escape_string($_POST['hour_or_days']);
$fare = $conn->real_escape_string($_POST['hid_fare']);
$total_amount = $hour_or_days * $fare;
$yacht_return_date = date('Y-m-d');
$return_status = "R";
$login_customer = $_SESSION['login_customer'];

$sql0 = "SELECT ry.id, ry.rent_end_date, ry.charge_type, ry.rent_start_date, y.yacht_name, y.yachttype_id FROM rentedyachts ry, yachts y WHERE id = '$id' AND y.yacht_id = ry.yacht_id";
$result0 = $conn->query($sql0);

if(mysqli_num_rows($result0) > 0) {
    while($row0 = mysqli_fetch_assoc($result0)){
            $rent_end_date = $row0["rent_end_date"];  
            $rent_start_date = $row0["rent_start_date"];
            $yacht_name = $row0["yacht_name"];
            $yachttype_id = $row0["yachttype_id"];
            $charge_type = $row0["charge_type"];
    }
}

function dateDiff($start, $end) {
    $start_ts = strtotime($start);
    $end_ts = strtotime($end);
    $diff = $end_ts - $start_ts;
    return round($diff / 86400);
}

$extra_days = dateDiff("$rent_end_date", "$yacht_return_date");
$total_fine = $extra_days*200;

$duration = dateDiff("$rent_start_date","$rent_end_date");

if($extra_days>0) {
    $total_amount = $total_amount + $total_fine;  
}

if($charge_type == "day"){
    $no_of_days = $hour_or_days;
    $sql1 = "UPDATE rentedyachts SET yacht_return_date='$yacht_return_date', total_amount='$total_amount', return_status='$return_status' WHERE id = '$id' ";
} else {
    $hour = $hour_or_days;
    $sql1 = "UPDATE rentedyachts SET yacht_return_date='$yacht_return_date', total_amount='$total_amount', return_status='$return_status' WHERE id = '$id' ";
}

$result1 = $conn->query($sql1);

if ($result1){
     $sql2 = "UPDATE yachts y, driver d, rentedyachts ry SET y.yacht_availability='yes', d.driver_availability='yes' 
     WHERE ry.yacht_id=y.yacht_id AND ry.driver_id=d.driver_id AND ry.customer_username = '$login_customer' AND ry.id = '$id'";
     $result2 = $conn->query($sql2);
}
else {
    echo $conn->error;
}
?>

    <div class="container">
        <div class="jumbotron">
            <h1 class="text-center" style="color: green;"><span class="glyphicon glyphicon-ok-circle"></span> Yacht Returned</h1>
        </div>
    </div>
    <br>

    <h2 class="text-center"> Thank you for visiting Yacht Rental System! We wish you have a happy experience. </h2>

    <h3 class="text-center"> <strong>Your Order Number:</strong> <span style="color: blue;"><?php echo "$id"; ?></span> </h3>


    <div class="container">
        <h5 class="text-center">Please read the following information about your order.</h5>
        <div class="box">
            <div class="col-md-10" style="float: none; margin: 0 auto; text-align: center;">
                <h3 style="color: orange;">Your booking has been received and placed into out order processing system.</h3>
                <br>
                <h4>Please make a note of your <strong>order number</strong> now and keep in the event you need to communicate with us about your order.</h4>
                <br>
                <h3 style="color: orange;">Invoice</h3>
                <br>
            </div>
            <div class="col-md-10" style="float: none; margin: 0 auto; ">
                <h4> <strong>Yacht Name: </strong> <?php echo $yacht_name;?></h4>
                <br>
                <h4> <strong>Yacht Number:</strong> <?php echo $yachttype_id; ?></h4>
                <br>
                <h4> <strong>Fare:&nbsp;</strong><?php 
            if($charge_type == "day"){
                    echo ($fare . "M/day");
                } else {
                    echo ($fare . "M/hour");
                }
            ?></h4>
                <br>
                <h4> <strong>Booking Date: </strong> <?php echo date("Y-m-d"); ?> </h4>
                <br>
                <h4> <strong>Start Date: </strong> <?php echo $rent_start_date; ?></h4>
                <br>
                <h4> <strong>Rent End Date: </strong> <?php echo $rent_end_date; ?></h4>
                <br>
                <h4> <strong>Yacht Return Date: </strong> <?php echo $yacht_return_date; ?> </h4>
                <br>
                <?php if($charge_type == "days"){?>
                    <h4> <strong>Number of days:</strong> <?php echo $hour_or_days; ?>day(s)</h4>
                <?php } else { ?>
                    <h4> <strong>hour Travelled:</strong> <?php echo $hour_or_days; ?>hour(s)</h4>
                <?php } ?>
                <br>
                <?php
                    if($extra_days > 0){
                        
                ?>
                <h4> <strong>Total Fine:</strong> <label class="text-danger"><?php echo $total_fine; ?>/- </label> for <?php echo $extra_days;?> extra days.</h4>
                <br>
                <?php } ?>
                <h4> <strong>Total Amount: </strong> <?php echo $total_amount; ?>M   </h4>
                <br>
            </div>
        </div>
        <div class="col-md-12" style="float: none; margin: 0 auto; text-align: center;">
            <h6>Warning! <strong>Do not reload this page</strong> or the above display will be lost. If you want a hardcopy of this page, please print it now.</h6>
        </div>
    </div>

</body>
<footer class="site-footer">
        <div class="container">
            <hr>
            <div class="row">
                <div class="col-sm-6">
                    <h5>Nguyen Nhat Huy</h5>
                </div>
            </div>
        </div>
    </footer>
</html>