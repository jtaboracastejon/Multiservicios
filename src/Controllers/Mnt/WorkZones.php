<?php
namespace Controllers\Mnt;
use Controllers\PrivateController;
use Views\Renderer;

class Workzones extends PrivateController
{
    public function run() :void {
        $viewData = array();
        $viewData["workzones"] = \Dao\WorkZones\Workzone::allWoz();
        Renderer::render("mnt/workzones",$viewData);
    }
}
?>