project "OpenGl"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/glad/glad.h",
		"include/glad/glad_wgl.h",
		"include/KHR/khrplatform.h",
		"src/glad.c",
		"src/glad_wgl.c"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"

		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"