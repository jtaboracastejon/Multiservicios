<div class="flex items-center justify-center max-w-screen">
    <div class="z-10 absolute left-4">
        <button id="slideLeft" class="" type="button">
            <i class="fa-solid fa-circle-left fa-xl shadow-lg text-white"></i>
        </button>
    </div>
    <div class="z-10 absolute right-4">
        <button id="slideRight" class="" type="button">
            <i class="fa-solid fa-circle-right fa-xl shadow-lg text-white"></i></button>
    </div>
    <div class="z-0 w-screen overflow-hidden">
        <div class="overflow-x-scroll scroll-smooth hide-scroll-bar p-10" id="services">
            <div class="flex flex-nowrap lg:ml-30 ml-10">
                {{foreach services}}
                <a href="index.php?page=Services-Search&service={{idservice}}">
                <div class="inline-block inline-block px-3">
                        <div class="multi-horizontalSlide js-show-on-scroll" style="background-image: url('{{imagepath}}');">
                        <div class="w-full h-full bg-black bg-opacity-40 flex justify-center items-center">
                            <p class="font-bold text-white">{{servicename}}</p>
                        </div>
                    </div>
                </div>
                </a>
                {{endfor services}} 
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
        document.getElementById('services').scrollLeft += 500;

    };
    buttonLeft.onclick = function () {
        document.getElementById('services').scrollLeft -= 500;
    };

    const callback = function (entries) {
        entries.forEach((entry) => {

            if (entry.isIntersecting) {
                console.log('intersecting');
                entry.target.classList.add("animate-fadeIn");
            } else {
                entry.target.classList.remove("animate-fadeIn");
            }
        });
    };

    const observer = new IntersectionObserver(callback);

    const targets = document.querySelectorAll(".js-show-on-scroll");
    targets.forEach(function (target) {
        observer.observe(target);
    });

</script>