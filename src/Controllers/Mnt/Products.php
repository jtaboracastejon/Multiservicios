<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Products extends PublicController
{
	public function run() :void {
        $viewData = array();
        $viewData["products"] = \Dao\Mnt\Products::getAllProducts();

        Renderer::render("mnt/products",$viewData);
	}
}
?>