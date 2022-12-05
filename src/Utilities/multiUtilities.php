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

    public static function changeZone($iddepto, $idmunicipality, $idservice, $query){
        $idworkzone = \Dao\Security\Security::existWorkzone($iddepto,$idmunicipality);
        if($idworkzone != 0){
            //Cambiar variable de sesion con el idworkzone
            $_SESSION["workzone"] = array(
                "idworkzone" => $idworkzone["idworkzone"],
                "iddepto" => $idworkzone["iddepto"],
                "idmunicipality" => $idworkzone["idmunicipality"],
                "department" => $idworkzone["department"],
                "municipality" => $idworkzone["municipality"]
            );

            \Utilities\Site::redirectTo("index.php?page=services_search&service=". $idservice ."&query=". $query);
        }
        else{
            \Utilities\Site::redirectToWithMsg("index.php?page=services_search&service=". $idservice ."&query=". $query, "No hay proveedores en esta zona");
        }
    }
}