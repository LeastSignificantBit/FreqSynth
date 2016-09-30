import qbs
import qbs.FileInfo
import "qbs/imports/FileExtension.js" as FileExtension


Project {
    qbsSearchPaths: "qbs"
    CppApplication {
        name: "FreqSynthFW"
        targetName: name + ".output"

        files: [
            "src/**",
            "system/f030_48_8/Startup.S",
            "system/f030_48_8/System.c",
            "system/LibraryHacks.cpp",
        ]

        cpp.includePaths: [
            "src/",
            "inc/"
        ]
        type: ["application", "hex","bin","size", "elf", "disassembly"]
        Depends { name: "stm32plus" }
        Depends { name: "cpp" }
        cpp.warningLevel: 'all'
        cpp.positionIndependentCode: false
        cpp.cxxFlags: [
            "-std=gnu++0x",
            "-fno-rtti",
            "-pedantic-errors",
            "-fno-threadsafe-statics",
        ]
        cpp.cFlags: [
            "-std=gnu99"
        ]
        cpp.defines: [
            "STM32PLUS_F0_30",
            "HSI_VALUE=8000000"
        ]

        Properties {
            condition: qbs.buildVariant === "debug"

            cpp.commonCompilerFlags: [
                "-mcpu=cortex-m0",
                "-mthumb",
                "-mfloat-abi=soft",
                "-fno-exceptions",
                "-ffunction-sections",
                "-fdata-sections",
                "-Werror"
            ]
            cpp.debugInformation: true
            cpp.optimization: "none"
        }

        Properties {
            condition: qbs.buildVariant === "release"

            cpp.commonCompilerFlags: [
                "-mcpu=cortex-m0",
                "-mthumb",
                "-mfloat-abi=soft",
                "-DNDEBUG",
                "-fno-exceptions",
                "-ffunction-sections",
                "-fdata-sections",
                "-Werror"
            ]
            cpp.debugInformation: false
            cpp.optimization: "small"
        }

        cpp.linkerFlags: [
            "-T"+path+"/system/f030_48_8/Linker.ld",
            "-mcpu=cortex-m0",
            "-mfloat-abi=soft",
            "-mthumb",
            "-lc",
            "-Wl,-Map,build"+targetName+".map",
            "-ffunction-sections",
            "-fdata-sections",
            "-Wl,--gc-sections",
            //"--specs=nano.specs",
            "--specs=nosys.specs"
        ]

        Rule {
            id: hex
            inputs: "application"
            Artifact {
                fileTags: "hex"
                filePath: "../../" + FileExtension.FileExtension(input.filePath, 1) + "/" + FileInfo.baseName(input.filePath) + ".hex"
            }
            prepare: {
                var args = ["-O", "ihex", input.filePath, output.filePath];
                var cmd = new Command("arm-none-eabi-objcopy", args);
                cmd.description = "converting to hex: "+FileInfo.fileName(input.filePath);
                cmd.highlight = "linker";
                return cmd;
            }
        }

        Rule {
            id: elf
            inputs: "application"
            Artifact {
                fileTags: "elf"
                filePath: "../../" + FileExtension.FileExtension(input.filePath, 1) + "/" + FileInfo.baseName(input.filePath) + ".elf"
            }
            prepare: {
                var args = [input.filePath, output.filePath];
                var cmd = new Command("cp", args);
                cmd.description = "copying elf: "+FileInfo.fileName(input.filePath);
                cmd.highlight = "linker";
                return cmd;
            }
        }

        Rule {
            id: bin
            inputs: "application"
            Artifact {
                fileTags: "bin"
                filePath: "../../" + FileExtension.FileExtension(input.filePath, 1) + "/" + FileInfo.baseName(input.filePath) + ".bin"
            }
            prepare: {
                var args = ["-O", "binary", input.filePath, output.filePath];
                var cmd = new Command("arm-none-eabi-objcopy", args);
                cmd.description = "converting to bin: "+FileInfo.fileName(input.filePath);
                cmd.highlight = "linker";
                return cmd;

            }
        }

        Rule {
            id: size
            inputs: "application"
            Artifact {
                fileTags: "size"
                filePath: "-"
            }
            prepare: {
                var args = [input.filePath];
                var cmd = new Command("arm-none-eabi-size", args);
                cmd.description = "File size: " + FileInfo.fileName(input.filePath);
                cmd.highlight = "linker";
                return cmd;
            }
        }

        Rule {
            id: disassmbly
            inputs: "application"
            Artifact {
                fileTags: "disassembly"
                filePath: "../../" + FileExtension.FileExtension(input.filePath, 1) + "/" + FileInfo.baseName(input.filePath) + ".lst"
            }
            prepare: {
                var args = [input.filePath, output.filePath];
                var cmd = new Command("elf2lst", args);
                cmd.description = "Disassembly listing for " + cmd.workingDirectory;
                cmd.highlight = "disassembler";
                cmd.silent = true;

                return cmd;
            }
        }
    }
}
