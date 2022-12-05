<?php 
namespace Dao\Mnt;

use Dao\Table;

class Suscriptions extends Table{
    public static function getAllSuscriptions(){
        $strSql = "SELECT  s.*, ud.usercod  , concat(ud.firstname, ' ', ud.lastname) fullname  FROM suscriptions s
        JOIN providers p ON p.idsuscription = s.idsuscription 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail ;";
        return self::obtenerRegistros($strSql, array());
    }

    public static function getSuscriptionById($idsuscription){
        $strSql = "SELECT  s.*, ud.usercod  , concat(ud.firstname, ' ', ud.lastname) fullname  FROM suscriptions s
        JOIN providers p ON p.idsuscription = s.idsuscription 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail 
        WHERE p.idsuscription = :idsuscription;";
        return self::obtenerUnRegistro($strSql, array("idsuscription" => $idsuscription));
    }

    public static function insertSuscription($idprovider, $days){
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

        
        $idsuscription = self::getLastId();

        $strSql = "UPDATE providers SET idsuscription = :idsuscription WHERE idprovider = :idprovider";
        self::executeNonQuery(
            $strSql,
            array(
                "idsuscription" => $idsuscription["idsuscription"],
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
                "bitdescripcion" => "Compra de suscripcion de ".$days." dias",
                "bitTipo" => "HIS",
                "bitusuario" => $usercod["usercod"]
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
        return self::executeNonQuery(
            $strSql,
            array(
                "enddate" => date("Y-m-d H:i:s"),
                "idsuscription" => $idsuscription
            )
        );

    }

    public static function getLastId(){
        $strSql = "SELECT MAX(idsuscription) AS idsuscription FROM suscriptions";
        return self::obtenerUnRegistro($strSql, array());
    }

    public static function getActiveSuscriptionByDate($idprovider){
        $strSql = "SELECT * FROM suscriptions s
        JOIN providers p on s.idsuscription = p.idsuscription 
        where p.idprovider  = :idprovider AND s.enddate >= NOW()";
        $return = self::obtenerUnRegistro($strSql, array("idprovider" => $idprovider));

        return (count($return) > 0) ? true : false;
    }
}
?>