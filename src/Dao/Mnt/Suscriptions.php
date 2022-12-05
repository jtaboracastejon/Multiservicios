<?php 
namespace Dao\Mnt;

use Dao\Table;

class Suscriptions extends Table{
    public static function getAllSuscriptions(){
        $strSql = "SELECT * FROM suscriptions s
        JOIN usuario u ON u.idsuscription  = s.idsuscription ";
        return self::obtenerRegistros($strSql, array());
    }

    public static function getSuscriptionById($idsuscription){
        $strSql = "SELECT  s.*, u.username, u.usercod, u.idsuscription FROM suscriptions s
        JOIN usuario u ON u.idsuscription  = s.idsuscription 
        WHERE u.idsuscription = :idsuscription;";
        return self::obtenerUnRegistro($strSql, array("idsuscription" => $idsuscription));
    }

    public static function insertSuscription($usercod, $days){
        $startdate = date("Y-m-d H:i:s");
        $enddate = date("Y-m-d H:i:s", strtotime("+".$days." days"));
        $strSql = "INSERT INTO suscriptions (startdate, enddate) VALUES (:startdate, :enddate)";
        self::executeNonQuery(
            $strSql,
            array(
                "startdate" => $startdate,
                "enddate" => $enddate
            )
        );

        $strSql = "SELECT MAX(idsuscription) AS idsuscription FROM suscriptions";
        $idsuscription = self::obtenerUnRegistro($strSql, array());

        $strSql = "UPDATE usuario SET idsuscription = :idsuscription WHERE usercod = :usercod";
        self::executeNonQuery(
            $strSql,
            array(
                "idsuscription" => $idsuscription["idsuscription"],
                "usercod" => $usercod
            )
        );

        $strSql = "INSERT INTO bitacora (bitacorafch, bitdescripcion, bitTipo, bitusuario) VALUES (:bitacorafch, :bitdescripcion, :bitTipo, :bitusuario)";
        return self::executeNonQuery(
            $strSql,
            array(
                "bitacorafch" => date("Y-m-d H:i:s"),
                "bitdescripcion" => "Compra de suscripcion de ".$days." dias",
                "bitTipo" => "HIS",
                "bitusuario" => $usercod
            )
        );
    }

    public static function updateSuscription($idsuscription, $usercod, $days){
        $startdate = date("Y-m-d H:i:s");
        $enddate = date("Y-m-d H:i:s", strtotime("+".$days." days"));

        $strSql = "UPDATE suscriptions SET startdate = :startdate, enddate = :enddate WHERE idsuscription = :idsuscription";
        self::executeNonQuery(
            $strSql,
            array(
                "startdate" => $startdate,
                "enddate" => $enddate,
                "idsuscription" => $idsuscription
            )
        );

        $strSql = "INSERT INTO bitacora (bitacorafch, bitdescripcion, bitTipo, bitusuario) VALUES (:bitacorafch, :bitdescripcion, :bitTipo, :bitusuario)";
        return self::executeNonQuery(
            $strSql,
            array(
                "bitacorafch" => date("Y-m-d H:i:s"),
                "bitdescripcion" => "Renovación de suscripcion de ".$days." dias",
                "bitTipo" => "HIS",
                "bitusuario" => $usercod
            )
        );



        
    }

    public static function deleteSuscription($idsuscription){
        $strSql = "UPDATE suscriptions SET enddate = :enddate WHERE idsuscription = :idsuscription";
        self::executeNonQuery(
            $strSql,
            array(
                "enddate" => date("Y-m-d H:i:s"),
                "idsuscription" => $idsuscription
            )
        );

        $strSql = "DELETE FROM suscriptions WHERE idsuscription = :idsuscription";
        return self::executeNonQuery(
            $strSql,
            array(
                "idsuscription" => $idsuscription
            )
        );
    }

    public static function getLastId(){
        $strSql = "SELECT MAX(idsuscription) AS idsuscription FROM suscriptions";
        return self::obtenerUnRegistro($strSql, array());
    }

    public static function getActiveSuscriptionByDate($usercod){
        $strSql = "SELECT * FROM suscriptions s
        JOIN usuario u ON u.idsuscription  = s.idsuscription  
        WHERE u.usercod = :usercod AND s.enddate >= NOW()";
        return self::obtenerUnRegistro($strSql, array("usercod" => $usercod));

    }
}
?>