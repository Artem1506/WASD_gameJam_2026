function gmcallback_on_browser_resize(){
    var pixel_ratio = real(evalJS("window.devicePixelRatio || 1;"))
    var bw = real(evalJS("window.innerWidth"))
    var bh = real(evalJS("window.innerHeight"))
    
    view_wport[0] = bw;
    view_hport[0] = bh;
    
    var new_width = bw
    var new_height = bh
    
    if ( bw > bh ){
        new_width = room_height * bw/bh
        new_height = room_height 
    }else{
        new_width = room_width
        new_height = room_width * bh/bw
    }
    
    if (new_width<room_width){
        new_width = room_width 
        new_height = room_width  * bh/bw
    }
    
    if (new_height<room_height){
        new_width = room_height * bw/bh
        new_height = room_height  
    }
    
    global.width = new_width
    global.height = new_height
    
    window_set_size(bw*pixel_ratio, bh*pixel_ratio);
    surface_resize(application_surface, new_width, new_height)
    display_set_gui_size(new_width, new_height)
    camera_set_view_size(view_camera[0], new_width, new_height)
    browser_stretch_canvas()
    
    global.left = -(new_width/2-room_width/2)
    global.right = global.left + new_width
    global.top = 0
    global.bottom = room_height
    
    var camera_x = (-new_width+room_width)*0.5
    var camera_y = -(new_height-room_height)*0.5
    camera_set_view_pos(view_camera[0], camera_x, camera_y)
}


