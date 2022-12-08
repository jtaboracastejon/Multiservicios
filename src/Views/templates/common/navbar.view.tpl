<div class="bg-black" style="box-shadow:-5px 4px 5px 0 rgba(0,0,0,0.8);">
    <nav class="relative px-4 z-10 py-4 flex justify-between items-center ">
        <a class="text-3xl font-bold leading-none text-white" href="#">
            <i class="fa-solid fa-gear"></i>
        </a>
        <div class="rounded-full bg-white py-2 mx-auto px-5 invisible md:visible">
            <i class="fas fa-map-location-dot"></i>
            <select name="" id="" class="px-4 font-semibold text-sm text-center">
                <option value="" class="text-left">Santa Rosa de Copán</option>
                <option value="" class="text-left">Arizona, Tela</option>
            </select>

        </div>
        <ul class="hidden lg:flex lg:mx-auto !ml-0 lg:flex lg:items-center lg:w-auto lg:space-x-6">
            <li><a class="text-sm text-white font-semibold" href="#">Inicio</a></li>
            <li class="text-gray-300">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" class="w-4 h-4 current-fill"
                    viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M12 5v0m0 7v0m0 7v0m0-13a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                </svg>
            </li>
            <li><a class="text-sm text-white font-semibold" href="#">Servicios</a></li>
            <li class="text-gray-300">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" class="w-4 h-4 current-fill"
                    viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M12 5v0m0 7v0m0 7v0m0-13a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                </svg>
            </li>
            <li><a class="text-sm text-white font-semibold" href="#">Sobre</a></li>
            <li class="text-gray-300">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" class="w-4 h-4 current-fill"
                    viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M12 5v0m0 7v0m0 7v0m0-13a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                </svg>
            </li>
            <li><a class="text-sm text-white font-semibold" href="#">Contacto</a></li>
            <li class="text-gray-300">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" class="w-4 h-4 current-fill"
                    viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M12 5v0m0 7v0m0 7v0m0-13a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                </svg>
            </li>
        </ul>
        {{ifnot isLogged}}
            <a class="multi-loginBtn" onclick="modalHandler1(true, 'modalLogin')">Iniciar Sesión</a>
            <a class="multi-registerBtn" onclick="modalHandler1(true, 'modal1')">Unirse</a>
            {{endifnot isLogged}}
            {{if isLogged}}
                <a class="multi-dashboardBtnGd mx-4" href="index.php?page=dashboard-dashboard">Acceder al Panel</a>
            {{with login}}
                <span class="text-white">{{userName}}<a href="index.php?page=sec_logout" class="mx-4"><i class="fas fa-sign-out-alt"></i></a></span>
            {{endwith login}}
        {{endif isLogged}}
    </nav>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const burger = document.querySelectorAll('.navbar-burger');
        const menu = document.querySelectorAll('.navbar-menu');

        if (burger.length && menu.length) {
            for (var i = 0; i < burger.length; i++) {
                burger[i].addEventListener('click', function () {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }

        const close = document.querySelectorAll('.navbar-close');
        const backdrop = document.querySelectorAll('.navbar-backdrop');

        if (close.length) {
            for (var i = 0; i < close.length; i++) {
                close[i].addEventListener('click', function () {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }

        if (backdrop.length) {
            for (var i = 0; i < backdrop.length; i++) {
                backdrop[i].addEventListener('click', function () {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }
    });
</script>