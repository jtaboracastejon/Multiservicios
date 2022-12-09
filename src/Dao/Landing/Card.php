<?php 
namespace Dao\Landing;
use Dao\Table;

class Card extends Table{

    public static function getTimeAgo($date){
        $time_ago = strtotime($date);
        $current_time = time();
        $time_difference = $current_time - $time_ago;
        $seconds = $time_difference;
        $minutes      = round($seconds / 60 );           // value 60 is seconds  
        $hours           = round($seconds / 3600);           //value 3600 is 60 minutes * 60 sec  
        $days          = round($seconds / 86400);          //86400 = 24 * 60 * 60;  
        $weeks          = round($seconds / 604800);          // 7*24*60*60;  
        $months          = round($seconds / 2629440);     //((365+365+365+365+366)/5/12)*24*60*60  
        $years          = round($seconds / 31553280);     //(365+365+365+365+366)/5 * 24 * 60 * 60  
        if($seconds <= 60){
            return "Justo ahora";
        }else if($minutes <=60){
            if($minutes==1){
                return "un minuto";
            }else{
                return "$minutes minutos";
            }
        }else if($hours <=24){
            if($hours==1){
                return "una hora";
            }else{
                return "$hours horas";
            }
        }else if($days <= 7){
            if($days==1){
                return "un día";
            }else{
                return "$days días";
            }
        }else if($weeks <= 4.3){ //4.3 == 52/12  
            if($weeks==1){
                return "una semana";
            }else{
                return "$weeks semanas";
            }
        }else if($months <=12){
            if($months==1){
                return "un mes";
            }else{
                return "$months meses";
            }
        }else{
            if($years==1){
                return "un año";
            }else{
                return "$years años";
            }
        }
    }
    public static function getCardRandom($cantidad){
        $selectSql = "SELECT ud.iduserdetail, ud.firstname ,ud.lastname , s.servicename ,ud.imgprofile, ud.imgportada , p.decription ,p.datecreate , p.idprovider
        FROM providers p 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN services s ON s.idservice = p.idservice
        WHERE p.status = 'ACT'
        ORDER BY RAND() LIMIT :cantidad";
        return self::obtenerRegistros($selectSql, array("cantidad"=>$cantidad));
    }

    public static function getCardRandomByService($cantidad, $idservice){
        $selectSql = "SELECT ud.iduserdetail, ud.firstname ,ud.lastname , s.servicename ,ud.imgprofile, ud.imgportada , p.decription ,p.datecreate , p.idprovider
        FROM providers p 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN services s ON s.idservice = p.idservice
        WHERE s.idservice = :idservice
        ORDER BY RAND() LIMIT :cantidad";
        return self::obtenerRegistros($selectSql, array("cantidad"=>$cantidad, "idservice"=>$idservice));
    }

    public static function isVerified($iduserdetail){
        $selectSql = "SELECT * FROM user_details ud
        JOIN usuario u ON u.usercod =ud.usercod 
        JOIN user_verifications uv ON u.usercod = uv.usercod 
        WHERE uv.statusprocess = 'VERIFICADO'
        AND ud.iduserdetail =:iduserdetail;";
        
        return (self::obtenerUnRegistro($selectSql, array("iduserdetail"=>$iduserdetail))) ? true : false;
    }

    /* public static function isSuscripter($iduserdetail){
        $selectSql = "SELECT * FROM user_details ud
        JOIN usuario u ON u.usercod =ud.usercod
        JOIN suscription s ON u.usercod = s.usercod
        WHERE s.fechaexp >= CURDATE()
        AND ud.iduserdetail =:iduserdetail;";
        
        return (self::obtenerUnRegistro($selectSql, array("iduserdetail"=>$iduserdetail))) ? true : false;
    } */

    public static function isPromotion($iduserdetail){
        $selectSql = "SELECT * FROM providers p 
        JOIN promotions pr on pr.idprovider  = p.idprovider 
        where pr.enddate >= NOW() and p.iduserdetail = :iduserdetail;";
        return (self::obtenerUnRegistro($selectSql, array("iduserdetail"=>$iduserdetail))) ? true : false;
    }

    //Search Section

    public static function getCardByProvider($l1,$l2,$query){
        $strSql = "SELECT ud.iduserdetail, ud.firstname ,ud.lastname , s.servicename ,ud.imgprofile, ud.imgportada , p.decription ,p.datecreate, p.idprovider
        FROM providers p 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN services s ON s.idservice = p.idservice
        WHERE p.status = 'ACT' AND  ud.firstname LIKE :like ORDER BY p.iduserdetail DESC LIMIT :l1 , :l2 ;";
        return self::obtenerRegistros(
            $strSql, 
            array(
                "l1" => intval($l1),
                "l2" => intval($l2),
                "like" => "%$query%"
            ));
    }

    public static function getCardByService($l1,$l2,$query){
        $strSql = "SELECT ud.iduserdetail, ud.firstname ,ud.lastname , s.servicename ,ud.imgprofile, ud.imgportada , p.decription ,p.datecreate, p.idprovider
        FROM providers p 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN services s ON s.idservice = p.idservice
        WHERE p.status = 'ACT' AND  s.idservice = :like ORDER BY p.iduserdetail DESC LIMIT :l1 , :l2 ;";
        return self::obtenerRegistros(
            $strSql, 
            array(
                "l1" => intval($l1),
                "l2" => intval($l2),
                "like" => "$query"
            ));
    }

    public static function getCardByQueryAndService($l1,$l2,$query,$service){
        $strSql = "SELECT ud.iduserdetail, ud.firstname ,ud.lastname , s.servicename ,ud.imgprofile, ud.imgportada , p.decription ,p.datecreate, p.idprovider 
        FROM providers p 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN services s ON s.idservice = p.idservice
        WHERE p.status = 'ACT' AND  s.idservice LIKE :idservice AND ud.firstname LIKE :like ORDER BY p.iduserdetail DESC LIMIT :l1 , :l2 ;";
        return self::obtenerRegistros(
            $strSql, 
            array(
                "l1" => intval($l1),
                "l2" => intval($l2),
                "idservice" => $service,
                "like" => "%$query%"
            ));
    }

}
?>