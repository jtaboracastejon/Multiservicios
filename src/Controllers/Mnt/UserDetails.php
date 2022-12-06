<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class UserDetails extends PublicController
{
	public function run() :void {
        $viewData = array();
        $viewData["uDetails"] = \Dao\Mnt\UserDetails::getAllInnerProducts();

        Renderer::render("mnt/userdetails",$viewData);
	}
}
?>