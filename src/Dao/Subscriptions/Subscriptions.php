<?php 
namespace Dao\Subscriptions;
use Dao\Table;

class Subscriptions extends Table
{
    public static function getAllSubscriptionsPlans(){
        $sqlstr = "SELECT * FROM prices WHERE status = 'ACT' AND type = 'SUS' ORDER BY price ASC;";
        return self::obtenerRegistros($sqlstr, array());
    }

    public static function getSubcriptionPlanPriceById($idprice){
        $sqlstr = "SELECT * FROM prices WHERE idprice = :idprice AND status = 'ACT' AND type = 'SUS';";
        return self::obtenerUnRegistro($sqlstr, ["idprice" => $idprice]);
    }

    public static function insertSubscription($idprovider, $startdate, $enddate, $billed, $idPrice){
        
        $sqlstr = "INSERT INTO nw202203.subscriptions
        (idprovider, startdate, enddate, billed, idprice)
        VALUES(:idprovider, :startdate, :enddate, :billed, :idprice);";
        $parameters = [
            "idprovider" => $idprovider,
            "startdate" => $startdate,
            "enddate" => $enddate,
            "billed" => $billed,
            "idprice" => $idPrice
        ];
        return self::executeNonQuery($sqlstr,  $parameters);
    }

    public static function getLastSubId(){
        $sqlstr = "SELECT MAX(idsubscription) 'idsubscription' FROM subscriptions";
        return self::obtenerUnRegistro($sqlstr, array())["idsubscription"];
    }

    public static function updateSubscriptionStatus($idSubscription, $status){
        $sqlstr = "UPDATE subscriptions SET status = :status WHERE idsubscription = :idsubscription";
        return self::executeNonQuery($sqlstr, ["idsubscription" => $idSubscription, "status" => $status]);
    }
}