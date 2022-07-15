<?php

namespace App\model;

use App\model\config\DBConnect;

class Mark extends DBConnect
{
    public function __construct()
    {
        parent::get();
    }

    /**
     * Funcion que retorna los tipos de marcas existentes
     */
    public function getMarkTypes()
    {
        $sql = "SELECT * FROM Mark_Type WHERE active = 1";

        return $this->ExecuteQueryArray($sql);
    }
}