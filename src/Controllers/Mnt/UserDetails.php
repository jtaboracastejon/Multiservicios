<?php 
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class UserDetails extends PrivateController
{
	public function run() :void {
        $viewData = array();
        $viewData["uDetails"] = \Dao\Mnt\UserDetails::getAllInnerProducts();

        Renderer::render("mnt/userdetails",$viewData);
	}
}
?>