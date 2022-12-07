<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use Views\Renderer;

class Workzones extends PublicController
{
    public function run() :void {
        $viewData = array();
        $viewData["workzones"] = \Dao\WorkZones\Workzone::allWoz();
        Renderer::render("mnt/workzones",$viewData);
    }
}
?>