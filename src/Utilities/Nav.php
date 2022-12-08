<?php

namespace Utilities;

class Nav {

    public static function setNavContext(){
        $tmpNAVIGATION = array();
        $userID = \Utilities\Security::getUserId();
        if (\Utilities\Security::isAuthorized($userID, "MntUsuarios")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_usuarios",
                "nav_label" => "Usuarios"
            );
        }
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Service")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_usuarios",
                "nav_label" => "MNT Servicios"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Providers")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_providers",
                "nav_label" => "MNT Proveedores"
            );
        }
        //Vista de mnt-providers
        //vista mnt-userdetails
        //vista mnt-workzones
        \Utilities\Context::setContext("NAVIGATION", $tmpNAVIGATION);
    }


    private function __construct()
    {
        
    }
    private function __clone()
    {
        
    }
}
?>
