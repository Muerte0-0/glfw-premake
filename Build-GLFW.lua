project "GLFW"
	kind "StaticLib"
	language "C"

targetdir (ThirdPartyBinDir)
objdir (ThirdPartyIntDir)

files
{
	"include/GLFW/glfw3.h",
	"include/GLFW/glfw3native.h",
	"src/context.c",
	"src/init.c",
	"src/input.c",
	"src/monitor.c",
	"src/platform.c",
	"src/vulkan.c",
	"src/window.c",
}

filter "system:windows"
systemversion "latest"

files {
	"src/win32_init.c",
	"src/win32_joystick.c",
	"src/win32_monitor.c",
	"src/win32_time.c",
	"src/win32_window.c",
	"src/wgl_context.c"
}

defines {
	"_GLFW_WIN32",
	"_CRT_SECURE_NO_WARNINGS"
}

links {
	"gdi32",
	"user32",
	"shell32"
}

filter "system:linux"
systemversion "latest"

defines {
	"_GLFW_X11"
}

files {
	-- Core
	"src/context.c",
	"src/init.c",
	"src/input.c",
	"src/monitor.c",
	"src/platform.c",
	"src/vulkan.c",
	"src/window.c",

	-- POSIX
	"src/posix_module.c",
	"src/posix_poll.c",
	"src/posix_thread.c",
	"src/posix_time.c",

	-- X11
	"src/x11_init.c",
	"src/x11_monitor.c",
	"src/x11_window.c",
	"src/xkb_unicode.c",
	"src/linux_joystick.c"
}

links {
	"X11",
	"Xrandr",
	"Xi",
	"Xxf86vm",
	"Xcursor",
	"pthread",
	"dl",
	"m"
}

filter "configurations:Debug"
runtime "Debug"
symbols "on"

filter "configurations:Release"
runtime "Release"
optimize "on"

filter "configurations:Dist"
runtime "Release"
optimize "on"