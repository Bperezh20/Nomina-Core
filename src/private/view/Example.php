<?php
require_once 'components/header.php';
?>
<br>
<form class="row g-3" name="example" action="Example.php">
  <div class="col-auto">
    <label for="email" class="visually-hidden">Email</label>
    <input type="text" class="form-control" name="email" id="email" placeholder="email@example.com">
  </div>
  <div class="col-auto">
    <label for="pass" class="visually-hidden">Password</label>
    <input type="password" class="form-control" name="pass" id="pass" placeholder="Password">
  </div>
  <div class="col-auto">
    <button type="button" class="btn btn-primary mb-3" onclick="testJS();">Login</button>
  </div>
  <div class="col-auto">
    <button type="button" class="btn btn-primary mb-3" onclick="testWithConstructJS();">Login con constructor</button>
  </div>
</form>
<!-- ESTE ES UN COMENTARIO DE PRUEBA PARA GIT -->
<div class="col-auto">
  <button type="button" class="btn btn-primary mb-3" onclick="buildTable(this);">Construir HTML</button>
</div>

<!-- Build table -->
<div class="col s1" id="autoTable"></div>

<script src="script/Example.js"></script>
<?php
require_once 'components/footer.php';
?>