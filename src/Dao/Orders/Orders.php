<?php
namespace Dao\Orders;
use Dao\Table;

class Orders extends Table
{

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
    
}
