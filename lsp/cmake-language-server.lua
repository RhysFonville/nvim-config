return {
    cmd = { "cmake-language-server" },
	filetypes = {"cmake", "CMakeLists.txt"},
    init_options = {
        buildDirectory = "build"
    },
    root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" }
}
