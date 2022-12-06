<?php 
namespace Controllers\Reviews;

use Controllers\PublicController;
use Views\Renderer;

class Review extends PublicController{
    private $arrModeDsc = array(
        "INS" => "Agregando datos",
        "UPD" => "Editar",
        "DEL" => "Eliminando",
        "DSP" => "Detalle"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "idreview" => "",
        "idordenfac" => "",
        "titulo" => "",
        "rating" => "",
       "idqualities"=>"",
        "idreview"=>"",
        "time"=>"",
        "knowledge"=>"",
        "attitude"=>"",
        "communication"=>"",
        "responsibilit"=>"",
        "puntuality"=>"",
        "readOnly" => false,
        "showSaveBtn" => true
        
    );

	public function run() :void{
        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("reviews/review", $this->viewData);
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
            if (!isset($_GET["idqualities"])) {
                $this->errorRedir();
            }
            $idreview = intval($_GET["idqualities"]);
            $dbReview = \Dao\Reviews\Review::getQualitiesProvById($idreview);
            \Utilities\ArrUtils::mergeFullArrayTo($dbReview, $this->viewData);

        }
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
        $this->viewData["idordenfac"] = $_POST["idordenfac"];
        $this->viewData["titulo"] = $_POST["titulo"];
        $this->viewData["rating"] = $_POST["rating"];
       $this->viewData["idreview"] = $_POST["idreview"];
        $this->viewData["time"] = $_POST["time"];
        $this->viewData["knowledge"] = $_POST["knowledge"];
        $this->viewData["attitude"] = $_POST["attitude"];
        $this->viewData["communication"] = $_POST["communication"];
        $this->viewData["puntuality"] = $_POST["puntuality"];
        $this->viewData["responsibility"] = $_POST["responsibility"];
        return true;
    }

    private function on_insert_clicked()
    {
        $insertResult = \Dao\Reviews\Review::AddProReview(
            $this->viewData["idordenfac"],
            $this->viewData["titulo"],
            $this->viewData["rating"]
        );
       $insertQualitys = \Dao\Reviews\Review::AddQualitiesProv(
            $this->viewData["idreview"],
            $this->viewData["time"],
            $this->viewData["knowledge"],
            $this->viewData["attitude"],
            $this->viewData["communication"],       
            $this->viewData["puntuality"],
            $this->viewData["responsibility"]
        ); 
        if($insertResult && $insertQualitys) { 
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Reviews-reviews",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
        $updateResult = \Dao\Reviews\Review::updateWithInner(
            $this->viewData["idqualities"],
            $this->viewData["titulo"],
            $this->viewData["rating"],
            $this->viewData["time"],
            $this->viewData["knowledge"],
            $this->viewData["attitude"],
            $this->viewData["communication"],
            $this->viewData["puntuality"],
            $this->viewData["responsibility"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Reviews-reviews",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\Reviews\Review::DeleteProReview(
            $this->viewData["idqualities"]
        );

        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Reviews-reviews",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    private function pre_render()
    {
        $getAllReviews = \Dao\Reviews\Review::getAllRevProReview();
        $this->viewData["reviews"] = $getAllReviews;

       
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]]
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
            "index.php?page=Reviews-reviews",
            "Algo Inesperado sucedió!"
        );
    }
}
?>