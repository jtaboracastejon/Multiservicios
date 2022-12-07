<?php
namespace Utilities;

use Exception;

class multiUtilities {

    /**
     * Toma el tipo de cambio de USD a HNL desde exchangeRate y devuelve el valor.
     * 
     * @author Javier T. Castejón
     */
    public static function exchangeRateUSDHNL(){
        $req_url = 'https://api.exchangerate.host/convert?from=USD&to=HNL';
        $response_json = file_get_contents($req_url);
        if(false !== $response_json) {
            try {
                $response = json_decode($response_json);
                if($response->success === true) {
                    return($response);
                }
            } catch(Exception $e) {
                return($e);
            }
        }
    }
    
    /**
     * Toma un array de arrays, y para cada array comprueba el valor de la clave "tipo", y si es "PRO"
     * lo cambia a "Promoción", si es "SUS" lo cambia a "Suscripción". ", y si es "REC", lo cambia a
     * "Recargo"
     * 
     * @param array arrWthType Matriz de objetos con la siguiente estructura:
     * 
     * @return array Un array con los types convertidos a su title.
     * @author Javier T. Castejón
     */
    public static function typeEnumToTitle($arrWthType){
        $title = array_map(function($item){
            if($item["type"] == "PRO"){
                $item["type"] = "Promoción";
            }
            if($item["type"] == "SUS"){
                $item["type"] = "Suscripción";
            }
            if($item["type"] == "REC"){
                $item["type"] = "Recargo";
            }
            return $item;
        }, $arrWthType);
        return $title;
    }

    /**
     * Toma una matriz de matrices y, para cada matriz, agrega un nuevo par clave/valor a la matriz,
     * donde la clave es "total" y el valor es el producto de las claves "crrcant" y "crrprice".
     * 
     * @param array arrWthCantPrice una matriz de matrices, cada matriz tiene una clave "crrcant" y
     * "crrprice".
     * 
     * @return array Una matriz de matrices.
     * @author Javier T. Castejón
     */
    public static function calculateTotalFromArray($arrWthCantPrice){
        $total = array_map(function($item){
            $item["total"] = $item["crrcant"] * $item["crrprice"];
            return $item;
        }, $arrWthCantPrice);
        return $total;
    }
}