<?php 
namespace Controllers\Payments;

use Controllers\PrivateController;
use Views\Renderer;

class Payments extends PrivateController{
    private $viewData = [];

    public function run() :void{
        Renderer::render('payments/payments', $this->viewData);
    }
    
} ?>