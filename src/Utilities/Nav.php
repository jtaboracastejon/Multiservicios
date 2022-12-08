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

<<<<<<< HEAD

        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Users")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_users",
                "nav_label" => "MNT Usuarios"
=======
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Providers")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_providers",
                "nav_label" => "MNT Proveedores"
>>>>>>> cf5fdfe11cc47126b10148b97f924529bb11a612
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
