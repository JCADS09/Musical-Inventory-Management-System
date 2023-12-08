<?php
  $page_title = 'All Group';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(1);
  $all_groups = find_all('user_groups');
?>

<?php
  if(isset($_POST['add'])){

   $req_fields = array('group-name','group-level');
   validate_fields($req_fields);

   if(find_by_groupName($_POST['group-name']) === false ){
     $session->msg('d','<b>Sorry!</b> Entered Group Name already in database!');
     redirect('add_group.php', false);
   }elseif(find_by_groupLevel($_POST['group-level']) === false) {
     $session->msg('d','<b>Sorry!</b> Entered Group Level already in database!');
     redirect('add_group.php', false);
   }
   if(empty($errors)){
           $name = remove_junk($db->escape($_POST['group-name']));
          $level = remove_junk($db->escape($_POST['group-level']));
         $status = remove_junk($db->escape($_POST['status']));

        $query  = "INSERT INTO user_groups (";
        $query .="group_name,group_level,group_status";
        $query .=") VALUES (";
        $query .=" '{$name}', '{$level}','{$status}'";
        $query .=")";
        if($db->query($query)){
          //sucess
          $session->msg('s',"Group has been creted! ");
          redirect('group.php', false);
        } else {
          //failed
          $session->msg('d',' Sorry failed to create Group!');
          redirect('group.php', false);
        }
   } else {
     $session->msg("d", $errors);
      redirect('group.php',false);
   }
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
        <span class="glyphicon glyphicon-th "></span>
        <span>GROUPS</span>
     </strong>
       <!-- <a href="add_group.php" class="btn btn-info pull-right btn-sm">ADD NEW GROUP</a> -->
       <button type="submit" name="add" class="btn btn-info pull-right btn-sm" data-toggle="modal" data-target="#exampleModal">ADD NEW GROUP</button>
    </div>
     <div class="panel-body">
      <table id="group_data" class="table table-striped table-bordered">
        <thead class="thead-dark">
          <tr>
            <th class="text-center" style="width: 50px;">#</th>
            <th>Group Name</th>
            <th class="text-center" style="width: 20%;">Group Level</th>
            <th class="text-center" style="width: 15%;">Status</th>
            <th class="text-center" style="width: 100px;">Actions</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach($all_groups as $a_group): ?>
          <tr>
           <td class="text-center"><?php echo count_id();?></td>
           <td><?php echo remove_junk(ucwords($a_group['group_name']))?></td>
           <td class="text-center">
             <?php echo remove_junk(ucwords($a_group['group_level']))?>
           </td>
           <td class="text-center">
           <?php if($a_group['group_status'] === '1'): ?>
            <span class="label label-success"><?php echo "Active"; ?></span>
          <?php else: ?>
            <span class="label label-danger"><?php echo "Deactive"; ?></span>
          <?php endif;?>
           </td>
           <td class="text-center">
             <div class="btn-group">
                <a href="edit_group.php?id=<?php echo (int)$a_group['id'];?>" class="btn btn-s btn-warning" data-toggle="tooltip" title="Edit">
                  <i class="glyphicon glyphicon-pencil"></i>
               </a>
                <a href="delete_group.php?id=<?php echo (int)$a_group['id'];?>" class="btn btn-s btn-danger" data-toggle="tooltip" title="Remove">
                  <i class="glyphicon glyphicon-remove"></i>
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
        <h5 class="modal-title" id="exampleModalLabel">ADD NEW USER GROUP</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- start form -->
        <div class="panel-body">
         <form method="post" action="group.php" class="clearfix">
        <div class="form-group">
              <label for="name" class="control-label">Group Name</label>
              <input type="name" class="form-control" name="group-name">
        </div>
        <div class="form-group">
              <label for="level" class="control-label">Group Level</label>
              <input type="number" class="form-control" name="group-level">
        </div>
        <div class="form-group">
          <label for="status">Status</label>
            <select class="form-control" name="status">
              <option value="1">Active</option>
              <option value="0">Deactive</option>
            </select>
        </div>
              
        </div>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" name="add" class="btn btn-primary">Save</button>
         </form>
      </div>
    </div>
  </div>
</div>


   <script>  
 $(document).ready(function(){  
      $('#group_data').DataTable();  
     
 });  
 </script>


  <?php include_once('layouts/footer.php'); ?>
