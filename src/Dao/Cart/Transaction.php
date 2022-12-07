<?php 
namespace Dao\Cart;
use Dao\Table;

class Transaction extends Table
{
    public static function insertCartToTransaction($orderId, $cartItem){
        $sqlstr = "INSERT INTO transactions
        (usercod, idprice, crrcant, crrprice, created, updated, triggeredId, triggeredTable, paypalOrderId)
        VALUES(:usercod, :idprice, :crrcant, :crrprice, now(), now(), :triggeredId, :triggeredTable, :paypalOrderId);";
        
        $parameters = array(
            "usercod"  => $cartItem["usercod"], 
            "idprice"  => $cartItem["idprice"], 
            "crrcant"  => $cartItem["crrcant"],
            "crrprice" => $cartItem["crrprice"], 
            "triggeredId"  => $cartItem["triggerId"], 
            "triggeredTable"   => $cartItem["triggerableTable"],
            "paypalOrderId"   => $orderId,
        );

        return self::executeNonQuery($sqlstr, $parameters);
    }
}