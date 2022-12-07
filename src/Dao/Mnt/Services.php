<?php
namespace Dao\Mnt;

use Dao\Table;
use DateTime;

class Services extends Table{
    public static function addService($servicename,$description,$imagepath,$status){
        $insertSQL= "INSERT INTO services (servicename, description, imagepath, status)
        values(:servicename, :description, :imagepath, :status);";
        $params=array(
            "servicename"=>$servicename,
            "description"=>$description,
            "imagepath"=>$imagepath,
            "status"=>$status
        );
        return self::executeNonQuery($insertSQL, $params);
    }

    public static function getAllServices(){
        $selectSql  = "SELECT * FROM services;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($idservice){
        $selectStr = "SELECT * FROM services WHERE idservice=:idservice; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("idservice"=>$idservice)
        );
    }
    public static function updateService($servicename, $description, $imagepath, $status, $idservice){
        $updateSql= "UPDATE services SET servicename=:servicename, description=:description, imagepath=:imagepath,
         status=:status WHERE idservice=:idservice;";
        $params=array(
            "servicename"=>$servicename,
            "description"=>$description,
            "imagepath"=>$imagepath,
            "status"=>$status,
            "idservice"=>$idservice
        );
        return self::executeNonQuery($updateSql, $params);
    }

    public static function deleteService($idservice){
        $deleteStr= "DELETE FROM services WHERE idservice=:idservice;";
        return self::executeNonQuery($deleteStr, array("idservice" => $idservice));
    }


}
?>0