<div class="bg-no-repeat bg-cover bg-center bg-[url('../public/imgs/landing/plumber.jpg')]">
    {{include common/navbar}}
    <div class="h-[45rem] grid md:grid-cols-2 md:gap-2 content-center p-10">
        <div class="drop-shadow-2xl">
            <h1 class="font-black text-white text-5xl">Encuentra la persona para resolver tus problemas</h1>
            <div class="mt-4 w-full">
                <input type="text" placeholder="Hora de arreglarlo..." class="text-xl rounded-l-full px-5 py-2 w-9/12">
                <a href="" class="bg-multiDarkBlue px-5 py-3 text-white rounded-r-full text-xl">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<div>    
    <div class="py-12 bg-gray-700 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0" id="modal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded border border-gray-400">
                <!-- Aquí podes meter código -->
                <div class="flex items-center justify-start w-full">
                    <button class="focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-700 transition duration-150 ease-in-out hover:bg-indigo-600 bg-indigo-700 rounded text-white px-8 py-2 text-sm">Submit</button>
                    <button class="focus:outline-none focus:ring-2 focus:ring-offset-2  focus:ring-gray-400 ml-3 bg-gray-100 transition duration-150 text-gray-600 ease-in-out hover:border-gray-400 hover:bg-gray-300 border rounded px-8 py-2 text-sm" onclick="modalHandler()">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Botón Abrir Modal -->
    <div class="w-full flex justify-center py-12" id="button">
        <button class="focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-700 mx-auto transition duration-150 ease-in-out hover:bg-indigo-600 bg-indigo-700 rounded text-white px-4 sm:px-8 py-2 text-xs sm:text-sm" onclick="modalHandler(true)">Abrir Modal</button>
    </div>
    <script>
        let modal = document.getElementById("modal");
        function modalHandler(val = false) {
            if (val) {
                fadeIn(modal);
            } else {
                fadeOut(modal);
            }
        }
        function fadeOut(el) {
            el.style.opacity = 1;
            (function fade() {
                if ((el.style.opacity -= 0.1) < 0) {
                    el.style.display = "none";
                } else {
                    requestAnimationFrame(fade);
                }
            })();
        }
        function fadeIn(el, display) {
            el.style.opacity = 0;
            el.style.display = display || "flex";
            (function fade() {
                let val = parseFloat(el.style.opacity);
                if (!((val += 0.2) > 1)) {
                    el.style.opacity = val;
                    requestAnimationFrame(fade);
                }
            })();
        }
    </script>
    
</div>