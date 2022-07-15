<?php

class Example
{
    /**
     * Function test, Explain PHP and JQuery concept
     *
     * @param   array   $param  Array of required parameter
     * @return string
     */
    public function test(array $param = []): string
    {
        if (empty($param)) {
            print 'Parametros inválidos';
            die();
        }

        print_r($param['name'] . ' ' . $param['lastName']);
        die();
    }  
    
    /**
     * Return an array of random data
     *
     * @return array
     */
    public function getRandomInfo(): array
    {
        $header = [];
        $header[] = 'no';
        for ($x = 0; $x < 5; $x++) {
            $header[] = 'title ' . ($x + 1);
        }

        $body = [];
        for ($i = 0; $i < 7; $i++) {
            $body[] = [
                'no' => ($i + 1),
                'dato1' => 'nombre ' . $i,
                'dato2' => 'apellido ' . $i,
                'dato3' => 'correo ' . $i . '@gmail.com',
                'dato4' => 'telefono ' . $i,
                'dato5' => 'direccion ' . $i
            ];
        }

        $randomData = ['header' => $header, 'body' => $body];
        print_r(json_encode($randomData));
        die();
    }
}
