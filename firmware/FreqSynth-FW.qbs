import qbs
import qbs.FileInfo
import "qbs/imports/FileExtension.js" as FileExtension


Project {
    qbsSearchPaths: "qbs"

    stm32f_chip: "STM32F030K6"
    stm32f_type: "030x6"
    stm32f_family: "0xx"
    coretex_mcu: "cortex-m0"

    CppApplication {
        name: "FreqSynth-FW"
        targetName: name + ".output"

        files: [
            "Inc/**",
            "Src/**",
            "Drivers/CMSIS/Device/ST/STM32F"+ stm32f_family +"/Source/Templates/gcc/startup_stm32f"+ stm32f_type +".S",
            "Drivers/CMSIS/Device/ST/STM32F"+ stm32f_family +"/Source/Templates/system_stm32f"+ stm32f_family +".c",
            "qbs/LibraryHacks.cpp",
            "Drivers/STM32F"+ stm32f_family +"_HAL_Driver/Src/**",
        ]

        cpp.includePaths: [
            "Inc/",
            "Drivers/STM32F"+ stm32f_family +"_HAL_Driver/Inc",
            "Drivers/CMSIS/Include",
            "Drivers/CMSIS/Device/ST/STM32F"+ stm32f_family +"/Include/"
        ]
        type: ["application", "hex","bin","size", "elf", "disassembly"]
        Depends { name: "cpp" }
        cpp.warningLevel: 'all'
        cpp.positionIndependentCode: false
        cpp.cxxFlags: [
            "-std=gnu++0x",
            "-fno-rtti",
            "-pedantic-errors",
            "-fno-threadsafe-statics",
            "-Werror"
        ]
        cpp.cFlags: [
            "-std=gnu99",
            "-Wno-unused-variable"
        ]
        cpp.defines: [
            "STM32F"+ stm32f_type,
            "USE_HAL_DRIVER",
            "__weak=__attribute__((weak))",
            "__packed=__attribute__((__packed__))"
        ]

        Properties {
            condition: qbs.buildVariant === "debug"

            cpp.commonCompilerFlags: [
                "-mcpu="+coretex_mcu,
                "-mthumb",
                "-fno-exceptions",
                "-ffunction-sections",
                "-fdata-sections"
            ]
            cpp.debugInformation: true
            cpp.optimization: "none"
        }

        Properties {
            condition: qbs.buildVariant === "release"

            cpp.commonCompilerFlags: [
                "-mcpu="+coretex_mcu,
                "-mthumb",
                "-DNDEBUG",
                "-fno-exceptions",
                "-ffunction-sections",
                "-fdata-sections"
            ]
            cpp.debugInformation: false
            cpp.optimization: "small"
        }

        cpp.linkerFlags: [
            "-T"+path+"/"+stm32f_chip+"_FLASH.ld",
            "-mcpu="+coretex_mcu,
            "-mthumb",
            "-lc",
            "-Wl,-Map=" + buildDirectory +
            "/"+name+".map",
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
