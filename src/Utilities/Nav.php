<?php

namespace Utilities;

class Nav {

    public static function setNavContext(){
        $tmpNAVIGATION = array();
        $userID = \Utilities\Security::getUserId();
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Subscriptions\Subscriptions")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=subscriptions_subscriptions",
                "nav_label" => "Conviértete en PRO"
            );
        }
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
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Promotions\Promotions")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=promotions_promotions",
                "nav_label" => "Promociones"
            );
        }
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Orders\ProviderDash")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=orders_providerdash",
                "nav_label" => "Lista de Ordenes"
            );
        }
        if (\Utilities\Security::isAuthorized($userID, "Controllers\Orders\ClientDash")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=orders_clientdash",
                "nav_label" => "Lista de Solicitudes"
            );
        }
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
