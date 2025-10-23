if (buffer_exists(buff) && surface_exists(surf)) {
  buffer_delete(buff);
  surface_free(surf);
}
if (capture_exists(capture)) {
  capture_delete(capture);
}