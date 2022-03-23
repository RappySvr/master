workspace "master"
	location ".\\build\\"

	targetdir "%{wks.location}\\bin\\%{cfg.buildcfg}\\"
	objdir "%{wks.location}\\obj\\%{cfg.buildcfg}\\%{prj.name}\\"
	buildlog "%{wks.location}\\obj\\%{cfg.buildcfg}\\%{prj.name}.log"

	largeaddressaware "on"
	editandcontinue "off"
	staticruntime "on"

	systemversion "latest"
	characterset "mbcs"
	architecture "x86"
	warnings "off"

	includedirs {
		".\\src\\",
	}
	
	platforms {
		"x86",
	}

	configurations {
		"Debug",
		"Release",
	}

	configuration "Debug"
		defines "DEBUG"
		optimize "debug"
		runtime "debug"
		symbols "on"

	configuration "Release"
		defines "NDEBUG"
		optimize "full"
		runtime "release"
		symbols "off"

	project "account_add"
		language "c"
		kind "consoleapp"

		pchheader "stdafx.h"
		pchsource "src/account_add/stdafx.c"
		forceincludes "stdafx.h"
		
		dependson {
			"md5",
		}

		links {
			"md5",
		}

		files {
			".\\src\\account_add\\**",
		}

		includedirs {
			".\\src\\account_add\\",
			".\\src\\md5\\include\\",
		}

	project "login_server"
		language "c"
		kind "consoleapp"

		pchheader "stdafx.h"
		pchsource "src/login_server/stdafx.c"
		forceincludes "stdafx.h"
		
		dependson {
			"md5",
		}

		links {
			"md5",
			"ws2_32",
		}

		files {
			".\\src\\login_server\\**",
		}

		includedirs {
			".\\src\\login_server\\",
			".\\src\\md5\\include\\",
		}

	project "make_key"
		language "c"
		kind "consoleapp"

		dependson {
			"mtwist",
		}

		links {
			"mtwist",
		}

		files {
			".\\src\\make_key\\**",
		}

		includedirs {
			".\\src\\make_key\\",
			".\\src\\mtwist\\",
		}

	project "patch_server"
		language "c"
		kind "consoleapp"

		links {
			"ws2_32",
		}

		files {
			".\\src\\patch_server\\**",
		}

		includedirs {
			".\\src\\patch_server\\",
		}

	project "ship_server"
		language "c"
		kind "consoleapp"

		dependson {
			"prs",
			"mtwist",
		}

		links {
			"prs",
			"mtwist",
			"ws2_32",
		}

		files {
			".\\src\\ship_server\\**",
		}

		includedirs {
			".\\src\\ship_server\\",
			".\\src\\prs\\include",
		}
		
	group "Dependencies"
		
	project "md5"
		language "c"
		kind "staticlib"
		
		files {
			".\\src\\md5\\**",
		}

		includedirs {
			".\\src\\md5\\include\\",
		}

	project "prs"
		language "c"
		kind "staticlib"
		
		files {
			".\\src\\prs\\**",
		}

		includedirs {
			".\\src\\prs\\include\\",
		}

	project "mtwist"
		language "c"
		kind "staticlib"
		
		files {
			".\\src\\mtwist\\mtwist.c",
			".\\src\\mtwist\\mtwist.h",
		}

		includedirs {
			".\\src\\mtwist\\",
		}