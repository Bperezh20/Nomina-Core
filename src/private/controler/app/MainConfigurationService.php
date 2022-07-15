<?php

if (isset($_POST['request'])) {
    $request = $_POST['request'];
    if (file_exists('../' . $request['class'] . '.php')) {

        // Cargando namespaces
        if (file_exists('../../../../vendor/autoload.php')) {
            require_once '../../../../vendor/autoload.php';

            // Importando clase requerida
            require_once '../' . $request['class'] . '.php';
        } else {
            echo "No se encontro autoload";
        }
        
        // Instanciando clase, con constructor y sin constructor
        if (isset($request['constructParams'])) {
            $class = new $request['class']($request['constructParams']);
        } else {
            $class = new $request['class']();
        }
        
        if (method_exists($class, $request['classMethod'])) {
            if (isset($_POST['params'])) {
                print_r(
                    $class->{$request['classMethod']}($_POST['params'])
                );
            }
            print_r(
                $class->{$request['classMethod']}()
            );
        } else {
            print 'Error, acción requerida inválida';
        }
    } else {
        print 'Error, archivo solicitado no encontrado';
    }
} else {
    print 'Error, parámetros incompletos';
}
