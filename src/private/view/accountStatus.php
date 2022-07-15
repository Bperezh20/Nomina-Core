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
                <h1 class="h3 mb-0 text-gray-800">Estado de cuenta</h1>
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
                        <label for="codEmpleado" class="form-label">Codigo del trabajador </label>
                        <input type="text" class="form-control" id="codEmpleado" placeholder="###" required>
                    </div>

                  <!--  <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="codEmpleado" class="form-label">Edad</label>
                        <input type="text" class="form-control" id="codEmpleado" placeholder="###" required>
                    </div>

                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="codEmpleado" class="form-label">Genero</label>
                        <input type="text" class="form-control" id="codEmpleado" placeholder="AAA" required>
                    </div>

                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="codEmpleado" class="form-label">Nacionalidad</label>
                        <input type="text" class="form-control" id="codEmpleado" placeholder="AAA" required>
                    </div>

                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="codEmpleado" class="form-label">Ocupacion</label>
                        <input type="text" class="form-control" id="codEmpleado" placeholder="AAA" required>
                    </div>

                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md">
                        <label for="nomUsuario" class="form-label">No. afiliacion IGSS</label>
                        <input type="text" class="form-control" id="nomUsuario" placeholder="###"required>
                    </div>    -->

                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="rol" class="form-label">Nombre del trabajador </label>
                        <input type="text" class="form-control" id="rol" placeholder="AAA" required>
                    </div>
                   
                    <!--
                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="password" class="form-label">Fecha de ingreso</label>
                        <input type="text" class="form-control" id="password" placeholder="00/00/0000">
                    </div>

                    <div class="col-xl-6 col-md-6 mb-6 position-relative input-group-md mt-2">
                        <label for="password2" class="form-label">Fecha fin de contrato</label>   
                        <input type="text" class="form-control" id="password2" placeholder="00/00/0000">
                    </div>  -->
                </div>
                <br>
                <button class="btn btn-primary btn btn-success" type="submit">Consultar</button>
                <button class="btn btn-primary btn btn-danger" type="submit">Volver</button>
            </form>
            <br>
            <div class="row justify-content-end">
                <div class="col-xl-5 col-md-5 mb-12">
                    <input type="text" class="form-control" placeholder="Buscar por: Nombre">
                </div>
            </div>

            <br>

            <div class="table-responsive">
                <div class="col-xl-12 col-md-12 mb-12 position-relative">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Documento </th>
                                <th scope="col">Serie de folio</th>
                                <th scope="col">fecha documento </th>
                                <th scope="col">TOTAL</th>
                                <th scope="col">tipo de moneda</th>
                                <th scope="col">Saldo</th>
                                <th scope="col">Fecha de pago</th>
                                <th scope="col">Cuenta</th>
                                <th scope="col">Metodo de pago </th>
                                <th scope="col">Monto asignado</th>
                                <th scope="col">Monto sin aplicar</th>
                                
             
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>Mark</td>
                            </tr>
                          
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
