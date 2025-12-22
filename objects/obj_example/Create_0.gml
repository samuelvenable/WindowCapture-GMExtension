/**
*** This is a GameMaker extension which allows you to capture the pixel data of external windows, 
*** and draw that pixel data to the screen or also save it as an image file to disk. You can also 
*** capture your entire primary monitor, (to do this, pass a pointer_null argument to the function 
*** capture_add(window)). It can only capture certain types of windows. In particular, it works great 
*** with windows which are rendered with OpenGL or Vulkan. Other types of windows also can work.
***
*** It doesn't work with windows which are rendered with Microsoft's Direct3D graphics, and since 
*** GameMaker games use Direct3D, GameMaker games can't be captured. However, as a workaround, you
*** may use the AllowCapture Extension to capture GameMaker games and apps you created yourself.
*** AllowCapture Extension lives here: https://github.com/samuelvenable/AllowCapture-GMExtension
**/

window_set_caption("WindowCapture");
alarm[0] = 100;
capture = -1;
