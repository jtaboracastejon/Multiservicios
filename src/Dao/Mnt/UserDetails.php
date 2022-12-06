<?php 
namespace Dao\Mnt;
use Dao\Table;

class UserDetails extends Table
{
    public static function AddUserDetail(
        $usercod,
        $firstname,
        $lastname,
        $address,
        $phonenumber,
        $idworkzone,
        $imgprofile,
        $imgportada
    ){
        $insertStr = "INSERT INTO user_details (usercod, firstname, lastname, address, phonenumber, idworkzone, imgprofile, imgportada) VALUES (:usercod, :firstname, :lastname, :address, :phonenumber, :idworkzone, :imgprofile, :imgportada)";
        $params = array(
            "usercod" => $usercod, 
            "firstname" => $firstname, 
            "lastname" => $lastname, 
            "address" => $address, 
            "phonenumber" => $phonenumber, 
            "idworkzone" => $idworkzone, 
            "imgprofile" => $imgprofile, 
            "imgportada" => $imgportada
        );
        return self::executeNonQuery($insertStr,$params);
    }

    public static function getAllInnerProducts(){
        $selectSql = "SELECT u.usercod,ud.iduserdetail,wz.idworkzone,ud.firstname,ud.lastname,u.username, ud.address,ud.phonenumber,m.municipality,d.department,ud.imgprofile,ud.imgportada
        from user_details ud
        inner join usuario u on u.usercod=ud.usercod
        inner join work_zones wz on wz.idworkzone=ud.idworkzone
        inner join municipalities m on m.idmunicipality=wz.idmunicipality
        inner join departments d on d.iddepto=wz.iddepto";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getAllWorkZones(){
        $selectSql = "SELECT wz.idworkzone,d.department,m.municipality
        from work_zones wz
        inner join municipalities m on m.idmunicipality=wz.idmunicipality
        inner join departments d on d.iddepto=wz.iddepto";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getAllUserDetails(){
        $selectSql = "SELECT * FROM user_details";
        return self::obtenerRegistros($selectSql, array());
    }
    public static function getUserDetailById($iduserdetail){
        $selectSql = "SELECT * FROM user_details WHERE iduserdetail=:iduserdetail;";
        return self::obtenerUnRegistro($selectSql, array(
            "iduserdetail"=>$iduserdetail
        ));
    }
    //get all table usuario
    public static function getAllUsers(){
        $selectSql = "SELECT * FROM usuario";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function UpdateUserDetails(
        $usercod,
        $firstname,
        $lastname,
        $address,
        $phonenumber,
        $idworkzone,
        $imgprofile,
        $imgportada,
        $iduserdetail
    ){
        $insertStr = "UPDATE user_details set usercod=:usercod, firstname=:firstname, lastname=:lastname, address=:address, phonenumber=:phonenumber, idworkzone=:idworkzone, imgprofile=:imgprofile, imgportada=:imgportada WHERE iduserdetail=:iduserdetail";
        $params = array(
            "usercod" => $usercod, 
            "firstname" => $firstname, 
            "lastname" => $lastname, 
            "address" => $address, 
            "phonenumber" => $phonenumber, 
            "idworkzone" => $idworkzone, 
            "imgprofile" => $imgprofile, 
            "imgportada" => $imgportada,
            "iduserdetail" => $iduserdetail,
        );
        return self::executeNonQuery($insertStr,$params);
    }
    public static function DeleteUserDetail($iduserdetail){
        $deleteStr = "DELETE FROM user_details WHERE iduserdetail=:iduserdetail;";
        return self::executeNonQuery($deleteStr, array("iduserdetail"=>$iduserdetail));
    }
}
