<?php 
namespace Controllers\Services;
use Controllers\PublicController;
use Views\Renderer;

class Search extends PublicController{
    private $viewData = array();
    private $page_rows = 1; //Cantidad de resultados por pagina

    
    public function run(): void
    {
        $this->onForm_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("services/search",$this->viewData);
    }

    private function onForm_loaded(){
        
        $idworkzone = $_SESSION["idworkzone"]["idworkzone"];
        

        !isset($_GET["result"]) ? $page = 1 : $page = intval($_GET["result"]);
        $this->viewData["pagenum"] = $page;

        if (isset($_GET["service"])) {
            $service = intval($_GET["service"]);
            $this->viewData["service"] = $service;
            $dbService = \Dao\Services\Services::getServiceById($service);
            if (!$dbService) {
                $this->viewData["isService"] = false;
                $this->errorRedir();
            }
            $this->viewData["isService"] = true;     
            $this->serviceId = $service;     
            \Utilities\ArrUtils::mergeFullArrayTo($dbService, $this->viewData);
        }
        else{
            $service = false;
        }

        if(isset($_GET["query"])){
            $query = $_GET["query"];
            $this->viewData["query"] = $query;
            /* $dbService = \Dao\Services\Services::getServiceByQuery($query);
            if (!$dbService) {
                $this->errorRedir();
            }
            \Utilities\ArrUtils::mergeFullArrayTo($dbService, $this->viewData); */
        }
        else{
            $query = false;
        }
        
        //All los proveedores de un servicio con el serviceId
        if($service && !$query){
            $this->viewData["urlNext"] = "index.php?page=services_search&service=$service"."&result=" . ($page + 1);
            $this->viewData["urlNext"] = "index.php?page=services_search&service=$service"."&result=" . ($page - 1);

            $countData = \Dao\Providers\Providers::getCountAllByServicesId($service, $idworkzone);
            try {
                $limit = $this->getLimit($countData,$page);
                $data_l = \Dao\Landing\Card::getCardByService($limit[0],$limit[1],$service);
                foreach($data_l as $key => $card){            
                    $data_l[$key]["isVerified"] = \Dao\Landing\Card::isVerified($card["iduserdetail"]);
                    $data_l[$key]["name"] = \Dao\Landing\Landing::split_name($card["firstname"], $card["lastname"]);
                    $data_l[$key]["tiempoPlataforma"] = \Dao\Landing\Card::getTimeAgo($card["datecreate"]);
                    //$data_l[$key]["isSuscripter"] = \Dao\Landing\Card::isSuscripter($card["iduserdetail"]);
                }

                $this->viewData["providers"] = $data_l;
                $this->viewData["noResults"] = false;

            } catch (\Throwable $th) {
                $this->viewData["noResults"] = true;
            }
        }

        //All los proveedores de un servicio con ese query
        else if($service && $query){
            $this->viewData["urlNext"] = "./index.php?page=services_search&service=".$service."&query=$query&result=" . ($page + 1);
            $this->viewData["urlPrev"] = "./index.php?page=services_search&service=".$service."&query=$query&result=" . ($page - 1);

            $countData = \Dao\Providers\Providers::getCountDataByQueryAndService($service, $query);
            try {
                $limit = $this->getLimit($countData,$page);
                $data_l = \Dao\Landing\Card::getCardByQueryAndService($limit[0],$limit[1],$query,$service);
                foreach($data_l as $key => $card){            
                    $data_l[$key]["isVerified"] = \Dao\Landing\Card::isVerified($card["iduserdetail"]);
                    $data_l[$key]["name"] = \Dao\Landing\Landing::split_name($card["firstname"], $card["lastname"]);
                    $data_l[$key]["tiempoPlataforma"] = \Dao\Landing\Card::getTimeAgo($card["datecreate"]);
                    //$data_l[$key]["isSuscripter"] = \Dao\Landing\Card::isSuscripter($card["iduserdetail"]);
                }                

                $this->viewData["providers"] = $data_l;
                $this->viewData["noResults"] = false;

            } catch (\Throwable $th) {
                $this->viewData["noResults"] = true;
            }

        }

        /* //All los proveedores con ese firstname
        else if(!$service && $query){
            $this->viewData["urlNext"] = "./index.php?page=services_search&query=$query&result=" . ($page + 1);
            $this->viewData["urlPrev"] = "./index.php?page=services_search&query=$query&result=" . ($page - 1);

            $countData = \Dao\Providers\Providers::getCountAllByProviders($query);
            //$countDataServices = \Dao\Providers\Providers::getCountAllServicesByQuery($query);
            try {
                $limit = $this->getLimit($countData,$page);
                $data_l = \Dao\Landing\Card::getCardByProvider($limit[0],$limit[1],$query);
                foreach($data_l as $key => $card){            
                    $data_l[$key]["isVerified"] = \Dao\Landing\Card::isVerified($card["iduserdetail"]);
                    $data_l[$key]["name"] = \Dao\Landing\Landing::split_name($card["firstname"], $card["lastname"]);
                    $data_l[$key]["tiempoPlataforma"] = \Dao\Landing\Card::getTimeAgo($card["datecreate"]);
                    //$data_l[$key]["isSuscripter"] = \Dao\Landing\Card::isSuscripter($card["iduserdetail"]);
                }
                $this->viewData["providers"] = $data_l;
                $this->viewData["noResults"] = false;
            } catch (\Throwable $th) {
                $this->viewData["noResults"] = true;
            }
            
        } */
        //All los proveedores -> Error
        else{
            $this->errorRedir();
        }
    }
    
