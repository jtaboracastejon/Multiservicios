<div class="bg-no-repeat bg-cover bg-center">
    {{include common/navbar2}}
</div>
<div class="pt-10 pl-10">
    
    <h1 class="font-bold text-xl text-black">
        Servicios
    </h1>
</div>
<div class="grid grid-cols-3 gap-4 p-10">
    <a href="#" class="js-target shadow-lg bg-[url('../public/imgs/joey-huang-XBh4DOGqMfc-unsplash.jpg')] bg-cover bg-center rounded-lg multi-horizontalSlide h-36">
        <div class="w-full h-full bg-black bg-opacity-40 flex justify-center items-center rounded-lg">
            <p class="font-bold text-white">Plomeria</p>
        </div>
    </a>
    <a href="#" class="js-target shadow-lg bg-[url('../public/imgs/joey-huang-XBh4DOGqMfc-unsplash.jpg')] bg-cover bg-center rounded-lg multi-horizontalSlide h-36">
        <div class="w-full h-full bg-black bg-opacity-40 flex justify-center items-center rounded-lg">
            <p class="font-bold text-white">Plomeria</p>
        </div>
    </a>
    <a href="#" class="js-target shadow-lg bg-[url('../public/imgs/joey-huang-XBh4DOGqMfc-unsplash.jpg')] bg-cover bg-center rounded-lg multi-horizontalSlide h-36">
        <div class="w-full h-full bg-black bg-opacity-40 flex justify-center items-center rounded-lg">
            <p class="font-bold text-white">Plomeria</p>
        </div>
    </a>
    <a href="#" class="js-target shadow-lg bg-[url('../public/imgs/joey-huang-XBh4DOGqMfc-unsplash.jpg')] bg-cover bg-center rounded-lg multi-horizontalSlide h-36">
        <div class="w-full h-full bg-black bg-opacity-40 flex justify-center items-center rounded-lg">
            <p class="font-bold text-white">Plomeria</p>
        </div>
    </a>
    <a href="#" class="js-target shadow-lg bg-[url('../public/imgs/joey-huang-XBh4DOGqMfc-unsplash.jpg')] bg-cover bg-center rounded-lg multi-horizontalSlide h-36">
        <div class="w-full h-full bg-black bg-opacity-40 flex justify-center items-center rounded-lg">
            <p class="font-bold text-white">Plomeria</p>
        </div>
    </a>
</div>
<script>
    const targets = document.querySelectorAll(".js-target");
    var i = 1;
    targets.forEach(target => {
        if (i === 1) {
            target.classList.add("col-span-2");
        }
        console.log(i);
        i++;
        if (i === 5) {
            target.classList.add("col-span-2");
            i = 1;
        }
    });
</script>