IncludeDir = {}
IncludeDir["GLFW"] = "%{wks.location}/Dependencies/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Dependencies/Glad/include"

project "ImGui"
	kind "StaticLib"
	language "C++"
	systemversion "latest"
	cppdialect "C++17"
	staticruntime "On"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
        "imgui_tables.cpp",
        "imgui_impl_glfw.h",
        "imgui_impl_glfw.cpp",
        "imgui_impl_opengl3.h",
        "imgui_impl_opengl3.cpp"
	}

    defines
	{
		"IMGUI_IMPL_OPENGL_LOADER_GLAD"
	}

    includedirs
	{
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
