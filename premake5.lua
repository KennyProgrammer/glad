--
-- Main Premake5 file for building OpenGL wtih GLAD project.
-- Copyright (c) 2020-2023 by Danil (Kenny) Dukhovenko, All rights reserved.
--

-- OpenGL/GLAD C++ Project
project "OpenGL"
	kind "StaticLib"
	language "C"
	staticruntime "on"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"include/glad/glad.h",
		"include/glad/glad_wgl.h",
		"include/KHR/khrplatform.h",
		"src/glad.c",
		"src/glad_wgl.c"
	}

	includedirs {
		"include"
	}
	
	links {
		"%{Library.OpenGL32}"
	}

	filter "system:windows"
		systemversion "latest"

		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"