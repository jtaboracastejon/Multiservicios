<?php
namespace Dao\Orders;
use Dao\Table;

class Orders extends Table
{
    //Proveedor DAO

    public static function addOrder($iduser_cli, $iduser_prov, $idservice, $descriptionwork, $enddate){
        $insertStr = "INSERT INTO orders (iduser_cli, iduser_prov, idservice, descriptionwork, enddate) 
        VALUES (:iduser_cli, :iduser_prov, :idservice, :descriptionwork, :enddate);";
        $insertParams = [
            "iduser_cli" => $iduser_cli,
            "iduser_prov" => $iduser_prov,
            "idservice" => $idservice,
            "descriptionwork" => $descriptionwork,
            "enddate" => $enddate,
        ];  
        return self::executeNonQuery($insertStr, $insertParams);
    }

    public static function getOrdersByProviderId($iduser_prov){
        $selectStr = "SELECT o.*, s.*, o.status orderstatus FROM orders o
        JOIN services s ON o.idservice = s.idservice
        WHERE o.iduser_prov = :iduser_prov;";
        $selectParams = [
            "iduser_prov" => $iduser_prov
        ];
        return self::obtenerRegistros($selectStr, $selectParams);
    }

    public static function getOrderById($idorder){
        $selectStr = "SELECT * FROM orders o
        JOIN services s ON o.idservice = s.idservice
        WHERE o.idorder = :idorder;";
        $selectParams = [
            "idorder" => $idorder
        ];
        return self::obtenerUnRegistro($selectStr, $selectParams);
    }

    public static function updateOrder($order){
        $updateStr = "UPDATE orders SET status = :status WHERE idorder = :idorder;";
        $updateParams = [
            "status" => $order["status"],
            "idorder" => $order["idorder"]["idorder"]
        ];
        return self::executeNonQuery($updateStr, $updateParams);
    }
    

    //Cliente DAO

    public static function getOrdersByClientId($iduser_cli){
        $selectStr = "SELECT o.*, s.*, o.status orderstatus FROM orders o
        JOIN services s ON o.idservice = s.idservice
        WHERE o.iduser_cli = :iduser_cli;";
        $selectParams = [
            "iduser_cli" => $iduser_cli
        ];
        return self::obtenerRegistros($selectStr, $selectParams);
    }
}
