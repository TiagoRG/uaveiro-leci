function decreaseImage(element){
    let height = parseInt(element.style.height) - 10 ;
    element.style.height = height+"px";
}
function resetImage(element){
    element.style.height = "200px";
}