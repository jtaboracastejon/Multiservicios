<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Product extends PublicController{
    private $arrModeDsc = array(
        "INS" => "Agregar nuevo producto",
        "UPD" => "Editar %s %s",
        "DEL" => "Eliminando %s %s",
        "DSP" => "Detalle de %s %s"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "barcode" => "",
        "description" => "",
        "brandId" => "",
        "categoryId" => "",
        "status" => "",
        "act_selected" => true,
        "ina_selected" => false,
        "readOnly" => false,
        "showSaveBtn" => true
        
    );

    private $brands=array();
    private $categories=array();
	public function run() :void{
        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("mnt/product", $this->viewData);
	}

    public function onForm_loaded(){
        if (!isset($_GET["mode"])) {
            $this->errorRedir();
        }
        $this->viewData["mode"] = $_GET["mode"];
        if (!isset($this->arrModeDsc[$this->viewData["mode"]])) {
            $this->errorRedir();
        }

        if ($this->viewData["mode"] !== "INS") {
            if (!isset($_GET["productId"])) {
                $this->errorRedir();
            }

            $productId = intval($_GET["productId"]);
            $dbQuote = \Dao\Mnt\Products::getProductById($productId);
            \Utilities\ArrUtils::mergeFullArrayTo($dbQuote, $this->viewData);
        }

        $this->brands=[
            ["value"=>1, "text"=>"Bimbo"],
            ["value"=>2, "text"=>"Leyde"],
            ["value"=>3, "text"=>"Sula"],
            ["value"=>4, "text"=>"Snickers"],
        ];
        $this->categories=[
            ["value"=>1, "text"=>"Lácteos"],
            ["value"=>2, "text"=>"Panadería"],
            ["value"=>3, "text"=>"Dulces"]
        ];

        $this->viewData["arrBrands"] = $this->brands;
        $this->viewData["arrCategories"] = $this->categories;
    }

    private function process_postBack()
    {
        if($this->validate_inputs()){
            switch($this->viewData["mode"]){
                case "INS":
                    $this->on_insert_clicked();
                    break;
                case "UPD":
                    $this->on_update_clicked();
                    break;
                case "DEL":
                    $this->on_delete_clicked();
                    break;
            }
        }
    }

    private function validate_inputs()
    {
        $this->viewData["barcode"] = $_POST["barcode"];
        $this->viewData["description"] = $_POST["description"];
        $this->viewData["brandId"] = $_POST["brandId"];
        $this->viewData["categoryId"] = $_POST["categoryId"];
        $this->viewData["status"] = $_POST["status"];
        $this->viewData["act_selected"] = $_POST["status"] == "ACT";
        $this->viewData["ina_selected"] = $_POST["status"] == "INA";
        return true;
    }

    private function on_insert_clicked()
    {
        $insertResult = \Dao\Mnt\Products::AgregarProducto(
            $this->viewData["barcode"],
            $this->viewData["description"],
            $this->viewData["brandId"],
            $this->viewData["categoryId"],
            $this->viewData["status"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt-products",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
        $updateResult = \Dao\Mnt\Products::ActualizarProducto(
            $this->viewData["barcode"],
            $this->viewData["description"],
            $this->viewData["brandId"],
            $this->viewData["categoryId"],
            $this->viewData["status"],
            $this->viewData["productId"],

        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Products",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\Mnt\Products::EliminarProducto(
            $this->viewData["productId"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Products",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    private function pre_render()
    {
        $this->viewData["arrCategories"]
                = \Utilities\ArrUtils::objectArrToOptionsArray(
                    $this->categories,
                    'value',
                    'text',
                    'value',
                    $this->viewData["categoryId"]
                );      
        $this->viewData["arrBrands"]
                = \Utilities\ArrUtils::objectArrToOptionsArray(
                    $this->brands,
                    'value',
                    'text',
                    'value',
                    $this->viewData["brandId"]
                );    
        $this->viewData["act_selected"] = $this->viewData["status"] === "ACT";
        $this->viewData["ina_selected"] = $this->viewData["status"] === "INA";
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["productId"],
                $this->viewData["description"]
            );
        } else {
            $this->viewData["mode_dsc"] = $this->arrModeDsc["INS"];
        }
        $this->viewData["readOnly"] = $this->viewData["mode"] == "DEL" || $this->viewData["mode"] == "DSP";
        $this->viewData["showSaveBtn"] = !($this->viewData["mode"] == "DSP");
    }

    private function errorRedir()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt-products",
            "Algo Inesperado sucedió!"
        );
    }
}
?>