<?php 
namespace Dao\Verification;
use Dao\Table;
/**
 * DAO, para verificado.
 * 
 * @author Javier T. Castejón
 * 
 * @version 1.0.0
 */
class Verified extends Table{
    
    /**
     * Si el usuario está verificado, devuelve verdadero, de lo contrario, devuelve falso.
     * 
     * @param int iduserdetail ID del usuario logueado.
     * 
     * @return bool 1 o 0 si esta verificado o no.
     * @author Elvis Rodesno
     * @author Javier T. Castejón
     */
    public static function isVerified($iduserdetail){
        $selectSql = "SELECT * FROM user_details ud
        JOIN usuario u ON u.usercod =ud.usercod 
        JOIN user_verifications uv ON u.usercod = uv.usercod 
        WHERE uv.statusprocess = 'VERIFICADO'
        AND ud.iduserdetail =:iduserdetail;";
        
        return (self::obtenerUnRegistro($selectSql, array("iduserdetail"=>$iduserdetail))) ? true : false;
    }

    public static function statusProcess($usercod){
        $selectSql = "SELECT * FROM user_verifications 
        WHERE usercod =:usercod;";
        
        return (self::obtenerUnRegistro($selectSql, array("usercod"=>$usercod))["statusprocess"]);
    }
}
?>