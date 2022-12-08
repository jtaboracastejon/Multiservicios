<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Dao\Dao;
use Views\Renderer;

class Users extends PrivateController{

    public function run() : void
    {
        $viewData = array();
        $viewData["users"] = \Dao\Mnt\Users::getAllUsers();

        Renderer::render("mnt/users", $viewData);
    }
}


?>