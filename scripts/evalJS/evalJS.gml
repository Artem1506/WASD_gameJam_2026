function evalJS(code) {
    if (code == "window.innerWidth") return string(window_get_width());
    if (code == "window.innerHeight") return string(window_get_height());
    if (code == "window.devicePixelRatio || 1;") return "1";
    return "0";
}

function browser_stretch_canvas() {
    // Ресайз холста на Windows не требуется
}
