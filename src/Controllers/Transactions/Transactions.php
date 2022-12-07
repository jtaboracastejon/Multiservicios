<?php 
namespace Controllers\Transactions;

use Controllers\PrivateController;
use Views\Renderer;

class Transactions extends PrivateController
{
    private $viewData = [];
	public function run(): void {
        $userCod = $_SESSION["login"]["userId"];
        $transactions = \Dao\Transactions\Transactions::getAllTransactionsByUserId($userCod);
        // die(var_dump($this->viewData["transactions"]));
        $transactions = \Utilities\multiUtilities::typeEnumToTitle($transactions);
        $transactions = \Utilities\multiUtilities::calculateTotalFromArray($transactions);
        $this->viewData["transactions"] = $transactions;
        Renderer::render("transactions/transactions", $this->viewData);
    }
}
?>