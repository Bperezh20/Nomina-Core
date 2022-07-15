<?php

namespace App\model\config;

class DBConnect
{
    protected $host = 'localhost';
    protected $user = 'root';
    protected $password = '';
    protected $db = 'NOMINA';

    protected $cnx = null;

    /**
     * Singleton que genera una instancia unica de conexion
     * a base de datos
     */
    public function get()
    {
        if ($this->cnx === null) {
            $this->cnx = $this->Connect();
        }

        return $this->cnx;
    }

    /**
     * Genera una conexion base de datos mysql
     */
    public function Connect()
    {
        $connection = mysqli_connect($this->host, $this->user, $this->password, $this->db)
            or mysqli_connect_error();
        
        return $connection;
    }

    /**
     * Cierra una conexion a base de datos mysql
     */
    public function Disconnect()
    {
        if ($this->cnx !== null) {
            mysqli_close($this->cnx);
            $this->cnx = null;
        }

        return;
    }

    /**
     * Escana caracteres especiales de una cadena proporcionada
     */
    public function ScapeString($string)
    {
        if (strlen(trim($string)) === 0) {
            return null;
        }

        return mysqli_real_escape_string($this->cnx, $string);
    }

    /**
     * function que ejcuta un query y retorna
     * el resultado de la consulta en caso no se enceuntren resultados
     * retorna nulo
     */
    public function ExecuteQuery($sql)
    {
        $result = mysqli_query($this->cnx, $this->ScapeString($sql));

        if (mysqli_num_rows($result) > 0) {
            return $result;
        }

        return null;
    }

    /**
     * function que ejcuta un query y retorna
     * el resultado de la consulta en caso no se enceuntren resultados
     * retorna nulo
     */
    public function ExecuteQueryArray($sql)
    {
        $result = mysqli_query($this->cnx, $this->ScapeString($sql));

        if (mysqli_num_rows($result) <= 0) {
            return null;
        }

        $arrReturn = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $arrReturn[] = json_decode(json_encode($row), true);
        }

        return $arrReturn;
    }
}