<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Providers extends PublicController
{
	public function run() :void {
        $viewData = array();
        $viewData["providers"] = \Dao\Providers\Providers::getallProviders();
        Renderer::render("mnt/providers",$viewData);
	}
}
?>