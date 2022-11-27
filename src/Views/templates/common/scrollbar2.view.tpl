<div class="flex flex-col bg-blue-white m-auto p-auto">
    <h1 class="flex py-5 lg:px-20 md:px-10 px-5 lg:mx-40 md:mx-20 mx-5 font-bold text-4xl text-gray-800">
        Conoce las areas con personal capacitado
    </h1>


<div>
  
<button id="slideLeft"  class="multi-btn" type="button">Slide left</button>
<button id="slideRight" class="multi-btn"  type="button">Slide right</button>
</div>

    <div class="flex overflow-x-scroll pb-10 max-w-7xl pr-8 pl-8 justify-center hide-scroll-bar" id="services">
        <div class=" flex flex-nowrap lg:ml-30 md:ml-20 ml-10 ">
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                    <p>Plomeria</p>
                </div>
            </div>
            <div class="inline-block px-3 ">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                    <p >Albañileria</p>
                </div>
            </div>
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                    <p>Electricista</p>
                </div>
            </div>
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                    <p>Hotel</p>
                </div>
            </div>
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                0
                </div>
            </div>
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                1
                </div>
            </div>
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                2
                </div>
            </div>
            <div class="inline-block px-3">
                <div class="w-80 h-36 max-w-xs overflow-hidden rounded-lg shadow-md bg-blue-600 hover:shadow-xl transition-shadow duration-300 ease-in-out">
                3
                </div>
            </div>
        </div>
        

    </div>
    
    
    
    

</div>
<style>
.hide-scroll-bar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
.hide-scroll-bar::-webkit-scrollbar {
  display: none;
}
</style>

<script>
  const buttonRight = document.getElementById('slideRight');
  const buttonLeft = document.getElementById('slideLeft');

  buttonRight.onclick = function () {
    document.getElementById('services').scrollLeft += 100;
    
  };
  buttonLeft.onclick = function () {
    document.getElementById('services').scrollLeft -= 100;
  };
  
</script>