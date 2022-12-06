<?php 
namespace Dao\Cart;
use Dao\Table;

class Carts extends Table
{
    public static function addCart($usercod, $idprice, $crrcant, $crrprice, $created, $updated){
        $sqlstr = "INSERT INTO cart (usercod, idprice, crrcant, crrprice, created, updated) 
        VALUES (:usercod, :idprice, :crrcant, :crrprice, :created, :updated);";
        $parameters = array(
            "usercod" => $usercod,
            "idprice" => $idprice,
            "crrcant" => $crrcant,
            "crrprice" => $crrprice,
            "created" => $created,
            "updated" => $updated
        );
        return self::executeNonQuery($sqlstr, $parameters);
    }

    public static function getQtyInvoices($usercod){
        $sqlstr = "SELECT COUNT(idcart) 'qty' FROM cart where usercod = :usercod ";
        return self::obtenerUnRegistro($sqlstr, array("usercod" => $usercod))["qty"];
        // return 3;
    }

    public static function getInvoicesByUserId($usercod){
        $sqlstr = "SELECT c.*,p.aplication,p.type FROM cart C
        inner join prices p 
        on c.idprice = p.idprice 
        where usercod = :usercod";
        return self::obtenerRegistros($sqlstr, array("usercod" => $usercod));
    }

    public static function getCardById($idcart){
        $sqlstr = "SELECT * FROM cart WHERE idcart = :idcart";
        return self::obtenerUnRegistro($sqlstr, array("idcart" => $idcart));
    }

    public static function deleteCartById($idcart){
        $sqlstr = "DELETE FROM cart WHERE idcart = :idcart";
        return self::executeNonQuery($sqlstr, array("idcart" => $idcart));
    }
}

?>