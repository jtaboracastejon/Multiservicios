<?php
namespace Utilities;

use Exception;

class multiUtilities {

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
}