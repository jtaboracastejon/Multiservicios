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

        $_SESSION["login"]["currentInvoices"] = \Dao\Cart\Carts::getQtyInvoices($_SESSION["login"]["userId"]);
        $_SESSION["login"]["servicename"] = \Dao\Security\Security::getProviderByUserID($_SESSION["login"]["userId"])["servicename"];
        
        
        Renderer::render("dashboard/dashboard", $viewData);
    }
}
?>