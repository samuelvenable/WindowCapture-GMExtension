var msg = "Window ID list:\n\n";
var list = capture_create_window_list();
for (var i = 0; i < capture_get_window_id_length(list); i++) {
  var wid = capture_get_window_id(list, i);
  var title = capture_get_window_caption(wid);
  if (title != "") {
    msg += wid + " - " + title + "\n";
  }
}
capture_destroy_window_list(list);
show_message(msg);
win = get_string("Enter a window ID, (or click 'Cancel' for default):", WindowIdFromNativeWindow(window_handle()));
if (win == "") win = WindowIdFromNativeWindow(window_handle());
if (capture != -1) capture_delete(capture);
capture = capture_add(ptr(int64(win)));
w = capture_get_width(capture);
h = capture_get_height(capture);
if (w <= 0 || h <= 0) game_end();
chan = buffer_sizeof(buffer_u64);
buff = buffer_create(chan * w * h, buffer_grow, chan);
surf = -1;
buffer_poke(buff, buffer_get_size(buff) - 1, buffer_u8, 0);
