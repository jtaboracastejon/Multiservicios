<?php
namespace Dao\Providers;
use Dao\Table;

class Providers extends Table
{
    public static function addProvider(
        $iduserdetail,
        $idservice,
        $decription,
        $status
    ){
        $insertStr = "INSERT INTO providers (iduserdetail, idservice, decription, status) VALUES (:iduserdetail, :idservice, :decription, :status);";
        $insertParams = [
            "iduserdetail" => $iduserdetail,
            "idservice" => $idservice,
            "decription" => $decription,
            "status" => $status
        ];  
        return self::executeNonQuery($insertStr, $insertParams);
    }


    //obtener toda la tabla userdetails
    public static function getAllUserDetails()
    {
        $selectStr = "SELECT * FROM user_details;";
        return self::obtenerRegistros($selectStr, array());
    }



    public static function getAllServices()
    {
        $strSql = "SELECT * FROM services";
        return self::obtenerRegistros($strSql, array());
    }

    public static function getAllProviders(){
        $selectSql = "SELECT * FROM providers";
        return self::obtenerRegistros($selectSql, array());
    }

   /*  public static function getProviderById($idprovider){
        $selectSql = "SELECT * FROM providers WHERE idprovider = :idprovider";
        $selectParams = [
            "idprovider" => $idprovider
        ];
        return self::obtenerUnRegistro($selectSql, $selectParams);
    }
 */
    public static function updateProvider(
        $idprovider,
        $iduserdetail,
        $idservice,
        $decription,
        $status
    ){
        $updateStr = "UPDATE providers SET iduserdetail = :iduserdetail, idservice = :idservice, decription = :decription, status = :status WHERE idprovider = :idprovider;";
        $updateParams = [
            "idprovider" => $idprovider,
            "iduserdetail" => $iduserdetail,
            "idservice" => $idservice,
            "decription" => $decription,
            "status" => $status
        ];
        return self::executeNonQuery($updateStr, $updateParams);
    }

    public static function deleteProvider($idprovider){
        $deleteStr = "DELETE FROM providers WHERE idprovider = :idprovider;";
        $deleteParams = [
            "idprovider" => $idprovider
        ];
        return self::executeNonQuery($deleteStr, $deleteParams);
    }


    /////////////////////////////Para la seccion de providers reviews/////////////////////////////
    public static function reviews_prov(){
        $selectSql = "SELECT * FROM reviews_prov";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getCard($idprovider){
        $selectSql = "SELECT ud.iduserdetail, ud.firstname ,ud.lastname , s.servicename ,ud.imgprofile, ud.imgportada , p.decription ,p.datecreate 
        FROM providers p 
        JOIN user_details ud ON ud.iduserdetail = p.iduserdetail
        JOIN services s ON s.idservice = p.idservice
        WHERE p.idprovider = :idprovider";

        return self::obtenerRegistros($selectSql, array("idprovider"=>$idprovider));
    }

    public static function InnerReview($idprovider){
        $selectSql = "SELECT rp.title, rp.review, ud.firstname, ud.lastname, wz.idworkzone,d.department, m.municipality, rp.rating
        from reviews_prov rp
        inner join user_details ud on ud.iduserdetail = rp.iduserdetail
        inner join work_zones wz on wz.idworkzone = ud.idworkzone
        inner join departments d on d.iddepto = wz.iddepto
        inner join municipalities m on m.idmunicipality = wz.idmunicipality
        WHERE idprovider = :idprovider";
        return self::obtenerRegistros($selectSql, array("idprovider"=>$idprovider));
    }

   
    public static function getProviderById($id){
        $selectSql = "SELECT * FROM providers WHERE idprovider=:idprovider;";
        return self::obtenerUnRegistro($selectSql, array(
            "idprovider"=>$id
        ));
    }
    
}
