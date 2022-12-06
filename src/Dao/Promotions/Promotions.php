<?php 
namespace Dao\Promotions;
use Dao\Table;

class Promotions extends Table
{
    public static function getAllPromotions($idprovider){

        /* $sqlstr = "UPDATE promotions SET status = 'FIN'
        WHERE enddate <= NOW() AND status = 'ACT'"; 
        self::executeNonQuery($sqlstr, []); */

        $sqlstr = "SELECT * FROM promotions 
        WHERE idprovider = :idprovider AND status != 'INA' ORDER BY idpromotion DESC;";
        return self::obtenerRegistros($sqlstr, ["idprovider" => $idprovider]);
        
    }

    public static function getLastPromotionPrice(){
        $sqlstr = "SELECT * FROM prices WHERE type = 'PRO' AND status = 'ACT'";
        return self::obtenerUnRegistro($sqlstr, array()); 
    }

    public static function insertPromotionQuery($idprovider, $promotionname, $startdate, $enddate, $billed){
        $sqlstr = "INSERT INTO promotions (idprovider, promotionname, startdate, enddate, billed, idprice) VALUES (:idprovider, :promotionname, :startdate, :enddate, :billed, '2');";
        return self::executeNonQuery($sqlstr, ["idprovider" => $idprovider, "promotionname" => $promotionname, "startdate" => $startdate, "enddate" => $enddate, "billed" => $billed]);
    }


    public static function checkPromotion($idpromotion){
        $sqlstr = "UPDATE promotions SET status = 'ACT' WHERE idpromotion = :idpromotion";
        return self::executeNonQuery($sqlstr, ["idpromotion" => $idpromotion]);
    }
    
}

?>