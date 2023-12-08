<?php
  $page_title = 'Home Page';
  require_once('includes/load.php');
  if (!$session->isUserLoggedIn(true)) { redirect('index.php', false);}
?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-12">
    <?php echo display_msg($msg); ?>
  </div>
 <div class="col-md-12">
    <div class="panel">
 

    <link rel="stylesheet" href="tuner-master/app/style.css" />
  </head>
  <body>
    <canvas class="frequency-bars"></canvas>
    <div class="meter">
      <div class="meter-dot"></div>
      <div class="meter-pointer"></div>
    </div>
    <div class="notes">
      <div class="notes-list"></div>
      <div class="frequency">
        <span>Hz</span>
      </div>
    </div>
    <div class="a4">A<sub>4</sub> = <span>440</span> Hz</div>
    <label class="auto">
      Auto
      <input type="checkbox" checked />
    </label>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/aubiojs@0.1.1/build/aubio.min.js"></script>
    <script src="tuner-master/app/tuner.js"></script>
    <script src="tuner-master/app/meter.js"></script>
    <script src="tuner-master/app/frequency-bars.js"></script>
    <script src="tuner-master/app/notes.js"></script>
    <script src="tuner-master/app/app.js"></script>

    </div>
 </div>
</div>


<?php include_once('layouts/footer.php'); ?>
