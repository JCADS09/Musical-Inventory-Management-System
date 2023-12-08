<?php
  $page_title = 'All User';
  require_once('includes/load.php');
?>
<?php
// Checkin What level user has permission to view this page
 page_require_level(1);
//pull out all user form database
 $all_users = find_all_user();
?>

<?php
  $page_title = 'Add User';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
  $groups = find_all('user_groups');
?>

<?php
  if(isset($_POST['add_user'])){

   $req_fields = array('full-name','email','password','level');
   validate_fields($req_fields);

   if(empty($errors)){
       $name   = remove_junk($db->escape($_POST['full-name']));
       $email   = remove_junk($db->escape($_POST['email']));
       $password   = remove_junk($db->escape($_POST['password']));
       $user_level = (int)$db->escape($_POST['level']);
       $password = sha1($password);

        $checkquery = ("SELECT * FROM users where email ='$email'");
        $statement = mysqli_num_rows($db->query($checkquery));

            if($statement > 0){
                ?>
                <script>
                    alert("User with email already exist!");
                </script>
                <?php
            }

       else { 
       $query = ("INSERT INTO users (name,email, password,user_level, status,verify) 
        VALUES ('$name','$email','$password','$user_level', 1,0)");

        if($db->query($query)){         
                           
                    $otp = rand(100000,999999);
                    $_SESSION['otp'] = $otp;
                    $_SESSION['mail'] = $email;
                    require "Mail/phpmailer/PHPMailerAutoload.php";
                    $mail = new PHPMailer;
    
                    $mail->isSMTP();
                    $mail->Host='smtp.gmail.com';
                    $mail->Port=587;
                    $mail->SMTPAuth=true;
                    $mail->SMTPSecure='tls';
    
                    $mail->Username='andreikevincasoco@gmail.com';
                    $mail->Password='wjowdmsrydneyphe';
                    
                    $mail->setFrom('andreikevincasoco@gmail.com', 'OTP Verification');
                    $mail->addAddress($_POST["email"]);
    
                    $mail->isHTML(true);
                    $mail->Subject="Your verify code";
                    $mail->Body="<p>Dear user, </p> <h3>Your verify OTP code is $otp <br></h3>
                    <p>kevs404 ^_^</p>
                    ";

    
                            if(!$mail->send()){
                                ?>
                                    <script>
                                        alert("<?php echo "Register Failed, Invalid Email "?>");
                                    </script>
                                <?php
                            }else{
                                ?>
                                <script>
                                    alert("<?php echo "Register Successfully, OTP sent to " . $email ?>");
                                    window.location.replace('verification.php');
                                </script>
                                <?php
                      } }
              }   }
          }       
   
?>

<?php include_once('layouts/header.php'); ?>


<div class="row">
   <div class="col-md-12">
     <?php echo display_msg($msg); ?>
   </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-primary class">
      <div class="panel-heading clearfix">
        <strong>
          <span class="glyphicon glyphicon-th"></span>
          <span>USERS</span>
       </strong>
         <!-- <a href="add_user.php" class="btn btn-info pull-right">ADD NEW USERS</a> -->
          <button type="submit" name="add_user" class="btn btn-info pull-right btn-sm" data-toggle="modal" data-target="#exampleModal">ADD NEW USER</button>
      </div>
     <div class="panel-body">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th class="text-center" style="width: 50px;">#</th>
            <th>Full Name </th>
            <th>Email</th>
            <th class="text-center" style="width: 15%;">User Role</th>
            <th class="text-center" style="width: 10%;">Status</th>
            <th style="width: 20%;">Last Login</th>
            <th class="text-center" style="width: 100px;">Actions</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach($all_users as $a_user): ?>
          <tr>
           <td class="text-center"><?php echo count_id();?></td>
           <td><?php echo remove_junk(ucwords($a_user['name']))?></td>
           <td><?php echo remove_junk(ucwords($a_user['email']))?></td>
           <td class="text-center"><?php echo remove_junk(ucwords($a_user['group_name']))?></td>
           <td class="text-center">
           <?php if($a_user['status'] === '1'): ?>
            <span class="label label-success"><?php echo "Active"; ?></span>
          <?php else: ?>
            <span class="label label-danger"><?php echo "Deactive"; ?></span>
          <?php endif;?>
           </td>
           <td><?php echo read_date($a_user['last_login'])?></td>
           <td class="text-center">
             <div class="btn-group">
                <a href="edit_user.php?id=<?php echo (int)$a_user['id'];?>" class="btn btn-s btn-warning" data-toggle="tooltip" title="Edit">
                  <i class="glyphicon glyphicon-pencil"></i>
               </a>
                <a href="delete_user.php?id=<?php echo (int)$a_user['id'];?>" class="btn btn-s btn-danger" data-toggle="tooltip" title="Remove">
                  <i class="glyphicon glyphicon-trash"></i>
                </a>
                </div>
           </td>
          </tr>
        <?php endforeach;?>
       </tbody>
     </table>
     </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">REGISTER NEW USER</h5>
        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> -->
      </div>
      <div class="modal-body">
        <!-- start form -->
        <div class="panel-body">
          <form method="post" action="users.php">
           <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="full-name" placeholder="Full Name" required>
            </div>
            <div class="form-group">
                <label for="email">Username</label>
                <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>
           
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name ="password" id="password"  placeholder="Password" minlength="8" required>
                  <i class="bi bi-eye-slash" id="togglePassword"></i>
            </div>

             <!-- confirm password validation  
            <div class="form-group">
                <label for="password">Confirm Password</label>
                <input type="password" class="form-control" name ="c_password"  placeholder="Confirm Password">
            </div> -->

            <div class="form-group">
              <label for="level">User Role</label>
                <select class="form-control" name="level">
                  <?php foreach ($groups as $group ):?>
                   <option value="<?php echo $group['group_level'];?>"><?php echo ucwords($group['group_name']);?></option>
                <?php endforeach;?>
                </select>
            </div>
            <div class="form-group clearfix">
              <!-- <button type="submit" name="add_user" class="btn btn-primary">Save</button> -->
            </div>
                    
        </div>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" name="add_user" class="btn btn-primary">Save</button>
         </form>
      </div>
    </div>
  </div>
</div>


<script>
    const toggle = document.getElementById('togglePassword');
    const password = document.getElementById('password');

    toggle.addEventListener('click', function(){
        if(password.type === "password"){
            password.type = 'text';
        }else{
            password.type = 'password';
        }
        this.classList.toggle('bi-eye');
    });
</script>

  <?php include_once('layouts/footer.php'); ?>