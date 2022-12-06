<?php 
namespace Dao\Reviews;
use Dao\Table;

class Review extends Table
{
//////////////////funciones para el crud de pro_reviews/////////////////////
    public static function AddProReview(
        $idordenfac,
        $titulo,
        $rating
    ){
        $insertStr = "INSERT INTO pro_reviews (idordenfac, titulo, rating) VALUES (:idordenfac, :titulo, :rating);";
        $params = array(
            "idordenfac" => $idordenfac,
            "titulo" => $titulo,
            "rating" => $rating
        );
        return self::executeNonQuery($insertStr,$params);
    }
    public static function getInnerAll(){
        $sqlst = "select q.idqualities,pr.idreview,pr.titulo, pr.rating,q.time,q.knowledge,q.attitude,q.communication,q.puntuality,q.responsibility
        from qualities_prov q
        inner join pro_reviews pr on pr.idreview=q.idreview;";
        return self::obtenerRegistros($sqlst, array());
    }
    public static function getAllRevProReview(){
        $selectSql = "SELECT * FROM pro_reviews";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function updateWithInner(
        $idqualities,
        $titulo,
        $rating,
        $time,
        $knowledge,
        $attitude,
        $communication,
        $puntuality,
        $responsibility
    ){
        $insertStr = "UPDATE pro_reviews pr inner join qualities_prov q on q.idreview=pr.idreview
        set
         pr.titulo=:titulo,
         pr.rating=:rating,
         time=:time,
         knowledge=:knowledge,
         attitude=:attitude,
         communication=:communication,
         puntuality=:puntuality,
         responsibility=:responsibility
         where idqualities=:idqualities;";
        $params = array(
            "idqualities" => $idqualities,
            "titulo" => $titulo,
            "rating" => $rating,
            "time" => $time,
            "knowledge" => $knowledge,
            "attitude" => $attitude,
            "communication" => $communication,
            "puntuality" => $puntuality,
            "responsibility" => $responsibility
        );
        return self::executeNonQuery($insertStr,$params);
    }

    public static function DeleteProReview($idqualities){
        $deleteStr = "DELETE FROM qualities_prov WHERE idqualities=:idqualities;";
        return self::executeNonQuery($deleteStr, array("idqualities"=>$idqualities));
    }

////////////////funciones para el crud de qualities_prov////////////////////
public static function AddQualitiesProv(
    $idreview,
    $time,
    $knowledge,
    $attitude,
    $communication,
    $puntuality,
    $responsibility
){
   $insertqp="INSERT INTO qualities_prov (idreview, time, knowledge, attitude, communication, puntuality, responsibility) VALUES (:idreview, :time, :knowledge, :attitude, :communication, :puntuality, :responsibility);";
    $params = array(
         "idreview" => $idreview,
         "time" => $time,
         "knowledge" => $knowledge,
         "attitude" => $attitude,
         "communication" => $communication,
         "puntuality" => $puntuality,
         "responsibility" => $responsibility
    );
    return self::executeNonQuery($insertqp,$params);
}

public static function getAllQualitiesProv(){
    $selectSql = "SELECT * FROM qualities_prov";
    return self::obtenerRegistros($selectSql, array());
}

public static function getQualitiesProvById($idqualities){
    $selectSql = "SELECT q.idqualities,pr.idreview,pr.idordenfac,pr.titulo, pr.rating,q.time,q.knowledge,q.attitude,q.communication,q.puntuality,q.responsibility
    from qualities_prov q
    inner join pro_reviews pr on pr.idreview=q.idreview WHERE idqualities=:idqualities;";
    return self::obtenerUnRegistro($selectSql, array(
        "idqualities"=>$idqualities
    ));
}

}
