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
                <h1 class="h3 mb-0 text-gray-800">Cambiar horario</h1>
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
                        <input type="text" class="form-control" id="codEmpleado" placeholder="10426" required>
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="nomUsuario" class="form-label">Nombre de usuario</label>
                        <input type="text" class="form-control" id="nomUsuario" placeholder="jmazariegos">
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="rol" class="form-label">Horario actual</label>
                        <input type="text" class="form-control" id="rol" placeholder="Administrador" required>
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="rol" class="form-label">Nuevo horario</label>
                        <select class="custom-select" id="estado">
                            <option value="1" selected>activo</option>
                            <option value="0">inactivo</option>
                        </select>
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="password" class="form-label">Dias a trabajar</label>
                        <input type="text" class="form-control" id="password" placeholder="126456789">
                    </div>
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="password2" class="form-label">----</label>   
                        <input type="text" class="form-control" id="password2" placeholder="987654321">
                    </div>
                </div>
                <br>
                <button class="btn btn-primary btn btn-success" type="submit">Guardar Cambios</button>
                <button class="btn btn-primary btn btn-danger" type="submit">Limpiar</button>
            </form>
            <br>
            <div class="row justify-content-end">
                <div class="col-xl-5 col-md-5 mb-12">
                    <input type="text" class="form-control" placeholder="Buscar por: Nombre">
                </div>
            </div>

            <br>

            <div class="row">
                <div class="col-xl-12 col-md-12 mb-12 position-relative">
                    <table class="table table-hover bordered">
                        <thead>
                            <tr>
                                <th scope="col">Codigo</th>
                                <th scope="col">Primer nombre</th>
                                <th scope="col">Segundo nombre</th>
                                <th scope="col">Horario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

        <!-- Insert footer -->
        <?php include_once 'components/footer.php'; ?>
</body>

</html>
