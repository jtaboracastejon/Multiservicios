<?php 
namespace Controllers\About;

use Controllers\PublicController;
use Views\Renderer;

class About extends PublicController{
    public function run() :void{
        // die("Run executed on About");
        $viewData = array(
            "imagenes" => array(

                "1" => array(
                    "img" => "https://picsum.photos/1920/1080?random=1",
                ),
                "2" => array(
                    "img" => "https://picsum.photos/1920/1080?random=2",
                ),
                "3" => array(
                    "img" => "https://picsum.photos/1920/1080?random=3",
                ),
                "4" => array(
                    "img" => "https://picsum.photos/1920/1080?random=4",
                ),
                "5" => array(
                    "img" => "https://picsum.photos/1920/1080?random=5",
                ),
                "6" => array(
                    "img" => "https://picsum.photos/1920/1080?random=6",
                ),
                "7" => array(
                    "img" => "https://picsum.photos/1920/1080?random=7",
                ),
                "8" => array(
                    "img" => "https://picsum.photos/1920/1080?random=8",
                ),
                "9" => array(
                    "img" => "https://picsum.photos/1920/1080?random=9",
                ),
                "10" => array(
                    "img" => "https://picsum.photos/1920/1080?random=10",
                ),
                "11" => array(
                    "img" => "https://picsum.photos/1920/1080?random=11",
                ),
                "12" => array(
                    "img" => "https://picsum.photos/1920/1080?random=12",
                ),
                "13" => array(
                    "img" => "https://picsum.photos/1920/1080?random=13",
                ),
                "14" => array(
                    "img" => "https://picsum.photos/1920/1080?random=14",
                ),
                "15" => array(
                    "img" => "https://picsum.photos/1920/1080?random=15",
                ),
                "16" => array(
                    "img" => "https://picsum.photos/1920/1080?random=16",
                ),
                "17" => array(
                    "img" => "https://picsum.photos/1920/1080?random=17",
                ),
                "18" => array(
                    "img" => "https://picsum.photos/1920/1080?random=18",
                ),
                "19" => array(
                    "img" => "https://picsum.photos/1920/1080?random=19",
                ),
            ),
        );
        $viewData["encoded"] = json_encode($viewData["imagenes"]);
        Renderer::render("about/about", $viewData);
    }
}
