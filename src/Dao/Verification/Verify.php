<?php 
namespace Dao\Verification;
use Dao\Table;
/**
 * DAO, para proceso de verificar.
 * 
 * @author Javier T. Castejón
 * 
 * @version 1.0.0
 */
class Verify extends Table{

    public static function insertVerification($intUserId, $strDNI, $strAddress, $strStatusProcess){
        $insertSql = "INSERT into user_verifications(userCod, DNI, address, StatusProcess, created, updated)
        VALUES(:userCod, :DNI, :address, :StatusProcess, now(), now());";
        $params = array(
            "userCod" => $intUserId,
            "DNI" => $strDNI,
            "address" => $strAddress,
            "StatusProcess" => $strStatusProcess
        );
        return self::executeNonQuery($insertSql, $params);
    }

    public static function getUserVerification($intUserId){
        $selectSql = "SELECT * FROM user_verifications WHERE usercod = :usercod;";
        return self::obtenerUnRegistro($selectSql, array("usercod"=>$intUserId));
    }


    public static function insertVerificationImgs($idverification, $dniFrontalPath, $dniPosteriorPath, $comprobanteDomicilioPath){
        $insertSql = "INSERT INTO user_verification_imgs(idverificacion, DNI_frontal, DNI_posterior, prueba_de_residencia, created, updated) 
        VALUES (:idverificacion, :DNI_frontal, :DNI_posterior, :prueba_de_residencia, now(), now());";
        $params = array(
            "idverificacion" => $idverification,
            "DNI_frontal" => $dniFrontalPath,
            "DNI_posterior" => $dniPosteriorPath,
            "prueba_de_residencia" => $comprobanteDomicilioPath
        );
        return self::executeNonQuery($insertSql, $params);
    }

    public static function getLastId(){
        $sqlstr = "SELECT MAX(idverification) idverification FROM user_verifications;";
        $verificationId=self::obtenerUnRegistro($sqlstr, array());
        return $verificationId["idverification"];
    }
}
?>