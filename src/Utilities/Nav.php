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
<<<<<<< HEAD
        }


=======
        }       
>>>>>>> 20be92c5166d8dcc657a35ee161d32137b037664

        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Users")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_users",
                "nav_label" => "MNT Usuarios"
<<<<<<< HEAD
            );}
=======
            );
        }
>>>>>>> 20be92c5166d8dcc657a35ee161d32137b037664
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Providers")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_providers",
                "nav_label" => "MNT Proveedores"
<<<<<<< HEAD
=======
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\Workzones")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_workzones",
                "nav_label" => "MNT Zonas de Trabajo"
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "Controllers\Mnt\UserDetails")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_userdetails",
                "nav_label" => "MNT detalles Usuarios"
>>>>>>> 20be92c5166d8dcc657a35ee161d32137b037664
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
