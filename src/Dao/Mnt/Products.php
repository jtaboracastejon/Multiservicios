<?php 
namespace Dao\Mnt;
use Dao\Table;

class Products extends Table
{
    public static function AgregarProducto(
        $barcode,
        $description,
        $brandId,
        $categoryId,
        $status
    ){
        $insertStr = "INSERT INTO products (barcode, description, brandId, categoryId, status, created, updated) VALUES (:barcode, :description, :brandId, :categoryId, :status, now(), now())";
        $params = array(
            "barcode" => $barcode, 
            "description" => $description, 
            "brandId" => $brandId, 
            "categoryId" => $categoryId, 
            "status" => $status
        );
        return self::executeNonQuery($insertStr,$params);
    }

    public static function getAllProducts(){
        $selectSql = "SELECT * FROM products";
        return self::obtenerRegistros($selectSql, array());
    }

    public static function getProductById($productId){
        $selectSql = "SELECT * FROM products WHERE productId=:productId;";
        return self::obtenerUnRegistro($selectSql, array(
            "productId"=>$productId
        ));
    }

    public static function ActualizarProducto(
        $barcode,
        $description,
        $brandId,
        $categoryId,
        $status,
        $productId
    ){
        $insertStr = "UPDATE products set barcode=:barcode, description=:description, brandId=:brandId, categoryId=:categoryId, status=:status, updated=now() WHERE productId=:productId";
        $params = array(
            "barcode" => $barcode, 
            "description" => $description, 
            "brandId" => $brandId, 
            "categoryId" => $categoryId, 
            "status" => $status,
            "productId" => $productId,
        );
        return self::executeNonQuery($insertStr,$params);
    }

    public static function EliminarProducto($productId){
        $deleteStr = "DELETE FROM products WHERE productId=:productId;";
        return self::executeNonQuery($deleteStr, array("productId"=>$productId));
    }
}
