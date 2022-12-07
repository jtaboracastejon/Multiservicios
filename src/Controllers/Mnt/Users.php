<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class Users extends PublicController{

    public function run() : void
    {
        $viewData = array();
        $viewData["users"] = \Dao\Mnt\Users::getAllUsers();

        Renderer::render("mnt/users", $viewData);
    }
}


?>