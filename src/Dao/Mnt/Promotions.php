<?php 
namespace Dao\Mnt;

use Dao\Table;

class Promotions extends Table{
    public static function getAllPromotions(){
        $strSql = "SELECT  s.*, ud.usercod  , concat(ud.firstname, ' ', ud.lastname) fullname  FROM promotions s
        JOIN providers p ON p.idpromotion = s.idpromotion 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail ;";
        return self::obtenerRegistros($strSql, array());
    }

    public static function getPromotionById($idpromotion){
        $strSql = "SELECT  s.*, ud.usercod  , concat(ud.firstname, ' ', ud.lastname) fullname  FROM promotions s
        JOIN providers p ON p.idpromotion = s.idpromotion 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail 
        WHERE p.idpromotion = :idpromotion;";
        return self::obtenerUnRegistro($strSql, array("idpromotion" => $idpromotion));
    }

    public static function insertPromotion($idprovider, $days){
        $startdate = date("Y-m-d H:i:s");
        $enddate = date("Y-m-d H:i:s", strtotime("+".$days." days"));
        $strSql = "INSERT INTO promotions (startdate, enddate) VALUES (:startdate, :enddate)";
        self::executeNonQuery(
            $strSql,
            array(
                "startdate" => $startdate,
                "enddate" => $enddate
            )
        );

        
        $idpromotion = self::getLastId();

        $strSql = "UPDATE providers SET idpromotion = :idpromotion WHERE idprovider = :idprovider";
        self::executeNonQuery(
            $strSql,
            array(
                "idpromotion" => $idpromotion["idpromotion"],
                "idprovider" => $idprovider
            )
        );

        $strSql = "SELECT usercod FROM user_details ud 
        JOIN providers p ON p.iduserdetail = ud.iduserdetail 
        WHERE p.idprovider = :idprovider";
        $usercod = self::obtenerUnRegistro($strSql, array("idprovider" => $idprovider));

        $strSql = "INSERT INTO bitacora (bitacorafch, bitdescripcion, bitTipo, bitusuario) VALUES (:bitacorafch, :bitdescripcion, :bitTipo, :bitusuario)";
        return self::executeNonQuery(
            $strSql,
            array(
                "bitacorafch" => date("Y-m-d H:i:s"),
                "bitdescripcion" => "Compra de promocion de ".$days." dias",
                "bitTipo" => "HIS",
                "bitusuario" => $usercod["usercod"]
            )
        );
    }

    public static function updatePromotion($idpromotion, $usercod, $days){
        $startdate = date("Y-m-d H:i:s");
        $enddate = date("Y-m-d H:i:s", strtotime("+".$days." days"));

        $strSql = "UPDATE promotions SET startdate = :startdate, enddate = :enddate WHERE idpromotion = :idpromotion";
        self::executeNonQuery(
            $strSql,
            array(
                "startdate" => $startdate,
                "enddate" => $enddate,
                "idpromotion" => $idpromotion
            )
        );

        $strSql = "INSERT INTO bitacora (bitacorafch, bitdescripcion, bitTipo, bitusuario) VALUES (:bitacorafch, :bitdescripcion, :bitTipo, :bitusuario)";
        return self::executeNonQuery(
            $strSql,
            array(
                "bitacorafch" => date("Y-m-d H:i:s"),
                "bitdescripcion" => "Renovación de promocion de ".$days." dias",
                "bitTipo" => "HIS",
                "bitusuario" => $usercod
            )
        );



        
    }

    public static function deletePromotion($idpromotion){
        $strSql = "UPDATE promotions SET enddate = :enddate WHERE idpromotion = :idpromotion";
        return self::executeNonQuery(
            $strSql,
            array(
                "enddate" => date("Y-m-d H:i:s"),
                "idpromotion" => $idpromotion
            )
        );

    }

    public static function getLastId(){
        $strSql = "SELECT MAX(idpromotion) AS idpromotion FROM promotions";
        return self::obtenerUnRegistro($strSql, array());
    }

    public static function getActivePromotionByDate($idprovider){
        $strSql = "SELECT * FROM promotions s
        JOIN providers p on s.idpromotion = p.idpromotion 
        where p.idprovider  = :idprovider AND s.enddate >= NOW()";
        $return = self::obtenerUnRegistro($strSql, array("idprovider" => $idprovider));

        return (count($return) > 0) ? true : false;
    }
}
?>