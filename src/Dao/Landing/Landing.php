<?php 
namespace Dao\Landing;
use Dao\Table;

class Landing extends Table{
    //Funcion que trae todos los servicios de la base de datos
    public static function getAllServices(){
        $selectSql = "SELECT * FROM services WHERE status = 'ACT'";
        return self::obtenerRegistros($selectSql, array());
    }


    //Funcion que trae una review random de la tabla reviews_pag
    public static function getReviewPage(){
        $selectSql = "SELECT ud.firstname, ud.lastname, ud.address ,rp.title ,rp.review FROM reviews_pag rp 
        JOIN user_details ud ON ud.iduserdetail  = rp.idreviewpage  
        ORDER BY RAND() LIMIT 1";
        return self::obtenerUnRegistro($selectSql, array());
    }

    //Funcion que retorna el primer nombre y el primer apellido de un usuario
    public static function split_name($firstname, $lastname){
        $split_firstname = explode(" ", $firstname);
        $split_lastname = explode(" ", $lastname);
        return ($split_firstname[0] . " " . $split_firstname[1] . " " . $split_lastname[0]);
    }
}
?>