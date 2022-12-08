<?php 
namespace Dao\Providers;
use Dao\Table;

class Providers extends Table{
    //Query
    public static function getCountAllByProviders($query){
        $strSql = "SELECT * FROM providers p 
        JOIN  user_details ud ON ud.iduserdetail = p.iduserdetail
        WHERE p.status = 'ACT' AND ud.firstname  LIKE :like";
        return count(self::obtenerRegistros($strSql, array( "like" => "%$query%")));
    }

    public static function getCountAllByServices($query){
        $strSql = "SELECT * FROM services WHERE status = 'ACT' AND servicename  like :like";
        return count(self::obtenerRegistros($strSql, array( "like" => "%$query%")));
    }

    //Services
    public static function getCountAllByServicesId($query, $idworkzone){
        $strSql = "SELECT * FROM providers p 
        JOIN  services s ON s.idservice = p.idservice
        JOIN  user_details ud ON ud.iduserdetail = p.iduserdetail
        WHERE p.status = 'ACT' AND s.idservice = :idservice AND ud.idworkzone = :idworkzone";
        return count(self::obtenerRegistros($strSql, array( "idservice" => $query, "idworkzone" => $idworkzone)));
    }

    //Query and Services
    public static function getCountDataByQueryAndService($service, $query, $idworkzone){
        $strSql = "SELECT * FROM providers p 
        JOIN  user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN  services s ON s.idservice = p.idservice
        WHERE p.status = 'ACT' AND s.idservice = :idservice AND ud.firstname  LIKE :like AND ud.idworkzone = :idworkzone";
        return count(self::obtenerRegistros($strSql, array( "idservice" => $service, "like" => "%$query%", "idworkzone" => $idworkzone)));
    }

}
?>