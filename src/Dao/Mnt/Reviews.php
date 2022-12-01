<?php
namespace Dao\Mnt;

use Dao\Table;
use DateTime;

class Reviews extends Table{
    public static function addReview($iduserdetail,$title,$review){
        $insertSQL= "INSERT INTO reviews_pag (iduserdetail, title, review)
        values(:iduserdetail, :title, :review);";
        $params=array(
            "iduserdetail"=>$iduserdetail,
            "title"=>$title,
            "review"=>$review
        );
        return self::executeNonQuery($insertSQL, $params);
    }

    public static function getAllReviews(){
        $selectSql  = "SELECT * FROM reviews_pag;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($idservice){
        $selectStr = "SELECT * FROM reviews_pag WHERE idreviewpage=:idreviewpage; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("idreviewpage"=>$idservice)
        );
    }
    public static function updateReview($iduserdetail,$title,$review, $idreviewpage){
        $updateSql= "UPDATE reviews_pag SET iduserdetail=:iduserdetail, title=:title, review=:review
         WHERE idreviewpage=:idreviewpage;";
        $params=array(
            "iduserdetail"=>$iduserdetail,
            "title"=>$title,
            "review"=>$review,
            "idreviewpage"=>$idreviewpage
        );
        return self::executeNonQuery($updateSql, $params);
    }

    public static function deleteReview($idreviewpage){
        $deleteStr= "DELETE FROM reviews_pag WHERE idreviewpage=:idreviewpage;";
        return self::executeNonQuery($deleteStr, array("idreviewpage" => $idreviewpage));
    }


}
?>