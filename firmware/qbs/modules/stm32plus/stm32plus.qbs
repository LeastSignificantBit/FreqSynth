import qbs
Module {
    Depends { name: "cpp" }
    property string stm32plus_path: "stm32plus/"
    cpp.includePaths: [
        stm32plus_path + "lib/",
        stm32plus_path + "lib/include/",
        stm32plus_path + "lib/include/stl/"
    ]
	cpp.libraryPath: stm32plus_path + "lib/build/"
	Properties {
	        condition: qbs.buildVariant === "release"
        cpp.staticLibraries: [path+"/../../../"+stm32plus_path + "lib/build/small-f030-8000000i/libstm32plus-small-f030-8000000i.a"]
	}
	Properties {
	        condition: qbs.buildVariant === "debug"
        cpp.staticLibraries: [path+"/../../../"+stm32plus_path + "lib/build/debug-f030-8000000i/libstm32plus-debug-f030-8000000i.a"]
		
	}	
}

