import qbs
Module {
    Depends { name: "cpp" }
    property string xyzPath: "the/xyz/path"
    cpp.includePaths: xyzPath + "/include"
    cpp.libraryPath: xyzPath + "/lib"
    cpp.staticLibraries: "xyz"
}
