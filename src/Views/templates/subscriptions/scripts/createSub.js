let startDate = document.getElementById('startDate');
let endDate = document.getElementById('endDate');
let price = document.getElementById('price');
let cant = document.getElementById('cant');
function processPayment(){
    console.log(startDate.innerHTML, endDate.innerHTML, price.innerHTML, cant.innerHTML);
    modalHandler(true, 'waiting4PaypalModal', 'paymentNotyModal');
    $.ajax({
        type: 'POST',
        url: window.location.href,
        data: {
            startdate: startDate.innerHTML,
            enddate: endDate.innerHTML,
            price : price.innerHTML,
            cant : 1,
        },
        success: function (response) {
            if(response == "error"){
                alert(response);                
            }
            else{
                //alert(response);                
                window.location.href = response;
            }
        }
    })
}