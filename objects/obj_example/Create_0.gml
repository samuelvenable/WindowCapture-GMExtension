/**
*** This is a GameMaker extension which allows you to capture the pixel data of external windows, 
*** and draw that pixel data to the screen or also save it as an image file to disk. You can also 
*** capture your entire primary monitor, (to do this, pass a pointer_null argument to the function 
*** capture_add(window)). It can only capture certain types of windows. In particular, it works great 
*** with windows which are rendered with OpenGL or Vulkan. Other types of windows also can work.
***
*** It doesn't work with windows which are rendered with Microsoft's Direct3D graphics, and since 
*** GameMaker games use Direct3D, GameMaker games can't be capured. This may be fixed down the line 
*** but it will require switching API's from using BitBlt() to a Windows 10+ API which can only be 
*** compiled with Visual Studio and it won't work with things like MinGW due to needing WinRT API 
*** access. Contributors are welcome! This extension is currently a work in progress. Bugs exist.
**/

widget_set_owner(string(int64(window_handle())));
window_set_caption("WindowCapture");
alarm[0] = 100;
capture = -1;
