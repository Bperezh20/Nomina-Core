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
                <h1 class="h3 mb-0 text-gray-800">Horarios</h1>
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
                    <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md">
                        <label for="nomHorario" class="form-label">Nombre de horario</label>
                        <input type="text" class="form-control" id="nomHorario" placeholder="Matutino general" required>
                    </div>
                    <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md">
                        <label for="horaIni" class="form-label">Hora Inicio</label>
                        <input type="time" class="form-control" id="horaIni" required>
                    </div>
                    <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md">
                        <label for="horaFin" class="form-label">Hora Fin</label>
                        <input type="time" class="form-control" id="horaFin" required>
                    </div>
                    <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md">
                        <label for="cantAlmuerzo" class="form-label">Tiempo Almuerzo (cant. horas)</label>
                        <input type="text" class="form-control" id="cantAlmuerzo" placeholder="1" required>
                    </div>
                    <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md">
                        <label for="horaAlmu" class="form-label">Hora Almuerzo</label>
                        <input type="time" class="form-control" id="horaAlmu" placeholder="10" required>
                    </div>
                    <div class="col-xl-3 col-md-3 mb-3 position-relative input-group-md mt-2">
                        <label for="rol" class="form-label">Estado</label>
                        <select class="custom-select" id="estado">
                            <option value="1" selected>activo</option>
                            <option value="0">inactivo</option>
                        </select>
                    </div>
                </div>
                <br>
                <button class="btn btn-primary btn btn-success" type="submit">Guardar Cambios</button>
                <button class="btn btn-primary btn btn-danger" type="submit">Limpiar</button>
            </form>
            <br>
            <div class="row justify-content-end">
                <div class="col-xl-5 col-md-5 mb-12">
                    <input type="text" class="form-control" placeholder="Buscar por: Nombre de horario">
                </div>
            </div>

            <br>

            <div class="row">
                <div class="col-xl-12 col-md-12 mb-12 position-relative">
                    <table class="table table-hover bordered">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">First</th>
                                <th scope="col">Last</th>
                                <th scope="col">Handle</th>
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