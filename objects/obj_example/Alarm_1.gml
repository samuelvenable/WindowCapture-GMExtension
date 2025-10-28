if (capture_grab_frame_buffer(capture, buffer_get_address(buff)) && 
  buffer_exists(buff) && surface_exists(surf)) {
  buffer_set_surface(buff, surf, 0);
  fname = get_save_filename_ext("Window Capture (*.png)|*.png", "Untitled.png", "", "Window Capture");
  surface_save(surf, fname);
}