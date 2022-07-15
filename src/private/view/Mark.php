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
            <div class="row ">
                <div class="col-xl-3 col-md-3 mb-3 d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Marcajes</h1>
                </div>
                <div class="col-xl-6 col-md-6 mb-6 d-sm-flex align-items-center justify-content-center mb-4">
                    <h1 id="reloj" class="h1 mb-0 text-gray-800">.....</h1>
                </div>
                <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md mt-2">
                    <label for="rol" class="form-label">Tipo Marcaje</label>
                    <select class="custom-select" id="selectMarkType">
                    <!-- Se inserta desde script -->
                    </select>
                </div>
            </div>
            <div class="row justify-content-center align-items-start">
                <div class="col-xl-6 col-md-6 mb-6 d-sm-flex justify-content-center">
                    <h1 id="fecha" class="h5 mb-0 text-gray-800">.....</h1>
                </div>
            </div>

            <!-- Split content -->
            <div class="row">
                <div class="col s12">
                    <hr>
                </div>
            </div>

            <!-- Content Row Input User Data Form-->
            <form class="needs-validation" novalidate>
                <div class="row justify-content-center">
                    <div class="col-xl-4 col-md-4 mb-4 align-self-center">
                        <input type="text" class="form-control text-center" id="codEmpleado" placeholder="Codigo Empleado" autofocus>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-4 col-md-4 mb-4 position-relative input-group-md">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" readonly class="form-control" id="nombre" placeholder="...">
                    </div>
                    <div class="col-xl-4 col-md-4 mb-4 position-relative input-group-md">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" readonly class="form-control" id="apellido" placeholder="..." required>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-4 col-md-4 mb-4 position-relative input-group-md">
                        <label for="password" class="form-label">Departamento</label>
                        <input type="text" readonly class="form-control" id="password" placeholder="...">
                    </div>
                    <div class="col-xl-4 col-md-4 mb-4 position-relative input-group-md">
                        <label for="password2" class="form-label">Confirmar contraseña</label>
                        <input type="text" readonly class="form-control" id="password2" placeholder="...">
                    </div>
                </div>
            </form>
        </div>
        <!-- /.container-fluid -->

        <!-- Insert footer -->
        <?php include_once 'components/footer.php'; ?>
        <script src="script/Mark.js"></script>
</body>

</html>