<?php 
namespace Dao\Mnt;
use Dao\Table;

class Roles extends Table
{
    public static function AddRoles(
       $rolescod,
       $rolesdsc,
        $rolesest
    ){
        $insertStr = "INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES (:rolescod, :rolesdsc, :rolesest)";
        $params = array(
            "rolescod" => $rolescod, 
            "rolesdsc" => $rolesdsc, 
            "rolesest" => $rolesest
        );
        return self::executeNonQuery($insertStr,$params);
    }

    public static function getALLRoles(){
        $selectSql = "SELECT * FROM roles";
        return self::obtenerRegistros($selectSql, array());
    }
    public static function getUserDetailByCod($rolescod){
        $selectSql = "SELECT * FROM roles WHERE rolescod=:rolescod;";
        return self::obtenerUnRegistro($selectSql, array(
            "rolescod"=>$rolescod
        ));
    }

    public static function UpdateRoles(
        $rolescod,
        $rolesdsc,
        $rolesest
    ){
        $insertStr = "UPDATE roles set rolesdsc=:rolesdsc, rolesest=:rolesest WHERE rolescod=:rolescod";
        $params = array(
            "rolescod" => $rolescod, 
            "rolesdsc" => $rolesdsc, 
            "rolesest" => $rolesest
        );
        return self::executeNonQuery($insertStr,$params);
    }

    public static function DeleteRoles($rolescod){
        $deleteStr = "DELETE FROM roles WHERE rolescod=:rolescod;";
        return self::executeNonQuery($deleteStr, array("iduserdetail"=>$rolescod));
    }
}
