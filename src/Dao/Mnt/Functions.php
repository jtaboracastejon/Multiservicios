<?php
namespace Dao\Mnt;

use Dao\Table;
use DateTime;

class Functions extends Table{
    public static function addFunction($fncod,$fndsc,$fnest,$fntyp){
        $insertSQL= "INSERT INTO funciones (fncod, fndsc, fnest, fntyp)
        values(:fncod, :fndsc, :fnest, :fntyp);";
        $params=array(
            "fncod"=>$fncod,
            "fndsc"=>$fndsc,
            "fnest"=>$fnest,
            "fntyp"=>$fntyp
        );
        return self::executeNonQuery($insertSQL, $params);
    }


    public static function getAllFncod(){
        $selectStr = "Select * from funciones";
        return self::obtenerRegistros($selectStr, array());
    }

    public static function getAllFunctions(){
        $selectSql  = "SELECT * FROM funciones;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($fncod){
        $selectStr = "SELECT * FROM funciones WHERE fncod=:fncod; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("fncod"=>$fncod)
        );
    }
    public static function updateFunction($fncod, $fndsc,$fnest,$fntyp){
        $updateSql= "UPDATE funciones SET fncod=:fncod, fndsc=:fndsc, fnest=:fnest,
         fntyp=:fntyp WHERE fncod=:fncod;";
        $params=array(
            "fncod"=>$fncod,
            "fndsc"=>$fndsc,
            "fnest"=>$fnest,
            "fntyp"=>$fntyp,
            "fncod"=>$fncod
        );
        return self::executeNonQuery($updateSql, $params);
    }

    public static function deleteFunction($fncod){
        $deleteStr= "DELETE FROM funciones WHERE fncod=:fncod;";
        return self::executeNonQuery($deleteStr, array("fncod" => $fncod));
    }


}
?>