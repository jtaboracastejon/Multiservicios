<?php 
namespace Controllers\Subscriptions;

use Controllers\PrivateController;
use Views\Renderer;

class Subscriptions extends PrivateController
{
    private $viewData = []; 
    private $userId;
	public function run(): void {
        $this->userId = $_SESSION["login"]["userId"];
        $this->viewData["provider"] = \Dao\Security\Security::getProviderByUserID($this->userId);
        
        if($this->isPostBack()){
            $this->process_postBack();
        }
        
        if(isset($_GET["idprice"])){
            $this->subscribeToPlanDetail();
        }else{
            $this->onLoadListPlans();
        }

        
    }

    private function onLoadListPlans(){
        $plans = \Dao\Subscriptions\Subscriptions::getAllSubscriptionsPlans();
        $newPlans = $this->utilityMonthToLetters($plans);
        
        $this->viewData["plans"] = $newPlans;
        Renderer::render("subscriptions/subscriptions", $this->viewData);
    }
    
    private function subscribeToPlanDetail(){
        $plan = \Dao\Subscriptions\Subscriptions::getSubcriptionPlanPriceById($_GET["idprice"]);
        $newPlans = $this->utilityMonthToLetters([$plan]);
        $this->viewData["plan"] = $newPlans[0];
        $this->viewData["startDate"] = date("Y-m-d H:i:s");
        $this->viewData["endDate"] = date("Y-m-d H:i:s", strtotime("+".$this->viewData["plan"]["billedsdays"]." days"));
        $this->viewData["startDateInLettters"] = \Utilities\multiUtilities::obtenerFechaEnLetras($this->viewData["startDate"]);
        $this->viewData["endDateInLettters"] = \Utilities\multiUtilities::obtenerFechaEnLetras($this->viewData["endDate"]);
        $this->viewData["usdHnlExchangeRate"] = number_format(\Utilities\multiUtilities::exchangeRateUSDHNL()->result,2);
        $this->viewData["priceInDollars"] = number_format($this->viewData["plan"]["price"] / $this->viewData["usdHnlExchangeRate"], 2);
        // die(var_dump($this->viewData["usdHnlExchangeRate"]));
        // die(var_dump($this->viewData["plan"]));
        \Utilities\Site::addEndScript("src/Views/templates/common/scripts/modal.js");
        \Utilities\Site::addEndScript("src/Views/templates/subscriptions/scripts/createSub.js");
        Renderer::render("subscriptions/subscribe", $this->viewData);
    }

    private function utilityMonthToLetters($arrPlans){
        $newPlans = array_map(function($plan){
            $plan["price"] = number_format($plan["price"], 2);
            $plan["monthCount"] = ceil($plan["billedsdays"] / 30.417);
            $plan["monthLetters"] = $plan["monthCount"] == 1 ? "Mes" : "Meses";
            $plan["pricePerMonth"] = str_replace(",","", $plan["price"]) / $plan["monthCount"];
            return $plan;
        }, $arrPlans);

        return $newPlans;
    }

    private function process_postBack(){
        try {
            \Dao\Subscriptions\Subscriptions::insertSubscription(
                $this->viewData["provider"]["idprovider"],
                $_POST["startdate"],
                $_POST["enddate"],
                $_POST["price"],
                $_GET["idprice"]
            );

            $lastSubId = \Dao\Subscriptions\Subscriptions::getLastSubId(); 
            \Dao\Cart\Carts::addCart(
                $this->userId,
                $_GET["idprice"],
                $_POST["cant"], 
                $_POST["price"], 
                date("Y-m-d H:i:s"),
                date("Y-m-d H:i:s"),
                $lastSubId,
                "subscriptions"
            );
            $nextCartId = \Dao\Cart\Carts::getCartLastId();
            echo "index.php?page=cart-cart&idCart=$nextCartId";
            exit();
        } catch (\Throwable $th) {
            echo $th;
            exit();
        }
    }
}