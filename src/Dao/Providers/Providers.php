<?php
namespace Dao\Providers;
use Dao\Table;

class Providers extends Table
{
    public static function addProvider(
        $iduserdetail,
        $idservice,
        $decription,
        $status
    ){
        $insertStr = "INSERT INTO providers (iduserdetail, idservice, decription, status) VALUES (:iduserdetail, :idservice, :decription, :status);";
        $insertParams = [
            "iduserdetail" => $iduserdetail,
            "idservice" => $idservice,
            "decription" => $decription,
            "status" => $status
        ];  
        return self::executeNonQuery($insertStr, $insertParams);
    }


    //obtener toda la tabla userdetails
    public static function getAllUserDetails()
    {
        $selectStr = "SELECT * FROM user_details;";
        return self::obtenerRegistros($selectStr, array());
    }



    public static function getAllServices()
    {
        $strSql = "SELECT * FROM services";
        return self::obtenerRegistros($strSql, array());
    }

    public static function getAllProviders(){
        $selectSql = "SELECT * FROM providers";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getProviderById($idprovider){
        $selectSql = "SELECT * FROM providers WHERE idprovider = :idprovider";
        $selectParams = [
            "idprovider" => $idprovider
        ];
        return self::obtenerUnRegistro($selectSql, $selectParams);
    }

    public static function updateProvider(
        $idprovider,
        $iduserdetail,
        $idservice,
        $decription,
        $status
    ){
        $updateStr = "UPDATE providers SET iduserdetail = :iduserdetail, idservice = :idservice, decription = :decription, status = :status WHERE idprovider = :idprovider;";
        $updateParams = [
            "idprovider" => $idprovider,
            "iduserdetail" => $iduserdetail,
            "idservice" => $idservice,
            "decription" => $decription,
            "status" => $status
        ];
        return self::executeNonQuery($updateStr, $updateParams);
    }

    public static function deleteProvider($idprovider){
        $deleteStr = "DELETE FROM providers WHERE idprovider = :idprovider;";
        $deleteParams = [
            "idprovider" => $idprovider
        ];
        return self::executeNonQuery($deleteStr, $deleteParams);
    }
}
