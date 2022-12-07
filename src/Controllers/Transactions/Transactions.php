<?php 
namespace Controllers\Transactions;

use Controllers\PrivateController;
use Views\Renderer;

class Transactions extends PrivateController
{
    private $viewData = [];
	public function run(): void {
        
        Renderer::render("transactions/transactions", $this->viewData);
    }
}