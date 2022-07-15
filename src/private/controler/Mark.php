<?php

use App\model\Mark as MarkModel;

/**
 * Clase que administra las funcionalidades relacioandas
 * a los marcajes
 */
class Mark extends MarkModel
{
    public function getMarkType()
    {
        $markTypes = $this->getMarkTypes();
        
        print_r(json_encode($markTypes));
        die();
    }
}