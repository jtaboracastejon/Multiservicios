<?php 
namespace Controllers\Faqs;

use Controllers\PublicController;
use Views\Renderer;

class Faqs extends PublicController{
    public function run() :void{
        // die("Run executed on About");
        $viewData = array(
            "variable" => "Version 1.0.0"
        );
        Renderer::render("faqs/faqs", $viewData);
    }
}
?>