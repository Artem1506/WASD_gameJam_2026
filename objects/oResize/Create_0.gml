var bw = real( evalJS("window.innerWidth"))
var bh = real( evalJS("window.innerHeight"))

window_set_size(bw, bh)
view_enabled = true
view_visible[0] = true

gmcallback_on_browser_resize()
