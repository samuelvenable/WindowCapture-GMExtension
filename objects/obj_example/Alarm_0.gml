var def = string(int64(window_handle()));
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
if (win == "0") {
  var prompt = "";
  capture_monitor_init_info();
  var moncnt = capture_monitor_get_count();
  if (moncnt == 0) game_end();
  var msg = "Monitor ID list:\n\n";
  for (var i = 0; i < moncnt; i++) {
    capture_monitor_set_current(i);
    var name = capture_monitor_get_name();
    msg += string(capture_monitor_get_current()) + " - " + name + "\n";
  }
  show_message(msg);
  if (moncnt == 1) prompt = "Enter a monitor ID, (only 0 is valid).";
  if (moncnt >= 2) prompt = "Enter a monitor ID, (only 0-" + string(moncnt - 1) + " is valid).";
  capture_monitor_set_current(get_integer(prompt, 0));
}
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
