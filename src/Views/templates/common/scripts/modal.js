function modalHandler(val = false, toModal, fromModal = null) {
    let toModalTg = document.getElementById(toModal);
    let fromModalTg = document.getElementById(fromModal);

    if (fromModalTg != null) {
        fadeOut(fromModalTg);
    }
    if (val) {
        fadeIn(toModalTg);
    } else {
        fadeOut(toModalTg);
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