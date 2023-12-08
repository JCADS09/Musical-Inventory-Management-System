<?php include_once('includes/load.php'); ?>
<?php
$req_fields = array('email','password' );
validate_fields($req_fields);
$email = remove_junk($_POST['email']);
$password = remove_junk($_POST['password']);

if(empty($errors)){
  $user_id = authenticate($email, $password);
  if($user_id){
    //create session with id
     $session->login($user_id);
    //Update Sign in time
     updateLastLogIn($user_id);
     $session->msg("s", "Welcome to Sales Management System");
     redirect('admin.php',false);

  } else {
    $session->msg("d", "Sorry Username/Password incorrect.");
    redirect('index.php',false);
  }

} else {
   $session->msg("d", $errors);
   redirect('index.php',false);
}

?>
