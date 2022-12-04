<?php
namespace Dao\WorkZones;
use Dao\Table;

class Workzone extends Table
{
    public static function getWorkZoneDis(){
        $sqlstr = "select * from work_zones wz 
        join departments d on d.iddepto = wz.iddepto 
        join municipalities m on m.idmunicipality = wz.idmunicipality 
        where wz.status = 'DIS'";
        $params = array(null);
        return self::obtenerRegistros($sqlstr, $params);
    }

    public static function addWorkZone(
        $iddepto,
        $idmunicipality,
        $status
    ){
        $insertStr = "INSERT INTO work_zones (iddepto, idmunicipality, status) VALUES (:iddepto, :idmunicipality, :status);";
        $insertParams = [
            "iddepto" => $iddepto,
            "idmunicipality" => $idmunicipality,
            "status" => $status
        ];
        return self::executeNonQuery($insertStr, $insertParams);
    }

    public static function allWoz(){
       $innerS= "select wz.idworkzone,d.department,m.municipality, wz.status
       from work_zones wz
       inner join  departments d on wz.iddepto=d.iddepto
       inner join municipalities m on wz.idmunicipality=m.idmunicipality";
       $wz=self::obtenerRegistros($innerS, array());
        return $wz;
    } 
    
    public static function getAllDeptos()
    {
        $selectStr = "SELECT * FROM departments;";
        return self::obtenerRegistros($selectStr, array());
    }

    public static function getAllMunicipies()
    {
        $strSql = "SELECT * FROM municipalities";
        return self::obtenerRegistros($strSql, array());
    }

    public static function getAllWorkZone(){
        $selectSql = "SELECT * FROM work_zones";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getWorkZonesById($idworkzone){
        $selectSql = "SELECT * FROM work_zones WHERE idworkzone = :idworkzone";
        $selectParams = [
            "idworkzone" => $idworkzone
        ];
        return self::obtenerUnRegistro($selectSql, $selectParams);
    }

    public static function updateWorkzone(
        $idworkzone,
        $iddepto,
        $idmunicipality,
        $status
        
    ){
        $updateStr = "UPDATE work_zones SET iddepto = :iddepto, idmunicipality = :idmunicipality, status = :status WHERE idworkzone = :idworkzone;";
        $updateParams = [
            "idworkzone" => $idworkzone,
            "iddepto" => $iddepto,
            "idmunicipality" => $idmunicipality,
            "status" => $status
        ];
        return self::executeNonQuery($updateStr, $updateParams);
    }

    public static function deleteWorkZone($idworkzone){
        $deleteStr = "DELETE FROM work_zones WHERE idworkzone = :idworkzone;";
        $deleteParams = [
            "idworkzone" => $idworkzone
        ];
        return self::executeNonQuery($deleteStr, $deleteParams);
    }
   
}