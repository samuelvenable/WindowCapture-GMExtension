draw_set_color(c_white);
display_set_gui_size(window_get_width(), window_get_height());
if (capture_exists(capture)) {
  if (!surface_exists(surf) && w > 0 && h > 0) {
    surf = surface_create(w, h);
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
  }
}