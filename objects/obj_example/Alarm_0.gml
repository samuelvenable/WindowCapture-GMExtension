var def = WindowIdFromNativeWindow(window_handle());
var msg = "Window ID list:\n\n";
var list = capture_create_window_list();
for (var i = 0; i < capture_get_window_id_length(list); i++) {
  var wid = capture_get_window_id(list, i);
  var title = capture_get_window_caption(wid);
  msg += wid + " - " + title + "\n";
  if (string_count(" - GameMaker", title) > 0) {
    def = wid;
  }
}
capture_destroy_window_list(list);
show_message(msg);
win = get_string("Enter a window ID, (or click 'Cancel' for default):", def);
if (win == "") win = def;
if (capture != -1) capture_delete(capture);
capture = capture_add(ptr(int64(win)));
w = capture_get_width(capture);
h = capture_get_height(capture);
if (w <= 0 || h <= 0) game_end();
capture_set_fixedsize(capture, true);
chan = buffer_sizeof(buffer_u64);
buff = buffer_create(chan * w * h, buffer_fixed, chan);
surf = -1;
buffer_poke(buff, buffer_get_size(buff) - 1, buffer_u8, 0);
