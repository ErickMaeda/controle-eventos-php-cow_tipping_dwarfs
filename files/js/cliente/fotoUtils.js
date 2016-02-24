window.addEventListener("DOMContentLoaded", function () {
    var canvas = document.getElementById("canvas"),
            context = canvas.getContext("2d"),
            video = document.getElementById("video"),
            videoObj = {"video": true},
    errBack = function (error) {
        console.log("Video capture error: ", error.code);
    };
    if (navigator.getUserMedia) {
        navigator.getUserMedia(videoObj, function (stream) {
            video.src = stream;
            video.play();
        }, errBack);
    } else if (navigator.webkitGetUserMedia) {
        navigator.webkitGetUserMedia(videoObj, function (stream) {
            video.src = window.webkitURL.createObjectURL(stream);
            video.play();
        }, errBack);
    }
    else if (navigator.mozGetUserMedia) {
        navigator.mozGetUserMedia(videoObj, function (stream) {
            video.src = window.URL.createObjectURL(stream);
            video.play();
        }, errBack);
    }
}, false);
document.getElementById("snap").addEventListener("click", function () {
    canvas.getContext("2d").drawImage(video, 0, 0, 640, 480);
    //alert(canvas.toDataURL());
});
document.getElementById("save").addEventListener("click", function () {
    document.getElementById("id_evento_cliente");
    var id = $('#id_evento_cliente').val();

    $.post('/participacao/uploadfoto', {imagem: canvas.toDataURL(), id_evento_cliente: id}, function (data) {
        console.log(data);
    }, 'json');
});