draw_set_color(c_white);
if (window_get_width() > 0 && window_get_height() > 0) {
  surface_resize(application_surface, window_get_width(), window_get_height());
  display_set_gui_size(window_get_width(), window_get_height());
}
if (capture_exists(capture)) {
  if (!surface_exists(surf)) {
    surf = surface_create(w, h);
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
  }
  if (buffer_exists(buff) && surface_exists(surf)) {
	if (capture_grab_frame_buffer(capture, buffer_get_address(buff))) {
      buffer_set_surface(buff, surf, 0);
	  draw_surface(surf, 0, 0);
	}
  }
}