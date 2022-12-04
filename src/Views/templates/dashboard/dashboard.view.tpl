
<div class="grid grid-cols-5">
    <div class="h-[80rem] bg-white">
        <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl">{{SITE_TITLE}}</p>
        <p class="pl-10 border-b-4 border-white font-normal text-black-400 text-xs">Sysadmin Panel</p>

            <div class="ml-10 rounded-lg mb-2 bg-zinc-100 cursor-pointer w-8/12 bg-gradient-to-r text-black-400 hover:text-white hover:from-green-400 hover:to-blue-500 ">
                <div class="flex flex-row">
                    <img class="w-7 h-7 m-2 justify-start rounded-full overflow-visible" src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col mt-1.5">
                        {{with login}}
                        <p class="text-xs font-medium">{{userName}}</p>
                        <p class="text-xs font-medium">{{userType}}</p>
                        {{endwith login}}
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
            </div>

        <p class="pl-10 pt-4 border-t-4 border-multiDarkBlue text-black-400 font-semibold text-sm"></p>
        {{foreach NAVIGATION}}
        <a type="button" href="{{nav_url}}" class="multi-dashboardBtn">
            {{nav_label}}
        </a>
        {{endfor NAVIGATION}}
    </div>

