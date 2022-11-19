<?php 
namespace Dao\Mnt;

use Dao\Table;

class Quotes extends Table{
    public static function AgregarQuote($quote, $author, $status){
        $sqlstr = "INSERT INTO quotes (quote, author, status, created, updated) VALUES (:quote, :author, :status, now(),now());";
        $params = array(
            "quote" => $quote,
            "author" => $author,
            "status" => $status
        );
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function getAllQuotes(){
        $selectSql = "SELECT * FROM quotes;";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getById($quoteId){
        $selectSql = "SELECT * FROM quotes WHERE quoteId=:quoteId;";
        return self::obtenerUnRegistro($selectSql, array(
            "quoteId"=>$quoteId
        ));
    }

    public static function ActualizarQuote($quoteId, $quote, $author, $status){
        $updateSrt="UPDATE quotes SET quote=:quote, author=:author, status=:status, updated=now() WHERE quoteId=:quoteId";
        $params = array(
            "quoteId" => $quoteId,
            "quote" => $quote,
            "author" => $author,
            "status" => $status
        );
        return self::executeNonQuery($updateSrt, $params);
    }

    public static function EliminarQuote($quoteId){
        $deleteStr = "DELETE FROM quotes WHERE quoteId=:quoteId;";
        return self::executeNonQuery($deleteStr, array("quoteId"=>$quoteId));
    }
}
?>