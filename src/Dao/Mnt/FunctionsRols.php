<?php
namespace Dao\Mnt;

use Dao\Table;
use DateTime;

class FunctionsRols extends Table{
    public static function addFunctionRol($rolescod,$fncod,$fnrolest,$fnexp){
        $insertSQL= "INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp)
        values(:rolescod, :fncod, :fnrolest, :fnexp);";
        $params=array(
            "rolescod"=>$rolescod,
            "fncod"=>$fncod,
            "fnrolest"=>$fnrolest,
            "fnexp"=>$fnexp
        );
        return self::executeNonQuery($insertSQL, $params);
    }


    public static function getAllFncod2(){
        $selectStr = "Select * from funciones";
        return self::obtenerRegistros($selectStr, array());
    }

    public static function getAllFunctionsRols(){
        $selectSql  = "SELECT * FROM funciones_roles;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($rolescod){
        $selectStr = "SELECT * FROM funciones_roles WHERE rolescod=:rolescod; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("rolescod"=>$rolescod)
        );
    }
    public static function updateFunctionRol($rolescod, $fncod,$fnrolest,$fnexp){
        $updateSql= "UPDATE funciones_roles SET rolescod=:rolescod, fncod=:fncod, fnrolest=:fnrolest,
         fnexp=:fnexp WHERE rolescod=:rolescod;";
        $params=array(
            "rolescod"=>$rolescod,
            "fncod"=>$fncod,
            "fnrolest"=>$fnrolest,
            "fnexp"=>$fnexp,
            "rolescod"=>$rolescod
        );
        return self::executeNonQuery($updateSql, $params);
    }

    public static function deleteFunctionRol($rolescod){
        $deleteStr= "DELETE FROM funciones_roles WHERE rolescod=:rolescod;";
        return self::executeNonQuery($deleteStr, array("rolescod" => $rolescod));
    }


}
?>