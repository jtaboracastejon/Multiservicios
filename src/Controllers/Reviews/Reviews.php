<?php 
namespace Controllers\Reviews;

use Controllers\PublicController;
use Views\Renderer;

class Reviews extends PublicController
{
	public function run() :void {
        $viewData = array();
        $viewData["proReview"] = \Dao\Reviews\Review::getAllRevProReview();

        $viewData["qualitiesProv"] = \Dao\Reviews\Review::getAllQualitiesProv();
        $viewData["GetAll"] = \Dao\Reviews\Review::getInnerAll();

        Renderer::render("reviews/reviews",$viewData);
	}
}
?>