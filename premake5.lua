project "yaml-cpp"
    kind "StaticLib"
    language "C++"
    staticruntime "on"
    cppdialect "C++20"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp",
        "include/**.h"
    }
    
    includedirs
    {
        "include"
    }
    
    -- temporarily manually defined YAML_CPP_STATIC_DEFINE in ./include/yaml-cpp/dll.h  (at line no. 9)
    -- TO DO: make it work :-
    -- defines
	-- {
    --     "YAML_CPP_STATIC_DEFINE"
	-- }

    filter "configurations:Debug"
        defines "QK_DEBUG" 
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "QK_RELEASE"
        runtime "Release"
        symbols "On"
        optimize "On"

    filter "configurations:Dist"
        defines "QK_DIST"
        runtime "Release"
        symbols "Off"
        optimize "Full"


