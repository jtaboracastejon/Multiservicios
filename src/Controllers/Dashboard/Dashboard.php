<?php 
namespace Controllers\Dashboard;

use Controllers\PublicController;
use Views\Renderer;

class Dashboard extends PublicController{
    public function run() :void{
        // die("Run executed on About");
        $viewData = array(
            "variable" => "Version 1.0.0"
        );

        
        Renderer::render("dashboard/dashboard", $viewData);
    }
}
?>