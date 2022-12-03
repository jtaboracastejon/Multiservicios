<?php
namespace Utilities;

class multiUtilities {

    /**
     * Toma un nombre y un apellido y devuelve la primera letra de cada uno.
     * 
     * @param string firstname Elvis
     * @param string lastname Rodesno
     * 
     * @return string El nombre y apellido del usuario.
     * @author Elvis Rodesno 
     * @author Javier T. Castejón 
     */
    public static function split_name($firstname, $lastname){
        if($firstname != null && $lastname != null){
            $name = explode(" ", $firstname);
            $lastname = explode(" ", $lastname);
            return $name[0]." ".$lastname[0];
        }
    }
}