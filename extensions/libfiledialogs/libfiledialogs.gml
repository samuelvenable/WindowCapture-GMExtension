#define _DialogInitialize
	EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(window_handle())));
	EnvironmentSetVariable("IMGUI_FONT_PATH", working_directory + string_lower("Fonts"));
	_IfdLoadFonts();

#define ShowMessage
	_ShowMessage(string(argument0));
	return 1;

#define ShowQuestion
	res = _ShowQuestion(string(argument0));
	return ((EnvironmentGetVariable("IMGUI_YES") != "") ? (res == EnvironmentGetVariable("IMGUI_YES")) : (res == "Yes"));

#define ShowQuestionExt
	res = _ShowQuestionExt(string(argument0));
	if ((EnvironmentGetVariable("IMGUI_YES") != "") ? (res == EnvironmentGetVariable("IMGUI_YES")) : (res == "Yes")) {
		return 1;
	} else if ((EnvironmentGetVariable("IMGUI_NO") != "") ? (res == EnvironmentGetVariable("IMGUI_NO")) : (res == "No")) {
		return 0;
	}
	return -1;

#define GetString
	res = _GetString(string(argument0), string(argument1));
	return res;

#define GetNumber
	res = _GetNumber(string(argument0), real(argument1));
	return real(res);

#define GetOpenFileName
	res = _GetOpenFileName(string(argument0), string(argument1), string(argument2), string(argument3));
	if (res == "(null)") res = "";
	return res;

#define GetOpenFileNames
	res = _GetOpenFileNames(string(argument0), string(argument1), string(argument2), string(argument3));
	if (res == "(null)") res = "";
	return res;

#define GetSaveFileName
	res = _GetSaveFileName(string(argument0), string(argument1), string(argument2), string(argument3));
	if (res == "(null)") res = "";
	return res;

#define GetDirectory
	res = _GetDirectory(string(argument0), string(argument1));
	if (res == "(null)") res = "";
	return res;
