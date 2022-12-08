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

    public static function allUser(){
        $joinI= "select rev.idreviewpage, u.firstname, rev.title, rev.review
        from reviews_pag rev
        inner join  user_details u on u.iduserdetail = rev.iduserdetail";
        $rev=self::obtenerRegistros($joinI, array());

        return $rev;
    }

    public static function getUserdetail(){
        $selectStr = "Select * from user_details";
        return self::obtenerRegistros($selectStr, array());
    }


    public static function getAllReviews(){
        $selectSql  = "SELECT * FROM reviews_pag;";
        return self::obtenerRegistros($selectSql ,array());
    }

    public static function getById($idreviewpage){
        $selectStr = "SELECT * FROM reviews_pag WHERE idreviewpage=:idreviewpage; ";
        return self::obtenerUnRegistro(
            $selectStr,
            array("idreviewpage"=>$idreviewpage)
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