<?php 
namespace Controllers\mnt;
use Controllers\PublicController;
use Views\Renderer;

class Quotes extends PublicController{
    public function run(): void
    {
        $viewData = array();
        $viewData["quotes"] = \Dao\Mnt\Quotes::getAllQuotes();

        Renderer::render("mnt/quotes",$viewData);
    }
}
?>