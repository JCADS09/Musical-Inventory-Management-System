<?php
  ob_start();
  require_once('includes/load.php');
  if($session->isUserLoggedIn(true)) { redirect('home.php', false);}
?>

<!--
<div class="login-page">
    <div class="text-center">
       <h1>Login Panel</h1>
       <h4>Inventory Management System</h4>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="auth.php" class="clearfix">
        <div class="form-group">
              <label for="username" class="control-label">Username</label>
              <input type="name" class="form-control" name="username" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="Password" class="control-label">Password</label>
            <input type="password" name= "password" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
                <button type="submit" class="btn btn-danger" style="border-radius:0%">Login</button>
        </div>
    </form>
</div>

-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="libs/css/index.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <title>Login Page</title>
</head>

<body>

<div class="login">
  <div class="form">
    <h1> Musical Inventory Management System</h1><br><br>

                <?php echo display_msg($msg); ?>
            <form class="login-form" method="post" action="auth.php">
                    <input type="text" name="email" placeholder="Email:"> <br><br>
               
                    <input type="password" name= "password" placeholder="Password:" required />
      <br><br>
                <!-- <a class="nav-link" href="register.php">Register</a> -->
                <br>
                <button class="submit"> L O G I N</button>
            </form> 
  </div>
</div>




<script>
    function changeClass(e){
  e.classList.toggle('off')
  e.classList.toggle('on')
}
document.querySelectorAll('span').forEach(span => span.addEventListener('click', function(){
  changeClass(this);
}))
</script>


</body>
</html>


<!--
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="libs/css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <title>Login landing page</title>
</head>
<body>
    <section class="side">
        <img src="libs/css/img.svg" alt="">
    </section>

    <section class="main">
        <div class="login-container">
            <p class="title">Welcome ADMIN</p>
            <div class="separator"></div>
            <p class="welcome-message">Please, provide login credential to proceed and have access to our system.</p>

            <?php echo display_msg($msg); ?>
            <form class="login-form" method="post" action="auth.php">
                <div class="form-control">
                    <input type="text" name="username" placeholder="Username">
                    <i class="fas fa-user"></i>
                </div>
                <div class="form-control">
                    <input type="password" name= "password" placeholder="Password">
                    <i class="fas fa-lock"></i>
                </div>

                <button class="submit">Login</button>
            </form>
        </div>
    </section>
    
</body>
</html> -->

<?php include_once('layouts/footer.php'); ?>
