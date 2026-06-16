function evalJS(code){
	try {
		return String(eval(code));
	}
	catch (exception)
	{
		console.error("[evalJS] A javascript error occured:" + exception);
	}
}

function browser_stretch_canvas() {
	var canvas = document.getElementById("canvas");
	canvas.style.width = window.innerWidth + "px";
	canvas.style.height = window.innerHeight + "px";
}
		