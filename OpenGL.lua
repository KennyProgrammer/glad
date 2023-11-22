--
-- Main Premake5 file for building OpenGL wtih GLAD project.
-- Copyright (c) 2020-2023 by Danil (Kenny) Dukhovenko, All rights reserved.
--
-- Requirement:
--  - ForceEngine.lua
--

-- OpenGL/GLAD C++ Project
project "OpenGL"
	kind          "StaticLib"
	language      "C"
	staticruntime "on"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/obj")

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
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"