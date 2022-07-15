<!-- Insert header -->
<?php include_once 'components/header.php'; ?>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Insert nav var -->
        <?php include_once 'components/nav.php'; ?>

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Marcaje por Día</h1>
            </div>

            <!-- Split content -->
            <div class="row">
                <div class="col s12">
                    <hr>
                </div>
            </div>

            <!-- Content Row Input User Data Form-->
            <form class="needs-validation" novalidate>
                <div class="row">
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="codEmpleado" class="form-label">Codigo de empleado</label>
                        <input type="text" class="form-control" id="codEmpleado" placeholder="13579" required>
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="nomUsuario" class="form-label">Nombre de usuario</label>
                        <input type="text" class="form-control" id="nomUsuario" placeholder="Bperezh20">
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                    <label for="rol" class="form-label">Jornada</label>
                        <select class="custom-select" id="jornada">
                            <option value="1" selected>Diurna</option>
                            <option value="0">Vespertina</option>
                        </select>
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="password" class="form-label">Fecha Inicial</label>
                        <input type="text" class="form-control" id="HoraIngreso" placeholder="12/12/2022">
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="password2" class="form-label">Fecha Final</label>
                        <input type="text" class="form-control" id="HoraSalida" placeholder="01/01/2023">
                    </div>
                </div>
                <br>
                <center><button class="btn btn-primary btn btn-success" type="submit">Ingresar Marcaje</button><label>   </label><button class="btn btn-primary btn btn-danger" type="submit">Cancelar</button></center>
                
            </form>
            <br>
            
        <!-- /.container-fluid -->

        <!-- Insert footer -->
        <?php include_once 'components/footer.php'; ?>
</body>

</html>