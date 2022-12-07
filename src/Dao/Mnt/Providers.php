<?php
namespace Dao\Mnt;

use Dao\Table;
use DateTime;

class Providers extends Table{
    public static function addProvider($iduserdetail,$idservice,$decription,$status, $datecreate){
        $insertSQL= "INSERT INTO providers (iduserdetail, idservice, decription, status, datecreate)
        values(:iduserdetail, :idservice, :decription, :status, :datecreate);";
        $params=array(
            "iduserdetail"=>$iduserdetail,
            "idservice"=>$idservice,
            "decription"=>$decription,
            "status"=>$status,
            "datecreate"=>$datecreate
        );
        return self::executeNonQuery($insertSQL, $params);
    }

    public static function allUser(){
        $joinS= "select  prv.idprovider, u.firstname, s.servicename, prv.decription, prv.status, prv.datecreate
            from providers prv
            inner join user_details u on u.iduserdetail = prv.iduserdetail
            inner join services s on  prv.idservice = s.idservice;";
        $prv=self::obtenerRegistros($joinS, array());

        return $prv;

    }

    public static function getAllUserdetail(){
        $selectStr = "Select * from user_details";
        return self::obtenerRegistros($selectStr, array());
    }

    public static function getAllServices(){
        $selectStr = "Select * from services";
        return self::obtenerRegistros($selectStr, array());
    }

    public static function getAllProviders(){
        $selectSql  = "SELECT * FROM providers;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($idprovider){
        $selectStr = "SELECT * FROM providers WHERE idprovider=:idprovider; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("idprovider"=>$idprovider)
        );
    }
    public static function updateProvider($iduserdetail,$idservice,$decription,$status, $datecreate, $idprovider){
        $updateSql= "UPDATE providers SET iduserdetail=:iduserdetail, idservice=:idservice, decription=:decription, status=:status,  
         datecreate=:datecreate WHERE idprovider=:idprovider;";
        $params=array(
            "iduserdetail"=>$iduserdetail,
            "idservice"=>$idservice,
            "decription"=>$decription,
            "status"=>$status,
            "datecreate"=>$datecreate,
            "idprovider"=>$idprovider
        );
        return self::executeNonQuery($updateSql, $params);
    }

    public static function deleteProvider($idprovider){
        $deleteStr= "DELETE FROM providers WHERE idprovider=:idprovider;";
        return self::executeNonQuery($deleteStr, array("idprovider" => $idprovider));
    }
}
?>