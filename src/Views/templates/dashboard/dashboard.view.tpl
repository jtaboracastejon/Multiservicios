
<div class="grid grid-cols-5">
    <div class="h-[80rem] bg-white">
        <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl">{{SITE_TITLE}}</p>
        <p class="pl-10 border-b-4 border-white font-normal text-black-400 text-xs">Panel</p>

            <div class="flex bg-zinc-100 m-10 rounded-lg">
                {{with login}}
                <div class="rounded-l-lg bg-zinc-100 cursor-pointer w-8/12 bg-gradient-to-r text-black-400 hover:text-white hover:from-green-400 hover:to-blue-500">
                    <div class="flex flex-row items-center">
                        <img class="w-7 h-7 m-2 justify-start rounded-full overflow-visible" src="https://picsum.photos/500/500" alt=".">
                        <div class="flex flex-col mt-1.5">
                            <p class="text-xs font-medium">{{userName}}</p>
                            <p class="text-xs font-medium">{{userType}}</p>
                            <p class="text-xs">{{servicename}}</p>
                        </div>
                    </div>
                </div>
                <a class="flex items-center p-2 cursor-pointer" href="index.php?page=cart-cart">
                    <p class="text-xs">Facturas Pendientes</p>
                    <i class="fa-solid fa-receipt"></i>
                    <p class="text-xs ml-2">{{currentInvoices}}</p>
                    
                </a>
                {{endwith login}}
            </div>

        <p class="pl-10 pt-4 border-t-4 border-multiDarkBlue text-black-400 font-semibold text-sm"></p>
        {{foreach NAVIGATION}}
        <a type="button" href="{{nav_url}}" class="multi-dashboardBtn">
            {{nav_label}}
        </a>
        {{endfor NAVIGATION}}
    </div>