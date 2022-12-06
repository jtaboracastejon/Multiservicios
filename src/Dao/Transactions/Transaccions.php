<?php
namespace Dao\Transactions;
use Dao\Table;

class Transactions extends Table{

    public static function migrateCartToTransaction($cart){
        $sqlstr = "INSERT INTO transactions (usercod, description, idprice, crrcant, crrprice, created, updated) 
        VALUES (:usercod, :description, :idprice, :crrcant, :crrprice, :created, :updated);";
        $parameters = array(
            "usercod" => $cart["usercod"],
            "description" => $cart["description"],
            "idprice" => $cart["idprice"],
            "crrcant" => $cart["crrcant"],
            "crrprice" => $cart["crrprice"],
            "created" => $cart["created"],
            "updated" => $cart["updated"]
        );
        return self::executeNonQuery($sqlstr, $parameters);
    }
}

?>