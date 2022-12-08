<?php
namespace Dao\Transactions;
use Dao\Table;

class Transactions extends Table{

    public static function getAllTransactionsByUserId($usercod){
        $sqlStr = "SELECT t.*, p.aplication, p.billedsdays, p.type FROM transactions t 
        INNER JOIN prices p 
        ON t.idprice = p.idprice
        WHERE t.usercod = :usercod";

        $parameters = array(
            "usercod" => $usercod
        );

        return self::obtenerRegistros($sqlStr, $parameters);
    }
}

?>