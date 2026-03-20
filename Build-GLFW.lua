project "GLFW"
	kind "StaticLib"
	language "C"

targetdir (ThirdPartyBinDir)
objdir (ThirdPartyIntDir)

files
{
	"include/GLFW/glfw3.h",
	"include/GLFW/glfw3native.h",
	
	"src/internal.h",
	"src/platform.h",
	"src/mappings.h",
	"src/context.c",
	"src/init.c",
	"src/input.c",
	"src/monitor.c",
	"src/platform.c",
	"src/vulkan.c",
	"src/window.c",
	"src/null_platform.h",
	"src/null_joystick.h",
	"src/null_init.c",
	
	"src/null_monitor.c",
	"src/null_window.c",
	"src/null_joystick.c",
}

filter "system:windows"
systemversion "latest"

files {
	-- Win32 platform
	"src/win32_init.c",
	"src/win32_joystick.c",
	"src/win32_monitor.c",
	"src/win32_time.c",
	"src/win32_window.c",
	"src/win32_thread.c",
	"src/win32_module.c",
	
	-- Context backends
	"src/wgl_context.c",
	"src/egl_context.c",
	"src/osmesa_context.c",
}

defines {
	"_GLFW_WIN32",
	"_CRT_SECURE_NO_WARNINGS",
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