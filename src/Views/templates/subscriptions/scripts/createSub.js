let startDate = document.getElementById('startDate');
let endDate = document.getElementById('endDate');
let price = document.getElementById('price');
let days = document.getElementById('days');
function processPayment(){
    // console.log(startDate.innerHTML, endDate.innerHTML, price.innerHTML, days.value);
    modalHandler(true, 'waiting4PaypalModal', 'paymentNotyModal');
    $.ajax({
        type: 'POST',
        url: window.location.href,
        data: {
            startdate: startDate.innerHTML,
            enddate: endDate.innerHTML,
            price : price.innerHTML,
            days : days.value,
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