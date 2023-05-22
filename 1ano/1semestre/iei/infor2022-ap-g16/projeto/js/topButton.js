let mybutton = document.getElementById("goToTopButton");

window.onscroll = function() {scrollFunction()};

function scrollFunction(){
    if (document.body.scrollTop >= 1 || document.documentElement.scrollTop >= 1) {
        mybutton.style.display = "block";
        mybutton.style.animation = "fadeIn 0.5s";
    }
    else {
        mybutton.style.animation = "fadeOut 0.5s";
        setTimeout(() => {mybutton.style.display = "none"}, 500)
    }
}
