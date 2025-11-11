# WindowCapture GameMaker Extension

Capture Screenshots of External Windows in GameMaker Projects

Working on a GameMaker extension which allows you to capture the pixel data external windows, and draw that pixel data to the screen or also optionally save it as an image to disk. GameMaker's IDE is on the left. The window on the right is the demo project running, and it is capturing the pixel data of the GameMaker IDE, which is why it looks like there is a duplicate instance of the IDE. 🙂 You can capture your primary desktop monitor, (to do this, pass `pointer_null` to `capture_add(window)`). It can only capture certain types of windows. In particular, it works great with windows which are rendered with OpenGL or Vulkan. It doesn't work with Direct3D and since GameMaker games use Direct3D GameMaker games can't be capured. This may be fixed down the line but it will require switching API's from using `BitBlt()` to a Windows 10+ API which can only be compiled with Visual Studio and won't work with things like MinGW due to needing WinRT API access. Contributors are welcome!

https://github.com/user-attachments/assets/ad94f00a-8e75-4739-9ded-2203bc9ae939
