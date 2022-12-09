<?php 
namespace Dao\Services;
use Dao\Table;

class Services extends Table{
    public static function getServiceById($idservice){
        $strSql = "SELECT * FROM services WHERE idservice=:idservice AND status = 'ACT';";
        return self::obtenerUnRegistro($strSql, array("idservice"=>$idservice));
    }
}
?>