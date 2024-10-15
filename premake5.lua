project "yaml-cpp"
    kind "StaticLib"
    language "C++"
    staticruntime "On"
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