    private function pre_render(){
        //&service=1&query=Hola%que%hace_s&Presupuesto=10000
        //&result=2
        //$this->viewData["workzone"] = $_SESSION["workzone"]["department"]. ", " . $_SESSION["workzone"]["municipality"];
        //Funciones de paginacion de resultados
        $this->viewData["pagenum"] == 1 ? $this->viewData["isFirst"] = true : $this->viewData["isFirst"] = false;
        $this->viewData["last"] == $this->viewData["pagenum"] ? $this->viewData["isLast"] = true : $this->viewData["isLast"] = false;
        !$this->viewData["isLast"] && !$this->viewData["isFirst"] ? $this->viewData["isMiddle"] = true : $this->viewData["isMiddle"] = false;
        $this->viewData["isFirst"] && $this->viewData["isLast"] ? $this->viewData["isOnly"] = true : $this->viewData["isOnly"] = false;


        

    }
    
    private function process_postBack(){
        if($_POST["step"] == "A"){
            $this->changeZone();
        }
        if($_POST["step"] != "A"){
            $query = $_POST["txtSearch"];
            $service = $this->viewData["service"];
            //$budget = $_POST["budget"];
            if($query !== ""){
                \Utilities\Site::redirectTo("index.php?page=services_search&service=$service&query=$query");
            }
            else{
                \Utilities\Site::redirectTo("index.php?page=services_search&service=$service");
            }
        }
    }

    private function changeZone(){
        $idworkzone = $_POST["idworkzone"];
        $workzone = \Dao\WorkZones\Workzone::getWorkZonesById($idworkzone);
        if($workzone != 0){
            //Cambiar variable de sesion con el idworkzone
            $_SESSION["idworkzone"] = array(
                "idworkzone" => $workzone["idworkzone"],
                "iddepto" => $workzone["iddepto"],
                "idmunicipality" => $workzone["idmunicipality"],
                "department" => $workzone["department"],
                "municipality" => $workzone["municipality"]
            );

            \Utilities\Site::redirectTo("index.php?page=services_search&service=".$this->viewData["service"]."&query=".$this->viewData["query"]."&result=".$this->viewData["pagenum"]);
        }
        else{
            \Utilities\Site::redirectToWithMsg("index.php?page=services_search&service=".$this->viewData["service"]."&query=".$this->viewData["query"]."&result=".$this->viewData["pagenum"], "No hay proveedores en esa zona");
        }
    }

    private function getLimit($countData, $pagenum){
        $last = ceil($countData/$this->page_rows);
        $this->viewData["last"] = $last;
        if($pagenum < 1){
            $pagenum = 1;
        }
        elseif($pagenum > $last){
            $pagenum = $last;
        }
        $l1 = ($pagenum - 1) * $this->page_rows;
        $l2 = $this->page_rows;        
        return array($l1,$l2);
    }
    
    private function errorRedir()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=Services-Services",
            "Algo Inesperado sucedió!"
        );
    }

}
?>