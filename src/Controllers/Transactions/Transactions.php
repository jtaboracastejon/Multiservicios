<?php 
namespace Controllers\Transactions;
use PayPalCheckoutSdk\Orders\OrdersGetRequest;
use Controllers\PrivateController;
use Views\Renderer;

class Transactions extends PrivateController
{
    private $viewData = [];
	public function run(): void {
        if(!isset($_GET["orderId"])){
            $this->onTransactionListLoad();
        }else{
            $this->onTransactionDetailLoad();
        }
    }

    public function onTransactionListLoad(){
        $userCod = $_SESSION["login"]["userId"];
        $transactions = \Dao\Transactions\Transactions::getAllTransactionsByUserId($userCod);
        $transactions = \Utilities\multiUtilities::typeEnumToTitle($transactions);
        $transactions = \Utilities\multiUtilities::calculateTotalFromArray($transactions);
        $this->viewData["transactions"] = $transactions;
        Renderer::render("transactions/transactions", $this->viewData);
    }

    public function onTransactionDetailLoad(){
        $client = \Utilities\Paypal\PayPalClient::client();
        $response = $client->execute(new OrdersGetRequest($_GET["orderId"]));
        $response= json_decode(json_encode($response), true);
        $this->viewData["orderId"] = $_GET["orderId"];
        $this->viewData["payerEmail"] = $response["result"]["payer"]["email_address"];
        $this->viewData["payerName"] = $response["result"]["payer"]["name"]["given_name"] . " " . $response["result"]["payer"]["name"]["surname"];
        $this->viewData["result"] = [
            "status" => $response["result"]["status"],
            "create_time" => $response["result"]["create_time"],
        ];
        $this->viewData["totalOrder"] = $response["result"]["purchase_units"][0]["amount"]["value"] . " " . $response["result"]["purchase_units"][0]["amount"]["currency_code"];
        $this->viewData["fechaDelPago"] = $this->obtenerFechaEnLetra($response["result"]["create_time"]);
        
        $this->viewData["items"] = $response["result"]["purchase_units"][0]["items"];
        /* $orderDetail = [
            "orderID" => $response["result"]["id"],
            "payerDetails" => $response["result"]["payer"],
            "name" => $response["result"]["purchase_units"][0]->shipping->name->full_name,
            "address" => $response["result"]["purchase_units"][0]->shipping->address,
        ]; */
        // $orderDetail = \Utilities\Paypal\PayPalCapture::captureOrder($_GET["orderId"]);
        // $this->viewData["orderDetail"] = json_encode($orderDetail, JSON_PRETTY_PRINT);
        Renderer::render("transactions/transactionDetail", $this->viewData);
    }

    private function obtenerFechaEnLetra($fecha){
        $dia= $this->conocerDiaSemanaFecha($fecha);
        $num = date("j", strtotime($fecha));
        $anno = date("Y", strtotime($fecha));
        $mes = array('enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre');
        $mes = $mes[(date('m', strtotime($fecha))*1)-1];
        return $dia.', '.$num.' de '.$mes.' del '.$anno;
    }
    private function conocerDiaSemanaFecha($fecha) {
        $dias = array('Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado');
        $dia = $dias[date('w', strtotime($fecha))];
        return $dia;
    }
}
?>