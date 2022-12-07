<?php
namespace Dao\Mnt;

use Dao\Table;
use DateTime;

class Users extends Table{
    public static function addUser($useremail,$username,$userest, $usertipo){
        $insertSQL= "INSERT INTO usuario (useremail, username, userest, usertipo)
        values(:useremail, :username, :userest, :usertipo);";
        $params=array(
            "useremail"=>$useremail,
            "username"=>$username,
            "userest"=>$userest,
            "usertipo"=>$usertipo
        );
        return self::executeNonQuery($insertSQL, $params);
    }

    public static function getAllUsers(){
        $selectSql  = "SELECT * FROM usuario;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($usercod){
        $selectStr = "SELECT * FROM usuario WHERE usercod=:usercod; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("usercod"=>$usercod)
        );
    }
    public static function updateUser($useremail,$username,$userest, $usertipo, $usercod){
        $updateSql= "UPDATE usuario SET useremail=:useremail, username=:username, userest=:userest,
         usertipo=:usertipo  WHERE usercod=:usercod;";
        $params=array(
            "useremail"=>$useremail,
            "username"=>$username,
            "userest"=>$userest,
            "usertipo"=>$usertipo,
            "usercod"=>$usercod
        );
        return self::executeNonQuery($updateSql, $params);
    }

    public static function deleteUser($usercod){
        $deleteStr= "DELETE FROM usuario WHERE usercod=:usercod;";
        return self::executeNonQuery($deleteStr, array("usercod" => $usercod));
    }


}
?>