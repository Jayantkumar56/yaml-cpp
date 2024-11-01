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
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        symbols "On"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        symbols "Off"
        optimize "on"


