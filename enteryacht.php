<!DOCTYPE html>
<html>

<?php 
include('session_client.php'); ?> 
<head>
<link rel="shortcut icon" type="image/png" href="assets/img/P.png.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/customerlogin.css">
    <link rel="stylesheet" href="assets/w3css/w3.css">
  <script type="text/javascript" src="assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="assets/css/clientpage.css" />
</head>
<body>

    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="color: black">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                    </button>
                <a class="navbar-brand page-scroll" href="index.php">
                   Yacht Rental System </a>
            </div>

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
                    <li>
                        <a href="#">History</a>
                    </li>
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
        </div>
    </nav>

    <div class="container" style="margin-top: 65px;" >
    <div class="col-md-7" style="float: none; margin: 0 auto;">
      <div class="form-area">
        <form role="form" action="enteryacht1.php" enctype="multipart/form-data" method="POST">
        <br style="clear: both">
          <h3 style="margin-bottom: 25px; text-align: center; font-size: 30px;"> Please Provide Your Yacht Details. </h3>

          <div class="form-group">
            <input type="text" class="form-control" id="yacht_name" name="yacht_name" placeholder="Yacht Name " required autofocus="">
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="yachttype_id" name="yachttype_id" placeholder="Yacht Number ID" required>
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="price_per_day" name="price_per_day" placeholder="Price per day (M)" required>
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="price_per_hour" name="price_per_hour" placeholder="Price per hour (M)" required>
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="engine_type" name="engine_type" placeholder="Engine Type" required>
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="max_passengers" name="max_passengers" placeholder="Max Passengers" required>
          </div>

          <div class="form-group">
            <input name="uploadedimage" type="file">
          </div>
           <button type="submit" id="submit" name="submit" class="btn btn-success pull-right"> Submit for Rental</button>    
        </form>
      </div>
    </div>


        <div class="col-md-12" style="float: none; margin: 0 auto;">
    <div class="form-area" style="padding: 0px 100px 100px 100px;">
        <form action="" method="POST">
        <br style="clear: both">
          <h3 style="margin-bottom: 25px; text-align: center; font-size: 30px;"> My Yachts </h3>
<?php
// Storing Session
$user_check=$_SESSION['login_client'];
$sql = "SELECT * FROM yachts WHERE yacht_id IN (SELECT yacht_id FROM clientyachts WHERE client_username='$user_check');";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  ?>
<div style="overflow-x:auto;">
  <table class="table table-striped">
    <thead class="thead-dark">
      <tr>
        <th></th>
        <th width="24%"> Yacht Name</th>
        <th width="12%"> Yacht Type Id </th>
        <th width="13%"> Price per day (M)</th>
        <th width="17%"> Price per hour (M)</th>
        <th width="13%"> Engine Type</th>
        <th width="17%"> Max Passengers</th>
        <th width="1%"> Availability </th>
      </tr>
    </thead>

    <?PHP
      while($row = mysqli_fetch_assoc($result)){
    ?>

    <tbody>
      <tr>
        <td> <span class="glyphicon glyphicon-menu-right"></span> </td>
        <td><?php echo $row["yacht_name"]; ?></td>
        <td><?php echo $row["yachttype_id"]; ?></td>
        <td><?php echo $row["price_per_day"]; ?></td>
        <td><?php echo $row["price_per_hour"]; ?></td>
        <td><?php echo $row["engine_type"]; ?></td>
        <td><?php echo $row["max_passengers"]; ?></td>
        <td><?php echo $row["yacht_availability"]; ?></td>
        
      </tr>
    </tbody>
    <?php } ?>
  </table>
  </div>

    <br>
  <?php } else { ?>
  <h4><center>0 Yachts available</center> </h4>
  <?php } ?>
        </form>
</div>        
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