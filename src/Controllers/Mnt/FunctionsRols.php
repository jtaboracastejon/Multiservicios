<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class FunctionsRols extends PublicController{

    public function run() : void
    {
        $viewData = array();
        $viewData["functionsrols"] = \Dao\Mnt\FunctionsRols::getAllFunctionsRols();

        Renderer::render("mnt/functionsrols", $viewData);
    }
}


?>