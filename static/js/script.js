var textBox = document.getElementById("result");
textBox.onfocus = function() {
    textBox.select();
    textBox.onmouseup = function() {
        textBox.onmouseup = null;
        return false;
    };
};