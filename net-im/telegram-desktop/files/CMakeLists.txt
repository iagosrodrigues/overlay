cmake_minimum_required(VERSION 2.8.8 FATAL_ERROR)
cmake_policy(VERSION 2.8.8)
project(Telegram)
set(configuration "Debug")
set(CMAKE_AR "/usr/bin/gcc-ar")
set(CMAKE_RANLIB "/usr/bin/gcc-ranlib")
set(CMAKE_NM "/usr/bin/gcc-nm")
enable_language(ASM)
set(builddir "${CMAKE_CURRENT_BINARY_DIR}")
set(obj "${builddir}/obj")

set(CMAKE_C_OUTPUT_EXTENSION_REPLACE 1)
set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE 1)

set(CMAKE_NINJA_FORCE_RESPONSE_FILE 1)


#utils.gyp:Updater#target
set(TARGET "Updater")
set(TOOLSET "target")
set(Updater__cxx_srcs "../../Telegram/SourceFiles/_other/updater_linux.cpp")
set(Updater__other_srcs "../../Telegram/SourceFiles/_other/updater.h")
add_executable(Updater ${Updater__cxx_srcs} ${Updater__other_srcs})
set_target_properties(Updater PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${Updater__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(Updater PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(Updater PROPERTIES PREFIX "")
set_target_properties(Updater PROPERTIES RUNTIME_OUTPUT_NAME "Updater")
set_target_properties(Updater PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/Updater PROPERTIES GENERATED "TRUE")
set(Updater__include_dirs "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles")
set_property(TARGET Updater APPEND PROPERTY INCLUDE_DIRECTORIES ${Updater__include_dirs})
set_target_properties(Updater PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(Updater PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(Updater PROPERTIES LINK_FLAGS "-static-libstdc++ -g ")
set_target_properties(Updater PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(Updater PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(Updater PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
unset(TOOLSET)
unset(TARGET)

#linux_glibc_wraps.gyp:linux_glibc_wraps#target
set(TARGET "linux_glibc_wraps")
set(TOOLSET "target")
list(APPEND linux_glibc_wraps__c_srcs
  "../../Telegram/SourceFiles/platform/linux/linux_glibc_wraps.c"
  "../../Telegram/SourceFiles/platform/linux/linux_glibc_wraps_64.c")
add_library(linux_glibc_wraps STATIC ${linux_glibc_wraps__c_srcs})
set_target_properties(linux_glibc_wraps PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(linux_glibc_wraps PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(linux_glibc_wraps PROPERTIES PREFIX "lib")
set_target_properties(linux_glibc_wraps PROPERTIES ARCHIVE_OUTPUT_NAME "linux_glibc_wraps")
set_target_properties(linux_glibc_wraps PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/liblinux_glibc_wraps.a PROPERTIES GENERATED "TRUE")
set_target_properties(linux_glibc_wraps PROPERTIES COMPILE_FLAGS "")
unset(TOOLSET)
unset(TARGET)

#utils.gyp:Packer#target
set(TARGET "Packer")
set(TOOLSET "target")
set(Packer__cxx_srcs "../../Telegram/SourceFiles/_other/packer.cpp")
set(Packer__other_srcs "../../Telegram/SourceFiles/_other/packer.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
)
add_executable(Packer ${Packer__cxx_srcs} ${Packer__other_srcs})
set_target_properties(Packer PROPERTIES EXCLUDE_FROM_ALL "TRUE")
set_source_files_properties(${Packer__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(Packer PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(Packer PROPERTIES PREFIX "")
set_target_properties(Packer PROPERTIES RUNTIME_OUTPUT_NAME "Packer")
set_target_properties(Packer PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/Packer PROPERTIES GENERATED "TRUE")
list(APPEND Packer__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/lzma/C"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/zlib"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/openssl/include")
set_property(TARGET Packer APPEND PROPERTY INCLUDE_DIRECTORIES ${Packer__include_dirs})
set_target_properties(Packer PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(Packer PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(Packer PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(Packer PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(Packer PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(Packer PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(Packer
  linux_glibc_wraps
  "ssl"
  "crypto"
  "lzma"
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests_rpl#target
set(TARGET "tests_rpl")
set(TOOLSET "target")
list(APPEND tests_rpl__cxx_srcs
  "../../Telegram/SourceFiles/rpl/operators_tests.cpp"
  "../../Telegram/SourceFiles/rpl/producer_tests.cpp"
  "../../Telegram/SourceFiles/rpl/variable_tests.cpp"
  "../../Telegram/SourceFiles/base/tests_main.cpp")
list(APPEND tests_rpl__other_srcs
  "../../Telegram/SourceFiles/rpl/details/callable.h"
  "../../Telegram/SourceFiles/rpl/details/superset_type.h"
  "../../Telegram/SourceFiles/rpl/details/type_list.h"
  "../../Telegram/SourceFiles/rpl/after_next.h"
  "../../Telegram/SourceFiles/rpl/before_next.h"
  "../../Telegram/SourceFiles/rpl/combine.h"
  "../../Telegram/SourceFiles/rpl/combine_previous.h"
  "../../Telegram/SourceFiles/rpl/complete.h"
  "../../Telegram/SourceFiles/rpl/consumer.h"
  "../../Telegram/SourceFiles/rpl/deferred.h"
  "../../Telegram/SourceFiles/rpl/distinct_until_changed.h"
  "../../Telegram/SourceFiles/rpl/event_stream.h"
  "../../Telegram/SourceFiles/rpl/fail.h"
  "../../Telegram/SourceFiles/rpl/filter.h"
  "../../Telegram/SourceFiles/rpl/flatten_latest.h"
  "../../Telegram/SourceFiles/rpl/lifetime.h"
  "../../Telegram/SourceFiles/rpl/map.h"
  "../../Telegram/SourceFiles/rpl/mappers.h"
  "../../Telegram/SourceFiles/rpl/merge.h"
  "../../Telegram/SourceFiles/rpl/never.h"
  "../../Telegram/SourceFiles/rpl/producer.h"
  "../../Telegram/SourceFiles/rpl/range.h"
  "../../Telegram/SourceFiles/rpl/rpl.h"
  "../../Telegram/SourceFiles/rpl/skip.h"
  "../../Telegram/SourceFiles/rpl/take.h"
  "../../Telegram/SourceFiles/rpl/then.h"
  "../../Telegram/SourceFiles/rpl/type_erased.h"
  "../../Telegram/SourceFiles/rpl/variable.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(tests_rpl ${tests_rpl__cxx_srcs} ${tests_rpl__other_srcs})
set_target_properties(tests_rpl PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${tests_rpl__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(tests_rpl PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(tests_rpl PROPERTIES PREFIX "")
set_target_properties(tests_rpl PROPERTIES RUNTIME_OUTPUT_NAME "tests_rpl")
set_target_properties(tests_rpl PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/tests_rpl PROPERTIES GENERATED "TRUE")
list(APPEND tests_rpl__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/Catch/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET tests_rpl APPEND PROPERTY INCLUDE_DIRECTORIES ${tests_rpl__include_dirs})
set_target_properties(tests_rpl PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(tests_rpl PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(tests_rpl PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(tests_rpl PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(tests_rpl PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(tests_rpl PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(tests_rpl
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests_flat_set#target
set(TARGET "tests_flat_set")
set(TOOLSET "target")
list(APPEND tests_flat_set__cxx_srcs
  "../../Telegram/SourceFiles/base/flat_set_tests.cpp"
  "../../Telegram/SourceFiles/base/tests_main.cpp")
set(tests_flat_set__other_srcs "../../Telegram/SourceFiles/base/flat_set.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(tests_flat_set ${tests_flat_set__cxx_srcs} ${tests_flat_set__other_srcs})
set_target_properties(tests_flat_set PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${tests_flat_set__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(tests_flat_set PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(tests_flat_set PROPERTIES PREFIX "")
set_target_properties(tests_flat_set PROPERTIES RUNTIME_OUTPUT_NAME "tests_flat_set")
set_target_properties(tests_flat_set PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/tests_flat_set PROPERTIES GENERATED "TRUE")
list(APPEND tests_flat_set__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/Catch/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET tests_flat_set APPEND PROPERTY INCLUDE_DIRECTORIES ${tests_flat_set__include_dirs})
set_target_properties(tests_flat_set PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(tests_flat_set PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(tests_flat_set PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(tests_flat_set PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(tests_flat_set PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(tests_flat_set PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(tests_flat_set
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests_flat_map#target
set(TARGET "tests_flat_map")
set(TOOLSET "target")
list(APPEND tests_flat_map__cxx_srcs
  "../../Telegram/SourceFiles/base/flat_map_tests.cpp"
  "../../Telegram/SourceFiles/base/tests_main.cpp")
set(tests_flat_map__other_srcs "../../Telegram/SourceFiles/base/flat_map.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(tests_flat_map ${tests_flat_map__cxx_srcs} ${tests_flat_map__other_srcs})
set_target_properties(tests_flat_map PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${tests_flat_map__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(tests_flat_map PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(tests_flat_map PROPERTIES PREFIX "")
set_target_properties(tests_flat_map PROPERTIES RUNTIME_OUTPUT_NAME "tests_flat_map")
set_target_properties(tests_flat_map PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/tests_flat_map PROPERTIES GENERATED "TRUE")
list(APPEND tests_flat_map__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/Catch/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET tests_flat_map APPEND PROPERTY INCLUDE_DIRECTORIES ${tests_flat_map__include_dirs})
set_target_properties(tests_flat_map PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(tests_flat_map PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(tests_flat_map PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(tests_flat_map PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(tests_flat_map PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(tests_flat_map PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(tests_flat_map
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests_flags#target
set(TARGET "tests_flags")
set(TOOLSET "target")
list(APPEND tests_flags__cxx_srcs
  "../../Telegram/SourceFiles/base/flags_tests.cpp"
  "../../Telegram/SourceFiles/base/tests_main.cpp")
set(tests_flags__other_srcs "../../Telegram/SourceFiles/base/flags.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(tests_flags ${tests_flags__cxx_srcs} ${tests_flags__other_srcs})
set_target_properties(tests_flags PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${tests_flags__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(tests_flags PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(tests_flags PROPERTIES PREFIX "")
set_target_properties(tests_flags PROPERTIES RUNTIME_OUTPUT_NAME "tests_flags")
set_target_properties(tests_flags PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/tests_flags PROPERTIES GENERATED "TRUE")
list(APPEND tests_flags__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/Catch/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET tests_flags APPEND PROPERTY INCLUDE_DIRECTORIES ${tests_flags__include_dirs})
set_target_properties(tests_flags PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(tests_flags PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(tests_flags PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(tests_flags PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(tests_flags PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(tests_flags PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(tests_flags
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests_algorithm#target
set(TARGET "tests_algorithm")
set(TOOLSET "target")
list(APPEND tests_algorithm__cxx_srcs
  "../../Telegram/SourceFiles/base/algorithm_tests.cpp"
  "../../Telegram/SourceFiles/base/tests_main.cpp")
set(tests_algorithm__other_srcs "../../Telegram/SourceFiles/base/algorithm.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(tests_algorithm ${tests_algorithm__cxx_srcs} ${tests_algorithm__other_srcs})
set_target_properties(tests_algorithm PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${tests_algorithm__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(tests_algorithm PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(tests_algorithm PROPERTIES PREFIX "")
set_target_properties(tests_algorithm PROPERTIES RUNTIME_OUTPUT_NAME "tests_algorithm")
set_target_properties(tests_algorithm PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/tests_algorithm PROPERTIES GENERATED "TRUE")
list(APPEND tests_algorithm__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/Catch/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET tests_algorithm APPEND PROPERTY INCLUDE_DIRECTORIES ${tests_algorithm__include_dirs})
set_target_properties(tests_algorithm PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(tests_algorithm PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(tests_algorithm PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(tests_algorithm PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(tests_algorithm PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(tests_algorithm PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(tests_algorithm
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#lib_scheme.gyp:lib_scheme#target
set(TARGET "lib_scheme")
set(TOOLSET "target")
list(APPEND lib_scheme__codegen_scheme__input
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/codegen/scheme/codegen_scheme.py"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/tl/mtproto.tl"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/tl/api.tl")
list(APPEND lib_scheme__codegen_scheme__output
  "${obj}/gen/scheme.cpp"
  "${obj}/gen/scheme.h")
add_custom_command(OUTPUT ${lib_scheme__codegen_scheme__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND python ../SourceFiles/codegen/scheme/codegen_scheme.py -o "${obj}/gen" ../Resources/tl/mtproto.tl ../Resources/tl/api.tl
  DEPENDS ${lib_scheme__codegen_scheme__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_scheme-ing *.tl..
  VERBATIM
)
add_custom_target(lib_scheme__codegen_scheme
  DEPENDS ${lib_scheme__codegen_scheme__output}
  SOURCES ${lib_scheme__codegen_scheme__input}
)
set(lib_scheme__cxx_srcs "${obj}/gen/scheme.cpp")
set(lib_scheme__other_srcs "${obj}/gen/scheme.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_library(lib_scheme STATIC ${lib_scheme__cxx_srcs} ${lib_scheme__other_srcs})
set_target_properties(lib_scheme PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(lib_scheme__codegen_scheme PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_scheme__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_scheme PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_scheme PROPERTIES PREFIX "lib")
set_target_properties(lib_scheme PROPERTIES ARCHIVE_OUTPUT_NAME "_scheme")
set_target_properties(lib_scheme PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_scheme.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_scheme__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET lib_scheme APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_scheme__include_dirs})
set_target_properties(lib_scheme PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_scheme PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(lib_scheme PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(lib_scheme PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_scheme PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_scheme PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
add_dependencies(lib_scheme
  lib_scheme__codegen_scheme
)
unset(TOOLSET)
unset(TARGET)

#crl.gyp:crl#target
set(TARGET "crl")
set(TOOLSET "target")
list(APPEND crl__cxx_srcs
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_list.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_on_main.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_queue.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_async.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_queue.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_semaphore.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/mac/crl_mac_time.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/linux/crl_linux_time.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/qt/crl_qt_async.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/qt/crl_qt_semaphore.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_async.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_list.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_semaphore.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_time.cpp"
  "../../Telegram/ThirdParty/crl/src/crl/crl_time.cpp")
list(APPEND crl__other_srcs
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_config.h"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_list.h"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_on_main.h"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_on_main_guarded.h"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_queue.h"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_sync.h"
  "../../Telegram/ThirdParty/crl/src/crl/common/crl_common_utils.h"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_async.h"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_on_main.h"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_queue.h"
  "../../Telegram/ThirdParty/crl/src/crl/dispatch/crl_dispatch_semaphore.h"
  "../../Telegram/ThirdParty/crl/src/crl/qt/crl_qt_async.h"
  "../../Telegram/ThirdParty/crl/src/crl/qt/crl_qt_semaphore.h"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_async.h"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_dll.h"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_list.h"
  "../../Telegram/ThirdParty/crl/src/crl/winapi/crl_winapi_semaphore.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl_async.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl_object_on_queue.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl_on_main.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl_queue.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl_semaphore.h"
  "../../Telegram/ThirdParty/crl/src/crl/crl_time.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_library(crl STATIC ${crl__cxx_srcs} ${crl__other_srcs})
set_target_properties(crl PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${crl__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(crl PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(crl PROPERTIES PREFIX "lib")
set_target_properties(crl PROPERTIES ARCHIVE_OUTPUT_NAME "crl")
set_target_properties(crl PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/libcrl.a PROPERTIES GENERATED "TRUE")
list(APPEND crl__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET crl APPEND PROPERTY INCLUDE_DIRECTORIES ${crl__include_dirs})
set_target_properties(crl PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(crl PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(crl PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(crl PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(crl PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(crl PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
unset(TOOLSET)
unset(TARGET)

#lib_mtproto.gyp:lib_mtproto#target
set(TARGET "lib_mtproto")
set(TOOLSET "target")
list(APPEND lib_mtproto__cxx_srcs
  "../../Telegram/SourceFiles/mtproto/mtp_abstract_socket.cpp"
  "../../Telegram/SourceFiles/mtproto/mtp_tcp_socket.cpp"
  "../../Telegram/SourceFiles/mtproto/mtp_tls_socket.cpp"
  "../../Telegram/SourceFiles/mtproto/mtp_pch.cpp")
list(APPEND lib_mtproto__other_srcs
  "../../Telegram/SourceFiles/mtproto/mtp_abstract_socket.h"
  "../../Telegram/SourceFiles/mtproto/mtp_tcp_socket.h"
  "../../Telegram/SourceFiles/mtproto/mtp_tls_socket.h"
  "../../Telegram/SourceFiles/mtproto/mtp_pch.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_mtproto STATIC ${lib_mtproto__cxx_srcs} ${lib_mtproto__other_srcs})
set_target_properties(lib_mtproto PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_mtproto__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_mtproto PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_mtproto PROPERTIES PREFIX "lib")
set_target_properties(lib_mtproto PROPERTIES ARCHIVE_OUTPUT_NAME "_mtproto")
set_target_properties(lib_mtproto PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_mtproto.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_mtproto__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_mtproto APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_mtproto__include_dirs})
set_target_properties(lib_mtproto PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_mtproto PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_mtproto PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_mtproto PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_mtproto PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
set_target_properties(lib_mtproto PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_mtproto PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "../SourceFiles/mtproto/mtp_pch.h")
set_target_properties(lib_mtproto PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
add_dependencies(lib_mtproto
  lib_scheme
)
include(${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/PrecompiledHeader.cmake)
add_precompiled_header(lib_mtproto ../../Telegram/SourceFiles/mtproto/mtp_pch.h)
unset(TOOLSET)
unset(TARGET)

#lib_export.gyp:lib_export#target
set(TARGET "lib_export")
set(TOOLSET "target")
list(APPEND lib_export__cxx_srcs
  "../../Telegram/SourceFiles/export/export_api_wrap.cpp"
  "../../Telegram/SourceFiles/export/export_controller.cpp"
  "../../Telegram/SourceFiles/export/export_settings.cpp"
  "../../Telegram/SourceFiles/export/data/export_data_types.cpp"
  "../../Telegram/SourceFiles/export/output/export_output_abstract.cpp"
  "../../Telegram/SourceFiles/export/output/export_output_file.cpp"
  "../../Telegram/SourceFiles/export/output/export_output_html.cpp"
  "../../Telegram/SourceFiles/export/output/export_output_json.cpp"
  "../../Telegram/SourceFiles/export/output/export_output_stats.cpp"
  "../../Telegram/SourceFiles/export/output/export_output_text.cpp"
  "../../Telegram/SourceFiles/export/export_pch.cpp")
list(APPEND lib_export__other_srcs
  "../../Telegram/SourceFiles/export/export_api_wrap.h"
  "../../Telegram/SourceFiles/export/export_controller.h"
  "../../Telegram/SourceFiles/export/export_settings.h"
  "../../Telegram/SourceFiles/export/data/export_data_types.h"
  "../../Telegram/SourceFiles/export/output/export_output_abstract.h"
  "../../Telegram/SourceFiles/export/output/export_output_file.h"
  "../../Telegram/SourceFiles/export/output/export_output_html.h"
  "../../Telegram/SourceFiles/export/output/export_output_json.h"
  "../../Telegram/SourceFiles/export/output/export_output_result.h"
  "../../Telegram/SourceFiles/export/output/export_output_stats.h"
  "../../Telegram/SourceFiles/export/output/export_output_text.h"
  "../../Telegram/SourceFiles/export/export_pch.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_export STATIC ${lib_export__cxx_srcs} ${lib_export__other_srcs})
set_target_properties(lib_export PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_export__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_export PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_export PROPERTIES PREFIX "lib")
set_target_properties(lib_export PROPERTIES ARCHIVE_OUTPUT_NAME "_export")
set_target_properties(lib_export PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_export.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_export__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_export APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_export__include_dirs})
set_target_properties(lib_export PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_export PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_export PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_export PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_export PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
set_target_properties(lib_export PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_export PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "../SourceFiles/export/export_pch.h")
set_target_properties(lib_export PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
add_dependencies(lib_export
  lib_scheme
)
include(${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/PrecompiledHeader.cmake)
add_precompiled_header(lib_export ../../Telegram/SourceFiles/export/export_pch.h)
unset(TOOLSET)
unset(TARGET)

#lib_base.gyp:lib_base#target
set(TARGET "lib_base")
set(TOOLSET "target")
list(APPEND lib_base__cxx_srcs
  "../../Telegram/SourceFiles/base/concurrent_timer.cpp"
  "../../Telegram/SourceFiles/base/observer.cpp"
  "../../Telegram/SourceFiles/base/parse_helper.cpp"
  "../../Telegram/SourceFiles/base/qthelp_url.cpp"
  "../../Telegram/SourceFiles/base/runtime_composer.cpp"
  "../../Telegram/SourceFiles/base/timer.cpp"
  "../../Telegram/SourceFiles/base/unixtime.cpp"
  "../../Telegram/SourceFiles/base/base_pch.cpp")
list(APPEND lib_base__other_srcs
  "../../Telegram/SourceFiles/base/algorithm.h"
  "../../Telegram/SourceFiles/base/assertion.h"
  "../../Telegram/SourceFiles/base/basic_types.h"
  "../../Telegram/SourceFiles/base/binary_guard.h"
  "../../Telegram/SourceFiles/base/build_config.h"
  "../../Telegram/SourceFiles/base/bytes.h"
  "../../Telegram/SourceFiles/base/concurrent_timer.h"
  "../../Telegram/SourceFiles/base/flags.h"
  "../../Telegram/SourceFiles/base/enum_mask.h"
  "../../Telegram/SourceFiles/base/flat_map.h"
  "../../Telegram/SourceFiles/base/flat_set.h"
  "../../Telegram/SourceFiles/base/functors.h"
  "../../Telegram/SourceFiles/base/index_based_iterator.h"
  "../../Telegram/SourceFiles/base/invoke_queued.h"
  "../../Telegram/SourceFiles/base/last_used_cache.h"
  "../../Telegram/SourceFiles/base/match_method.h"
  "../../Telegram/SourceFiles/base/observer.h"
  "../../Telegram/SourceFiles/base/ordered_set.h"
  "../../Telegram/SourceFiles/base/openssl_help.h"
  "../../Telegram/SourceFiles/base/optional.h"
  "../../Telegram/SourceFiles/base/overload.h"
  "../../Telegram/SourceFiles/base/parse_helper.h"
  "../../Telegram/SourceFiles/base/qthelp_regex.h"
  "../../Telegram/SourceFiles/base/qthelp_url.h"
  "../../Telegram/SourceFiles/base/runtime_composer.h"
  "../../Telegram/SourceFiles/base/thread_safe_wrap.h"
  "../../Telegram/SourceFiles/base/timer.h"
  "../../Telegram/SourceFiles/base/type_traits.h"
  "../../Telegram/SourceFiles/base/unique_any.h"
  "../../Telegram/SourceFiles/base/unique_function.h"
  "../../Telegram/SourceFiles/base/unique_qptr.h"
  "../../Telegram/SourceFiles/base/unixtime.h"
  "../../Telegram/SourceFiles/base/value_ordering.h"
  "../../Telegram/SourceFiles/base/variant.h"
  "../../Telegram/SourceFiles/base/virtual_method.h"
  "../../Telegram/SourceFiles/base/weak_ptr.h"
  "../../Telegram/SourceFiles/base/zlib_help.h"
  "../../Telegram/SourceFiles/base/base_pch.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_base STATIC ${lib_base__cxx_srcs} ${lib_base__other_srcs})
set_target_properties(lib_base PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_base__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_base PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_base PROPERTIES PREFIX "lib")
set_target_properties(lib_base PROPERTIES ARCHIVE_OUTPUT_NAME "_base")
set_target_properties(lib_base PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_base.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_base__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/xxHash"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_base APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_base__include_dirs})
set_target_properties(lib_base PROPERTIES COMPILE_DEFINITIONS "XXH_INLINE_ALL;NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_base PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_base PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_base PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_base PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
set_target_properties(lib_base PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_base PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "../SourceFiles/base/base_pch.h")
set_target_properties(lib_base PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
include(${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/PrecompiledHeader.cmake)
add_precompiled_header(lib_base ../../Telegram/SourceFiles/base/base_pch.h)
unset(TOOLSET)
unset(TARGET)

#lib_storage.gyp:lib_storage#target
set(TARGET "lib_storage")
set(TOOLSET "target")
list(APPEND lib_storage__cxx_srcs
  "../../Telegram/SourceFiles/storage/storage_clear_legacy.cpp"
  "../../Telegram/SourceFiles/storage/storage_clear_legacy_posix.cpp"
  "../../Telegram/SourceFiles/storage/storage_databases.cpp"
  "../../Telegram/SourceFiles/storage/storage_encryption.cpp"
  "../../Telegram/SourceFiles/storage/storage_encrypted_file.cpp"
  "../../Telegram/SourceFiles/storage/storage_file_lock_posix.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_binlog_reader.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_cleaner.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_compactor.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_database.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_database_object.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_types.cpp"
  "../../Telegram/SourceFiles/storage/storage_pch.cpp")
list(APPEND lib_storage__other_srcs
  "../../Telegram/SourceFiles/storage/storage_clear_legacy.h"
  "../../Telegram/SourceFiles/storage/storage_databases.h"
  "../../Telegram/SourceFiles/storage/storage_encryption.h"
  "../../Telegram/SourceFiles/storage/storage_encrypted_file.h"
  "../../Telegram/SourceFiles/storage/storage_file_lock.h"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_binlog_reader.h"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_cleaner.h"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_compactor.h"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_database.h"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_database_object.h"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_types.h"
  "../../Telegram/SourceFiles/storage/storage_pch.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_storage STATIC ${lib_storage__cxx_srcs} ${lib_storage__other_srcs})
set_target_properties(lib_storage PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_storage__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_storage PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_storage PROPERTIES PREFIX "lib")
set_target_properties(lib_storage PROPERTIES ARCHIVE_OUTPUT_NAME "_storage")
set_target_properties(lib_storage PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_storage.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_storage__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/xxHash"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_storage APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_storage__include_dirs})
set_target_properties(lib_storage PROPERTIES COMPILE_DEFINITIONS "XXH_INLINE_ALL;NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_storage PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_storage PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_storage PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_storage PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
set_target_properties(lib_storage PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_storage PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "../SourceFiles/storage/storage_pch.h")
set_target_properties(lib_storage PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
include(${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/PrecompiledHeader.cmake)
add_precompiled_header(lib_storage ../../Telegram/SourceFiles/storage/storage_pch.h)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests_storage#target
set(TARGET "tests_storage")
set(TOOLSET "target")
list(APPEND tests_storage__cxx_srcs
  "../../Telegram/SourceFiles/storage/storage_encrypted_file_tests.cpp"
  "../../Telegram/SourceFiles/storage/cache/storage_cache_database_tests.cpp"
  "../../Telegram/SourceFiles/base/tests_main.cpp")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(tests_storage ${tests_storage__cxx_srcs})
set_target_properties(tests_storage PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(tests_storage PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(tests_storage PROPERTIES PREFIX "")
set_target_properties(tests_storage PROPERTIES RUNTIME_OUTPUT_NAME "tests_storage")
set_target_properties(tests_storage PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/tests_storage PROPERTIES GENERATED "TRUE")
list(APPEND tests_storage__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/Catch/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET tests_storage APPEND PROPERTY INCLUDE_DIRECTORIES ${tests_storage__include_dirs})
set_target_properties(tests_storage PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(tests_storage PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(tests_storage PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(tests_storage PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(tests_storage PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(tests_storage PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(tests_storage
-Wl,--start-group
  lib_storage
  linux_glibc_wraps
  crl
  lib_base
-Wl,--end-group
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#tests/tests.gyp:tests#target
set(TARGET "tests")
set(TOOLSET "target")
set(tests__run_tests__input "${builddir}/${RULE_INPUT_ROOT}")
set(RULE_INPUT_PATH "tests_algorithm.test")
set(RULE_INPUT_DIRNAME "")
set(RULE_INPUT_NAME "tests_algorithm.test")
set(RULE_INPUT_ROOT "tests_algorithm")
set(RULE_INPUT_EXT ".test")
set(tests__run_tests_0_0 "${obj}/gen/${RULE_INPUT_ROOT}.timestamp")
add_custom_command(OUTPUT
  ${tests__run_tests_0_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/${RULE_INPUT_ROOT}" --touch "${obj}/gen/${RULE_INPUT_ROOT}.timestamp"
  DEPENDS ${tests__run_tests__input} ../../Telegram/gyp/tests/tests_algorithm.test
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/tests
  COMMENT Running ${RULE_INPUT_ROOT}..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "tests_flags.test")
set(RULE_INPUT_DIRNAME "")
set(RULE_INPUT_NAME "tests_flags.test")
set(RULE_INPUT_ROOT "tests_flags")
set(RULE_INPUT_EXT ".test")
set(tests__run_tests_1_0 "${obj}/gen/${RULE_INPUT_ROOT}.timestamp")
add_custom_command(OUTPUT
  ${tests__run_tests_1_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/${RULE_INPUT_ROOT}" --touch "${obj}/gen/${RULE_INPUT_ROOT}.timestamp"
  DEPENDS ${tests__run_tests__input} ../../Telegram/gyp/tests/tests_flags.test
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/tests
  COMMENT Running ${RULE_INPUT_ROOT}..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "tests_flat_map.test")
set(RULE_INPUT_DIRNAME "")
set(RULE_INPUT_NAME "tests_flat_map.test")
set(RULE_INPUT_ROOT "tests_flat_map")
set(RULE_INPUT_EXT ".test")
set(tests__run_tests_2_0 "${obj}/gen/${RULE_INPUT_ROOT}.timestamp")
add_custom_command(OUTPUT
  ${tests__run_tests_2_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/${RULE_INPUT_ROOT}" --touch "${obj}/gen/${RULE_INPUT_ROOT}.timestamp"
  DEPENDS ${tests__run_tests__input} ../../Telegram/gyp/tests/tests_flat_map.test
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/tests
  COMMENT Running ${RULE_INPUT_ROOT}..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "tests_flat_set.test")
set(RULE_INPUT_DIRNAME "")
set(RULE_INPUT_NAME "tests_flat_set.test")
set(RULE_INPUT_ROOT "tests_flat_set")
set(RULE_INPUT_EXT ".test")
set(tests__run_tests_3_0 "${obj}/gen/${RULE_INPUT_ROOT}.timestamp")
add_custom_command(OUTPUT
  ${tests__run_tests_3_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/${RULE_INPUT_ROOT}" --touch "${obj}/gen/${RULE_INPUT_ROOT}.timestamp"
  DEPENDS ${tests__run_tests__input} ../../Telegram/gyp/tests/tests_flat_set.test
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/tests
  COMMENT Running ${RULE_INPUT_ROOT}..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "tests_rpl.test")
set(RULE_INPUT_DIRNAME "")
set(RULE_INPUT_NAME "tests_rpl.test")
set(RULE_INPUT_ROOT "tests_rpl")
set(RULE_INPUT_EXT ".test")
set(tests__run_tests_4_0 "${obj}/gen/${RULE_INPUT_ROOT}.timestamp")
add_custom_command(OUTPUT
  ${tests__run_tests_4_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/${RULE_INPUT_ROOT}" --touch "${obj}/gen/${RULE_INPUT_ROOT}.timestamp"
  DEPENDS ${tests__run_tests__input} ../../Telegram/gyp/tests/tests_rpl.test
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/tests
  COMMENT Running ${RULE_INPUT_ROOT}..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
add_custom_target(tests__run_tests DEPENDS
  ${tests__run_tests_0_0}
  ${tests__run_tests_1_0}
  ${tests__run_tests_2_0}
  ${tests__run_tests_3_0}
  ${tests__run_tests_4_0}
SOURCES ${tests__run_tests__input}
  ../../Telegram/gyp/tests/tests_algorithm.test
  ../../Telegram/gyp/tests/tests_flags.test
  ../../Telegram/gyp/tests/tests_flat_map.test
  ../../Telegram/gyp/tests/tests_flat_set.test
  ../../Telegram/gyp/tests/tests_rpl.test
)
list(APPEND tests__other_srcs
  "../../Telegram/gyp/tests/tests_algorithm.test"
  "../../Telegram/gyp/tests/tests_flags.test"
  "../../Telegram/gyp/tests/tests_flat_map.test"
  "../../Telegram/gyp/tests/tests_flat_set.test"
  "../../Telegram/gyp/tests/tests_rpl.test")
add_custom_target(tests SOURCES ${tests__other_srcs})
set_target_properties(tests PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(tests__run_tests PROPERTIES EXCLUDE_FROM_ALL "FALSE")
add_dependencies(tests__run_tests
  tests_algorithm
  tests_flags
  tests_flat_map
  tests_flat_set
  tests_rpl
  tests_storage
)
add_dependencies(tests
  tests_algorithm
  tests_flags
  tests_flat_map
  tests_flat_set
  tests_rpl
  tests_storage
  tests__run_tests
)
unset(TOOLSET)
unset(TARGET)

#lib_ffmpeg.gyp:lib_ffmpeg#target
set(TARGET "lib_ffmpeg")
set(TOOLSET "target")
set(lib_ffmpeg__cxx_srcs "../../Telegram/SourceFiles/ffmpeg/ffmpeg_utility.cpp")
set(lib_ffmpeg__other_srcs "../../Telegram/SourceFiles/ffmpeg/ffmpeg_utility.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_ffmpeg STATIC ${lib_ffmpeg__cxx_srcs} ${lib_ffmpeg__other_srcs})
set_target_properties(lib_ffmpeg PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_ffmpeg__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_ffmpeg PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_ffmpeg PROPERTIES PREFIX "lib")
set_target_properties(lib_ffmpeg PROPERTIES ARCHIVE_OUTPUT_NAME "_ffmpeg")
set_target_properties(lib_ffmpeg PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_ffmpeg.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_ffmpeg__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/ffmpeg"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_ffmpeg APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_ffmpeg__include_dirs})
set_target_properties(lib_ffmpeg PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_ffmpeg PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_ffmpeg PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_ffmpeg PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_ffmpeg PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_ffmpeg PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
unset(TOOLSET)
unset(TARGET)

#codegen.gyp:codegen_style#target
set(TARGET "codegen_style")
set(TOOLSET "target")
list(APPEND codegen_style__cxx_srcs
  "../../Telegram/SourceFiles/codegen/common/basic_tokenized_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/checked_utf8_string.cpp"
  "../../Telegram/SourceFiles/codegen/common/clean_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/cpp_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/logging.cpp"
  "../../Telegram/SourceFiles/codegen/style/generator.cpp"
  "../../Telegram/SourceFiles/codegen/style/main.cpp"
  "../../Telegram/SourceFiles/codegen/style/module.cpp"
  "../../Telegram/SourceFiles/codegen/style/options.cpp"
  "../../Telegram/SourceFiles/codegen/style/parsed_file.cpp"
  "../../Telegram/SourceFiles/codegen/style/processor.cpp"
  "../../Telegram/SourceFiles/codegen/style/structure_types.cpp")
list(APPEND codegen_style__other_srcs
  "../../Telegram/SourceFiles/codegen/common/basic_tokenized_file.h"
  "../../Telegram/SourceFiles/codegen/common/checked_utf8_string.h"
  "../../Telegram/SourceFiles/codegen/common/clean_file.h"
  "../../Telegram/SourceFiles/codegen/common/clean_file_reader.h"
  "../../Telegram/SourceFiles/codegen/common/const_utf8_string.h"
  "../../Telegram/SourceFiles/codegen/common/cpp_file.h"
  "../../Telegram/SourceFiles/codegen/common/logging.h"
  "../../Telegram/SourceFiles/codegen/style/generator.h"
  "../../Telegram/SourceFiles/codegen/style/module.h"
  "../../Telegram/SourceFiles/codegen/style/options.h"
  "../../Telegram/SourceFiles/codegen/style/parsed_file.h"
  "../../Telegram/SourceFiles/codegen/style/processor.h"
  "../../Telegram/SourceFiles/codegen/style/structure_types.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(codegen_style ${codegen_style__cxx_srcs} ${codegen_style__other_srcs})
set_target_properties(codegen_style PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${codegen_style__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(codegen_style PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(codegen_style PROPERTIES PREFIX "")
set_target_properties(codegen_style PROPERTIES RUNTIME_OUTPUT_NAME "codegen_style")
set_target_properties(codegen_style PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/codegen_style PROPERTIES GENERATED "TRUE")
list(APPEND codegen_style__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET codegen_style APPEND PROPERTY INCLUDE_DIRECTORIES ${codegen_style__include_dirs})
set_target_properties(codegen_style PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(codegen_style PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(codegen_style PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(codegen_style PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(codegen_style PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(codegen_style PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(codegen_style
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#codegen.gyp:codegen_numbers#target
set(TARGET "codegen_numbers")
set(TOOLSET "target")
list(APPEND codegen_numbers__cxx_srcs
  "../../Telegram/SourceFiles/codegen/common/basic_tokenized_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/checked_utf8_string.cpp"
  "../../Telegram/SourceFiles/codegen/common/clean_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/cpp_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/logging.cpp"
  "../../Telegram/SourceFiles/codegen/numbers/generator.cpp"
  "../../Telegram/SourceFiles/codegen/numbers/main.cpp"
  "../../Telegram/SourceFiles/codegen/numbers/options.cpp"
  "../../Telegram/SourceFiles/codegen/numbers/parsed_file.cpp"
  "../../Telegram/SourceFiles/codegen/numbers/processor.cpp")
list(APPEND codegen_numbers__other_srcs
  "../../Telegram/SourceFiles/codegen/common/basic_tokenized_file.h"
  "../../Telegram/SourceFiles/codegen/common/checked_utf8_string.h"
  "../../Telegram/SourceFiles/codegen/common/clean_file.h"
  "../../Telegram/SourceFiles/codegen/common/clean_file_reader.h"
  "../../Telegram/SourceFiles/codegen/common/const_utf8_string.h"
  "../../Telegram/SourceFiles/codegen/common/cpp_file.h"
  "../../Telegram/SourceFiles/codegen/common/logging.h"
  "../../Telegram/SourceFiles/codegen/numbers/generator.h"
  "../../Telegram/SourceFiles/codegen/numbers/options.h"
  "../../Telegram/SourceFiles/codegen/numbers/parsed_file.h"
  "../../Telegram/SourceFiles/codegen/numbers/processor.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(codegen_numbers ${codegen_numbers__cxx_srcs} ${codegen_numbers__other_srcs})
set_target_properties(codegen_numbers PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${codegen_numbers__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(codegen_numbers PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(codegen_numbers PROPERTIES PREFIX "")
set_target_properties(codegen_numbers PROPERTIES RUNTIME_OUTPUT_NAME "codegen_numbers")
set_target_properties(codegen_numbers PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/codegen_numbers PROPERTIES GENERATED "TRUE")
list(APPEND codegen_numbers__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET codegen_numbers APPEND PROPERTY INCLUDE_DIRECTORIES ${codegen_numbers__include_dirs})
set_target_properties(codegen_numbers PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(codegen_numbers PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(codegen_numbers PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(codegen_numbers PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(codegen_numbers PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(codegen_numbers PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(codegen_numbers
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#codegen.gyp:codegen_lang#target
set(TARGET "codegen_lang")
set(TOOLSET "target")
list(APPEND codegen_lang__cxx_srcs
  "../../Telegram/SourceFiles/codegen/common/basic_tokenized_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/checked_utf8_string.cpp"
  "../../Telegram/SourceFiles/codegen/common/clean_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/cpp_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/logging.cpp"
  "../../Telegram/SourceFiles/codegen/lang/generator.cpp"
  "../../Telegram/SourceFiles/codegen/lang/main.cpp"
  "../../Telegram/SourceFiles/codegen/lang/options.cpp"
  "../../Telegram/SourceFiles/codegen/lang/parsed_file.cpp"
  "../../Telegram/SourceFiles/codegen/lang/processor.cpp")
list(APPEND codegen_lang__other_srcs
  "../../Telegram/SourceFiles/codegen/common/basic_tokenized_file.h"
  "../../Telegram/SourceFiles/codegen/common/checked_utf8_string.h"
  "../../Telegram/SourceFiles/codegen/common/clean_file.h"
  "../../Telegram/SourceFiles/codegen/common/clean_file_reader.h"
  "../../Telegram/SourceFiles/codegen/common/const_utf8_string.h"
  "../../Telegram/SourceFiles/codegen/common/cpp_file.h"
  "../../Telegram/SourceFiles/codegen/common/logging.h"
  "../../Telegram/SourceFiles/codegen/lang/generator.h"
  "../../Telegram/SourceFiles/codegen/lang/options.h"
  "../../Telegram/SourceFiles/codegen/lang/parsed_file.h"
  "../../Telegram/SourceFiles/codegen/lang/processor.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(codegen_lang ${codegen_lang__cxx_srcs} ${codegen_lang__other_srcs})
set_target_properties(codegen_lang PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${codegen_lang__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(codegen_lang PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(codegen_lang PROPERTIES PREFIX "")
set_target_properties(codegen_lang PROPERTIES RUNTIME_OUTPUT_NAME "codegen_lang")
set_target_properties(codegen_lang PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/codegen_lang PROPERTIES GENERATED "TRUE")
list(APPEND codegen_lang__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET codegen_lang APPEND PROPERTY INCLUDE_DIRECTORIES ${codegen_lang__include_dirs})
set_target_properties(codegen_lang PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(codegen_lang PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(codegen_lang PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(codegen_lang PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(codegen_lang PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(codegen_lang PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(codegen_lang
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#codegen.gyp:codegen_emoji#target
set(TARGET "codegen_emoji")
set(TOOLSET "target")
list(APPEND codegen_emoji__cxx_srcs
  "../../Telegram/SourceFiles/codegen/common/cpp_file.cpp"
  "../../Telegram/SourceFiles/codegen/common/logging.cpp"
  "../../Telegram/SourceFiles/codegen/emoji/data.cpp"
  "../../Telegram/SourceFiles/codegen/emoji/generator.cpp"
  "../../Telegram/SourceFiles/codegen/emoji/main.cpp"
  "../../Telegram/SourceFiles/codegen/emoji/options.cpp"
  "../../Telegram/SourceFiles/codegen/emoji/replaces.cpp")
list(APPEND codegen_emoji__other_srcs
  "../../Telegram/SourceFiles/codegen/common/cpp_file.h"
  "../../Telegram/SourceFiles/codegen/common/logging.h"
  "../../Telegram/SourceFiles/codegen/emoji/data.h"
  "../../Telegram/SourceFiles/codegen/emoji/generator.h"
  "../../Telegram/SourceFiles/codegen/emoji/options.h"
  "../../Telegram/SourceFiles/codegen/emoji/replaces.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
)
add_executable(codegen_emoji ${codegen_emoji__cxx_srcs} ${codegen_emoji__other_srcs})
set_target_properties(codegen_emoji PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${codegen_emoji__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(codegen_emoji PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(codegen_emoji PROPERTIES PREFIX "")
set_target_properties(codegen_emoji PROPERTIES RUNTIME_OUTPUT_NAME "codegen_emoji")
set_target_properties(codegen_emoji PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/codegen_emoji PROPERTIES GENERATED "TRUE")
list(APPEND codegen_emoji__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++")
set_property(TARGET codegen_emoji APPEND PROPERTY INCLUDE_DIRECTORIES ${codegen_emoji__include_dirs})
set_target_properties(codegen_emoji PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(codegen_emoji PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g ")
set_target_properties(codegen_emoji PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic ")
set_target_properties(codegen_emoji PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(codegen_emoji PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(codegen_emoji PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
target_link_libraries(codegen_emoji
  linux_glibc_wraps
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libz.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
unset(TOOLSET)
unset(TARGET)

#lib_rlottie.gyp:lib_rlottie#target
set(TARGET "lib_rlottie")
set(TOOLSET "target")
list(APPEND lib_rlottie__cxx_srcs
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieanimation.cpp"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieitem.cpp"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottiekeypath.cpp"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieloader.cpp"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottiemodel.cpp"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieparser.cpp"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieproxymodel.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_math.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_raster.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_stroker.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/pixman/vregion.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vbezier.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vbitmap.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vbrush.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vcompositionfunctions.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdasher.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdebug.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdrawable.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdrawhelper.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdrawhelper_neon.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdrawhelper_sse2.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/velapsedtimer.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vimageloader.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vinterpolator.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vmatrix.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpainter.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpath.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpathmesure.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vraster.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vrect.cpp"
  "../../Telegram/ThirdParty/rlottie/src/vector/vrle.cpp")
list(APPEND lib_rlottie__other_srcs
  "../../Telegram/ThirdParty/rlottie/inc/rlottie.h"
  "../../Telegram/ThirdParty/rlottie/inc/rlottie_capi.h"
  "../../Telegram/ThirdParty/rlottie/inc/rlottiecommon.h"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieitem.h"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottiekeypath.h"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieloader.h"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottiemodel.h"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieparser.h"
  "../../Telegram/ThirdParty/rlottie/src/lottie/lottieproxymodel.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_math.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_raster.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_stroker.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/freetype/v_ft_types.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/pixman/vregion.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/config.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vbezier.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vbitmap.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vbrush.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vcowptr.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdasher.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdebug.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdrawable.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vdrawhelper.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/velapsedtimer.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vglobal.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vimageloader.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vinterpolator.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vline.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vmatrix.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpainter.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpath.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpathmesure.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vpoint.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vraster.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vrect.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vrle.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vstackallocator.h"
  "../../Telegram/ThirdParty/rlottie/src/vector/vtaskqueue.h")
link_directories( /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_rlottie STATIC ${lib_rlottie__cxx_srcs} ${lib_rlottie__other_srcs})
set_target_properties(lib_rlottie PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_rlottie__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_rlottie PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_rlottie PROPERTIES PREFIX "lib")
set_target_properties(lib_rlottie PROPERTIES ARCHIVE_OUTPUT_NAME "_rlottie")
set_target_properties(lib_rlottie PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_rlottie.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_rlottie__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/rlottie/inc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/rlottie/src/lottie"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/rlottie/src/vector"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/rlottie/src/vector/pixman"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/rlottie/src/vector/freetype"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_rlottie APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_rlottie__include_dirs})
set_target_properties(lib_rlottie PROPERTIES COMPILE_DEFINITIONS "_USE_MATH_DEFINES;RAPIDJSON_ASSERT=(void);LOT_BUILD;NOMINMAX;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_rlottie PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_rlottie PROPERTIES LINK_FLAGS "-g -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_rlottie PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_rlottie PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_rlottie PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
unset(TOOLSET)
unset(TARGET)

#lib_lz4.gyp:lib_lz4#target
set(TARGET "lib_lz4")
set(TOOLSET "target")
list(APPEND lib_lz4__c_srcs
  "../../Telegram/ThirdParty/lz4/lib/lz4.c"
  "../../Telegram/ThirdParty/lz4/lib/lz4frame.c"
  "../../Telegram/ThirdParty/lz4/lib/lz4hc.c"
  "../../Telegram/ThirdParty/lz4/lib/xxhash.c")
list(APPEND lib_lz4__other_srcs
  "../../Telegram/ThirdParty/lz4/lib/lz4.h"
  "../../Telegram/ThirdParty/lz4/lib/lz4frame.h"
  "../../Telegram/ThirdParty/lz4/lib/lz4frame_static.h"
  "../../Telegram/ThirdParty/lz4/lib/lz4hc.h"
  "../../Telegram/ThirdParty/lz4/lib/xxhash.h")
link_directories( /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_lz4 STATIC ${lib_lz4__c_srcs} ${lib_lz4__other_srcs})
set_target_properties(lib_lz4 PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_lz4__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_lz4 PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_lz4 PROPERTIES PREFIX "lib")
set_target_properties(lib_lz4 PROPERTIES ARCHIVE_OUTPUT_NAME "_lz4")
set_target_properties(lib_lz4 PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_lz4.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_lz4__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/lz4/lib"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_lz4 APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_lz4__include_dirs})
set_target_properties(lib_lz4 PROPERTIES COMPILE_DEFINITIONS "NOMINMAX;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_lz4 PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=gnu11 -g ")
set_target_properties(lib_lz4 PROPERTIES LINK_FLAGS "-g -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_lz4 PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_lz4 PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_lz4 PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
unset(TOOLSET)
unset(TARGET)

#lib_lottie.gyp:lib_lottie#target
set(TARGET "lib_lottie")
set(TOOLSET "target")
list(APPEND lib_lottie__cxx_srcs
  "../../Telegram/SourceFiles/lottie/lottie_animation.cpp"
  "../../Telegram/SourceFiles/lottie/lottie_cache.cpp"
  "../../Telegram/SourceFiles/lottie/lottie_common.cpp"
  "../../Telegram/SourceFiles/lottie/lottie_frame_renderer.cpp"
  "../../Telegram/SourceFiles/lottie/lottie_multi_player.cpp"
  "../../Telegram/SourceFiles/lottie/lottie_single_player.cpp")
list(APPEND lib_lottie__other_srcs
  "../../Telegram/SourceFiles/lottie/lottie_animation.h"
  "../../Telegram/SourceFiles/lottie/lottie_cache.h"
  "../../Telegram/SourceFiles/lottie/lottie_common.h"
  "../../Telegram/SourceFiles/lottie/lottie_frame_renderer.h"
  "../../Telegram/SourceFiles/lottie/lottie_multi_player.h"
  "../../Telegram/SourceFiles/lottie/lottie_player.h"
  "../../Telegram/SourceFiles/lottie/lottie_single_player.h")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /tdesktop/build/qt/plugins/platforminputcontexts
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
)
add_library(lib_lottie STATIC ${lib_lottie__cxx_srcs} ${lib_lottie__other_srcs})
set_target_properties(lib_lottie PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${lib_lottie__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(lib_lottie PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(lib_lottie PROPERTIES PREFIX "lib")
set_target_properties(lib_lottie PROPERTIES ARCHIVE_OUTPUT_NAME "_lottie")
set_target_properties(lib_lottie PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/lib_lottie.a PROPERTIES GENERATED "TRUE")
list(APPEND lib_lottie__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/zlib"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/ffmpeg"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/rlottie/inc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/lz4/lib"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include")
set_property(TARGET lib_lottie APPEND PROPERTY INCLUDE_DIRECTORIES ${lib_lottie__include_dirs})
set_target_properties(lib_lottie PROPERTIES COMPILE_DEFINITIONS "LOT_BUILD;NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_target_properties(lib_lottie PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(lib_lottie PROPERTIES LINK_FLAGS "-g -static-libstdc++ -pthread -rdynamic -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt ")
set_target_properties(lib_lottie PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(lib_lottie PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(lib_lottie PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia ")
unset(TOOLSET)
unset(TARGET)

#../ThirdParty/libtgvoip/libtgvoip.gyp:libtgvoip#target
set(TARGET "libtgvoip")
set(TOOLSET "target")
list(APPEND libtgvoip__c_srcs
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/third_party/fft/fft.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_estimator.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb16_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_gain_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines_logist.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/filterbanks.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/transform.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_filter.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/encode_lpc_swb.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/filter_functions.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/decode.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lattice.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/intialize.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_gain_swb_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/bandwidth_estimator.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/encode.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_analysis.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines_hist.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/entropy_coding.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac_vad.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/crc.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb12_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/decode_bwe.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/spectrum_ar_model_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_lag_tables.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/nsx_core.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/noise_suppression_x.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/nsx_core_c.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/ns_core.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/noise_suppression.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/legacy/analog_agc.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/legacy/digital_agc.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/third_party/spl_sqrt_floor/spl_sqrt_floor.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/third_party/fft4g/fft4g.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/ring_buffer.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/complex_fft.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/filter_ma_fast_q12.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/levinson_durbin.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/auto_corr_to_refl_coef.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/resample_by_2_internal.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/energy.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/sqrt_of_one_minus_x_squared.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/downsample_fast.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/splitting_filter1.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/filter_ar_fast_q12.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/spl_init.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/lpc_to_refl_coef.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/cross_correlation.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/division_operations.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/auto_correlation.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/get_scaling_square.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/resample.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/min_max_operations.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/refl_coef_to_lpc.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/filter_ar.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/vector_scaling_operations.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/resample_fractional.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/real_fft.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/ilbc_specific_functions.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/complex_bit_reverse.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/randomization_functions.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/copy_set_operations.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/resample_by_2.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/get_hanning_window.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/resample_48khz.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/spl_inl.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/spl_sqrt.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_sp.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/webrtc_vad.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_filterbank.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_core.c"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_gmm.c")
list(APPEND libtgvoip__cxx_srcs
  "../../Telegram/ThirdParty/libtgvoip/BlockingQueue.cpp"
  "../../Telegram/ThirdParty/libtgvoip/Buffers.cpp"
  "../../Telegram/ThirdParty/libtgvoip/CongestionControl.cpp"
  "../../Telegram/ThirdParty/libtgvoip/EchoCanceller.cpp"
  "../../Telegram/ThirdParty/libtgvoip/JitterBuffer.cpp"
  "../../Telegram/ThirdParty/libtgvoip/logging.cpp"
  "../../Telegram/ThirdParty/libtgvoip/MediaStreamItf.cpp"
  "../../Telegram/ThirdParty/libtgvoip/OpusDecoder.cpp"
  "../../Telegram/ThirdParty/libtgvoip/OpusEncoder.cpp"
  "../../Telegram/ThirdParty/libtgvoip/VoIPController.cpp"
  "../../Telegram/ThirdParty/libtgvoip/VoIPGroupController.cpp"
  "../../Telegram/ThirdParty/libtgvoip/VoIPServerConfig.cpp"
  "../../Telegram/ThirdParty/libtgvoip/audio/AudioInput.cpp"
  "../../Telegram/ThirdParty/libtgvoip/audio/AudioOutput.cpp"
  "../../Telegram/ThirdParty/libtgvoip/audio/Resampler.cpp"
  "../../Telegram/ThirdParty/libtgvoip/NetworkSocket.cpp"
  "../../Telegram/ThirdParty/libtgvoip/PacketReassembler.cpp"
  "../../Telegram/ThirdParty/libtgvoip/MessageThread.cpp"
  "../../Telegram/ThirdParty/libtgvoip/audio/AudioIO.cpp"
  "../../Telegram/ThirdParty/libtgvoip/video/ScreamCongestionController.cpp"
  "../../Telegram/ThirdParty/libtgvoip/video/VideoSource.cpp"
  "../../Telegram/ThirdParty/libtgvoip/video/VideoRenderer.cpp"
  "../../Telegram/ThirdParty/libtgvoip/json11.cpp"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioInputALSA.cpp"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioOutputALSA.cpp"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioOutputPulse.cpp"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioInputPulse.cpp"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioPulse.cpp"
  "../../Telegram/ThirdParty/libtgvoip/os/posix/NetworkSocketPosix.cpp"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/source/field_trial.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/source/metrics.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/source/cpu_features.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/strings/internal/memutil.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/strings/string_view.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/strings/ascii.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/types/bad_optional_access.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/types/optional.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/raw_logging.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/throw_delegate.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/race_checker.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/strings/string_builder.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/memory/aligned_malloc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/timeutils.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/platform_file.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/string_to_number.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/thread_checker_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/stringencode.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/stringutils.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/checks.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/platform_thread.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/criticalsection.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/platform_thread_types.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/event.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/event_tracer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/logging_webrtc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/third_party/rnnoise/src/rnn_vad_weights.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/third_party/rnnoise/src/kiss_fft.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/audio_frame.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/echo_canceller3_config.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/echo_canceller3_factory.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/rms_level.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/normalized_covariance_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/moving_max.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/circular_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/mean_variance_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/splitting_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/gain_control_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/audio_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/typing_detection.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_processing_statistics.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_generator_factory.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/aec_dump.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_processing.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/config.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/interpolated_gain_curve.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/agc2_common.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/gain_applier.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_agc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_digital_gain_applier.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/limiter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/saturation_protector.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features_internal.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/rnn.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search_internal.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/features_extraction.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/fft_util.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/lp_residual.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator_agc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/vector_float_frame.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/noise_level_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/agc2_testing_common.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/fixed_digital_level_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/fixed_gain_controller.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/vad_with_level.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/limiter_db_gain_curve.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/down_sampler.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/signal_classifier.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/noise_spectrum_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/compute_interpolated_gain_curve.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/biquad_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/moving_moments.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/wpd_tree.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/wpd_node.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/transient_suppressor.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/transient_detector.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/low_cut_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/level_estimator_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/three_band_filter_bank.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/echo_cancellation.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_resampler.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_core.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_core_sse2.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/voice_detection_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_cancellation_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/gain_control_for_experimental_agc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/agc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/loudness_histogram.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/agc_manager_direct.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/utility.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/audio_processing_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/audio_generator/file_audio_generator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/gain_controller2.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/residual_echo_detector.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/noise_suppression_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aecm/aecm_core.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aecm/aecm_core_c.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aecm/echo_control_mobile.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_reverb_model.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_model_fallback.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_remover_metrics.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/matched_filter_lag_aggregator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_buffer2.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_path_variability.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/frame_blocker.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subtractor.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/aec3_fft.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/fullband_erle_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/suppression_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_processor.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subband_erle_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_controller_metrics.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/vector_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/erl_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/aec_state.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/adaptive_fir_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_controller.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/skew_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_path_delay_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_framer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/erle_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_model.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/cascaded_biquad_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subtractor_output.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/stationarity_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_signal_analyzer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subtractor_output_analyzer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/suppression_gain.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_audibility.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_processor_metrics.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/moving_average.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_model_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/aec3_common.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/residual_echo_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/matched_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_decay_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_controller2.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/suppression_gain_limiter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/main_filter_update_gain.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_remover.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/downsampled_render_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/matrix_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_processor2.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_canceller3.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_delay_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/fft_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/comfort_noise_generator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/shadow_filter_update_gain.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/filter_analyzer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_frequency_response.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/decimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_control_mobile_impl.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/logging/apm_data_dumper.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/voice_activity_detector.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/standalone_vad.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/pitch_internal.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/vad_circular_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/vad_audio_proc.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/pole_zero_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/pitch_based_vad.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/gmm.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/ooura_fft.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/delay_estimator_wrapper.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/ooura_fft_sse2.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/delay_estimator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/block_mean_calculator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/window_generator.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/channel_buffer.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter_factory.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/wav_header.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/real_fourier_ooura.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/audio_util.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter_sse.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/push_sinc_resampler.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/resampler.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/sinc_resampler_sse.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/push_resampler.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/sinc_resampler.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/sinusoidal_linear_chirp_source.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/wav_file.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/audio_converter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/real_fourier.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/sparse_fir_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/smoothing_filter.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter_c.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/dot_product_with_scale.cc"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad.cc")
list(APPEND libtgvoip__other_srcs
  "../../Telegram/ThirdParty/libtgvoip/BlockingQueue.h"
  "../../Telegram/ThirdParty/libtgvoip/Buffers.h"
  "../../Telegram/ThirdParty/libtgvoip/CongestionControl.h"
  "../../Telegram/ThirdParty/libtgvoip/EchoCanceller.h"
  "../../Telegram/ThirdParty/libtgvoip/JitterBuffer.h"
  "../../Telegram/ThirdParty/libtgvoip/logging.h"
  "../../Telegram/ThirdParty/libtgvoip/MediaStreamItf.h"
  "../../Telegram/ThirdParty/libtgvoip/OpusDecoder.h"
  "../../Telegram/ThirdParty/libtgvoip/OpusEncoder.h"
  "../../Telegram/ThirdParty/libtgvoip/threading.h"
  "../../Telegram/ThirdParty/libtgvoip/VoIPController.h"
  "../../Telegram/ThirdParty/libtgvoip/PrivateDefines.h"
  "../../Telegram/ThirdParty/libtgvoip/VoIPServerConfig.h"
  "../../Telegram/ThirdParty/libtgvoip/audio/AudioInput.h"
  "../../Telegram/ThirdParty/libtgvoip/audio/AudioOutput.h"
  "../../Telegram/ThirdParty/libtgvoip/audio/Resampler.h"
  "../../Telegram/ThirdParty/libtgvoip/NetworkSocket.h"
  "../../Telegram/ThirdParty/libtgvoip/PacketReassembler.h"
  "../../Telegram/ThirdParty/libtgvoip/MessageThread.h"
  "../../Telegram/ThirdParty/libtgvoip/audio/AudioIO.h"
  "../../Telegram/ThirdParty/libtgvoip/video/ScreamCongestionController.h"
  "../../Telegram/ThirdParty/libtgvoip/video/VideoSource.h"
  "../../Telegram/ThirdParty/libtgvoip/video/VideoRenderer.h"
  "../../Telegram/ThirdParty/libtgvoip/json11.hpp"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioInputALSA.h"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioOutputALSA.h"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioOutputPulse.h"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioInputPulse.h"
  "../../Telegram/ThirdParty/libtgvoip/os/linux/AudioPulse.h"
  "../../Telegram/ThirdParty/libtgvoip/os/posix/NetworkSocketPosix.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/include/field_trial.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/include/cpu_features_wrapper.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/include/asm_defines.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/include/metrics.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/system_wrappers/include/compile_assert_c.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/typedefs.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/strings/internal/memutil.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/strings/ascii.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/strings/string_view.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/types/optional.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/types/bad_optional_access.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/memory/memory.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/meta/type_traits.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/algorithm/algorithm.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/container/inlined_vector.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/policy_checks.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/port.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/config.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/invoke.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/inline_variable.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/atomic_hook.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/identity.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/raw_logging.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/internal/throw_delegate.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/attributes.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/macros.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/optimization.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/base/log_severity.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl/utility/utility.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/string_to_number.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/constructormagic.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/strings/string_builder.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/event_tracer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/stringencode.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/memory/aligned_malloc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/event.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/ignore_wundef.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/stringutils.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/arraysize.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/swap_queue.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/trace_event.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/checks.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/deprecation.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/sanitizer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/scoped_ref_ptr.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/logging.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/timeutils.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/atomicops.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/numerics/safe_minmax.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/numerics/safe_conversions.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/numerics/safe_conversions_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/numerics/safe_compare.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/system/unused.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/system/inline.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/system/ignore_warnings.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/system/asm_defines.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/system/rtc_export.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/system/arch.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/platform_thread.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/platform_thread_types.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/protobuf_utils.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/thread_annotations.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/gtest_prod_util.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/function_view.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/criticalsection.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/refcount.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/thread_checker_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/compile_assert_c.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/type_traits.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/platform_file.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/refcounter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/logging_mac.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/thread_checker.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/race_checker.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/rtc_base/refcountedobject.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/third_party/rnnoise/src/rnn_activations.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/third_party/rnnoise/src/kiss_fft.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/third_party/rnnoise/src/rnn_vad_weights.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/echo_canceller3_config.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/echo_control.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/audio_frame.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/audio/echo_canceller3_factory.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/api/array_view.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/third_party/fft/fft.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/bandwidth_info.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/include/isac.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/os_specific_inline.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/entropy_coding.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac_vad.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/settings.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb12_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/crc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac_float_type.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_lag_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/spectrum_ar_model_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/codec.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_gain_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb16_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/structs.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/filter_functions.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/encode_lpc_swb.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_analysis.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/bandwidth_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_gain_swb_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/moving_max.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/circular_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/normalized_covariance_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_detector/mean_variance_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/gain_control_for_experimental_agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/rms_level.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/ns_core.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/defines.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/noise_suppression.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/nsx_core.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/windows_private.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/noise_suppression_x.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/ns/nsx_defines.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/residual_echo_detector.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/audio_processing_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/render_queue_item_verifier.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_generator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/config.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_frame_view.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/mock_audio_processing.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/gain_control.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_generator_factory.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/aec_dump.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_processing_statistics.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/include/audio_processing.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/interpolated_gain_curve.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/biquad_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/agc2_testing_common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/signal_classifier.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/vector_float_frame.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/sequence_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/rnn.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/test_utils.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_info.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/lp_residual.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/ring_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/symmetric_matrix_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/features_extraction.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/fft_util.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/fixed_gain_controller.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/down_sampler.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/saturation_protector.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/agc2_common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator_agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_digital_gain_applier.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/vad_with_level.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/limiter_db_gain_curve.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/fixed_digital_level_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/adaptive_agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/gain_applier.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/noise_level_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/compute_interpolated_gain_curve.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/noise_spectrum_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc2/limiter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/transient_detector.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/transient_suppressor.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/daubechies_8_wavelet_coeffs.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/wpd_node.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/moving_moments.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/wpd_tree.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/transient/dyadic_decimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/noise_suppression_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_resampler.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/echo_cancellation.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_core.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_core_optimized_methods.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec/aec_common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/voice_detection_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/legacy/analog_agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/legacy/gain_control.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/legacy/digital_agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/mock_agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/loudness_histogram.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/gain_map_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/utility.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/agc_manager_direct.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/agc/agc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/audio_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_control_mobile_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/splitting_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/low_cut_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/audio_generator/file_audio_generator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/three_band_filter_bank.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/echo_cancellation_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/level_estimator_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/gain_controller2.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aecm/aecm_core.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aecm/aecm_defines.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aecm/echo_control_mobile.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/downsampled_render_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subtractor_output_analyzer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/residual_echo_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/shadow_filter_update_gain.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/aec_state.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/suppression_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_delay_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/adaptive_fir_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/cascaded_biquad_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/matched_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subtractor_output.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_signal_analyzer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/aec3_fft.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_remover_metrics.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/filter_analyzer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subtractor.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_path_delay_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_processor_metrics.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/fft_data.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_controller_metrics.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/comfort_noise_generator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/erl_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_remover.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/matrix_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_model_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_path_variability.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/moving_average.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_reverb_model.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_controller.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/suppression_gain.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/erle_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/subband_erle_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_processor.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/fullband_erle_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/stationarity_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_canceller3.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/skew_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_model_fallback.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/vector_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_frequency_response.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/echo_audibility.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/fft_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/aec3_common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/vector_math.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/decimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/frame_blocker.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/block_framer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/suppression_gain_limiter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/delay_estimate.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_model.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/main_filter_update_gain.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/matched_filter_lag_aggregator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/reverb_decay_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/aec3/render_delay_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/gain_control_impl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/typing_detection.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/logging/apm_data_dumper.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/vad_audio_proc_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/vad_circular_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/pitch_based_vad.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/pole_zero_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/gmm.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/vad_audio_proc.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/voice_gmm_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/noise_gmm_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/pitch_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/standalone_vad.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/vad/voice_activity_detector.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/delay_estimator_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/ooura_fft.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/block_mean_calculator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/delay_estimator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/ooura_fft_tables_common.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/modules/audio_processing/utility/delay_estimator_wrapper.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/mocks/mock_smoothing_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/wav_file.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/sparse_fir_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter_sse.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/window_generator.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/ring_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/include/audio_util.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/real_fourier_ooura.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/smoothing_filter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/sinc_resampler.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/include/push_resampler.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/include/resampler.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/push_sinc_resampler.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/resampler/sinusoidal_linear_chirp_source.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter_factory.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/audio_converter.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/third_party/spl_sqrt_floor/spl_sqrt_floor.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/third_party/fft4g/fft4g.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/channel_buffer.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/real_fourier.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/fir_filter_c.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/complex_fft_tables.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/include/signal_processing_library.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/include/real_fft.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/include/spl_inl.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/dot_product_with_scale.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/signal_processing/resample_by_2_internal.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/wav_header.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_core.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/include/vad.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/include/webrtc_vad.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_gmm.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_sp.h"
  "../../Telegram/ThirdParty/libtgvoip/webrtc_dsp/common_audio/vad/vad_filterbank.h")
add_library(libtgvoip STATIC ${libtgvoip__c_srcs} ${libtgvoip__cxx_srcs} ${libtgvoip__other_srcs})
set_target_properties(libtgvoip PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${libtgvoip__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(libtgvoip PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/../ThirdParty/libtgvoip")
set_target_properties(libtgvoip PROPERTIES PREFIX "lib")
set_target_properties(libtgvoip PROPERTIES ARCHIVE_OUTPUT_NAME "tgvoip")
set_target_properties(libtgvoip PROPERTIES SUFFIX ".a")
set_source_files_properties(${obj}.${TOOLSET}/../ThirdParty/libtgvoip/libtgvoip.a PROPERTIES GENERATED "TRUE")
list(APPEND libtgvoip__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/libtgvoip/webrtc_dsp"
  "/usr/include/opus")
set_property(TARGET libtgvoip APPEND PROPERTY INCLUDE_DIRECTORIES ${libtgvoip__include_dirs})
set_target_properties(libtgvoip PROPERTIES COMPILE_DEFINITIONS "WEBRTC_APM_DEBUG_DUMP=0;TGVOIP_USE_DESKTOP_DSP;WEBRTC_NS_FLOAT;WEBRTC_POSIX;WEBRTC_LINUX;")
set_target_properties(libtgvoip PROPERTIES COMPILE_FLAGS "")
unset(TOOLSET)
unset(TARGET)

#Telegram.gyp:Telegram#target
set(TARGET "Telegram")
set(TOOLSET "target")
list(APPEND Telegram__update_dependent_styles__input
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/update_dependent.py"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/colors.palette"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/basic.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/boxes/boxes.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/calls/calls.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/dialogs/dialogs.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/export/view/export.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/history/history.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/info/info.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/intro/intro.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/media/view/mediaview.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/media/player/media_player.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/overview/overview.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/passport/passport.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/profile/profile.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/settings/settings.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/chat_helpers/chat_helpers.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/ui/widgets/widgets.style"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles/window/window.style")
set(Telegram__update_dependent_styles__output "${obj}/gen/update_dependent_styles.timestamp")
add_custom_command(OUTPUT ${Telegram__update_dependent_styles__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND python ./update_dependent.py --styles -I ../Resources -I ../SourceFiles -o "${obj}/gen/update_dependent_styles.timestamp" ../Resources/colors.palette ../Resources/basic.style ../SourceFiles/boxes/boxes.style ../SourceFiles/calls/calls.style ../SourceFiles/dialogs/dialogs.style ../SourceFiles/export/view/export.style ../SourceFiles/history/history.style ../SourceFiles/info/info.style ../SourceFiles/intro/intro.style ../SourceFiles/media/view/mediaview.style ../SourceFiles/media/player/media_player.style ../SourceFiles/overview/overview.style ../SourceFiles/passport/passport.style ../SourceFiles/profile/profile.style ../SourceFiles/settings/settings.style ../SourceFiles/chat_helpers/chat_helpers.style ../SourceFiles/ui/widgets/widgets.style ../SourceFiles/window/window.style
  DEPENDS ${Telegram__update_dependent_styles__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Updating dependent style files..
  VERBATIM
)
add_custom_target(Telegram__update_dependent_styles
  DEPENDS ${Telegram__update_dependent_styles__output}
  SOURCES ${Telegram__update_dependent_styles__input}
)
list(APPEND Telegram__update_dependent_qrc__input
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/update_dependent.py"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_emoji_1.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_emoji_2.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_emoji_3.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_emoji_4.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_emoji_5.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_emoji_preview.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_sounds.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/telegram_linux.qrc"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_video@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/day-blue.tdesktop-theme"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_sessions@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_frequent@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/back@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/art/bg_initial.jpg"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_chats@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_location.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_sessions.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/qrc/qmime/freedesktop.org.xml"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/back.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_game@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/sounds/call_end.mp3"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_call@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_web.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_photos@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_shop.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_contact.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_music.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/night-green.tdesktop-theme"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_chats.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_contacts.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_web@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_location@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_photo@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_file@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_file.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/sounds/call_incoming.mp3"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/css/style.css"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_contacts@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/fonts/OpenSans-Regular.ttf"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/fonts/OpenSans-Bold.ttf"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_other@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_photo.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_other.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/night.tdesktop-theme"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_calls.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/sounds/call_connect.mp3"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_photos.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/sounds/call_busy.mp3"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_game.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/art/logo_256.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_voice@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_music@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/art/sunrise.jpg"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/js/script.js"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/default_shortcuts-custom.json"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/sounds/msg_incoming.mp3"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_calls@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_shop@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_contact@2x.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/art/logo_256_no_margin.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_video.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/art/bg.jpg"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_voice.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/fonts/OpenSans-Semibold.ttf"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/section_frequent.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/export_html/images/media_call.png"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/sounds/call_outgoing.mp3")
set(Telegram__update_dependent_qrc__output "${obj}/gen/update_dependent_qrc.timestamp")
add_custom_command(OUTPUT ${Telegram__update_dependent_qrc__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND python ./update_dependent.py --qrc -o "${obj}/gen/update_dependent_qrc.timestamp" ../Resources/qrc/telegram.qrc ../Resources/qrc/telegram_emoji_1.qrc ../Resources/qrc/telegram_emoji_2.qrc ../Resources/qrc/telegram_emoji_3.qrc ../Resources/qrc/telegram_emoji_4.qrc ../Resources/qrc/telegram_emoji_5.qrc ../Resources/qrc/telegram_emoji_preview.qrc ../Resources/qrc/telegram_sounds.qrc ../Resources/qrc/telegram_linux.qrc
  DEPENDS ${Telegram__update_dependent_qrc__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Updating dependent qrc files..
  VERBATIM
)
add_custom_target(Telegram__update_dependent_qrc
  DEPENDS ${Telegram__update_dependent_qrc__output}
  SOURCES ${Telegram__update_dependent_qrc__input}
)
list(APPEND Telegram__codegen_palette__input
  "${builddir}/codegen_style"
  "${obj}/gen/update_dependent_styles.timestamp"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/colors.palette")
list(APPEND Telegram__codegen_palette__output
  "${obj}/gen/styles/palette.h"
  "${obj}/gen/styles/palette.cpp")
add_custom_command(OUTPUT ${Telegram__codegen_palette__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." ../Resources/colors.palette
  DEPENDS ${Telegram__codegen_palette__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_palette-ing colors..
  VERBATIM
)
add_custom_target(Telegram__codegen_palette
  DEPENDS ${Telegram__codegen_palette__output}
  SOURCES ${Telegram__codegen_palette__input}
)
list(APPEND Telegram__codegen_lang__input
  "${builddir}/codegen_lang"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/langs/lang.strings")
list(APPEND Telegram__codegen_lang__output
  "${obj}/gen/lang_auto.cpp"
  "${obj}/gen/lang_auto.h")
add_custom_command(OUTPUT ${Telegram__codegen_lang__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/codegen_lang" -o "${obj}/gen" ../Resources/langs/lang.strings -w "${builddir}/.."
  DEPENDS ${Telegram__codegen_lang__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_lang-ing lang.strings..
  VERBATIM
)
add_custom_target(Telegram__codegen_lang
  DEPENDS ${Telegram__codegen_lang__output}
  SOURCES ${Telegram__codegen_lang__input}
)
list(APPEND Telegram__codegen_numbers__input
  "${builddir}/codegen_numbers"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/numbers.txt")
list(APPEND Telegram__codegen_numbers__output
  "${obj}/gen/numbers.cpp"
  "${obj}/gen/numbers.h")
add_custom_command(OUTPUT ${Telegram__codegen_numbers__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/codegen_numbers" -o "${obj}/gen" ../Resources/numbers.txt -w "${builddir}/.."
  DEPENDS ${Telegram__codegen_numbers__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_numbers-ing numbers.txt..
  VERBATIM
)
add_custom_target(Telegram__codegen_numbers
  DEPENDS ${Telegram__codegen_numbers__output}
  SOURCES ${Telegram__codegen_numbers__input}
)
list(APPEND Telegram__codegen_emoji__input
  "${builddir}/codegen_emoji"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/Resources/emoji_autocomplete.json")
list(APPEND Telegram__codegen_emoji__output
  "${obj}/gen/emoji.cpp"
  "${obj}/gen/emoji.h"
  "${obj}/gen/emoji_suggestions_data.cpp"
  "${obj}/gen/emoji_suggestions_data.h")
add_custom_command(OUTPUT ${Telegram__codegen_emoji__output}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen
  COMMAND "${builddir}/codegen_emoji" ../Resources/emoji_autocomplete.json -o "${obj}/gen"
  DEPENDS ${Telegram__codegen_emoji__input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_emoji-ing..
  VERBATIM
)
add_custom_target(Telegram__codegen_emoji
  DEPENDS ${Telegram__codegen_emoji__output}
  SOURCES ${Telegram__codegen_emoji__input}
)
set(Telegram__qt_moc__input "")
set(RULE_INPUT_PATH "../SourceFiles/api/api_sending.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/api")
set(RULE_INPUT_NAME "api_sending.h")
set(RULE_INPUT_ROOT "api_sending")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_0_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_0_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/api/api_sending.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/api/api_single_message_search.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/api")
set(RULE_INPUT_NAME "api_single_message_search.h")
set(RULE_INPUT_ROOT "api_single_message_search")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_1_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_1_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/api/api_single_message_search.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/add_participants_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "add_participants_box.h")
set(RULE_INPUT_ROOT "add_participants_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_2_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_2_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/add_participants_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_contact_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_contact_box.h")
set(RULE_INPUT_ROOT "edit_contact_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_3_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_3_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_contact_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_linked_chat_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_linked_chat_box.h")
set(RULE_INPUT_ROOT "edit_linked_chat_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_4_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_4_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_linked_chat_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_participant_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_participant_box.h")
set(RULE_INPUT_ROOT "edit_participant_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_5_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_5_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_participant_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_participants_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_participants_box.h")
set(RULE_INPUT_ROOT "edit_participants_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_6_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_6_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_participants_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_peer_info_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_peer_info_box.h")
set(RULE_INPUT_ROOT "edit_peer_info_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_7_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_7_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_peer_info_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_peer_type_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_peer_type_box.h")
set(RULE_INPUT_ROOT "edit_peer_type_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_8_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_8_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_peer_type_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_peer_history_visibility_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_peer_history_visibility_box.h")
set(RULE_INPUT_ROOT "edit_peer_history_visibility_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_9_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_9_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_peer_history_visibility_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peers/edit_peer_permissions_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes/peers")
set(RULE_INPUT_NAME "edit_peer_permissions_box.h")
set(RULE_INPUT_ROOT "edit_peer_permissions_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_10_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_10_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peers/edit_peer_permissions_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/about_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "about_box.h")
set(RULE_INPUT_ROOT "about_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_11_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_11_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/about_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/abstract_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "abstract_box.h")
set(RULE_INPUT_ROOT "abstract_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_12_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_12_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/abstract_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/add_contact_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "add_contact_box.h")
set(RULE_INPUT_ROOT "add_contact_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_13_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_13_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/add_contact_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/auto_lock_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "auto_lock_box.h")
set(RULE_INPUT_ROOT "auto_lock_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_14_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_14_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/auto_lock_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/auto_download_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "auto_download_box.h")
set(RULE_INPUT_ROOT "auto_download_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_15_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_15_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/auto_download_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/background_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "background_box.h")
set(RULE_INPUT_ROOT "background_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_16_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_16_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/background_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/background_preview_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "background_preview_box.h")
set(RULE_INPUT_ROOT "background_preview_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_17_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_17_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/background_preview_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/calendar_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "calendar_box.h")
set(RULE_INPUT_ROOT "calendar_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_18_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_18_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/calendar_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/change_phone_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "change_phone_box.h")
set(RULE_INPUT_ROOT "change_phone_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_19_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_19_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/change_phone_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/confirm_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "confirm_box.h")
set(RULE_INPUT_ROOT "confirm_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_20_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_20_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/confirm_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/confirm_phone_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "confirm_phone_box.h")
set(RULE_INPUT_ROOT "confirm_phone_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_21_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_21_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/confirm_phone_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/connection_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "connection_box.h")
set(RULE_INPUT_ROOT "connection_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_22_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_22_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/connection_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/create_poll_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "create_poll_box.h")
set(RULE_INPUT_ROOT "create_poll_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_23_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_23_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/create_poll_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/download_path_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "download_path_box.h")
set(RULE_INPUT_ROOT "download_path_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_24_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_24_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/download_path_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/edit_caption_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "edit_caption_box.h")
set(RULE_INPUT_ROOT "edit_caption_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_25_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_25_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/edit_caption_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/edit_color_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "edit_color_box.h")
set(RULE_INPUT_ROOT "edit_color_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_26_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_26_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/edit_color_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/edit_privacy_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "edit_privacy_box.h")
set(RULE_INPUT_ROOT "edit_privacy_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_27_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_27_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/edit_privacy_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/generic_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "generic_box.h")
set(RULE_INPUT_ROOT "generic_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_28_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_28_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/generic_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/language_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "language_box.h")
set(RULE_INPUT_ROOT "language_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_29_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_29_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/language_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/local_storage_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "local_storage_box.h")
set(RULE_INPUT_ROOT "local_storage_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_30_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_30_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/local_storage_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/mute_settings_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "mute_settings_box.h")
set(RULE_INPUT_ROOT "mute_settings_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_31_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_31_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/mute_settings_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peer_list_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "peer_list_box.h")
set(RULE_INPUT_ROOT "peer_list_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_32_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_32_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peer_list_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/peer_list_controllers.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "peer_list_controllers.h")
set(RULE_INPUT_ROOT "peer_list_controllers")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_33_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_33_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/peer_list_controllers.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/passcode_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "passcode_box.h")
set(RULE_INPUT_ROOT "passcode_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_34_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_34_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/passcode_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/photo_crop_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "photo_crop_box.h")
set(RULE_INPUT_ROOT "photo_crop_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_35_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_35_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/photo_crop_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/rate_call_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "rate_call_box.h")
set(RULE_INPUT_ROOT "rate_call_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_36_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_36_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/rate_call_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/report_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "report_box.h")
set(RULE_INPUT_ROOT "report_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_37_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_37_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/report_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/self_destruction_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "self_destruction_box.h")
set(RULE_INPUT_ROOT "self_destruction_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_38_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_38_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/self_destruction_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/send_files_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "send_files_box.h")
set(RULE_INPUT_ROOT "send_files_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_39_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_39_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/send_files_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/sessions_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "sessions_box.h")
set(RULE_INPUT_ROOT "sessions_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_40_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_40_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/sessions_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/share_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "share_box.h")
set(RULE_INPUT_ROOT "share_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_41_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_41_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/share_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/single_choice_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "single_choice_box.h")
set(RULE_INPUT_ROOT "single_choice_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_42_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_42_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/single_choice_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/sticker_set_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "sticker_set_box.h")
set(RULE_INPUT_ROOT "sticker_set_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_43_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_43_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/sticker_set_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/stickers_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "stickers_box.h")
set(RULE_INPUT_ROOT "stickers_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_44_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_44_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/stickers_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/url_auth_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "url_auth_box.h")
set(RULE_INPUT_ROOT "url_auth_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_45_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_45_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/url_auth_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/username_box.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "username_box.h")
set(RULE_INPUT_ROOT "username_box")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_46_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_46_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/boxes/username_box.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls_box_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls_box_controller.h")
set(RULE_INPUT_ROOT "calls_box_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_47_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_47_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/calls/calls_box_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls_call.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls_call.h")
set(RULE_INPUT_ROOT "calls_call")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_48_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_48_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/calls/calls_call.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls_emoji_fingerprint.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls_emoji_fingerprint.h")
set(RULE_INPUT_ROOT "calls_emoji_fingerprint")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_49_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_49_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/calls/calls_emoji_fingerprint.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls_instance.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls_instance.h")
set(RULE_INPUT_ROOT "calls_instance")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_50_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_50_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/calls/calls_instance.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls_panel.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls_panel.h")
set(RULE_INPUT_ROOT "calls_panel")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_51_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_51_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/calls/calls_panel.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls_top_bar.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls_top_bar.h")
set(RULE_INPUT_ROOT "calls_top_bar")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_52_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_52_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/calls/calls_top_bar.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/bot_keyboard.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "bot_keyboard.h")
set(RULE_INPUT_ROOT "bot_keyboard")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_53_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_53_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/bot_keyboard.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/emoji_keywords.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "emoji_keywords.h")
set(RULE_INPUT_ROOT "emoji_keywords")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_54_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_54_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/emoji_keywords.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/emoji_list_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "emoji_list_widget.h")
set(RULE_INPUT_ROOT "emoji_list_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_55_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_55_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/emoji_list_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/emoji_sets_manager.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "emoji_sets_manager.h")
set(RULE_INPUT_ROOT "emoji_sets_manager")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_56_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_56_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/emoji_sets_manager.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/emoji_suggestions_helper.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "emoji_suggestions_helper.h")
set(RULE_INPUT_ROOT "emoji_suggestions_helper")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_57_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_57_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_helper.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/emoji_suggestions_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "emoji_suggestions_widget.h")
set(RULE_INPUT_ROOT "emoji_suggestions_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_58_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_58_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/field_autocomplete.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "field_autocomplete.h")
set(RULE_INPUT_ROOT "field_autocomplete")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_59_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_59_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/field_autocomplete.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/gifs_list_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "gifs_list_widget.h")
set(RULE_INPUT_ROOT "gifs_list_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_60_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_60_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/gifs_list_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/message_field.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "message_field.h")
set(RULE_INPUT_ROOT "message_field")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_61_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_61_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/message_field.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/stickers.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "stickers.h")
set(RULE_INPUT_ROOT "stickers")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_62_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_62_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/stickers.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/stickers_emoji_pack.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "stickers_emoji_pack.h")
set(RULE_INPUT_ROOT "stickers_emoji_pack")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_63_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_63_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/stickers_emoji_pack.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/stickers_list_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "stickers_list_widget.h")
set(RULE_INPUT_ROOT "stickers_list_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_64_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_64_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/stickers_list_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/tabbed_panel.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "tabbed_panel.h")
set(RULE_INPUT_ROOT "tabbed_panel")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_65_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_65_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/tabbed_panel.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/tabbed_section.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "tabbed_section.h")
set(RULE_INPUT_ROOT "tabbed_section")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_66_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_66_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/tabbed_section.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/tabbed_selector.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "tabbed_selector.h")
set(RULE_INPUT_ROOT "tabbed_selector")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_67_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_67_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/chat_helpers/tabbed_selector.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/application.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "application.h")
set(RULE_INPUT_ROOT "application")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_68_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_68_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/application.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/changelogs.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "changelogs.h")
set(RULE_INPUT_ROOT "changelogs")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_69_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_69_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/changelogs.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/click_handler.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "click_handler.h")
set(RULE_INPUT_ROOT "click_handler")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_70_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_70_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/click_handler.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/click_handler_types.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "click_handler_types.h")
set(RULE_INPUT_ROOT "click_handler_types")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_71_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_71_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/click_handler_types.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/core_cloud_password.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "core_cloud_password.h")
set(RULE_INPUT_ROOT "core_cloud_password")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_72_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_72_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/core_cloud_password.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/crash_report_window.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "crash_report_window.h")
set(RULE_INPUT_ROOT "crash_report_window")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_73_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_73_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/crash_report_window.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/crash_reports.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "crash_reports.h")
set(RULE_INPUT_ROOT "crash_reports")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_74_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_74_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/crash_reports.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/event_filter.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "event_filter.h")
set(RULE_INPUT_ROOT "event_filter")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_75_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_75_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/event_filter.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/file_utilities.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "file_utilities.h")
set(RULE_INPUT_ROOT "file_utilities")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_76_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_76_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/file_utilities.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/launcher.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "launcher.h")
set(RULE_INPUT_ROOT "launcher")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_77_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_77_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/launcher.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/local_url_handlers.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "local_url_handlers.h")
set(RULE_INPUT_ROOT "local_url_handlers")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_78_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_78_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/local_url_handlers.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/main_queue_processor.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "main_queue_processor.h")
set(RULE_INPUT_ROOT "main_queue_processor")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_79_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_79_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/main_queue_processor.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/media_active_cache.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "media_active_cache.h")
set(RULE_INPUT_ROOT "media_active_cache")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_80_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_80_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/media_active_cache.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/mime_type.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "mime_type.h")
set(RULE_INPUT_ROOT "mime_type")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_81_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_81_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/mime_type.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/qt_signal_producer.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "qt_signal_producer.h")
set(RULE_INPUT_ROOT "qt_signal_producer")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_82_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_82_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/qt_signal_producer.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/sandbox.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "sandbox.h")
set(RULE_INPUT_ROOT "sandbox")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_83_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_83_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/sandbox.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/shortcuts.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "shortcuts.h")
set(RULE_INPUT_ROOT "shortcuts")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_84_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_84_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/shortcuts.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/update_checker.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "update_checker.h")
set(RULE_INPUT_ROOT "update_checker")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_85_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_85_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/update_checker.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/utils.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "utils.h")
set(RULE_INPUT_ROOT "utils")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_86_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_86_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/utils.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/core/version.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/core")
set(RULE_INPUT_NAME "version.h")
set(RULE_INPUT_ROOT "version")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_87_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_87_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/core/version.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_abstract_structure.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_abstract_structure.h")
set(RULE_INPUT_ROOT "data_abstract_structure")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_88_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_88_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_abstract_structure.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_auto_download.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_auto_download.h")
set(RULE_INPUT_ROOT "data_auto_download")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_89_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_89_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_auto_download.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_chat.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_chat.h")
set(RULE_INPUT_ROOT "data_chat")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_90_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_90_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_chat.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_channel.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_channel.h")
set(RULE_INPUT_ROOT "data_channel")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_91_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_91_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_channel.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_channel_admins.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_channel_admins.h")
set(RULE_INPUT_ROOT "data_channel_admins")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_92_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_92_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_channel_admins.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_countries.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_countries.h")
set(RULE_INPUT_ROOT "data_countries")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_93_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_93_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_countries.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_document.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_document.h")
set(RULE_INPUT_ROOT "data_document")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_94_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_94_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_document.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_document_good_thumbnail.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_document_good_thumbnail.h")
set(RULE_INPUT_ROOT "data_document_good_thumbnail")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_95_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_95_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_document_good_thumbnail.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_drafts.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_drafts.h")
set(RULE_INPUT_ROOT "data_drafts")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_96_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_96_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_drafts.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_folder.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_folder.h")
set(RULE_INPUT_ROOT "data_folder")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_97_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_97_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_folder.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_file_origin.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_file_origin.h")
set(RULE_INPUT_ROOT "data_file_origin")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_98_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_98_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_file_origin.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_flags.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_flags.h")
set(RULE_INPUT_ROOT "data_flags")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_99_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_99_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_flags.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_game.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_game.h")
set(RULE_INPUT_ROOT "data_game")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_100_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_100_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_game.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_groups.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_groups.h")
set(RULE_INPUT_ROOT "data_groups")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_101_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_101_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_groups.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_location.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_location.h")
set(RULE_INPUT_ROOT "data_location")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_102_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_102_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_location.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_media_types.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_media_types.h")
set(RULE_INPUT_ROOT "data_media_types")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_103_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_103_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_media_types.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_messages.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_messages.h")
set(RULE_INPUT_ROOT "data_messages")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_104_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_104_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_messages.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_notify_settings.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_notify_settings.h")
set(RULE_INPUT_ROOT "data_notify_settings")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_105_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_105_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_notify_settings.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_peer.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_peer.h")
set(RULE_INPUT_ROOT "data_peer")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_106_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_106_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_peer.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_peer_values.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_peer_values.h")
set(RULE_INPUT_ROOT "data_peer_values")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_107_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_107_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_peer_values.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_photo.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_photo.h")
set(RULE_INPUT_ROOT "data_photo")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_108_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_108_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_photo.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_poll.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_poll.h")
set(RULE_INPUT_ROOT "data_poll")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_109_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_109_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_poll.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_pts_waiter.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_pts_waiter.h")
set(RULE_INPUT_ROOT "data_pts_waiter")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_110_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_110_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_pts_waiter.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_search_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_search_controller.h")
set(RULE_INPUT_ROOT "data_search_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_111_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_111_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_search_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_session.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_session.h")
set(RULE_INPUT_ROOT "data_session")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_112_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_112_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_session.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_shared_media.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_shared_media.h")
set(RULE_INPUT_ROOT "data_shared_media")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_113_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_113_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_shared_media.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_sparse_ids.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_sparse_ids.h")
set(RULE_INPUT_ROOT "data_sparse_ids")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_114_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_114_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_sparse_ids.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_types.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_types.h")
set(RULE_INPUT_ROOT "data_types")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_115_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_115_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_types.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_user.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_user.h")
set(RULE_INPUT_ROOT "data_user")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_116_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_116_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_user.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_user_photos.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_user_photos.h")
set(RULE_INPUT_ROOT "data_user_photos")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_117_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_117_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_user_photos.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_wall_paper.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_wall_paper.h")
set(RULE_INPUT_ROOT "data_wall_paper")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_118_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_118_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_wall_paper.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/data/data_web_page.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/data")
set(RULE_INPUT_NAME "data_web_page.h")
set(RULE_INPUT_ROOT "data_web_page")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_119_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_119_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/data/data_web_page.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_entry.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_entry.h")
set(RULE_INPUT_ROOT "dialogs_entry")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_120_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_120_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_entry.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_indexed_list.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_indexed_list.h")
set(RULE_INPUT_ROOT "dialogs_indexed_list")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_121_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_121_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_indexed_list.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_inner_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_inner_widget.h")
set(RULE_INPUT_ROOT "dialogs_inner_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_122_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_122_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_inner_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_key.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_key.h")
set(RULE_INPUT_ROOT "dialogs_key")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_123_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_123_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_key.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_layout.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_layout.h")
set(RULE_INPUT_ROOT "dialogs_layout")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_124_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_124_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_layout.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_list.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_list.h")
set(RULE_INPUT_ROOT "dialogs_list")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_125_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_125_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_list.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_main_list.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_main_list.h")
set(RULE_INPUT_ROOT "dialogs_main_list")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_126_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_126_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_main_list.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_pinned_list.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_pinned_list.h")
set(RULE_INPUT_ROOT "dialogs_pinned_list")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_127_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_127_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_pinned_list.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_row.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_row.h")
set(RULE_INPUT_ROOT "dialogs_row")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_128_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_128_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_row.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_search_from_controllers.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_search_from_controllers.h")
set(RULE_INPUT_ROOT "dialogs_search_from_controllers")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_129_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_129_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_search_from_controllers.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs_widget.h")
set(RULE_INPUT_ROOT "dialogs_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_130_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_130_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/dialogs/dialogs_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/export/view/export_view_content.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/export/view")
set(RULE_INPUT_NAME "export_view_content.h")
set(RULE_INPUT_ROOT "export_view_content")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_131_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_131_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/export/view/export_view_content.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/export/view/export_view_panel_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/export/view")
set(RULE_INPUT_NAME "export_view_panel_controller.h")
set(RULE_INPUT_ROOT "export_view_panel_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_132_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_132_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/export/view/export_view_panel_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/export/view/export_view_progress.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/export/view")
set(RULE_INPUT_NAME "export_view_progress.h")
set(RULE_INPUT_ROOT "export_view_progress")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_133_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_133_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/export/view/export_view_progress.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/export/view/export_view_settings.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/export/view")
set(RULE_INPUT_NAME "export_view_settings.h")
set(RULE_INPUT_ROOT "export_view_settings")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_134_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_134_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/export/view/export_view_settings.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/export/view/export_view_top_bar.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/export/view")
set(RULE_INPUT_NAME "export_view_top_bar.h")
set(RULE_INPUT_ROOT "export_view_top_bar")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_135_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_135_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/export/view/export_view_top_bar.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/admin_log/history_admin_log_filter.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/admin_log")
set(RULE_INPUT_NAME "history_admin_log_filter.h")
set(RULE_INPUT_ROOT "history_admin_log_filter")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_136_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_136_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/admin_log/history_admin_log_filter.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/admin_log/history_admin_log_inner.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/admin_log")
set(RULE_INPUT_NAME "history_admin_log_inner.h")
set(RULE_INPUT_ROOT "history_admin_log_inner")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_137_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_137_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/admin_log/history_admin_log_inner.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/admin_log/history_admin_log_item.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/admin_log")
set(RULE_INPUT_NAME "history_admin_log_item.h")
set(RULE_INPUT_ROOT "history_admin_log_item")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_138_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_138_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/admin_log/history_admin_log_item.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/admin_log/history_admin_log_section.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/admin_log")
set(RULE_INPUT_NAME "history_admin_log_section.h")
set(RULE_INPUT_ROOT "history_admin_log_section")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_139_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_139_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/admin_log/history_admin_log_section.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_call.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_call.h")
set(RULE_INPUT_ROOT "history_view_call")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_140_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_140_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_call.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_contact.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_contact.h")
set(RULE_INPUT_ROOT "history_view_contact")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_141_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_141_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_contact.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_document.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_document.h")
set(RULE_INPUT_ROOT "history_view_document")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_142_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_142_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_document.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_file.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_file.h")
set(RULE_INPUT_ROOT "history_view_file")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_143_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_143_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_file.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_game.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_game.h")
set(RULE_INPUT_ROOT "history_view_game")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_144_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_144_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_game.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_gif.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_gif.h")
set(RULE_INPUT_ROOT "history_view_gif")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_145_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_145_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_gif.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_invoice.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_invoice.h")
set(RULE_INPUT_ROOT "history_view_invoice")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_146_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_146_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_invoice.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_large_emoji.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_large_emoji.h")
set(RULE_INPUT_ROOT "history_view_large_emoji")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_147_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_147_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_large_emoji.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_location.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_location.h")
set(RULE_INPUT_ROOT "history_view_location")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_148_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_148_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_location.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_media.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_media.h")
set(RULE_INPUT_ROOT "history_view_media")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_149_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_149_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_media.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_media_common.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_media_common.h")
set(RULE_INPUT_ROOT "history_view_media_common")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_150_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_150_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_media_common.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_media_grouped.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_media_grouped.h")
set(RULE_INPUT_ROOT "history_view_media_grouped")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_151_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_151_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_media_grouped.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_media_unwrapped.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_media_unwrapped.h")
set(RULE_INPUT_ROOT "history_view_media_unwrapped")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_152_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_152_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_media_unwrapped.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_photo.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_photo.h")
set(RULE_INPUT_ROOT "history_view_photo")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_153_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_153_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_photo.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_poll.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_poll.h")
set(RULE_INPUT_ROOT "history_view_poll")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_154_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_154_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_poll.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_sticker.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_sticker.h")
set(RULE_INPUT_ROOT "history_view_sticker")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_155_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_155_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_sticker.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_video.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_video.h")
set(RULE_INPUT_ROOT "history_view_video")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_156_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_156_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_video.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_wall_paper.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_wall_paper.h")
set(RULE_INPUT_ROOT "history_view_wall_paper")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_157_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_157_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_wall_paper.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/media/history_view_web_page.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view/media")
set(RULE_INPUT_NAME "history_view_web_page.h")
set(RULE_INPUT_ROOT "history_view_web_page")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_158_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_158_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/media/history_view_web_page.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_contact_status.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_contact_status.h")
set(RULE_INPUT_ROOT "history_view_contact_status")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_159_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_159_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_contact_status.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_context_menu.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_context_menu.h")
set(RULE_INPUT_ROOT "history_view_context_menu")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_160_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_160_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_context_menu.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_cursor_state.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_cursor_state.h")
set(RULE_INPUT_ROOT "history_view_cursor_state")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_161_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_161_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_cursor_state.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_element.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_element.h")
set(RULE_INPUT_ROOT "history_view_element")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_162_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_162_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_element.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_list_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_list_widget.h")
set(RULE_INPUT_ROOT "history_view_list_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_163_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_163_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_list_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_message.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_message.h")
set(RULE_INPUT_ROOT "history_view_message")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_164_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_164_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_message.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_object.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_object.h")
set(RULE_INPUT_ROOT "history_view_object")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_165_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_165_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_object.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_service_message.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_service_message.h")
set(RULE_INPUT_ROOT "history_view_service_message")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_166_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_166_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_service_message.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/view/history_view_top_bar_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history/view")
set(RULE_INPUT_NAME "history_view_top_bar_widget.h")
set(RULE_INPUT_ROOT "history_view_top_bar_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_167_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_167_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/view/history_view_top_bar_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history.h")
set(RULE_INPUT_ROOT "history")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_168_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_168_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_drag_area.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_drag_area.h")
set(RULE_INPUT_ROOT "history_drag_area")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_169_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_169_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_drag_area.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_item.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_item.h")
set(RULE_INPUT_ROOT "history_item")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_170_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_170_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_item.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_item_components.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_item_components.h")
set(RULE_INPUT_ROOT "history_item_components")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_171_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_171_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_item_components.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_item_text.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_item_text.h")
set(RULE_INPUT_ROOT "history_item_text")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_172_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_172_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_item_text.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_inner_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_inner_widget.h")
set(RULE_INPUT_ROOT "history_inner_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_173_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_173_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_inner_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_location_manager.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_location_manager.h")
set(RULE_INPUT_ROOT "history_location_manager")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_174_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_174_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_location_manager.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_message.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_message.h")
set(RULE_INPUT_ROOT "history_message")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_175_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_175_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_message.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_service.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_service.h")
set(RULE_INPUT_ROOT "history_service")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_176_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_176_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_service.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history_widget.h")
set(RULE_INPUT_ROOT "history_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_177_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_177_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/history/history_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_content_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_content_widget.h")
set(RULE_INPUT_ROOT "info_content_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_178_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_178_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_content_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_controller.h")
set(RULE_INPUT_ROOT "info_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_179_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_179_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_layer_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_layer_widget.h")
set(RULE_INPUT_ROOT "info_layer_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_180_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_180_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_layer_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_memento.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_memento.h")
set(RULE_INPUT_ROOT "info_memento")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_181_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_181_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_memento.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_section_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_section_widget.h")
set(RULE_INPUT_ROOT "info_section_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_182_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_182_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_section_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_top_bar.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_top_bar.h")
set(RULE_INPUT_ROOT "info_top_bar")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_183_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_183_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_top_bar.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info_wrap_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info_wrap_widget.h")
set(RULE_INPUT_ROOT "info_wrap_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_184_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_184_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/info_wrap_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/common_groups/info_common_groups_inner_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/common_groups")
set(RULE_INPUT_NAME "info_common_groups_inner_widget.h")
set(RULE_INPUT_ROOT "info_common_groups_inner_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_185_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_185_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/common_groups/info_common_groups_inner_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/common_groups/info_common_groups_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/common_groups")
set(RULE_INPUT_NAME "info_common_groups_widget.h")
set(RULE_INPUT_ROOT "info_common_groups_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_186_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_186_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/common_groups/info_common_groups_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/media/info_media_buttons.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/media")
set(RULE_INPUT_NAME "info_media_buttons.h")
set(RULE_INPUT_ROOT "info_media_buttons")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_187_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_187_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/media/info_media_buttons.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/media/info_media_empty_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/media")
set(RULE_INPUT_NAME "info_media_empty_widget.h")
set(RULE_INPUT_ROOT "info_media_empty_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_188_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_188_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/media/info_media_empty_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/media/info_media_inner_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/media")
set(RULE_INPUT_NAME "info_media_inner_widget.h")
set(RULE_INPUT_ROOT "info_media_inner_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_189_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_189_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/media/info_media_inner_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/media/info_media_list_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/media")
set(RULE_INPUT_NAME "info_media_list_widget.h")
set(RULE_INPUT_ROOT "info_media_list_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_190_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_190_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/media/info_media_list_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/media/info_media_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/media")
set(RULE_INPUT_NAME "info_media_widget.h")
set(RULE_INPUT_ROOT "info_media_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_191_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_191_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/media/info_media_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/members/info_members_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/members")
set(RULE_INPUT_NAME "info_members_widget.h")
set(RULE_INPUT_ROOT "info_members_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_192_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_192_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/members/info_members_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_actions.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_actions.h")
set(RULE_INPUT_ROOT "info_profile_actions")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_193_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_193_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_actions.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_button.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_button.h")
set(RULE_INPUT_ROOT "info_profile_button")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_194_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_194_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_button.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_cover.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_cover.h")
set(RULE_INPUT_ROOT "info_profile_cover")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_195_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_195_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_cover.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_icon.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_icon.h")
set(RULE_INPUT_ROOT "info_profile_icon")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_196_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_196_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_icon.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_inner_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_inner_widget.h")
set(RULE_INPUT_ROOT "info_profile_inner_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_197_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_197_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_inner_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_members.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_members.h")
set(RULE_INPUT_ROOT "info_profile_members")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_198_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_198_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_members.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_members_controllers.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_members_controllers.h")
set(RULE_INPUT_ROOT "info_profile_members_controllers")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_199_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_199_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_members_controllers.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_text.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_text.h")
set(RULE_INPUT_ROOT "info_profile_text")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_200_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_200_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_text.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_values.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_values.h")
set(RULE_INPUT_ROOT "info_profile_values")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_201_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_201_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_values.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/profile/info_profile_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/profile")
set(RULE_INPUT_NAME "info_profile_widget.h")
set(RULE_INPUT_ROOT "info_profile_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_202_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_202_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/profile/info_profile_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/settings/info_settings_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/info/settings")
set(RULE_INPUT_NAME "info_settings_widget.h")
set(RULE_INPUT_ROOT "info_settings_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_203_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_203_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/info/settings/info_settings_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/inline_bots/inline_bot_layout_internal.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/inline_bots")
set(RULE_INPUT_NAME "inline_bot_layout_internal.h")
set(RULE_INPUT_ROOT "inline_bot_layout_internal")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_204_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_204_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/inline_bots/inline_bot_layout_internal.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/inline_bots/inline_bot_layout_item.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/inline_bots")
set(RULE_INPUT_NAME "inline_bot_layout_item.h")
set(RULE_INPUT_ROOT "inline_bot_layout_item")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_205_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_205_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/inline_bots/inline_bot_layout_item.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/inline_bots/inline_bot_result.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/inline_bots")
set(RULE_INPUT_NAME "inline_bot_result.h")
set(RULE_INPUT_ROOT "inline_bot_result")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_206_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_206_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/inline_bots/inline_bot_result.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/inline_bots/inline_bot_send_data.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/inline_bots")
set(RULE_INPUT_NAME "inline_bot_send_data.h")
set(RULE_INPUT_ROOT "inline_bot_send_data")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_207_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_207_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/inline_bots/inline_bot_send_data.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/inline_bots/inline_results_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/inline_bots")
set(RULE_INPUT_NAME "inline_results_widget.h")
set(RULE_INPUT_ROOT "inline_results_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_208_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_208_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/inline_bots/inline_results_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/introwidget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "introwidget.h")
set(RULE_INPUT_ROOT "introwidget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_209_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_209_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/intro/introwidget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/introcode.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "introcode.h")
set(RULE_INPUT_ROOT "introcode")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_210_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_210_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/intro/introcode.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/introphone.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "introphone.h")
set(RULE_INPUT_ROOT "introphone")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_211_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_211_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/intro/introphone.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/intropwdcheck.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "intropwdcheck.h")
set(RULE_INPUT_ROOT "intropwdcheck")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_212_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_212_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/intro/intropwdcheck.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/introsignup.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "introsignup.h")
set(RULE_INPUT_ROOT "introsignup")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_213_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_213_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/intro/introsignup.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/introstart.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "introstart.h")
set(RULE_INPUT_ROOT "introstart")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_214_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_214_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/intro/introstart.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_cloud_manager.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_cloud_manager.h")
set(RULE_INPUT_ROOT "lang_cloud_manager")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_215_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_215_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_cloud_manager.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_file_parser.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_file_parser.h")
set(RULE_INPUT_ROOT "lang_file_parser")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_216_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_216_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_file_parser.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_hardcoded.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_hardcoded.h")
set(RULE_INPUT_ROOT "lang_hardcoded")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_217_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_217_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_hardcoded.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_instance.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_instance.h")
set(RULE_INPUT_ROOT "lang_instance")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_218_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_218_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_instance.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_keys.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_keys.h")
set(RULE_INPUT_ROOT "lang_keys")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_219_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_219_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_keys.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_tag.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_tag.h")
set(RULE_INPUT_ROOT "lang_tag")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_220_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_220_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_tag.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_translator.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_translator.h")
set(RULE_INPUT_ROOT "lang_translator")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_221_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_221_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_translator.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/lang/lang_values.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/lang")
set(RULE_INPUT_NAME "lang_values.h")
set(RULE_INPUT_ROOT "lang_values")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_222_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_222_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/lang/lang_values.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/main/main_account.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/main")
set(RULE_INPUT_NAME "main_account.h")
set(RULE_INPUT_ROOT "main_account")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_223_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_223_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/main/main_account.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/main/main_app_config.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/main")
set(RULE_INPUT_NAME "main_app_config.h")
set(RULE_INPUT_ROOT "main_app_config")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_224_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_224_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/main/main_app_config.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/main/main_session.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/main")
set(RULE_INPUT_NAME "main_session.h")
set(RULE_INPUT_ROOT "main_session")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_225_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_225_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/main/main_session.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_audio.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_audio.h")
set(RULE_INPUT_ROOT "media_audio")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_226_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_226_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_audio.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_audio_capture.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_audio_capture.h")
set(RULE_INPUT_ROOT "media_audio_capture")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_227_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_227_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_audio_capture.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_audio_ffmpeg_loader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_audio_ffmpeg_loader.h")
set(RULE_INPUT_ROOT "media_audio_ffmpeg_loader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_228_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_228_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_audio_ffmpeg_loader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_audio_loader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_audio_loader.h")
set(RULE_INPUT_ROOT "media_audio_loader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_229_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_229_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_audio_loader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_audio_loaders.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_audio_loaders.h")
set(RULE_INPUT_ROOT "media_audio_loaders")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_230_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_230_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_audio_loaders.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_audio_track.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_audio_track.h")
set(RULE_INPUT_ROOT "media_audio_track")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_231_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_231_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_audio_track.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/audio/media_child_ffmpeg_loader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/audio")
set(RULE_INPUT_NAME "media_child_ffmpeg_loader.h")
set(RULE_INPUT_ROOT "media_child_ffmpeg_loader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_232_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_232_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/audio/media_child_ffmpeg_loader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/clip/media_clip_check_streaming.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/clip")
set(RULE_INPUT_NAME "media_clip_check_streaming.h")
set(RULE_INPUT_ROOT "media_clip_check_streaming")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_233_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_233_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/clip/media_clip_check_streaming.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/clip/media_clip_ffmpeg.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/clip")
set(RULE_INPUT_NAME "media_clip_ffmpeg.h")
set(RULE_INPUT_ROOT "media_clip_ffmpeg")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_234_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_234_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/clip/media_clip_ffmpeg.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/clip/media_clip_implementation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/clip")
set(RULE_INPUT_NAME "media_clip_implementation.h")
set(RULE_INPUT_ROOT "media_clip_implementation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_235_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_235_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/clip/media_clip_implementation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/clip/media_clip_reader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/clip")
set(RULE_INPUT_NAME "media_clip_reader.h")
set(RULE_INPUT_ROOT "media_clip_reader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_236_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_236_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/clip/media_clip_reader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player_button.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player_button.h")
set(RULE_INPUT_ROOT "media_player_button")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_237_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_237_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/player/media_player_button.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player_float.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player_float.h")
set(RULE_INPUT_ROOT "media_player_float")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_238_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_238_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/player/media_player_float.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player_instance.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player_instance.h")
set(RULE_INPUT_ROOT "media_player_instance")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_239_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_239_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/player/media_player_instance.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player_panel.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player_panel.h")
set(RULE_INPUT_ROOT "media_player_panel")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_240_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_240_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/player/media_player_panel.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player_volume_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player_volume_controller.h")
set(RULE_INPUT_ROOT "media_player_volume_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_241_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_241_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/player/media_player_volume_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player_widget.h")
set(RULE_INPUT_ROOT "media_player_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_242_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_242_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/player/media_player_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_audio_track.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_audio_track.h")
set(RULE_INPUT_ROOT "media_streaming_audio_track")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_243_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_243_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_audio_track.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_common.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_common.h")
set(RULE_INPUT_ROOT "media_streaming_common")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_244_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_244_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_common.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_file.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_file.h")
set(RULE_INPUT_ROOT "media_streaming_file")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_245_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_245_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_file.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_file_delegate.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_file_delegate.h")
set(RULE_INPUT_ROOT "media_streaming_file_delegate")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_246_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_246_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_file_delegate.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_loader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_loader.h")
set(RULE_INPUT_ROOT "media_streaming_loader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_247_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_247_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_loader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_loader_local.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_loader_local.h")
set(RULE_INPUT_ROOT "media_streaming_loader_local")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_248_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_248_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_loader_local.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_loader_mtproto.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_loader_mtproto.h")
set(RULE_INPUT_ROOT "media_streaming_loader_mtproto")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_249_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_249_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_loader_mtproto.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_player.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_player.h")
set(RULE_INPUT_ROOT "media_streaming_player")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_250_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_250_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_player.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_reader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_reader.h")
set(RULE_INPUT_ROOT "media_streaming_reader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_251_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_251_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_reader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_utility.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_utility.h")
set(RULE_INPUT_ROOT "media_streaming_utility")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_252_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_252_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_utility.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/streaming/media_streaming_video_track.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/streaming")
set(RULE_INPUT_NAME "media_streaming_video_track.h")
set(RULE_INPUT_ROOT "media_streaming_video_track")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_253_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_253_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/streaming/media_streaming_video_track.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/view/media_view_playback_controls.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/view")
set(RULE_INPUT_NAME "media_view_playback_controls.h")
set(RULE_INPUT_ROOT "media_view_playback_controls")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_254_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_254_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/view/media_view_playback_controls.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/view/media_view_playback_progress.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/view")
set(RULE_INPUT_NAME "media_view_playback_progress.h")
set(RULE_INPUT_ROOT "media_view_playback_progress")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_255_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_255_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/view/media_view_playback_progress.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/view/media_view_group_thumbs.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/view")
set(RULE_INPUT_NAME "media_view_group_thumbs.h")
set(RULE_INPUT_ROOT "media_view_group_thumbs")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_256_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_256_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/view/media_view_group_thumbs.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/view/media_view_overlay_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/view")
set(RULE_INPUT_NAME "media_view_overlay_widget.h")
set(RULE_INPUT_ROOT "media_view_overlay_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_257_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_257_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/media/view/media_view_overlay_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/auth_key.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "auth_key.h")
set(RULE_INPUT_ROOT "auth_key")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_258_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_258_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/auth_key.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/concurrent_sender.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "concurrent_sender.h")
set(RULE_INPUT_ROOT "concurrent_sender")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_259_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_259_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/concurrent_sender.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/config_loader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "config_loader.h")
set(RULE_INPUT_ROOT "config_loader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_260_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_260_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/config_loader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/connection.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "connection.h")
set(RULE_INPUT_ROOT "connection")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_261_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_261_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/connection.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/connection_abstract.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "connection_abstract.h")
set(RULE_INPUT_ROOT "connection_abstract")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_262_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_262_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/connection_abstract.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/connection_http.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "connection_http.h")
set(RULE_INPUT_ROOT "connection_http")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_263_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_263_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/connection_http.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/connection_resolving.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "connection_resolving.h")
set(RULE_INPUT_ROOT "connection_resolving")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_264_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_264_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/connection_resolving.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/connection_tcp.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "connection_tcp.h")
set(RULE_INPUT_ROOT "connection_tcp")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_265_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_265_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/connection_tcp.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/core_types.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "core_types.h")
set(RULE_INPUT_ROOT "core_types")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_266_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_266_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/core_types.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/dcenter.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "dcenter.h")
set(RULE_INPUT_ROOT "dcenter")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_267_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_267_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/dcenter.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/dc_options.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "dc_options.h")
set(RULE_INPUT_ROOT "dc_options")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_268_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_268_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/dc_options.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/dedicated_file_loader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "dedicated_file_loader.h")
set(RULE_INPUT_ROOT "dedicated_file_loader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_269_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_269_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/dedicated_file_loader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/facade.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "facade.h")
set(RULE_INPUT_ROOT "facade")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_270_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_270_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/facade.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/mtp_instance.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "mtp_instance.h")
set(RULE_INPUT_ROOT "mtp_instance")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_271_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_271_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/mtp_instance.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/rsa_public_key.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "rsa_public_key.h")
set(RULE_INPUT_ROOT "rsa_public_key")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_272_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_272_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/rsa_public_key.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/rpc_sender.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "rpc_sender.h")
set(RULE_INPUT_ROOT "rpc_sender")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_273_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_273_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/rpc_sender.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/sender.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "sender.h")
set(RULE_INPUT_ROOT "sender")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_274_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_274_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/sender.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/session.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "session.h")
set(RULE_INPUT_ROOT "session")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_275_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_275_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/session.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/special_config_request.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "special_config_request.h")
set(RULE_INPUT_ROOT "special_config_request")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_276_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_276_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/special_config_request.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mtproto/type_utils.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/mtproto")
set(RULE_INPUT_NAME "type_utils.h")
set(RULE_INPUT_ROOT "type_utils")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_277_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_277_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mtproto/type_utils.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/overview/overview_layout.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/overview")
set(RULE_INPUT_NAME "overview_layout.h")
set(RULE_INPUT_ROOT "overview_layout")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_278_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_278_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/overview/overview_layout.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_encryption.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_encryption.h")
set(RULE_INPUT_ROOT "passport_encryption")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_279_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_279_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_encryption.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_form_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_form_controller.h")
set(RULE_INPUT_ROOT "passport_form_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_280_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_280_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_form_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_form_view_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_form_view_controller.h")
set(RULE_INPUT_ROOT "passport_form_view_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_281_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_281_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_form_view_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel.h")
set(RULE_INPUT_ROOT "passport_panel")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_282_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_282_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_controller.h")
set(RULE_INPUT_ROOT "passport_panel_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_283_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_283_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_details_row.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_details_row.h")
set(RULE_INPUT_ROOT "passport_panel_details_row")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_284_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_284_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_details_row.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_edit_contact.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_edit_contact.h")
set(RULE_INPUT_ROOT "passport_panel_edit_contact")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_285_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_285_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_edit_contact.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_edit_document.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_edit_document.h")
set(RULE_INPUT_ROOT "passport_panel_edit_document")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_286_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_286_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_edit_document.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_edit_scans.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_edit_scans.h")
set(RULE_INPUT_ROOT "passport_panel_edit_scans")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_287_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_287_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_edit_scans.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_form.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_form.h")
set(RULE_INPUT_ROOT "passport_panel_form")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_288_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_288_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_form.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport_panel_password.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport_panel_password.h")
set(RULE_INPUT_ROOT "passport_panel_password")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_289_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_289_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/passport/passport_panel_password.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/linux_desktop_environment.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "linux_desktop_environment.h")
set(RULE_INPUT_ROOT "linux_desktop_environment")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_290_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_290_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/linux_desktop_environment.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/linux_gdk_helper.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "linux_gdk_helper.h")
set(RULE_INPUT_ROOT "linux_gdk_helper")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_291_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_291_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/linux_gdk_helper.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/linux_libnotify.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "linux_libnotify.h")
set(RULE_INPUT_ROOT "linux_libnotify")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_292_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_292_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/linux_libnotify.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/linux_libs.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "linux_libs.h")
set(RULE_INPUT_ROOT "linux_libs")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_293_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_293_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/linux_libs.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/file_utilities_linux.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "file_utilities_linux.h")
set(RULE_INPUT_ROOT "file_utilities_linux")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_294_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_294_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/file_utilities_linux.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/info_linux.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "info_linux.h")
set(RULE_INPUT_ROOT "info_linux")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_295_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_295_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/info_linux.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/launcher_linux.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "launcher_linux.h")
set(RULE_INPUT_ROOT "launcher_linux")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_296_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_296_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/launcher_linux.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/main_window_linux.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "main_window_linux.h")
set(RULE_INPUT_ROOT "main_window_linux")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_297_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_297_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/main_window_linux.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/notifications_manager_linux.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "notifications_manager_linux.h")
set(RULE_INPUT_ROOT "notifications_manager_linux")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_298_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_298_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/notifications_manager_linux.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/linux/specific_linux.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform/linux")
set(RULE_INPUT_NAME "specific_linux.h")
set(RULE_INPUT_ROOT "specific_linux")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_299_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_299_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/linux/specific_linux.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_audio.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_audio.h")
set(RULE_INPUT_ROOT "platform_audio")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_300_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_300_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_audio.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_file_utilities.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_file_utilities.h")
set(RULE_INPUT_ROOT "platform_file_utilities")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_301_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_301_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_file_utilities.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_info.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_info.h")
set(RULE_INPUT_ROOT "platform_info")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_302_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_302_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_info.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_launcher.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_launcher.h")
set(RULE_INPUT_ROOT "platform_launcher")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_303_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_303_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_launcher.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_main_window.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_main_window.h")
set(RULE_INPUT_ROOT "platform_main_window")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_304_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_304_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_main_window.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_notifications_manager.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_notifications_manager.h")
set(RULE_INPUT_ROOT "platform_notifications_manager")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_305_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_305_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_notifications_manager.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_specific.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_specific.h")
set(RULE_INPUT_ROOT "platform_specific")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_306_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_306_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_specific.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/platform/platform_window_title.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/platform")
set(RULE_INPUT_NAME "platform_window_title.h")
set(RULE_INPUT_ROOT "platform_window_title")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_307_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_307_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/platform/platform_window_title.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/profile/profile_back_button.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/profile")
set(RULE_INPUT_NAME "profile_back_button.h")
set(RULE_INPUT_ROOT "profile_back_button")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_308_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_308_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/profile/profile_back_button.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/profile/profile_block_group_members.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/profile")
set(RULE_INPUT_NAME "profile_block_group_members.h")
set(RULE_INPUT_ROOT "profile_block_group_members")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_309_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_309_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/profile/profile_block_group_members.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/profile/profile_block_peer_list.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/profile")
set(RULE_INPUT_NAME "profile_block_peer_list.h")
set(RULE_INPUT_ROOT "profile_block_peer_list")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_310_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_310_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/profile/profile_block_peer_list.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/profile/profile_block_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/profile")
set(RULE_INPUT_NAME "profile_block_widget.h")
set(RULE_INPUT_ROOT "profile_block_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_311_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_311_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/profile/profile_block_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/profile/profile_cover_drop_area.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/profile")
set(RULE_INPUT_NAME "profile_cover_drop_area.h")
set(RULE_INPUT_ROOT "profile_cover_drop_area")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_312_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_312_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/profile/profile_cover_drop_area.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_advanced.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_advanced.h")
set(RULE_INPUT_ROOT "settings_advanced")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_313_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_313_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_advanced.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_chat.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_chat.h")
set(RULE_INPUT_ROOT "settings_chat")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_314_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_314_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_chat.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_calls.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_calls.h")
set(RULE_INPUT_ROOT "settings_calls")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_315_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_315_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_calls.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_codes.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_codes.h")
set(RULE_INPUT_ROOT "settings_codes")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_316_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_316_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_codes.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_common.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_common.h")
set(RULE_INPUT_ROOT "settings_common")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_317_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_317_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_common.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_information.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_information.h")
set(RULE_INPUT_ROOT "settings_information")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_318_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_318_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_information.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_intro.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_intro.h")
set(RULE_INPUT_ROOT "settings_intro")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_319_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_319_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_intro.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_main.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_main.h")
set(RULE_INPUT_ROOT "settings_main")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_320_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_320_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_main.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_notifications.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_notifications.h")
set(RULE_INPUT_ROOT "settings_notifications")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_321_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_321_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_notifications.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_privacy_controllers.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_privacy_controllers.h")
set(RULE_INPUT_ROOT "settings_privacy_controllers")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_322_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_322_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_privacy_controllers.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings_privacy_security.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings_privacy_security.h")
set(RULE_INPUT_ROOT "settings_privacy_security")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_323_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_323_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings/settings_privacy_security.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/file_download.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "file_download.h")
set(RULE_INPUT_ROOT "file_download")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_324_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_324_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/file_download.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/file_upload.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "file_upload.h")
set(RULE_INPUT_ROOT "file_upload")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_325_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_325_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/file_upload.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/localimageloader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "localimageloader.h")
set(RULE_INPUT_ROOT "localimageloader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_326_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_326_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/localimageloader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/localstorage.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "localstorage.h")
set(RULE_INPUT_ROOT "localstorage")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_327_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_327_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/localstorage.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/serialize_common.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "serialize_common.h")
set(RULE_INPUT_ROOT "serialize_common")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_328_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_328_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/serialize_common.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/serialize_document.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "serialize_document.h")
set(RULE_INPUT_ROOT "serialize_document")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_329_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_329_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/serialize_document.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/storage_facade.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "storage_facade.h")
set(RULE_INPUT_ROOT "storage_facade")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_330_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_330_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/storage_facade.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/storage_media_prepare.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "storage_media_prepare.h")
set(RULE_INPUT_ROOT "storage_media_prepare")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_331_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_331_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/storage_media_prepare.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/storage_shared_media.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "storage_shared_media.h")
set(RULE_INPUT_ROOT "storage_shared_media")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_332_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_332_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/storage_shared_media.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/storage_sparse_ids_list.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "storage_sparse_ids_list.h")
set(RULE_INPUT_ROOT "storage_sparse_ids_list")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_333_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_333_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/storage_sparse_ids_list.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/storage_user_photos.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "storage_user_photos.h")
set(RULE_INPUT_ROOT "storage_user_photos")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_334_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_334_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/storage_user_photos.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/storage/streamed_file_downloader.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/storage")
set(RULE_INPUT_NAME "streamed_file_downloader.h")
set(RULE_INPUT_ROOT "streamed_file_downloader")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_335_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_335_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/storage/streamed_file_downloader.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/support/support_autocomplete.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/support")
set(RULE_INPUT_NAME "support_autocomplete.h")
set(RULE_INPUT_ROOT "support_autocomplete")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_336_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_336_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/support/support_autocomplete.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/support/support_common.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/support")
set(RULE_INPUT_NAME "support_common.h")
set(RULE_INPUT_ROOT "support_common")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_337_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_337_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/support/support_common.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/support/support_helper.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/support")
set(RULE_INPUT_NAME "support_helper.h")
set(RULE_INPUT_ROOT "support_helper")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_338_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_338_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/support/support_helper.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/support/support_templates.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/support")
set(RULE_INPUT_NAME "support_templates.h")
set(RULE_INPUT_ROOT "support_templates")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_339_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_339_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/support/support_templates.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/animations.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "animations.h")
set(RULE_INPUT_ROOT "animations")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_340_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_340_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/animations.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/cross_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "cross_animation.h")
set(RULE_INPUT_ROOT "cross_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_341_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_341_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/cross_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/fade_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "fade_animation.h")
set(RULE_INPUT_ROOT "fade_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_342_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_342_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/fade_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/numbers_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "numbers_animation.h")
set(RULE_INPUT_ROOT "numbers_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_343_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_343_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/numbers_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/panel_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "panel_animation.h")
set(RULE_INPUT_ROOT "panel_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_344_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_344_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/panel_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/radial_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "radial_animation.h")
set(RULE_INPUT_ROOT "radial_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_345_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_345_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/radial_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/ripple_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "ripple_animation.h")
set(RULE_INPUT_ROOT "ripple_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_346_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_346_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/ripple_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/round_checkbox.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "round_checkbox.h")
set(RULE_INPUT_ROOT "round_checkbox")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_347_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_347_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/round_checkbox.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/send_action_animations.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "send_action_animations.h")
set(RULE_INPUT_ROOT "send_action_animations")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_348_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_348_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/send_action_animations.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/effects/slide_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/effects")
set(RULE_INPUT_NAME "slide_animation.h")
set(RULE_INPUT_ROOT "slide_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_349_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_349_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/effects/slide_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/image/image.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/image")
set(RULE_INPUT_NAME "image.h")
set(RULE_INPUT_ROOT "image")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_350_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_350_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/image/image.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/image/image_location.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/image")
set(RULE_INPUT_NAME "image_location.h")
set(RULE_INPUT_ROOT "image_location")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_351_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_351_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/image/image_location.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/image/image_prepare.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/image")
set(RULE_INPUT_NAME "image_prepare.h")
set(RULE_INPUT_ROOT "image_prepare")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_352_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_352_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/image/image_prepare.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/image/image_source.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/image")
set(RULE_INPUT_NAME "image_source.h")
set(RULE_INPUT_ROOT "image_source")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_353_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_353_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/image/image_source.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/style/style_core.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/style")
set(RULE_INPUT_NAME "style_core.h")
set(RULE_INPUT_ROOT "style_core")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_354_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_354_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/style/style_core.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/style/style_core_color.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/style")
set(RULE_INPUT_NAME "style_core_color.h")
set(RULE_INPUT_ROOT "style_core_color")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_355_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_355_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/style/style_core_color.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/style/style_core_font.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/style")
set(RULE_INPUT_NAME "style_core_font.h")
set(RULE_INPUT_ROOT "style_core_font")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_356_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_356_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/style/style_core_font.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/style/style_core_icon.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/style")
set(RULE_INPUT_NAME "style_core_icon.h")
set(RULE_INPUT_ROOT "style_core_icon")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_357_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_357_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/style/style_core_icon.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/style/style_core_types.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/style")
set(RULE_INPUT_NAME "style_core_types.h")
set(RULE_INPUT_ROOT "style_core_types")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_358_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_358_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/style/style_core_types.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/text/text.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/text")
set(RULE_INPUT_NAME "text.h")
set(RULE_INPUT_ROOT "text")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_359_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_359_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/text/text.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/text/text_block.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/text")
set(RULE_INPUT_NAME "text_block.h")
set(RULE_INPUT_ROOT "text_block")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_360_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_360_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/text/text_block.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/text/text_entity.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/text")
set(RULE_INPUT_NAME "text_entity.h")
set(RULE_INPUT_ROOT "text_entity")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_361_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_361_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/text/text_entity.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/text/text_isolated_emoji.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/text")
set(RULE_INPUT_NAME "text_isolated_emoji.h")
set(RULE_INPUT_ROOT "text_isolated_emoji")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_362_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_362_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/text/text_isolated_emoji.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/text/text_utilities.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/text")
set(RULE_INPUT_NAME "text_utilities.h")
set(RULE_INPUT_ROOT "text_utilities")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_363_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_363_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/text/text_utilities.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/toast/toast.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/toast")
set(RULE_INPUT_NAME "toast.h")
set(RULE_INPUT_ROOT "toast")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_364_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_364_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/toast/toast.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/toast/toast_manager.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/toast")
set(RULE_INPUT_NAME "toast_manager.h")
set(RULE_INPUT_ROOT "toast_manager")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_365_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_365_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/toast/toast_manager.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/toast/toast_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/toast")
set(RULE_INPUT_NAME "toast_widget.h")
set(RULE_INPUT_ROOT "toast_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_366_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_366_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/toast/toast_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/buttons.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "buttons.h")
set(RULE_INPUT_ROOT "buttons")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_367_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_367_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/buttons.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/checkbox.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "checkbox.h")
set(RULE_INPUT_ROOT "checkbox")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_368_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_368_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/checkbox.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/continuous_sliders.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "continuous_sliders.h")
set(RULE_INPUT_ROOT "continuous_sliders")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_369_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_369_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/continuous_sliders.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/discrete_sliders.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "discrete_sliders.h")
set(RULE_INPUT_ROOT "discrete_sliders")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_370_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_370_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/discrete_sliders.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/dropdown_menu.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "dropdown_menu.h")
set(RULE_INPUT_ROOT "dropdown_menu")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_371_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_371_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/dropdown_menu.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/inner_dropdown.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "inner_dropdown.h")
set(RULE_INPUT_ROOT "inner_dropdown")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_372_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_372_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/inner_dropdown.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/input_fields.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "input_fields.h")
set(RULE_INPUT_ROOT "input_fields")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_373_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_373_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/input_fields.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/labels.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "labels.h")
set(RULE_INPUT_ROOT "labels")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_374_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_374_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/labels.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/level_meter.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "level_meter.h")
set(RULE_INPUT_ROOT "level_meter")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_375_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_375_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/level_meter.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/menu.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "menu.h")
set(RULE_INPUT_ROOT "menu")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_376_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_376_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/menu.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/multi_select.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "multi_select.h")
set(RULE_INPUT_ROOT "multi_select")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_377_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_377_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/multi_select.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/popup_menu.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "popup_menu.h")
set(RULE_INPUT_ROOT "popup_menu")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_378_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_378_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/popup_menu.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/separate_panel.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "separate_panel.h")
set(RULE_INPUT_ROOT "separate_panel")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_379_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_379_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/separate_panel.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/scroll_area.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "scroll_area.h")
set(RULE_INPUT_ROOT "scroll_area")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_380_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_380_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/scroll_area.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/shadow.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "shadow.h")
set(RULE_INPUT_ROOT "shadow")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_381_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_381_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/shadow.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/tooltip.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "tooltip.h")
set(RULE_INPUT_ROOT "tooltip")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_382_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_382_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/widgets/tooltip.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/wrap/fade_wrap.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/wrap")
set(RULE_INPUT_NAME "fade_wrap.h")
set(RULE_INPUT_ROOT "fade_wrap")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_383_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_383_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/wrap/fade_wrap.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/wrap/padding_wrap.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/wrap")
set(RULE_INPUT_NAME "padding_wrap.h")
set(RULE_INPUT_ROOT "padding_wrap")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_384_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_384_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/wrap/padding_wrap.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/wrap/slide_wrap.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/wrap")
set(RULE_INPUT_NAME "slide_wrap.h")
set(RULE_INPUT_ROOT "slide_wrap")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_385_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_385_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/wrap/slide_wrap.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/wrap/vertical_layout.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/wrap")
set(RULE_INPUT_NAME "vertical_layout.h")
set(RULE_INPUT_ROOT "vertical_layout")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_386_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_386_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/wrap/vertical_layout.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/wrap/wrap.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/wrap")
set(RULE_INPUT_NAME "wrap.h")
set(RULE_INPUT_ROOT "wrap")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_387_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_387_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/wrap/wrap.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/abstract_button.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "abstract_button.h")
set(RULE_INPUT_ROOT "abstract_button")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_388_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_388_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/abstract_button.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "animation.h")
set(RULE_INPUT_ROOT "animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_389_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_389_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/countryinput.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "countryinput.h")
set(RULE_INPUT_ROOT "countryinput")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_390_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_390_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/countryinput.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/emoji_config.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "emoji_config.h")
set(RULE_INPUT_ROOT "emoji_config")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_391_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_391_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/emoji_config.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/empty_userpic.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "empty_userpic.h")
set(RULE_INPUT_ROOT "empty_userpic")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_392_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_392_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/empty_userpic.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/focus_persister.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "focus_persister.h")
set(RULE_INPUT_ROOT "focus_persister")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_393_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_393_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/focus_persister.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/grouped_layout.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "grouped_layout.h")
set(RULE_INPUT_ROOT "grouped_layout")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_394_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_394_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/grouped_layout.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/resize_area.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "resize_area.h")
set(RULE_INPUT_ROOT "resize_area")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_395_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_395_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/resize_area.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/rp_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "rp_widget.h")
set(RULE_INPUT_ROOT "rp_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_396_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_396_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/rp_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/search_field_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "search_field_controller.h")
set(RULE_INPUT_ROOT "search_field_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_397_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_397_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/search_field_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/special_buttons.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "special_buttons.h")
set(RULE_INPUT_ROOT "special_buttons")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_398_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_398_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/special_buttons.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/text_options.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "text_options.h")
set(RULE_INPUT_ROOT "text_options")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_399_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_399_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/text_options.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/twidget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "twidget.h")
set(RULE_INPUT_ROOT "twidget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_400_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_400_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/twidget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/unread_badge.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui")
set(RULE_INPUT_NAME "unread_badge.h")
set(RULE_INPUT_ROOT "unread_badge")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_401_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_401_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/ui/unread_badge.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/layer_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "layer_widget.h")
set(RULE_INPUT_ROOT "layer_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_402_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_402_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/layer_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/main_window.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "main_window.h")
set(RULE_INPUT_ROOT "main_window")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_403_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_403_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/main_window.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/notifications_manager.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "notifications_manager.h")
set(RULE_INPUT_ROOT "notifications_manager")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_404_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_404_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/notifications_manager.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/notifications_manager_default.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "notifications_manager_default.h")
set(RULE_INPUT_ROOT "notifications_manager_default")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_405_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_405_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/notifications_manager_default.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/notifications_utilities.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "notifications_utilities.h")
set(RULE_INPUT_ROOT "notifications_utilities")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_406_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_406_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/notifications_utilities.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/section_memento.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "section_memento.h")
set(RULE_INPUT_ROOT "section_memento")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_407_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_407_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/section_memento.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/section_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "section_widget.h")
set(RULE_INPUT_ROOT "section_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_408_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_408_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/section_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_connecting_widget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_connecting_widget.h")
set(RULE_INPUT_ROOT "window_connecting_widget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_409_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_409_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_connecting_widget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_controller.h")
set(RULE_INPUT_ROOT "window_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_410_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_410_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_history_hider.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_history_hider.h")
set(RULE_INPUT_ROOT "window_history_hider")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_411_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_411_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_history_hider.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_lock_widgets.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_lock_widgets.h")
set(RULE_INPUT_ROOT "window_lock_widgets")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_412_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_412_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_lock_widgets.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_main_menu.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_main_menu.h")
set(RULE_INPUT_ROOT "window_main_menu")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_413_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_413_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_main_menu.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_outdated_bar.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_outdated_bar.h")
set(RULE_INPUT_ROOT "window_outdated_bar")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_414_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_414_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_outdated_bar.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_peer_menu.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_peer_menu.h")
set(RULE_INPUT_ROOT "window_peer_menu")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_415_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_415_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_peer_menu.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_session_controller.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_session_controller.h")
set(RULE_INPUT_ROOT "window_session_controller")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_416_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_416_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_session_controller.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_slide_animation.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_slide_animation.h")
set(RULE_INPUT_ROOT "window_slide_animation")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_417_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_417_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_slide_animation.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_title.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_title.h")
set(RULE_INPUT_ROOT "window_title")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_418_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_418_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_title.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window_top_bar_wrap.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window_top_bar_wrap.h")
set(RULE_INPUT_ROOT "window_top_bar_wrap")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_419_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_419_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/window_top_bar_wrap.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/themes/window_theme.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window/themes")
set(RULE_INPUT_NAME "window_theme.h")
set(RULE_INPUT_ROOT "window_theme")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_420_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_420_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/themes/window_theme.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/themes/window_theme_editor.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window/themes")
set(RULE_INPUT_NAME "window_theme_editor.h")
set(RULE_INPUT_ROOT "window_theme_editor")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_421_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_421_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/themes/window_theme_editor.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/themes/window_theme_editor_block.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window/themes")
set(RULE_INPUT_NAME "window_theme_editor_block.h")
set(RULE_INPUT_ROOT "window_theme_editor_block")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_422_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_422_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/themes/window_theme_editor_block.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/themes/window_theme_preview.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window/themes")
set(RULE_INPUT_NAME "window_theme_preview.h")
set(RULE_INPUT_ROOT "window_theme_preview")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_423_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_423_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/themes/window_theme_preview.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/themes/window_theme_warning.h")
set(RULE_INPUT_DIRNAME "../SourceFiles/window/themes")
set(RULE_INPUT_NAME "window_theme_warning.h")
set(RULE_INPUT_ROOT "window_theme_warning")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_424_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_424_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/window/themes/window_theme_warning.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/apiwrap.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "apiwrap.h")
set(RULE_INPUT_ROOT "apiwrap")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_425_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_425_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/apiwrap.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/app.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "app.h")
set(RULE_INPUT_ROOT "app")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_426_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_426_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/app.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/config.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "config.h")
set(RULE_INPUT_ROOT "config")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_427_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_427_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/config.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/facades.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "facades.h")
set(RULE_INPUT_ROOT "facades")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_428_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_428_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/facades.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/layout.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "layout.h")
set(RULE_INPUT_ROOT "layout")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_429_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_429_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/layout.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/logs.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "logs.h")
set(RULE_INPUT_ROOT "logs")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_430_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_430_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/logs.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mainwidget.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "mainwidget.h")
set(RULE_INPUT_ROOT "mainwidget")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_431_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_431_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mainwidget.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/mainwindow.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "mainwindow.h")
set(RULE_INPUT_ROOT "mainwindow")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_432_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_432_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/mainwindow.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/observer_peer.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "observer_peer.h")
set(RULE_INPUT_ROOT "observer_peer")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_433_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_433_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/observer_peer.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "settings.h")
set(RULE_INPUT_ROOT "settings")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_434_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_434_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/settings.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../ThirdParty/emoji_suggestions/emoji_suggestions.h")
set(RULE_INPUT_DIRNAME "../ThirdParty/emoji_suggestions")
set(RULE_INPUT_NAME "emoji_suggestions.h")
set(RULE_INPUT_ROOT "emoji_suggestions")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_435_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_435_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/ThirdParty/emoji_suggestions/emoji_suggestions.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../ThirdParty/minizip/crypt.h")
set(RULE_INPUT_DIRNAME "../ThirdParty/minizip")
set(RULE_INPUT_NAME "crypt.h")
set(RULE_INPUT_ROOT "crypt")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_436_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_436_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/ThirdParty/minizip/crypt.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../ThirdParty/minizip/ioapi.h")
set(RULE_INPUT_DIRNAME "../ThirdParty/minizip")
set(RULE_INPUT_NAME "ioapi.h")
set(RULE_INPUT_ROOT "ioapi")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_437_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_437_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/ThirdParty/minizip/ioapi.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../ThirdParty/minizip/zip.h")
set(RULE_INPUT_DIRNAME "../ThirdParty/minizip")
set(RULE_INPUT_NAME "zip.h")
set(RULE_INPUT_ROOT "zip")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_438_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_438_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/ThirdParty/minizip/zip.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../ThirdParty/minizip/unzip.h")
set(RULE_INPUT_DIRNAME "../ThirdParty/minizip")
set(RULE_INPUT_NAME "unzip.h")
set(RULE_INPUT_ROOT "unzip")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_439_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_439_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/ThirdParty/minizip/unzip.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/stdafx.h")
set(RULE_INPUT_DIRNAME "../SourceFiles")
set(RULE_INPUT_NAME "stdafx.h")
set(RULE_INPUT_ROOT "stdafx")
set(RULE_INPUT_EXT ".h")
set(Telegram__qt_moc_440_0 "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_moc_440_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/moc
  COMMAND /tdesktop/build/qt/bin/moc --no-notes -DAL_LIBTYPE_STATIC -DAL_ALEXT_PROTOTYPES -DTGVOIP_USE_CXX11_LIB -DXXH_INLINE_ALL "-DTDESKTOP_API_ID=17349" "-DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb" -DNOMINMAX -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_GUI_LIB -DQT_CORE_LIB -D_REENTRANT -DQT_STATICPLUGIN -DQT_PLUGIN -DQ_OS_LINUX64 "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/moc/moc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_moc__input} ../../Telegram/SourceFiles/stdafx.h
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Moc-ing ${RULE_INPUT_ROOT}.h..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
add_custom_target(Telegram__qt_moc DEPENDS
  ${Telegram__qt_moc_0_0}
  ${Telegram__qt_moc_1_0}
  ${Telegram__qt_moc_2_0}
  ${Telegram__qt_moc_3_0}
  ${Telegram__qt_moc_4_0}
  ${Telegram__qt_moc_5_0}
  ${Telegram__qt_moc_6_0}
  ${Telegram__qt_moc_7_0}
  ${Telegram__qt_moc_8_0}
  ${Telegram__qt_moc_9_0}
  ${Telegram__qt_moc_10_0}
  ${Telegram__qt_moc_11_0}
  ${Telegram__qt_moc_12_0}
  ${Telegram__qt_moc_13_0}
  ${Telegram__qt_moc_14_0}
  ${Telegram__qt_moc_15_0}
  ${Telegram__qt_moc_16_0}
  ${Telegram__qt_moc_17_0}
  ${Telegram__qt_moc_18_0}
  ${Telegram__qt_moc_19_0}
  ${Telegram__qt_moc_20_0}
  ${Telegram__qt_moc_21_0}
  ${Telegram__qt_moc_22_0}
  ${Telegram__qt_moc_23_0}
  ${Telegram__qt_moc_24_0}
  ${Telegram__qt_moc_25_0}
  ${Telegram__qt_moc_26_0}
  ${Telegram__qt_moc_27_0}
  ${Telegram__qt_moc_28_0}
  ${Telegram__qt_moc_29_0}
  ${Telegram__qt_moc_30_0}
  ${Telegram__qt_moc_31_0}
  ${Telegram__qt_moc_32_0}
  ${Telegram__qt_moc_33_0}
  ${Telegram__qt_moc_34_0}
  ${Telegram__qt_moc_35_0}
  ${Telegram__qt_moc_36_0}
  ${Telegram__qt_moc_37_0}
  ${Telegram__qt_moc_38_0}
  ${Telegram__qt_moc_39_0}
  ${Telegram__qt_moc_40_0}
  ${Telegram__qt_moc_41_0}
  ${Telegram__qt_moc_42_0}
  ${Telegram__qt_moc_43_0}
  ${Telegram__qt_moc_44_0}
  ${Telegram__qt_moc_45_0}
  ${Telegram__qt_moc_46_0}
  ${Telegram__qt_moc_47_0}
  ${Telegram__qt_moc_48_0}
  ${Telegram__qt_moc_49_0}
  ${Telegram__qt_moc_50_0}
  ${Telegram__qt_moc_51_0}
  ${Telegram__qt_moc_52_0}
  ${Telegram__qt_moc_53_0}
  ${Telegram__qt_moc_54_0}
  ${Telegram__qt_moc_55_0}
  ${Telegram__qt_moc_56_0}
  ${Telegram__qt_moc_57_0}
  ${Telegram__qt_moc_58_0}
  ${Telegram__qt_moc_59_0}
  ${Telegram__qt_moc_60_0}
  ${Telegram__qt_moc_61_0}
  ${Telegram__qt_moc_62_0}
  ${Telegram__qt_moc_63_0}
  ${Telegram__qt_moc_64_0}
  ${Telegram__qt_moc_65_0}
  ${Telegram__qt_moc_66_0}
  ${Telegram__qt_moc_67_0}
  ${Telegram__qt_moc_68_0}
  ${Telegram__qt_moc_69_0}
  ${Telegram__qt_moc_70_0}
  ${Telegram__qt_moc_71_0}
  ${Telegram__qt_moc_72_0}
  ${Telegram__qt_moc_73_0}
  ${Telegram__qt_moc_74_0}
  ${Telegram__qt_moc_75_0}
  ${Telegram__qt_moc_76_0}
  ${Telegram__qt_moc_77_0}
  ${Telegram__qt_moc_78_0}
  ${Telegram__qt_moc_79_0}
  ${Telegram__qt_moc_80_0}
  ${Telegram__qt_moc_81_0}
  ${Telegram__qt_moc_82_0}
  ${Telegram__qt_moc_83_0}
  ${Telegram__qt_moc_84_0}
  ${Telegram__qt_moc_85_0}
  ${Telegram__qt_moc_86_0}
  ${Telegram__qt_moc_87_0}
  ${Telegram__qt_moc_88_0}
  ${Telegram__qt_moc_89_0}
  ${Telegram__qt_moc_90_0}
  ${Telegram__qt_moc_91_0}
  ${Telegram__qt_moc_92_0}
  ${Telegram__qt_moc_93_0}
  ${Telegram__qt_moc_94_0}
  ${Telegram__qt_moc_95_0}
  ${Telegram__qt_moc_96_0}
  ${Telegram__qt_moc_97_0}
  ${Telegram__qt_moc_98_0}
  ${Telegram__qt_moc_99_0}
  ${Telegram__qt_moc_100_0}
  ${Telegram__qt_moc_101_0}
  ${Telegram__qt_moc_102_0}
  ${Telegram__qt_moc_103_0}
  ${Telegram__qt_moc_104_0}
  ${Telegram__qt_moc_105_0}
  ${Telegram__qt_moc_106_0}
  ${Telegram__qt_moc_107_0}
  ${Telegram__qt_moc_108_0}
  ${Telegram__qt_moc_109_0}
  ${Telegram__qt_moc_110_0}
  ${Telegram__qt_moc_111_0}
  ${Telegram__qt_moc_112_0}
  ${Telegram__qt_moc_113_0}
  ${Telegram__qt_moc_114_0}
  ${Telegram__qt_moc_115_0}
  ${Telegram__qt_moc_116_0}
  ${Telegram__qt_moc_117_0}
  ${Telegram__qt_moc_118_0}
  ${Telegram__qt_moc_119_0}
  ${Telegram__qt_moc_120_0}
  ${Telegram__qt_moc_121_0}
  ${Telegram__qt_moc_122_0}
  ${Telegram__qt_moc_123_0}
  ${Telegram__qt_moc_124_0}
  ${Telegram__qt_moc_125_0}
  ${Telegram__qt_moc_126_0}
  ${Telegram__qt_moc_127_0}
  ${Telegram__qt_moc_128_0}
  ${Telegram__qt_moc_129_0}
  ${Telegram__qt_moc_130_0}
  ${Telegram__qt_moc_131_0}
  ${Telegram__qt_moc_132_0}
  ${Telegram__qt_moc_133_0}
  ${Telegram__qt_moc_134_0}
  ${Telegram__qt_moc_135_0}
  ${Telegram__qt_moc_136_0}
  ${Telegram__qt_moc_137_0}
  ${Telegram__qt_moc_138_0}
  ${Telegram__qt_moc_139_0}
  ${Telegram__qt_moc_140_0}
  ${Telegram__qt_moc_141_0}
  ${Telegram__qt_moc_142_0}
  ${Telegram__qt_moc_143_0}
  ${Telegram__qt_moc_144_0}
  ${Telegram__qt_moc_145_0}
  ${Telegram__qt_moc_146_0}
  ${Telegram__qt_moc_147_0}
  ${Telegram__qt_moc_148_0}
  ${Telegram__qt_moc_149_0}
  ${Telegram__qt_moc_150_0}
  ${Telegram__qt_moc_151_0}
  ${Telegram__qt_moc_152_0}
  ${Telegram__qt_moc_153_0}
  ${Telegram__qt_moc_154_0}
  ${Telegram__qt_moc_155_0}
  ${Telegram__qt_moc_156_0}
  ${Telegram__qt_moc_157_0}
  ${Telegram__qt_moc_158_0}
  ${Telegram__qt_moc_159_0}
  ${Telegram__qt_moc_160_0}
  ${Telegram__qt_moc_161_0}
  ${Telegram__qt_moc_162_0}
  ${Telegram__qt_moc_163_0}
  ${Telegram__qt_moc_164_0}
  ${Telegram__qt_moc_165_0}
  ${Telegram__qt_moc_166_0}
  ${Telegram__qt_moc_167_0}
  ${Telegram__qt_moc_168_0}
  ${Telegram__qt_moc_169_0}
  ${Telegram__qt_moc_170_0}
  ${Telegram__qt_moc_171_0}
  ${Telegram__qt_moc_172_0}
  ${Telegram__qt_moc_173_0}
  ${Telegram__qt_moc_174_0}
  ${Telegram__qt_moc_175_0}
  ${Telegram__qt_moc_176_0}
  ${Telegram__qt_moc_177_0}
  ${Telegram__qt_moc_178_0}
  ${Telegram__qt_moc_179_0}
  ${Telegram__qt_moc_180_0}
  ${Telegram__qt_moc_181_0}
  ${Telegram__qt_moc_182_0}
  ${Telegram__qt_moc_183_0}
  ${Telegram__qt_moc_184_0}
  ${Telegram__qt_moc_185_0}
  ${Telegram__qt_moc_186_0}
  ${Telegram__qt_moc_187_0}
  ${Telegram__qt_moc_188_0}
  ${Telegram__qt_moc_189_0}
  ${Telegram__qt_moc_190_0}
  ${Telegram__qt_moc_191_0}
  ${Telegram__qt_moc_192_0}
  ${Telegram__qt_moc_193_0}
  ${Telegram__qt_moc_194_0}
  ${Telegram__qt_moc_195_0}
  ${Telegram__qt_moc_196_0}
  ${Telegram__qt_moc_197_0}
  ${Telegram__qt_moc_198_0}
  ${Telegram__qt_moc_199_0}
  ${Telegram__qt_moc_200_0}
  ${Telegram__qt_moc_201_0}
  ${Telegram__qt_moc_202_0}
  ${Telegram__qt_moc_203_0}
  ${Telegram__qt_moc_204_0}
  ${Telegram__qt_moc_205_0}
  ${Telegram__qt_moc_206_0}
  ${Telegram__qt_moc_207_0}
  ${Telegram__qt_moc_208_0}
  ${Telegram__qt_moc_209_0}
  ${Telegram__qt_moc_210_0}
  ${Telegram__qt_moc_211_0}
  ${Telegram__qt_moc_212_0}
  ${Telegram__qt_moc_213_0}
  ${Telegram__qt_moc_214_0}
  ${Telegram__qt_moc_215_0}
  ${Telegram__qt_moc_216_0}
  ${Telegram__qt_moc_217_0}
  ${Telegram__qt_moc_218_0}
  ${Telegram__qt_moc_219_0}
  ${Telegram__qt_moc_220_0}
  ${Telegram__qt_moc_221_0}
  ${Telegram__qt_moc_222_0}
  ${Telegram__qt_moc_223_0}
  ${Telegram__qt_moc_224_0}
  ${Telegram__qt_moc_225_0}
  ${Telegram__qt_moc_226_0}
  ${Telegram__qt_moc_227_0}
  ${Telegram__qt_moc_228_0}
  ${Telegram__qt_moc_229_0}
  ${Telegram__qt_moc_230_0}
  ${Telegram__qt_moc_231_0}
  ${Telegram__qt_moc_232_0}
  ${Telegram__qt_moc_233_0}
  ${Telegram__qt_moc_234_0}
  ${Telegram__qt_moc_235_0}
  ${Telegram__qt_moc_236_0}
  ${Telegram__qt_moc_237_0}
  ${Telegram__qt_moc_238_0}
  ${Telegram__qt_moc_239_0}
  ${Telegram__qt_moc_240_0}
  ${Telegram__qt_moc_241_0}
  ${Telegram__qt_moc_242_0}
  ${Telegram__qt_moc_243_0}
  ${Telegram__qt_moc_244_0}
  ${Telegram__qt_moc_245_0}
  ${Telegram__qt_moc_246_0}
  ${Telegram__qt_moc_247_0}
  ${Telegram__qt_moc_248_0}
  ${Telegram__qt_moc_249_0}
  ${Telegram__qt_moc_250_0}
  ${Telegram__qt_moc_251_0}
  ${Telegram__qt_moc_252_0}
  ${Telegram__qt_moc_253_0}
  ${Telegram__qt_moc_254_0}
  ${Telegram__qt_moc_255_0}
  ${Telegram__qt_moc_256_0}
  ${Telegram__qt_moc_257_0}
  ${Telegram__qt_moc_258_0}
  ${Telegram__qt_moc_259_0}
  ${Telegram__qt_moc_260_0}
  ${Telegram__qt_moc_261_0}
  ${Telegram__qt_moc_262_0}
  ${Telegram__qt_moc_263_0}
  ${Telegram__qt_moc_264_0}
  ${Telegram__qt_moc_265_0}
  ${Telegram__qt_moc_266_0}
  ${Telegram__qt_moc_267_0}
  ${Telegram__qt_moc_268_0}
  ${Telegram__qt_moc_269_0}
  ${Telegram__qt_moc_270_0}
  ${Telegram__qt_moc_271_0}
  ${Telegram__qt_moc_272_0}
  ${Telegram__qt_moc_273_0}
  ${Telegram__qt_moc_274_0}
  ${Telegram__qt_moc_275_0}
  ${Telegram__qt_moc_276_0}
  ${Telegram__qt_moc_277_0}
  ${Telegram__qt_moc_278_0}
  ${Telegram__qt_moc_279_0}
  ${Telegram__qt_moc_280_0}
  ${Telegram__qt_moc_281_0}
  ${Telegram__qt_moc_282_0}
  ${Telegram__qt_moc_283_0}
  ${Telegram__qt_moc_284_0}
  ${Telegram__qt_moc_285_0}
  ${Telegram__qt_moc_286_0}
  ${Telegram__qt_moc_287_0}
  ${Telegram__qt_moc_288_0}
  ${Telegram__qt_moc_289_0}
  ${Telegram__qt_moc_290_0}
  ${Telegram__qt_moc_291_0}
  ${Telegram__qt_moc_292_0}
  ${Telegram__qt_moc_293_0}
  ${Telegram__qt_moc_294_0}
  ${Telegram__qt_moc_295_0}
  ${Telegram__qt_moc_296_0}
  ${Telegram__qt_moc_297_0}
  ${Telegram__qt_moc_298_0}
  ${Telegram__qt_moc_299_0}
  ${Telegram__qt_moc_300_0}
  ${Telegram__qt_moc_301_0}
  ${Telegram__qt_moc_302_0}
  ${Telegram__qt_moc_303_0}
  ${Telegram__qt_moc_304_0}
  ${Telegram__qt_moc_305_0}
  ${Telegram__qt_moc_306_0}
  ${Telegram__qt_moc_307_0}
  ${Telegram__qt_moc_308_0}
  ${Telegram__qt_moc_309_0}
  ${Telegram__qt_moc_310_0}
  ${Telegram__qt_moc_311_0}
  ${Telegram__qt_moc_312_0}
  ${Telegram__qt_moc_313_0}
  ${Telegram__qt_moc_314_0}
  ${Telegram__qt_moc_315_0}
  ${Telegram__qt_moc_316_0}
  ${Telegram__qt_moc_317_0}
  ${Telegram__qt_moc_318_0}
  ${Telegram__qt_moc_319_0}
  ${Telegram__qt_moc_320_0}
  ${Telegram__qt_moc_321_0}
  ${Telegram__qt_moc_322_0}
  ${Telegram__qt_moc_323_0}
  ${Telegram__qt_moc_324_0}
  ${Telegram__qt_moc_325_0}
  ${Telegram__qt_moc_326_0}
  ${Telegram__qt_moc_327_0}
  ${Telegram__qt_moc_328_0}
  ${Telegram__qt_moc_329_0}
  ${Telegram__qt_moc_330_0}
  ${Telegram__qt_moc_331_0}
  ${Telegram__qt_moc_332_0}
  ${Telegram__qt_moc_333_0}
  ${Telegram__qt_moc_334_0}
  ${Telegram__qt_moc_335_0}
  ${Telegram__qt_moc_336_0}
  ${Telegram__qt_moc_337_0}
  ${Telegram__qt_moc_338_0}
  ${Telegram__qt_moc_339_0}
  ${Telegram__qt_moc_340_0}
  ${Telegram__qt_moc_341_0}
  ${Telegram__qt_moc_342_0}
  ${Telegram__qt_moc_343_0}
  ${Telegram__qt_moc_344_0}
  ${Telegram__qt_moc_345_0}
  ${Telegram__qt_moc_346_0}
  ${Telegram__qt_moc_347_0}
  ${Telegram__qt_moc_348_0}
  ${Telegram__qt_moc_349_0}
  ${Telegram__qt_moc_350_0}
  ${Telegram__qt_moc_351_0}
  ${Telegram__qt_moc_352_0}
  ${Telegram__qt_moc_353_0}
  ${Telegram__qt_moc_354_0}
  ${Telegram__qt_moc_355_0}
  ${Telegram__qt_moc_356_0}
  ${Telegram__qt_moc_357_0}
  ${Telegram__qt_moc_358_0}
  ${Telegram__qt_moc_359_0}
  ${Telegram__qt_moc_360_0}
  ${Telegram__qt_moc_361_0}
  ${Telegram__qt_moc_362_0}
  ${Telegram__qt_moc_363_0}
  ${Telegram__qt_moc_364_0}
  ${Telegram__qt_moc_365_0}
  ${Telegram__qt_moc_366_0}
  ${Telegram__qt_moc_367_0}
  ${Telegram__qt_moc_368_0}
  ${Telegram__qt_moc_369_0}
  ${Telegram__qt_moc_370_0}
  ${Telegram__qt_moc_371_0}
  ${Telegram__qt_moc_372_0}
  ${Telegram__qt_moc_373_0}
  ${Telegram__qt_moc_374_0}
  ${Telegram__qt_moc_375_0}
  ${Telegram__qt_moc_376_0}
  ${Telegram__qt_moc_377_0}
  ${Telegram__qt_moc_378_0}
  ${Telegram__qt_moc_379_0}
  ${Telegram__qt_moc_380_0}
  ${Telegram__qt_moc_381_0}
  ${Telegram__qt_moc_382_0}
  ${Telegram__qt_moc_383_0}
  ${Telegram__qt_moc_384_0}
  ${Telegram__qt_moc_385_0}
  ${Telegram__qt_moc_386_0}
  ${Telegram__qt_moc_387_0}
  ${Telegram__qt_moc_388_0}
  ${Telegram__qt_moc_389_0}
  ${Telegram__qt_moc_390_0}
  ${Telegram__qt_moc_391_0}
  ${Telegram__qt_moc_392_0}
  ${Telegram__qt_moc_393_0}
  ${Telegram__qt_moc_394_0}
  ${Telegram__qt_moc_395_0}
  ${Telegram__qt_moc_396_0}
  ${Telegram__qt_moc_397_0}
  ${Telegram__qt_moc_398_0}
  ${Telegram__qt_moc_399_0}
  ${Telegram__qt_moc_400_0}
  ${Telegram__qt_moc_401_0}
  ${Telegram__qt_moc_402_0}
  ${Telegram__qt_moc_403_0}
  ${Telegram__qt_moc_404_0}
  ${Telegram__qt_moc_405_0}
  ${Telegram__qt_moc_406_0}
  ${Telegram__qt_moc_407_0}
  ${Telegram__qt_moc_408_0}
  ${Telegram__qt_moc_409_0}
  ${Telegram__qt_moc_410_0}
  ${Telegram__qt_moc_411_0}
  ${Telegram__qt_moc_412_0}
  ${Telegram__qt_moc_413_0}
  ${Telegram__qt_moc_414_0}
  ${Telegram__qt_moc_415_0}
  ${Telegram__qt_moc_416_0}
  ${Telegram__qt_moc_417_0}
  ${Telegram__qt_moc_418_0}
  ${Telegram__qt_moc_419_0}
  ${Telegram__qt_moc_420_0}
  ${Telegram__qt_moc_421_0}
  ${Telegram__qt_moc_422_0}
  ${Telegram__qt_moc_423_0}
  ${Telegram__qt_moc_424_0}
  ${Telegram__qt_moc_425_0}
  ${Telegram__qt_moc_426_0}
  ${Telegram__qt_moc_427_0}
  ${Telegram__qt_moc_428_0}
  ${Telegram__qt_moc_429_0}
  ${Telegram__qt_moc_430_0}
  ${Telegram__qt_moc_431_0}
  ${Telegram__qt_moc_432_0}
  ${Telegram__qt_moc_433_0}
  ${Telegram__qt_moc_434_0}
  ${Telegram__qt_moc_435_0}
  ${Telegram__qt_moc_436_0}
  ${Telegram__qt_moc_437_0}
  ${Telegram__qt_moc_438_0}
  ${Telegram__qt_moc_439_0}
  ${Telegram__qt_moc_440_0}
SOURCES ${Telegram__qt_moc__input}
  ../../Telegram/SourceFiles/api/api_sending.h
  ../../Telegram/SourceFiles/api/api_single_message_search.h
  ../../Telegram/SourceFiles/boxes/peers/add_participants_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_contact_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_linked_chat_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_participant_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_participants_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_peer_info_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_peer_type_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_peer_history_visibility_box.h
  ../../Telegram/SourceFiles/boxes/peers/edit_peer_permissions_box.h
  ../../Telegram/SourceFiles/boxes/about_box.h
  ../../Telegram/SourceFiles/boxes/abstract_box.h
  ../../Telegram/SourceFiles/boxes/add_contact_box.h
  ../../Telegram/SourceFiles/boxes/auto_lock_box.h
  ../../Telegram/SourceFiles/boxes/auto_download_box.h
  ../../Telegram/SourceFiles/boxes/background_box.h
  ../../Telegram/SourceFiles/boxes/background_preview_box.h
  ../../Telegram/SourceFiles/boxes/calendar_box.h
  ../../Telegram/SourceFiles/boxes/change_phone_box.h
  ../../Telegram/SourceFiles/boxes/confirm_box.h
  ../../Telegram/SourceFiles/boxes/confirm_phone_box.h
  ../../Telegram/SourceFiles/boxes/connection_box.h
  ../../Telegram/SourceFiles/boxes/create_poll_box.h
  ../../Telegram/SourceFiles/boxes/download_path_box.h
  ../../Telegram/SourceFiles/boxes/edit_caption_box.h
  ../../Telegram/SourceFiles/boxes/edit_color_box.h
  ../../Telegram/SourceFiles/boxes/edit_privacy_box.h
  ../../Telegram/SourceFiles/boxes/generic_box.h
  ../../Telegram/SourceFiles/boxes/language_box.h
  ../../Telegram/SourceFiles/boxes/local_storage_box.h
  ../../Telegram/SourceFiles/boxes/mute_settings_box.h
  ../../Telegram/SourceFiles/boxes/peer_list_box.h
  ../../Telegram/SourceFiles/boxes/peer_list_controllers.h
  ../../Telegram/SourceFiles/boxes/passcode_box.h
  ../../Telegram/SourceFiles/boxes/photo_crop_box.h
  ../../Telegram/SourceFiles/boxes/rate_call_box.h
  ../../Telegram/SourceFiles/boxes/report_box.h
  ../../Telegram/SourceFiles/boxes/self_destruction_box.h
  ../../Telegram/SourceFiles/boxes/send_files_box.h
  ../../Telegram/SourceFiles/boxes/sessions_box.h
  ../../Telegram/SourceFiles/boxes/share_box.h
  ../../Telegram/SourceFiles/boxes/single_choice_box.h
  ../../Telegram/SourceFiles/boxes/sticker_set_box.h
  ../../Telegram/SourceFiles/boxes/stickers_box.h
  ../../Telegram/SourceFiles/boxes/url_auth_box.h
  ../../Telegram/SourceFiles/boxes/username_box.h
  ../../Telegram/SourceFiles/calls/calls_box_controller.h
  ../../Telegram/SourceFiles/calls/calls_call.h
  ../../Telegram/SourceFiles/calls/calls_emoji_fingerprint.h
  ../../Telegram/SourceFiles/calls/calls_instance.h
  ../../Telegram/SourceFiles/calls/calls_panel.h
  ../../Telegram/SourceFiles/calls/calls_top_bar.h
  ../../Telegram/SourceFiles/chat_helpers/bot_keyboard.h
  ../../Telegram/SourceFiles/chat_helpers/emoji_keywords.h
  ../../Telegram/SourceFiles/chat_helpers/emoji_list_widget.h
  ../../Telegram/SourceFiles/chat_helpers/emoji_sets_manager.h
  ../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_helper.h
  ../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_widget.h
  ../../Telegram/SourceFiles/chat_helpers/field_autocomplete.h
  ../../Telegram/SourceFiles/chat_helpers/gifs_list_widget.h
  ../../Telegram/SourceFiles/chat_helpers/message_field.h
  ../../Telegram/SourceFiles/chat_helpers/stickers.h
  ../../Telegram/SourceFiles/chat_helpers/stickers_emoji_pack.h
  ../../Telegram/SourceFiles/chat_helpers/stickers_list_widget.h
  ../../Telegram/SourceFiles/chat_helpers/tabbed_panel.h
  ../../Telegram/SourceFiles/chat_helpers/tabbed_section.h
  ../../Telegram/SourceFiles/chat_helpers/tabbed_selector.h
  ../../Telegram/SourceFiles/core/application.h
  ../../Telegram/SourceFiles/core/changelogs.h
  ../../Telegram/SourceFiles/core/click_handler.h
  ../../Telegram/SourceFiles/core/click_handler_types.h
  ../../Telegram/SourceFiles/core/core_cloud_password.h
  ../../Telegram/SourceFiles/core/crash_report_window.h
  ../../Telegram/SourceFiles/core/crash_reports.h
  ../../Telegram/SourceFiles/core/event_filter.h
  ../../Telegram/SourceFiles/core/file_utilities.h
  ../../Telegram/SourceFiles/core/launcher.h
  ../../Telegram/SourceFiles/core/local_url_handlers.h
  ../../Telegram/SourceFiles/core/main_queue_processor.h
  ../../Telegram/SourceFiles/core/media_active_cache.h
  ../../Telegram/SourceFiles/core/mime_type.h
  ../../Telegram/SourceFiles/core/qt_signal_producer.h
  ../../Telegram/SourceFiles/core/sandbox.h
  ../../Telegram/SourceFiles/core/shortcuts.h
  ../../Telegram/SourceFiles/core/update_checker.h
  ../../Telegram/SourceFiles/core/utils.h
  ../../Telegram/SourceFiles/core/version.h
  ../../Telegram/SourceFiles/data/data_abstract_structure.h
  ../../Telegram/SourceFiles/data/data_auto_download.h
  ../../Telegram/SourceFiles/data/data_chat.h
  ../../Telegram/SourceFiles/data/data_channel.h
  ../../Telegram/SourceFiles/data/data_channel_admins.h
  ../../Telegram/SourceFiles/data/data_countries.h
  ../../Telegram/SourceFiles/data/data_document.h
  ../../Telegram/SourceFiles/data/data_document_good_thumbnail.h
  ../../Telegram/SourceFiles/data/data_drafts.h
  ../../Telegram/SourceFiles/data/data_folder.h
  ../../Telegram/SourceFiles/data/data_file_origin.h
  ../../Telegram/SourceFiles/data/data_flags.h
  ../../Telegram/SourceFiles/data/data_game.h
  ../../Telegram/SourceFiles/data/data_groups.h
  ../../Telegram/SourceFiles/data/data_location.h
  ../../Telegram/SourceFiles/data/data_media_types.h
  ../../Telegram/SourceFiles/data/data_messages.h
  ../../Telegram/SourceFiles/data/data_notify_settings.h
  ../../Telegram/SourceFiles/data/data_peer.h
  ../../Telegram/SourceFiles/data/data_peer_values.h
  ../../Telegram/SourceFiles/data/data_photo.h
  ../../Telegram/SourceFiles/data/data_poll.h
  ../../Telegram/SourceFiles/data/data_pts_waiter.h
  ../../Telegram/SourceFiles/data/data_search_controller.h
  ../../Telegram/SourceFiles/data/data_session.h
  ../../Telegram/SourceFiles/data/data_shared_media.h
  ../../Telegram/SourceFiles/data/data_sparse_ids.h
  ../../Telegram/SourceFiles/data/data_types.h
  ../../Telegram/SourceFiles/data/data_user.h
  ../../Telegram/SourceFiles/data/data_user_photos.h
  ../../Telegram/SourceFiles/data/data_wall_paper.h
  ../../Telegram/SourceFiles/data/data_web_page.h
  ../../Telegram/SourceFiles/dialogs/dialogs_entry.h
  ../../Telegram/SourceFiles/dialogs/dialogs_indexed_list.h
  ../../Telegram/SourceFiles/dialogs/dialogs_inner_widget.h
  ../../Telegram/SourceFiles/dialogs/dialogs_key.h
  ../../Telegram/SourceFiles/dialogs/dialogs_layout.h
  ../../Telegram/SourceFiles/dialogs/dialogs_list.h
  ../../Telegram/SourceFiles/dialogs/dialogs_main_list.h
  ../../Telegram/SourceFiles/dialogs/dialogs_pinned_list.h
  ../../Telegram/SourceFiles/dialogs/dialogs_row.h
  ../../Telegram/SourceFiles/dialogs/dialogs_search_from_controllers.h
  ../../Telegram/SourceFiles/dialogs/dialogs_widget.h
  ../../Telegram/SourceFiles/export/view/export_view_content.h
  ../../Telegram/SourceFiles/export/view/export_view_panel_controller.h
  ../../Telegram/SourceFiles/export/view/export_view_progress.h
  ../../Telegram/SourceFiles/export/view/export_view_settings.h
  ../../Telegram/SourceFiles/export/view/export_view_top_bar.h
  ../../Telegram/SourceFiles/history/admin_log/history_admin_log_filter.h
  ../../Telegram/SourceFiles/history/admin_log/history_admin_log_inner.h
  ../../Telegram/SourceFiles/history/admin_log/history_admin_log_item.h
  ../../Telegram/SourceFiles/history/admin_log/history_admin_log_section.h
  ../../Telegram/SourceFiles/history/view/media/history_view_call.h
  ../../Telegram/SourceFiles/history/view/media/history_view_contact.h
  ../../Telegram/SourceFiles/history/view/media/history_view_document.h
  ../../Telegram/SourceFiles/history/view/media/history_view_file.h
  ../../Telegram/SourceFiles/history/view/media/history_view_game.h
  ../../Telegram/SourceFiles/history/view/media/history_view_gif.h
  ../../Telegram/SourceFiles/history/view/media/history_view_invoice.h
  ../../Telegram/SourceFiles/history/view/media/history_view_large_emoji.h
  ../../Telegram/SourceFiles/history/view/media/history_view_location.h
  ../../Telegram/SourceFiles/history/view/media/history_view_media.h
  ../../Telegram/SourceFiles/history/view/media/history_view_media_common.h
  ../../Telegram/SourceFiles/history/view/media/history_view_media_grouped.h
  ../../Telegram/SourceFiles/history/view/media/history_view_media_unwrapped.h
  ../../Telegram/SourceFiles/history/view/media/history_view_photo.h
  ../../Telegram/SourceFiles/history/view/media/history_view_poll.h
  ../../Telegram/SourceFiles/history/view/media/history_view_sticker.h
  ../../Telegram/SourceFiles/history/view/media/history_view_video.h
  ../../Telegram/SourceFiles/history/view/media/history_view_wall_paper.h
  ../../Telegram/SourceFiles/history/view/media/history_view_web_page.h
  ../../Telegram/SourceFiles/history/view/history_view_contact_status.h
  ../../Telegram/SourceFiles/history/view/history_view_context_menu.h
  ../../Telegram/SourceFiles/history/view/history_view_cursor_state.h
  ../../Telegram/SourceFiles/history/view/history_view_element.h
  ../../Telegram/SourceFiles/history/view/history_view_list_widget.h
  ../../Telegram/SourceFiles/history/view/history_view_message.h
  ../../Telegram/SourceFiles/history/view/history_view_object.h
  ../../Telegram/SourceFiles/history/view/history_view_service_message.h
  ../../Telegram/SourceFiles/history/view/history_view_top_bar_widget.h
  ../../Telegram/SourceFiles/history/history.h
  ../../Telegram/SourceFiles/history/history_drag_area.h
  ../../Telegram/SourceFiles/history/history_item.h
  ../../Telegram/SourceFiles/history/history_item_components.h
  ../../Telegram/SourceFiles/history/history_item_text.h
  ../../Telegram/SourceFiles/history/history_inner_widget.h
  ../../Telegram/SourceFiles/history/history_location_manager.h
  ../../Telegram/SourceFiles/history/history_message.h
  ../../Telegram/SourceFiles/history/history_service.h
  ../../Telegram/SourceFiles/history/history_widget.h
  ../../Telegram/SourceFiles/info/info_content_widget.h
  ../../Telegram/SourceFiles/info/info_controller.h
  ../../Telegram/SourceFiles/info/info_layer_widget.h
  ../../Telegram/SourceFiles/info/info_memento.h
  ../../Telegram/SourceFiles/info/info_section_widget.h
  ../../Telegram/SourceFiles/info/info_top_bar.h
  ../../Telegram/SourceFiles/info/info_wrap_widget.h
  ../../Telegram/SourceFiles/info/common_groups/info_common_groups_inner_widget.h
  ../../Telegram/SourceFiles/info/common_groups/info_common_groups_widget.h
  ../../Telegram/SourceFiles/info/media/info_media_buttons.h
  ../../Telegram/SourceFiles/info/media/info_media_empty_widget.h
  ../../Telegram/SourceFiles/info/media/info_media_inner_widget.h
  ../../Telegram/SourceFiles/info/media/info_media_list_widget.h
  ../../Telegram/SourceFiles/info/media/info_media_widget.h
  ../../Telegram/SourceFiles/info/members/info_members_widget.h
  ../../Telegram/SourceFiles/info/profile/info_profile_actions.h
  ../../Telegram/SourceFiles/info/profile/info_profile_button.h
  ../../Telegram/SourceFiles/info/profile/info_profile_cover.h
  ../../Telegram/SourceFiles/info/profile/info_profile_icon.h
  ../../Telegram/SourceFiles/info/profile/info_profile_inner_widget.h
  ../../Telegram/SourceFiles/info/profile/info_profile_members.h
  ../../Telegram/SourceFiles/info/profile/info_profile_members_controllers.h
  ../../Telegram/SourceFiles/info/profile/info_profile_text.h
  ../../Telegram/SourceFiles/info/profile/info_profile_values.h
  ../../Telegram/SourceFiles/info/profile/info_profile_widget.h
  ../../Telegram/SourceFiles/info/settings/info_settings_widget.h
  ../../Telegram/SourceFiles/inline_bots/inline_bot_layout_internal.h
  ../../Telegram/SourceFiles/inline_bots/inline_bot_layout_item.h
  ../../Telegram/SourceFiles/inline_bots/inline_bot_result.h
  ../../Telegram/SourceFiles/inline_bots/inline_bot_send_data.h
  ../../Telegram/SourceFiles/inline_bots/inline_results_widget.h
  ../../Telegram/SourceFiles/intro/introwidget.h
  ../../Telegram/SourceFiles/intro/introcode.h
  ../../Telegram/SourceFiles/intro/introphone.h
  ../../Telegram/SourceFiles/intro/intropwdcheck.h
  ../../Telegram/SourceFiles/intro/introsignup.h
  ../../Telegram/SourceFiles/intro/introstart.h
  ../../Telegram/SourceFiles/lang/lang_cloud_manager.h
  ../../Telegram/SourceFiles/lang/lang_file_parser.h
  ../../Telegram/SourceFiles/lang/lang_hardcoded.h
  ../../Telegram/SourceFiles/lang/lang_instance.h
  ../../Telegram/SourceFiles/lang/lang_keys.h
  ../../Telegram/SourceFiles/lang/lang_tag.h
  ../../Telegram/SourceFiles/lang/lang_translator.h
  ../../Telegram/SourceFiles/lang/lang_values.h
  ../../Telegram/SourceFiles/main/main_account.h
  ../../Telegram/SourceFiles/main/main_app_config.h
  ../../Telegram/SourceFiles/main/main_session.h
  ../../Telegram/SourceFiles/media/audio/media_audio.h
  ../../Telegram/SourceFiles/media/audio/media_audio_capture.h
  ../../Telegram/SourceFiles/media/audio/media_audio_ffmpeg_loader.h
  ../../Telegram/SourceFiles/media/audio/media_audio_loader.h
  ../../Telegram/SourceFiles/media/audio/media_audio_loaders.h
  ../../Telegram/SourceFiles/media/audio/media_audio_track.h
  ../../Telegram/SourceFiles/media/audio/media_child_ffmpeg_loader.h
  ../../Telegram/SourceFiles/media/clip/media_clip_check_streaming.h
  ../../Telegram/SourceFiles/media/clip/media_clip_ffmpeg.h
  ../../Telegram/SourceFiles/media/clip/media_clip_implementation.h
  ../../Telegram/SourceFiles/media/clip/media_clip_reader.h
  ../../Telegram/SourceFiles/media/player/media_player_button.h
  ../../Telegram/SourceFiles/media/player/media_player_float.h
  ../../Telegram/SourceFiles/media/player/media_player_instance.h
  ../../Telegram/SourceFiles/media/player/media_player_panel.h
  ../../Telegram/SourceFiles/media/player/media_player_volume_controller.h
  ../../Telegram/SourceFiles/media/player/media_player_widget.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_audio_track.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_common.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_file.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_file_delegate.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_loader.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_loader_local.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_loader_mtproto.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_player.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_reader.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_utility.h
  ../../Telegram/SourceFiles/media/streaming/media_streaming_video_track.h
  ../../Telegram/SourceFiles/media/view/media_view_playback_controls.h
  ../../Telegram/SourceFiles/media/view/media_view_playback_progress.h
  ../../Telegram/SourceFiles/media/view/media_view_group_thumbs.h
  ../../Telegram/SourceFiles/media/view/media_view_overlay_widget.h
  ../../Telegram/SourceFiles/mtproto/auth_key.h
  ../../Telegram/SourceFiles/mtproto/concurrent_sender.h
  ../../Telegram/SourceFiles/mtproto/config_loader.h
  ../../Telegram/SourceFiles/mtproto/connection.h
  ../../Telegram/SourceFiles/mtproto/connection_abstract.h
  ../../Telegram/SourceFiles/mtproto/connection_http.h
  ../../Telegram/SourceFiles/mtproto/connection_resolving.h
  ../../Telegram/SourceFiles/mtproto/connection_tcp.h
  ../../Telegram/SourceFiles/mtproto/core_types.h
  ../../Telegram/SourceFiles/mtproto/dcenter.h
  ../../Telegram/SourceFiles/mtproto/dc_options.h
  ../../Telegram/SourceFiles/mtproto/dedicated_file_loader.h
  ../../Telegram/SourceFiles/mtproto/facade.h
  ../../Telegram/SourceFiles/mtproto/mtp_instance.h
  ../../Telegram/SourceFiles/mtproto/rsa_public_key.h
  ../../Telegram/SourceFiles/mtproto/rpc_sender.h
  ../../Telegram/SourceFiles/mtproto/sender.h
  ../../Telegram/SourceFiles/mtproto/session.h
  ../../Telegram/SourceFiles/mtproto/special_config_request.h
  ../../Telegram/SourceFiles/mtproto/type_utils.h
  ../../Telegram/SourceFiles/overview/overview_layout.h
  ../../Telegram/SourceFiles/passport/passport_encryption.h
  ../../Telegram/SourceFiles/passport/passport_form_controller.h
  ../../Telegram/SourceFiles/passport/passport_form_view_controller.h
  ../../Telegram/SourceFiles/passport/passport_panel.h
  ../../Telegram/SourceFiles/passport/passport_panel_controller.h
  ../../Telegram/SourceFiles/passport/passport_panel_details_row.h
  ../../Telegram/SourceFiles/passport/passport_panel_edit_contact.h
  ../../Telegram/SourceFiles/passport/passport_panel_edit_document.h
  ../../Telegram/SourceFiles/passport/passport_panel_edit_scans.h
  ../../Telegram/SourceFiles/passport/passport_panel_form.h
  ../../Telegram/SourceFiles/passport/passport_panel_password.h
  ../../Telegram/SourceFiles/platform/linux/linux_desktop_environment.h
  ../../Telegram/SourceFiles/platform/linux/linux_gdk_helper.h
  ../../Telegram/SourceFiles/platform/linux/linux_libnotify.h
  ../../Telegram/SourceFiles/platform/linux/linux_libs.h
  ../../Telegram/SourceFiles/platform/linux/file_utilities_linux.h
  ../../Telegram/SourceFiles/platform/linux/info_linux.h
  ../../Telegram/SourceFiles/platform/linux/launcher_linux.h
  ../../Telegram/SourceFiles/platform/linux/main_window_linux.h
  ../../Telegram/SourceFiles/platform/linux/notifications_manager_linux.h
  ../../Telegram/SourceFiles/platform/linux/specific_linux.h
  ../../Telegram/SourceFiles/platform/platform_audio.h
  ../../Telegram/SourceFiles/platform/platform_file_utilities.h
  ../../Telegram/SourceFiles/platform/platform_info.h
  ../../Telegram/SourceFiles/platform/platform_launcher.h
  ../../Telegram/SourceFiles/platform/platform_main_window.h
  ../../Telegram/SourceFiles/platform/platform_notifications_manager.h
  ../../Telegram/SourceFiles/platform/platform_specific.h
  ../../Telegram/SourceFiles/platform/platform_window_title.h
  ../../Telegram/SourceFiles/profile/profile_back_button.h
  ../../Telegram/SourceFiles/profile/profile_block_group_members.h
  ../../Telegram/SourceFiles/profile/profile_block_peer_list.h
  ../../Telegram/SourceFiles/profile/profile_block_widget.h
  ../../Telegram/SourceFiles/profile/profile_cover_drop_area.h
  ../../Telegram/SourceFiles/settings/settings_advanced.h
  ../../Telegram/SourceFiles/settings/settings_chat.h
  ../../Telegram/SourceFiles/settings/settings_calls.h
  ../../Telegram/SourceFiles/settings/settings_codes.h
  ../../Telegram/SourceFiles/settings/settings_common.h
  ../../Telegram/SourceFiles/settings/settings_information.h
  ../../Telegram/SourceFiles/settings/settings_intro.h
  ../../Telegram/SourceFiles/settings/settings_main.h
  ../../Telegram/SourceFiles/settings/settings_notifications.h
  ../../Telegram/SourceFiles/settings/settings_privacy_controllers.h
  ../../Telegram/SourceFiles/settings/settings_privacy_security.h
  ../../Telegram/SourceFiles/storage/file_download.h
  ../../Telegram/SourceFiles/storage/file_upload.h
  ../../Telegram/SourceFiles/storage/localimageloader.h
  ../../Telegram/SourceFiles/storage/localstorage.h
  ../../Telegram/SourceFiles/storage/serialize_common.h
  ../../Telegram/SourceFiles/storage/serialize_document.h
  ../../Telegram/SourceFiles/storage/storage_facade.h
  ../../Telegram/SourceFiles/storage/storage_media_prepare.h
  ../../Telegram/SourceFiles/storage/storage_shared_media.h
  ../../Telegram/SourceFiles/storage/storage_sparse_ids_list.h
  ../../Telegram/SourceFiles/storage/storage_user_photos.h
  ../../Telegram/SourceFiles/storage/streamed_file_downloader.h
  ../../Telegram/SourceFiles/support/support_autocomplete.h
  ../../Telegram/SourceFiles/support/support_common.h
  ../../Telegram/SourceFiles/support/support_helper.h
  ../../Telegram/SourceFiles/support/support_templates.h
  ../../Telegram/SourceFiles/ui/effects/animations.h
  ../../Telegram/SourceFiles/ui/effects/cross_animation.h
  ../../Telegram/SourceFiles/ui/effects/fade_animation.h
  ../../Telegram/SourceFiles/ui/effects/numbers_animation.h
  ../../Telegram/SourceFiles/ui/effects/panel_animation.h
  ../../Telegram/SourceFiles/ui/effects/radial_animation.h
  ../../Telegram/SourceFiles/ui/effects/ripple_animation.h
  ../../Telegram/SourceFiles/ui/effects/round_checkbox.h
  ../../Telegram/SourceFiles/ui/effects/send_action_animations.h
  ../../Telegram/SourceFiles/ui/effects/slide_animation.h
  ../../Telegram/SourceFiles/ui/image/image.h
  ../../Telegram/SourceFiles/ui/image/image_location.h
  ../../Telegram/SourceFiles/ui/image/image_prepare.h
  ../../Telegram/SourceFiles/ui/image/image_source.h
  ../../Telegram/SourceFiles/ui/style/style_core.h
  ../../Telegram/SourceFiles/ui/style/style_core_color.h
  ../../Telegram/SourceFiles/ui/style/style_core_font.h
  ../../Telegram/SourceFiles/ui/style/style_core_icon.h
  ../../Telegram/SourceFiles/ui/style/style_core_types.h
  ../../Telegram/SourceFiles/ui/text/text.h
  ../../Telegram/SourceFiles/ui/text/text_block.h
  ../../Telegram/SourceFiles/ui/text/text_entity.h
  ../../Telegram/SourceFiles/ui/text/text_isolated_emoji.h
  ../../Telegram/SourceFiles/ui/text/text_utilities.h
  ../../Telegram/SourceFiles/ui/toast/toast.h
  ../../Telegram/SourceFiles/ui/toast/toast_manager.h
  ../../Telegram/SourceFiles/ui/toast/toast_widget.h
  ../../Telegram/SourceFiles/ui/widgets/buttons.h
  ../../Telegram/SourceFiles/ui/widgets/checkbox.h
  ../../Telegram/SourceFiles/ui/widgets/continuous_sliders.h
  ../../Telegram/SourceFiles/ui/widgets/discrete_sliders.h
  ../../Telegram/SourceFiles/ui/widgets/dropdown_menu.h
  ../../Telegram/SourceFiles/ui/widgets/inner_dropdown.h
  ../../Telegram/SourceFiles/ui/widgets/input_fields.h
  ../../Telegram/SourceFiles/ui/widgets/labels.h
  ../../Telegram/SourceFiles/ui/widgets/level_meter.h
  ../../Telegram/SourceFiles/ui/widgets/menu.h
  ../../Telegram/SourceFiles/ui/widgets/multi_select.h
  ../../Telegram/SourceFiles/ui/widgets/popup_menu.h
  ../../Telegram/SourceFiles/ui/widgets/separate_panel.h
  ../../Telegram/SourceFiles/ui/widgets/scroll_area.h
  ../../Telegram/SourceFiles/ui/widgets/shadow.h
  ../../Telegram/SourceFiles/ui/widgets/tooltip.h
  ../../Telegram/SourceFiles/ui/wrap/fade_wrap.h
  ../../Telegram/SourceFiles/ui/wrap/padding_wrap.h
  ../../Telegram/SourceFiles/ui/wrap/slide_wrap.h
  ../../Telegram/SourceFiles/ui/wrap/vertical_layout.h
  ../../Telegram/SourceFiles/ui/wrap/wrap.h
  ../../Telegram/SourceFiles/ui/abstract_button.h
  ../../Telegram/SourceFiles/ui/animation.h
  ../../Telegram/SourceFiles/ui/countryinput.h
  ../../Telegram/SourceFiles/ui/emoji_config.h
  ../../Telegram/SourceFiles/ui/empty_userpic.h
  ../../Telegram/SourceFiles/ui/focus_persister.h
  ../../Telegram/SourceFiles/ui/grouped_layout.h
  ../../Telegram/SourceFiles/ui/resize_area.h
  ../../Telegram/SourceFiles/ui/rp_widget.h
  ../../Telegram/SourceFiles/ui/search_field_controller.h
  ../../Telegram/SourceFiles/ui/special_buttons.h
  ../../Telegram/SourceFiles/ui/text_options.h
  ../../Telegram/SourceFiles/ui/twidget.h
  ../../Telegram/SourceFiles/ui/unread_badge.h
  ../../Telegram/SourceFiles/window/layer_widget.h
  ../../Telegram/SourceFiles/window/main_window.h
  ../../Telegram/SourceFiles/window/notifications_manager.h
  ../../Telegram/SourceFiles/window/notifications_manager_default.h
  ../../Telegram/SourceFiles/window/notifications_utilities.h
  ../../Telegram/SourceFiles/window/section_memento.h
  ../../Telegram/SourceFiles/window/section_widget.h
  ../../Telegram/SourceFiles/window/window_connecting_widget.h
  ../../Telegram/SourceFiles/window/window_controller.h
  ../../Telegram/SourceFiles/window/window_history_hider.h
  ../../Telegram/SourceFiles/window/window_lock_widgets.h
  ../../Telegram/SourceFiles/window/window_main_menu.h
  ../../Telegram/SourceFiles/window/window_outdated_bar.h
  ../../Telegram/SourceFiles/window/window_peer_menu.h
  ../../Telegram/SourceFiles/window/window_session_controller.h
  ../../Telegram/SourceFiles/window/window_slide_animation.h
  ../../Telegram/SourceFiles/window/window_title.h
  ../../Telegram/SourceFiles/window/window_top_bar_wrap.h
  ../../Telegram/SourceFiles/window/themes/window_theme.h
  ../../Telegram/SourceFiles/window/themes/window_theme_editor.h
  ../../Telegram/SourceFiles/window/themes/window_theme_editor_block.h
  ../../Telegram/SourceFiles/window/themes/window_theme_preview.h
  ../../Telegram/SourceFiles/window/themes/window_theme_warning.h
  ../../Telegram/SourceFiles/apiwrap.h
  ../../Telegram/SourceFiles/app.h
  ../../Telegram/SourceFiles/config.h
  ../../Telegram/SourceFiles/facades.h
  ../../Telegram/SourceFiles/layout.h
  ../../Telegram/SourceFiles/logs.h
  ../../Telegram/SourceFiles/mainwidget.h
  ../../Telegram/SourceFiles/mainwindow.h
  ../../Telegram/SourceFiles/observer_peer.h
  ../../Telegram/SourceFiles/settings.h
  ../../Telegram/ThirdParty/emoji_suggestions/emoji_suggestions.h
  ../../Telegram/ThirdParty/minizip/crypt.h
  ../../Telegram/ThirdParty/minizip/ioapi.h
  ../../Telegram/ThirdParty/minizip/zip.h
  ../../Telegram/ThirdParty/minizip/unzip.h
  ../../Telegram/SourceFiles/stdafx.h
)
set(Telegram__qt_rcc__input "${obj}/gen/update_dependent_qrc.timestamp")
set(RULE_INPUT_PATH "../Resources/qrc/telegram.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram.qrc")
set(RULE_INPUT_ROOT "telegram")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_0_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_0_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_emoji_1.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_emoji_1.qrc")
set(RULE_INPUT_ROOT "telegram_emoji_1")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_1_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_1_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_emoji_1.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_emoji_2.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_emoji_2.qrc")
set(RULE_INPUT_ROOT "telegram_emoji_2")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_2_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_2_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_emoji_2.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_emoji_3.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_emoji_3.qrc")
set(RULE_INPUT_ROOT "telegram_emoji_3")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_3_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_3_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_emoji_3.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_emoji_4.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_emoji_4.qrc")
set(RULE_INPUT_ROOT "telegram_emoji_4")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_4_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_4_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_emoji_4.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_emoji_5.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_emoji_5.qrc")
set(RULE_INPUT_ROOT "telegram_emoji_5")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_5_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_5_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_emoji_5.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_emoji_preview.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_emoji_preview.qrc")
set(RULE_INPUT_ROOT "telegram_emoji_preview")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_6_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_6_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_emoji_preview.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_sounds.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_sounds.qrc")
set(RULE_INPUT_ROOT "telegram_sounds")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_7_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_7_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_sounds.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../Resources/qrc/telegram_linux.qrc")
set(RULE_INPUT_DIRNAME "../Resources/qrc")
set(RULE_INPUT_NAME "telegram_linux.qrc")
set(RULE_INPUT_ROOT "telegram_linux")
set(RULE_INPUT_EXT ".qrc")
set(Telegram__qt_rcc_8_0 "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__qt_rcc_8_0}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/Telegram/qrc
  COMMAND /tdesktop/build/qt/bin/rcc -name "${RULE_INPUT_ROOT}" -no-compress "${RULE_INPUT_PATH}" -o "${obj}/gen/Telegram/qrc/qrc_${RULE_INPUT_ROOT}.cpp"
  DEPENDS ${Telegram__qt_rcc__input} ../../Telegram/Resources/qrc/telegram_linux.qrc
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT Rcc-ing ${RULE_INPUT_ROOT}.qrc..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
add_custom_target(Telegram__qt_rcc DEPENDS
  ${Telegram__qt_rcc_0_0}
  ${Telegram__qt_rcc_1_0}
  ${Telegram__qt_rcc_2_0}
  ${Telegram__qt_rcc_3_0}
  ${Telegram__qt_rcc_4_0}
  ${Telegram__qt_rcc_5_0}
  ${Telegram__qt_rcc_6_0}
  ${Telegram__qt_rcc_7_0}
  ${Telegram__qt_rcc_8_0}
SOURCES ${Telegram__qt_rcc__input}
  ../../Telegram/Resources/qrc/telegram.qrc
  ../../Telegram/Resources/qrc/telegram_emoji_1.qrc
  ../../Telegram/Resources/qrc/telegram_emoji_2.qrc
  ../../Telegram/Resources/qrc/telegram_emoji_3.qrc
  ../../Telegram/Resources/qrc/telegram_emoji_4.qrc
  ../../Telegram/Resources/qrc/telegram_emoji_5.qrc
  ../../Telegram/Resources/qrc/telegram_emoji_preview.qrc
  ../../Telegram/Resources/qrc/telegram_sounds.qrc
  ../../Telegram/Resources/qrc/telegram_linux.qrc
)
list(APPEND Telegram__codegen_style__input
  "${builddir}/codegen_style"
  "${obj}/gen/update_dependent_styles.timestamp")
set(RULE_INPUT_PATH "../Resources/basic.style")
set(RULE_INPUT_DIRNAME "../Resources")
set(RULE_INPUT_NAME "basic.style")
set(RULE_INPUT_ROOT "basic")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_0_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_0_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_0_0}
  ${Telegram__codegen_style_0_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/Resources/basic.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/boxes/boxes.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/boxes")
set(RULE_INPUT_NAME "boxes.style")
set(RULE_INPUT_ROOT "boxes")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_1_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_1_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_1_0}
  ${Telegram__codegen_style_1_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/boxes/boxes.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/calls/calls.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/calls")
set(RULE_INPUT_NAME "calls.style")
set(RULE_INPUT_ROOT "calls")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_2_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_2_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_2_0}
  ${Telegram__codegen_style_2_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/calls/calls.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/dialogs/dialogs.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/dialogs")
set(RULE_INPUT_NAME "dialogs.style")
set(RULE_INPUT_ROOT "dialogs")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_3_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_3_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_3_0}
  ${Telegram__codegen_style_3_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/dialogs/dialogs.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/export/view/export.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/export/view")
set(RULE_INPUT_NAME "export.style")
set(RULE_INPUT_ROOT "export")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_4_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_4_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_4_0}
  ${Telegram__codegen_style_4_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/export/view/export.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/history/history.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/history")
set(RULE_INPUT_NAME "history.style")
set(RULE_INPUT_ROOT "history")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_5_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_5_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_5_0}
  ${Telegram__codegen_style_5_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/history/history.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/info/info.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/info")
set(RULE_INPUT_NAME "info.style")
set(RULE_INPUT_ROOT "info")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_6_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_6_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_6_0}
  ${Telegram__codegen_style_6_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/info/info.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/intro/intro.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/intro")
set(RULE_INPUT_NAME "intro.style")
set(RULE_INPUT_ROOT "intro")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_7_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_7_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_7_0}
  ${Telegram__codegen_style_7_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/intro/intro.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/view/mediaview.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/view")
set(RULE_INPUT_NAME "mediaview.style")
set(RULE_INPUT_ROOT "mediaview")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_8_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_8_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_8_0}
  ${Telegram__codegen_style_8_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/media/view/mediaview.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/media/player/media_player.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/media/player")
set(RULE_INPUT_NAME "media_player.style")
set(RULE_INPUT_ROOT "media_player")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_9_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_9_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_9_0}
  ${Telegram__codegen_style_9_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/media/player/media_player.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/overview/overview.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/overview")
set(RULE_INPUT_NAME "overview.style")
set(RULE_INPUT_ROOT "overview")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_10_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_10_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_10_0}
  ${Telegram__codegen_style_10_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/overview/overview.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/passport/passport.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/passport")
set(RULE_INPUT_NAME "passport.style")
set(RULE_INPUT_ROOT "passport")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_11_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_11_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_11_0}
  ${Telegram__codegen_style_11_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/passport/passport.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/profile/profile.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/profile")
set(RULE_INPUT_NAME "profile.style")
set(RULE_INPUT_ROOT "profile")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_12_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_12_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_12_0}
  ${Telegram__codegen_style_12_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/profile/profile.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/settings/settings.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/settings")
set(RULE_INPUT_NAME "settings.style")
set(RULE_INPUT_ROOT "settings")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_13_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_13_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_13_0}
  ${Telegram__codegen_style_13_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/settings/settings.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/chat_helpers/chat_helpers.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/chat_helpers")
set(RULE_INPUT_NAME "chat_helpers.style")
set(RULE_INPUT_ROOT "chat_helpers")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_14_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_14_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_14_0}
  ${Telegram__codegen_style_14_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/chat_helpers/chat_helpers.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/ui/widgets/widgets.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/ui/widgets")
set(RULE_INPUT_NAME "widgets.style")
set(RULE_INPUT_ROOT "widgets")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_15_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_15_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_15_0}
  ${Telegram__codegen_style_15_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/ui/widgets/widgets.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
set(RULE_INPUT_PATH "../SourceFiles/window/window.style")
set(RULE_INPUT_DIRNAME "../SourceFiles/window")
set(RULE_INPUT_NAME "window.style")
set(RULE_INPUT_ROOT "window")
set(RULE_INPUT_EXT ".style")
set(Telegram__codegen_style_16_0 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.h")
set(Telegram__codegen_style_16_1 "${obj}/gen/styles/style_${RULE_INPUT_ROOT}.cpp")
add_custom_command(OUTPUT
  ${Telegram__codegen_style_16_0}
  ${Telegram__codegen_style_16_1}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${obj}/gen/styles
  COMMAND "${builddir}/codegen_style" -I ../Resources -I ../SourceFiles -o "${obj}/gen/styles" -w "${builddir}/.." "${RULE_INPUT_DIRNAME}/${RULE_INPUT_ROOT}${RULE_INPUT_EXT}"
  DEPENDS ${Telegram__codegen_style__input} ../../Telegram/SourceFiles/window/window.style
  WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/
  COMMENT codegen_style-ing ${RULE_INPUT_ROOT}.style..
  VERBATIM
)
unset(RULE_INPUT_PATH)
unset(RULE_INPUT_DIRNAME)
unset(RULE_INPUT_NAME)
unset(RULE_INPUT_ROOT)
unset(RULE_INPUT_EXT)
add_custom_target(Telegram__codegen_style DEPENDS
  ${Telegram__codegen_style_0_0}
  ${Telegram__codegen_style_0_1}
  ${Telegram__codegen_style_1_0}
  ${Telegram__codegen_style_1_1}
  ${Telegram__codegen_style_2_0}
  ${Telegram__codegen_style_2_1}
  ${Telegram__codegen_style_3_0}
  ${Telegram__codegen_style_3_1}
  ${Telegram__codegen_style_4_0}
  ${Telegram__codegen_style_4_1}
  ${Telegram__codegen_style_5_0}
  ${Telegram__codegen_style_5_1}
  ${Telegram__codegen_style_6_0}
  ${Telegram__codegen_style_6_1}
  ${Telegram__codegen_style_7_0}
  ${Telegram__codegen_style_7_1}
  ${Telegram__codegen_style_8_0}
  ${Telegram__codegen_style_8_1}
  ${Telegram__codegen_style_9_0}
  ${Telegram__codegen_style_9_1}
  ${Telegram__codegen_style_10_0}
  ${Telegram__codegen_style_10_1}
  ${Telegram__codegen_style_11_0}
  ${Telegram__codegen_style_11_1}
  ${Telegram__codegen_style_12_0}
  ${Telegram__codegen_style_12_1}
  ${Telegram__codegen_style_13_0}
  ${Telegram__codegen_style_13_1}
  ${Telegram__codegen_style_14_0}
  ${Telegram__codegen_style_14_1}
  ${Telegram__codegen_style_15_0}
  ${Telegram__codegen_style_15_1}
  ${Telegram__codegen_style_16_0}
  ${Telegram__codegen_style_16_1}
SOURCES ${Telegram__codegen_style__input}
  ../../Telegram/Resources/basic.style
  ../../Telegram/SourceFiles/boxes/boxes.style
  ../../Telegram/SourceFiles/calls/calls.style
  ../../Telegram/SourceFiles/dialogs/dialogs.style
  ../../Telegram/SourceFiles/export/view/export.style
  ../../Telegram/SourceFiles/history/history.style
  ../../Telegram/SourceFiles/info/info.style
  ../../Telegram/SourceFiles/intro/intro.style
  ../../Telegram/SourceFiles/media/view/mediaview.style
  ../../Telegram/SourceFiles/media/player/media_player.style
  ../../Telegram/SourceFiles/overview/overview.style
  ../../Telegram/SourceFiles/passport/passport.style
  ../../Telegram/SourceFiles/profile/profile.style
  ../../Telegram/SourceFiles/settings/settings.style
  ../../Telegram/SourceFiles/chat_helpers/chat_helpers.style
  ../../Telegram/SourceFiles/ui/widgets/widgets.style
  ../../Telegram/SourceFiles/window/window.style
)
list(APPEND Telegram__c_srcs
  "../../Telegram/ThirdParty/minizip/ioapi.c"
  "../../Telegram/ThirdParty/minizip/zip.c"
  "../../Telegram/ThirdParty/minizip/unzip.c")
list(APPEND Telegram__cxx_srcs
  "../../Telegram/SourceFiles/api/api_sending.cpp"
  "../../Telegram/SourceFiles/api/api_single_message_search.cpp"
  "../../Telegram/SourceFiles/boxes/peers/add_participants_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_contact_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_linked_chat_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_participant_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_participants_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_info_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_type_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_history_visibility_box.cpp"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_permissions_box.cpp"
  "../../Telegram/SourceFiles/boxes/about_box.cpp"
  "../../Telegram/SourceFiles/boxes/abstract_box.cpp"
  "../../Telegram/SourceFiles/boxes/add_contact_box.cpp"
  "../../Telegram/SourceFiles/boxes/auto_lock_box.cpp"
  "../../Telegram/SourceFiles/boxes/auto_download_box.cpp"
  "../../Telegram/SourceFiles/boxes/background_box.cpp"
  "../../Telegram/SourceFiles/boxes/background_preview_box.cpp"
  "../../Telegram/SourceFiles/boxes/calendar_box.cpp"
  "../../Telegram/SourceFiles/boxes/change_phone_box.cpp"
  "../../Telegram/SourceFiles/boxes/confirm_box.cpp"
  "../../Telegram/SourceFiles/boxes/confirm_phone_box.cpp"
  "../../Telegram/SourceFiles/boxes/connection_box.cpp"
  "../../Telegram/SourceFiles/boxes/create_poll_box.cpp"
  "../../Telegram/SourceFiles/boxes/download_path_box.cpp"
  "../../Telegram/SourceFiles/boxes/edit_caption_box.cpp"
  "../../Telegram/SourceFiles/boxes/edit_color_box.cpp"
  "../../Telegram/SourceFiles/boxes/edit_privacy_box.cpp"
  "../../Telegram/SourceFiles/boxes/generic_box.cpp"
  "../../Telegram/SourceFiles/boxes/language_box.cpp"
  "../../Telegram/SourceFiles/boxes/local_storage_box.cpp"
  "../../Telegram/SourceFiles/boxes/mute_settings_box.cpp"
  "../../Telegram/SourceFiles/boxes/peer_list_box.cpp"
  "../../Telegram/SourceFiles/boxes/peer_list_controllers.cpp"
  "../../Telegram/SourceFiles/boxes/passcode_box.cpp"
  "../../Telegram/SourceFiles/boxes/photo_crop_box.cpp"
  "../../Telegram/SourceFiles/boxes/rate_call_box.cpp"
  "../../Telegram/SourceFiles/boxes/report_box.cpp"
  "../../Telegram/SourceFiles/boxes/self_destruction_box.cpp"
  "../../Telegram/SourceFiles/boxes/send_files_box.cpp"
  "../../Telegram/SourceFiles/boxes/sessions_box.cpp"
  "../../Telegram/SourceFiles/boxes/share_box.cpp"
  "../../Telegram/SourceFiles/boxes/single_choice_box.cpp"
  "../../Telegram/SourceFiles/boxes/sticker_set_box.cpp"
  "../../Telegram/SourceFiles/boxes/stickers_box.cpp"
  "../../Telegram/SourceFiles/boxes/url_auth_box.cpp"
  "../../Telegram/SourceFiles/boxes/username_box.cpp"
  "../../Telegram/SourceFiles/calls/calls_box_controller.cpp"
  "../../Telegram/SourceFiles/calls/calls_call.cpp"
  "../../Telegram/SourceFiles/calls/calls_emoji_fingerprint.cpp"
  "../../Telegram/SourceFiles/calls/calls_instance.cpp"
  "../../Telegram/SourceFiles/calls/calls_panel.cpp"
  "../../Telegram/SourceFiles/calls/calls_top_bar.cpp"
  "../../Telegram/SourceFiles/chat_helpers/bot_keyboard.cpp"
  "../../Telegram/SourceFiles/chat_helpers/emoji_keywords.cpp"
  "../../Telegram/SourceFiles/chat_helpers/emoji_list_widget.cpp"
  "../../Telegram/SourceFiles/chat_helpers/emoji_sets_manager.cpp"
  "../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_widget.cpp"
  "../../Telegram/SourceFiles/chat_helpers/field_autocomplete.cpp"
  "../../Telegram/SourceFiles/chat_helpers/gifs_list_widget.cpp"
  "../../Telegram/SourceFiles/chat_helpers/message_field.cpp"
  "../../Telegram/SourceFiles/chat_helpers/stickers.cpp"
  "../../Telegram/SourceFiles/chat_helpers/stickers_emoji_pack.cpp"
  "../../Telegram/SourceFiles/chat_helpers/stickers_list_widget.cpp"
  "../../Telegram/SourceFiles/chat_helpers/tabbed_panel.cpp"
  "../../Telegram/SourceFiles/chat_helpers/tabbed_section.cpp"
  "../../Telegram/SourceFiles/chat_helpers/tabbed_selector.cpp"
  "../../Telegram/SourceFiles/core/application.cpp"
  "../../Telegram/SourceFiles/core/changelogs.cpp"
  "../../Telegram/SourceFiles/core/click_handler.cpp"
  "../../Telegram/SourceFiles/core/click_handler_types.cpp"
  "../../Telegram/SourceFiles/core/core_cloud_password.cpp"
  "../../Telegram/SourceFiles/core/crash_report_window.cpp"
  "../../Telegram/SourceFiles/core/crash_reports.cpp"
  "../../Telegram/SourceFiles/core/event_filter.cpp"
  "../../Telegram/SourceFiles/core/file_utilities.cpp"
  "../../Telegram/SourceFiles/core/launcher.cpp"
  "../../Telegram/SourceFiles/core/local_url_handlers.cpp"
  "../../Telegram/SourceFiles/core/main_queue_processor.cpp"
  "../../Telegram/SourceFiles/core/mime_type.cpp"
  "../../Telegram/SourceFiles/core/sandbox.cpp"
  "../../Telegram/SourceFiles/core/shortcuts.cpp"
  "../../Telegram/SourceFiles/core/update_checker.cpp"
  "../../Telegram/SourceFiles/core/utils.cpp"
  "../../Telegram/SourceFiles/data/data_abstract_structure.cpp"
  "../../Telegram/SourceFiles/data/data_auto_download.cpp"
  "../../Telegram/SourceFiles/data/data_chat.cpp"
  "../../Telegram/SourceFiles/data/data_channel.cpp"
  "../../Telegram/SourceFiles/data/data_channel_admins.cpp"
  "../../Telegram/SourceFiles/data/data_countries.cpp"
  "../../Telegram/SourceFiles/data/data_document.cpp"
  "../../Telegram/SourceFiles/data/data_document_good_thumbnail.cpp"
  "../../Telegram/SourceFiles/data/data_drafts.cpp"
  "../../Telegram/SourceFiles/data/data_folder.cpp"
  "../../Telegram/SourceFiles/data/data_file_origin.cpp"
  "../../Telegram/SourceFiles/data/data_groups.cpp"
  "../../Telegram/SourceFiles/data/data_location.cpp"
  "../../Telegram/SourceFiles/data/data_media_types.cpp"
  "../../Telegram/SourceFiles/data/data_messages.cpp"
  "../../Telegram/SourceFiles/data/data_notify_settings.cpp"
  "../../Telegram/SourceFiles/data/data_peer.cpp"
  "../../Telegram/SourceFiles/data/data_peer_values.cpp"
  "../../Telegram/SourceFiles/data/data_photo.cpp"
  "../../Telegram/SourceFiles/data/data_poll.cpp"
  "../../Telegram/SourceFiles/data/data_pts_waiter.cpp"
  "../../Telegram/SourceFiles/data/data_search_controller.cpp"
  "../../Telegram/SourceFiles/data/data_session.cpp"
  "../../Telegram/SourceFiles/data/data_shared_media.cpp"
  "../../Telegram/SourceFiles/data/data_sparse_ids.cpp"
  "../../Telegram/SourceFiles/data/data_types.cpp"
  "../../Telegram/SourceFiles/data/data_user.cpp"
  "../../Telegram/SourceFiles/data/data_user_photos.cpp"
  "../../Telegram/SourceFiles/data/data_wall_paper.cpp"
  "../../Telegram/SourceFiles/data/data_web_page.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_entry.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_indexed_list.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_inner_widget.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_key.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_layout.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_list.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_main_list.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_pinned_list.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_row.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_search_from_controllers.cpp"
  "../../Telegram/SourceFiles/dialogs/dialogs_widget.cpp"
  "../../Telegram/SourceFiles/export/view/export_view_content.cpp"
  "../../Telegram/SourceFiles/export/view/export_view_panel_controller.cpp"
  "../../Telegram/SourceFiles/export/view/export_view_progress.cpp"
  "../../Telegram/SourceFiles/export/view/export_view_settings.cpp"
  "../../Telegram/SourceFiles/export/view/export_view_top_bar.cpp"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_filter.cpp"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_inner.cpp"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_item.cpp"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_section.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_call.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_contact.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_document.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_file.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_game.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_gif.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_invoice.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_large_emoji.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_location.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_media.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_media_common.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_media_grouped.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_media_unwrapped.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_photo.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_poll.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_sticker.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_video.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_wall_paper.cpp"
  "../../Telegram/SourceFiles/history/view/media/history_view_web_page.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_contact_status.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_context_menu.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_cursor_state.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_element.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_list_widget.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_message.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_service_message.cpp"
  "../../Telegram/SourceFiles/history/view/history_view_top_bar_widget.cpp"
  "../../Telegram/SourceFiles/history/history.cpp"
  "../../Telegram/SourceFiles/history/history_drag_area.cpp"
  "../../Telegram/SourceFiles/history/history_item.cpp"
  "../../Telegram/SourceFiles/history/history_item_components.cpp"
  "../../Telegram/SourceFiles/history/history_item_text.cpp"
  "../../Telegram/SourceFiles/history/history_inner_widget.cpp"
  "../../Telegram/SourceFiles/history/history_location_manager.cpp"
  "../../Telegram/SourceFiles/history/history_message.cpp"
  "../../Telegram/SourceFiles/history/history_service.cpp"
  "../../Telegram/SourceFiles/history/history_widget.cpp"
  "../../Telegram/SourceFiles/info/info_content_widget.cpp"
  "../../Telegram/SourceFiles/info/info_controller.cpp"
  "../../Telegram/SourceFiles/info/info_layer_widget.cpp"
  "../../Telegram/SourceFiles/info/info_memento.cpp"
  "../../Telegram/SourceFiles/info/info_section_widget.cpp"
  "../../Telegram/SourceFiles/info/info_top_bar.cpp"
  "../../Telegram/SourceFiles/info/info_wrap_widget.cpp"
  "../../Telegram/SourceFiles/info/common_groups/info_common_groups_inner_widget.cpp"
  "../../Telegram/SourceFiles/info/common_groups/info_common_groups_widget.cpp"
  "../../Telegram/SourceFiles/info/media/info_media_empty_widget.cpp"
  "../../Telegram/SourceFiles/info/media/info_media_inner_widget.cpp"
  "../../Telegram/SourceFiles/info/media/info_media_list_widget.cpp"
  "../../Telegram/SourceFiles/info/media/info_media_widget.cpp"
  "../../Telegram/SourceFiles/info/members/info_members_widget.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_actions.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_button.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_cover.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_icon.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_inner_widget.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_members.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_members_controllers.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_text.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_values.cpp"
  "../../Telegram/SourceFiles/info/profile/info_profile_widget.cpp"
  "../../Telegram/SourceFiles/info/settings/info_settings_widget.cpp"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_layout_internal.cpp"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_layout_item.cpp"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_result.cpp"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_send_data.cpp"
  "../../Telegram/SourceFiles/inline_bots/inline_results_widget.cpp"
  "../../Telegram/SourceFiles/intro/introwidget.cpp"
  "../../Telegram/SourceFiles/intro/introcode.cpp"
  "../../Telegram/SourceFiles/intro/introphone.cpp"
  "../../Telegram/SourceFiles/intro/intropwdcheck.cpp"
  "../../Telegram/SourceFiles/intro/introsignup.cpp"
  "../../Telegram/SourceFiles/intro/introstart.cpp"
  "../../Telegram/SourceFiles/lang/lang_cloud_manager.cpp"
  "../../Telegram/SourceFiles/lang/lang_file_parser.cpp"
  "../../Telegram/SourceFiles/lang/lang_instance.cpp"
  "../../Telegram/SourceFiles/lang/lang_keys.cpp"
  "../../Telegram/SourceFiles/lang/lang_tag.cpp"
  "../../Telegram/SourceFiles/lang/lang_translator.cpp"
  "../../Telegram/SourceFiles/lang/lang_values.cpp"
  "../../Telegram/SourceFiles/main/main_account.cpp"
  "../../Telegram/SourceFiles/main/main_app_config.cpp"
  "../../Telegram/SourceFiles/main/main_session.cpp"
  "../../Telegram/SourceFiles/media/audio/media_audio.cpp"
  "../../Telegram/SourceFiles/media/audio/media_audio_capture.cpp"
  "../../Telegram/SourceFiles/media/audio/media_audio_ffmpeg_loader.cpp"
  "../../Telegram/SourceFiles/media/audio/media_audio_loader.cpp"
  "../../Telegram/SourceFiles/media/audio/media_audio_loaders.cpp"
  "../../Telegram/SourceFiles/media/audio/media_audio_track.cpp"
  "../../Telegram/SourceFiles/media/audio/media_child_ffmpeg_loader.cpp"
  "../../Telegram/SourceFiles/media/clip/media_clip_check_streaming.cpp"
  "../../Telegram/SourceFiles/media/clip/media_clip_ffmpeg.cpp"
  "../../Telegram/SourceFiles/media/clip/media_clip_implementation.cpp"
  "../../Telegram/SourceFiles/media/clip/media_clip_reader.cpp"
  "../../Telegram/SourceFiles/media/player/media_player_button.cpp"
  "../../Telegram/SourceFiles/media/player/media_player_float.cpp"
  "../../Telegram/SourceFiles/media/player/media_player_instance.cpp"
  "../../Telegram/SourceFiles/media/player/media_player_panel.cpp"
  "../../Telegram/SourceFiles/media/player/media_player_volume_controller.cpp"
  "../../Telegram/SourceFiles/media/player/media_player_widget.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_audio_track.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_file.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_loader.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_loader_local.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_loader_mtproto.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_player.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_reader.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_utility.cpp"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_video_track.cpp"
  "../../Telegram/SourceFiles/media/view/media_view_playback_controls.cpp"
  "../../Telegram/SourceFiles/media/view/media_view_playback_progress.cpp"
  "../../Telegram/SourceFiles/media/view/media_view_group_thumbs.cpp"
  "../../Telegram/SourceFiles/media/view/media_view_overlay_widget.cpp"
  "../../Telegram/SourceFiles/mtproto/auth_key.cpp"
  "../../Telegram/SourceFiles/mtproto/concurrent_sender.cpp"
  "../../Telegram/SourceFiles/mtproto/config_loader.cpp"
  "../../Telegram/SourceFiles/mtproto/connection.cpp"
  "../../Telegram/SourceFiles/mtproto/connection_abstract.cpp"
  "../../Telegram/SourceFiles/mtproto/connection_http.cpp"
  "../../Telegram/SourceFiles/mtproto/connection_resolving.cpp"
  "../../Telegram/SourceFiles/mtproto/connection_tcp.cpp"
  "../../Telegram/SourceFiles/mtproto/core_types.cpp"
  "../../Telegram/SourceFiles/mtproto/dcenter.cpp"
  "../../Telegram/SourceFiles/mtproto/dc_options.cpp"
  "../../Telegram/SourceFiles/mtproto/dedicated_file_loader.cpp"
  "../../Telegram/SourceFiles/mtproto/facade.cpp"
  "../../Telegram/SourceFiles/mtproto/mtp_instance.cpp"
  "../../Telegram/SourceFiles/mtproto/rsa_public_key.cpp"
  "../../Telegram/SourceFiles/mtproto/rpc_sender.cpp"
  "../../Telegram/SourceFiles/mtproto/session.cpp"
  "../../Telegram/SourceFiles/mtproto/special_config_request.cpp"
  "../../Telegram/SourceFiles/overview/overview_layout.cpp"
  "../../Telegram/SourceFiles/passport/passport_encryption.cpp"
  "../../Telegram/SourceFiles/passport/passport_form_controller.cpp"
  "../../Telegram/SourceFiles/passport/passport_form_view_controller.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_controller.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_details_row.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_edit_contact.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_edit_document.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_edit_scans.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_form.cpp"
  "../../Telegram/SourceFiles/passport/passport_panel_password.cpp"
  "../../Telegram/SourceFiles/platform/linux/linux_desktop_environment.cpp"
  "../../Telegram/SourceFiles/platform/linux/linux_gdk_helper.cpp"
  "../../Telegram/SourceFiles/platform/linux/linux_libnotify.cpp"
  "../../Telegram/SourceFiles/platform/linux/linux_libs.cpp"
  "../../Telegram/SourceFiles/platform/linux/file_utilities_linux.cpp"
  "../../Telegram/SourceFiles/platform/linux/info_linux.cpp"
  "../../Telegram/SourceFiles/platform/linux/launcher_linux.cpp"
  "../../Telegram/SourceFiles/platform/linux/main_window_linux.cpp"
  "../../Telegram/SourceFiles/platform/linux/notifications_manager_linux.cpp"
  "../../Telegram/SourceFiles/platform/linux/specific_linux.cpp"
  "../../Telegram/SourceFiles/profile/profile_back_button.cpp"
  "../../Telegram/SourceFiles/profile/profile_block_group_members.cpp"
  "../../Telegram/SourceFiles/profile/profile_block_peer_list.cpp"
  "../../Telegram/SourceFiles/profile/profile_block_widget.cpp"
  "../../Telegram/SourceFiles/profile/profile_cover_drop_area.cpp"
  "../../Telegram/SourceFiles/settings/settings_advanced.cpp"
  "../../Telegram/SourceFiles/settings/settings_chat.cpp"
  "../../Telegram/SourceFiles/settings/settings_calls.cpp"
  "../../Telegram/SourceFiles/settings/settings_codes.cpp"
  "../../Telegram/SourceFiles/settings/settings_common.cpp"
  "../../Telegram/SourceFiles/settings/settings_information.cpp"
  "../../Telegram/SourceFiles/settings/settings_intro.cpp"
  "../../Telegram/SourceFiles/settings/settings_main.cpp"
  "../../Telegram/SourceFiles/settings/settings_notifications.cpp"
  "../../Telegram/SourceFiles/settings/settings_privacy_controllers.cpp"
  "../../Telegram/SourceFiles/settings/settings_privacy_security.cpp"
  "../../Telegram/SourceFiles/storage/file_download.cpp"
  "../../Telegram/SourceFiles/storage/file_upload.cpp"
  "../../Telegram/SourceFiles/storage/localimageloader.cpp"
  "../../Telegram/SourceFiles/storage/localstorage.cpp"
  "../../Telegram/SourceFiles/storage/serialize_common.cpp"
  "../../Telegram/SourceFiles/storage/serialize_document.cpp"
  "../../Telegram/SourceFiles/storage/storage_facade.cpp"
  "../../Telegram/SourceFiles/storage/storage_media_prepare.cpp"
  "../../Telegram/SourceFiles/storage/storage_shared_media.cpp"
  "../../Telegram/SourceFiles/storage/storage_sparse_ids_list.cpp"
  "../../Telegram/SourceFiles/storage/storage_user_photos.cpp"
  "../../Telegram/SourceFiles/storage/streamed_file_downloader.cpp"
  "../../Telegram/SourceFiles/support/support_autocomplete.cpp"
  "../../Telegram/SourceFiles/support/support_common.cpp"
  "../../Telegram/SourceFiles/support/support_helper.cpp"
  "../../Telegram/SourceFiles/support/support_templates.cpp"
  "../../Telegram/SourceFiles/ui/effects/animations.cpp"
  "../../Telegram/SourceFiles/ui/effects/cross_animation.cpp"
  "../../Telegram/SourceFiles/ui/effects/fade_animation.cpp"
  "../../Telegram/SourceFiles/ui/effects/numbers_animation.cpp"
  "../../Telegram/SourceFiles/ui/effects/panel_animation.cpp"
  "../../Telegram/SourceFiles/ui/effects/radial_animation.cpp"
  "../../Telegram/SourceFiles/ui/effects/ripple_animation.cpp"
  "../../Telegram/SourceFiles/ui/effects/round_checkbox.cpp"
  "../../Telegram/SourceFiles/ui/effects/send_action_animations.cpp"
  "../../Telegram/SourceFiles/ui/effects/slide_animation.cpp"
  "../../Telegram/SourceFiles/ui/image/image.cpp"
  "../../Telegram/SourceFiles/ui/image/image_location.cpp"
  "../../Telegram/SourceFiles/ui/image/image_prepare.cpp"
  "../../Telegram/SourceFiles/ui/image/image_source.cpp"
  "../../Telegram/SourceFiles/ui/style/style_core.cpp"
  "../../Telegram/SourceFiles/ui/style/style_core_color.cpp"
  "../../Telegram/SourceFiles/ui/style/style_core_font.cpp"
  "../../Telegram/SourceFiles/ui/style/style_core_icon.cpp"
  "../../Telegram/SourceFiles/ui/style/style_core_types.cpp"
  "../../Telegram/SourceFiles/ui/text/text.cpp"
  "../../Telegram/SourceFiles/ui/text/text_block.cpp"
  "../../Telegram/SourceFiles/ui/text/text_entity.cpp"
  "../../Telegram/SourceFiles/ui/text/text_utilities.cpp"
  "../../Telegram/SourceFiles/ui/toast/toast.cpp"
  "../../Telegram/SourceFiles/ui/toast/toast_manager.cpp"
  "../../Telegram/SourceFiles/ui/toast/toast_widget.cpp"
  "../../Telegram/SourceFiles/ui/widgets/buttons.cpp"
  "../../Telegram/SourceFiles/ui/widgets/checkbox.cpp"
  "../../Telegram/SourceFiles/ui/widgets/continuous_sliders.cpp"
  "../../Telegram/SourceFiles/ui/widgets/discrete_sliders.cpp"
  "../../Telegram/SourceFiles/ui/widgets/dropdown_menu.cpp"
  "../../Telegram/SourceFiles/ui/widgets/inner_dropdown.cpp"
  "../../Telegram/SourceFiles/ui/widgets/input_fields.cpp"
  "../../Telegram/SourceFiles/ui/widgets/labels.cpp"
  "../../Telegram/SourceFiles/ui/widgets/level_meter.cpp"
  "../../Telegram/SourceFiles/ui/widgets/menu.cpp"
  "../../Telegram/SourceFiles/ui/widgets/multi_select.cpp"
  "../../Telegram/SourceFiles/ui/widgets/popup_menu.cpp"
  "../../Telegram/SourceFiles/ui/widgets/separate_panel.cpp"
  "../../Telegram/SourceFiles/ui/widgets/scroll_area.cpp"
  "../../Telegram/SourceFiles/ui/widgets/shadow.cpp"
  "../../Telegram/SourceFiles/ui/widgets/tooltip.cpp"
  "../../Telegram/SourceFiles/ui/wrap/fade_wrap.cpp"
  "../../Telegram/SourceFiles/ui/wrap/padding_wrap.cpp"
  "../../Telegram/SourceFiles/ui/wrap/slide_wrap.cpp"
  "../../Telegram/SourceFiles/ui/wrap/vertical_layout.cpp"
  "../../Telegram/SourceFiles/ui/abstract_button.cpp"
  "../../Telegram/SourceFiles/ui/animation.cpp"
  "../../Telegram/SourceFiles/ui/countryinput.cpp"
  "../../Telegram/SourceFiles/ui/emoji_config.cpp"
  "../../Telegram/SourceFiles/ui/empty_userpic.cpp"
  "../../Telegram/SourceFiles/ui/grouped_layout.cpp"
  "../../Telegram/SourceFiles/ui/rp_widget.cpp"
  "../../Telegram/SourceFiles/ui/search_field_controller.cpp"
  "../../Telegram/SourceFiles/ui/special_buttons.cpp"
  "../../Telegram/SourceFiles/ui/text_options.cpp"
  "../../Telegram/SourceFiles/ui/twidget.cpp"
  "../../Telegram/SourceFiles/ui/unread_badge.cpp"
  "../../Telegram/SourceFiles/window/layer_widget.cpp"
  "../../Telegram/SourceFiles/window/main_window.cpp"
  "../../Telegram/SourceFiles/window/notifications_manager.cpp"
  "../../Telegram/SourceFiles/window/notifications_manager_default.cpp"
  "../../Telegram/SourceFiles/window/notifications_utilities.cpp"
  "../../Telegram/SourceFiles/window/section_widget.cpp"
  "../../Telegram/SourceFiles/window/window_connecting_widget.cpp"
  "../../Telegram/SourceFiles/window/window_controller.cpp"
  "../../Telegram/SourceFiles/window/window_history_hider.cpp"
  "../../Telegram/SourceFiles/window/window_lock_widgets.cpp"
  "../../Telegram/SourceFiles/window/window_main_menu.cpp"
  "../../Telegram/SourceFiles/window/window_outdated_bar.cpp"
  "../../Telegram/SourceFiles/window/window_peer_menu.cpp"
  "../../Telegram/SourceFiles/window/window_session_controller.cpp"
  "../../Telegram/SourceFiles/window/window_slide_animation.cpp"
  "../../Telegram/SourceFiles/window/themes/window_theme.cpp"
  "../../Telegram/SourceFiles/window/themes/window_theme_editor.cpp"
  "../../Telegram/SourceFiles/window/themes/window_theme_editor_block.cpp"
  "../../Telegram/SourceFiles/window/themes/window_theme_preview.cpp"
  "../../Telegram/SourceFiles/window/themes/window_theme_warning.cpp"
  "../../Telegram/SourceFiles/apiwrap.cpp"
  "../../Telegram/SourceFiles/app.cpp"
  "../../Telegram/SourceFiles/facades.cpp"
  "../../Telegram/SourceFiles/layout.cpp"
  "../../Telegram/SourceFiles/logs.cpp"
  "../../Telegram/SourceFiles/main.cpp"
  "../../Telegram/SourceFiles/mainwidget.cpp"
  "../../Telegram/SourceFiles/mainwindow.cpp"
  "../../Telegram/SourceFiles/observer_peer.cpp"
  "../../Telegram/SourceFiles/qt_static_plugins.cpp"
  "../../Telegram/SourceFiles/settings.cpp"
  "../../Telegram/ThirdParty/emoji_suggestions/emoji_suggestions.cpp"
  "${obj}/gen/Telegram/moc/moc_abstract_box.cpp"
  "${obj}/gen/Telegram/moc/moc_stickers_box.cpp"
  "${obj}/gen/Telegram/moc/moc_field_autocomplete.cpp"
  "${obj}/gen/Telegram/moc/moc_crash_report_window.cpp"
  "${obj}/gen/Telegram/moc/moc_dialogs_inner_widget.cpp"
  "${obj}/gen/Telegram/moc/moc_dialogs_widget.cpp"
  "${obj}/gen/Telegram/moc/moc_history_drag_area.cpp"
  "${obj}/gen/Telegram/moc/moc_history_inner_widget.cpp"
  "${obj}/gen/Telegram/moc/moc_history_widget.cpp"
  "${obj}/gen/Telegram/moc/moc_inline_results_widget.cpp"
  "${obj}/gen/Telegram/moc/moc_introwidget.cpp"
  "${obj}/gen/Telegram/moc/moc_introcode.cpp"
  "${obj}/gen/Telegram/moc/moc_introphone.cpp"
  "${obj}/gen/Telegram/moc/moc_intropwdcheck.cpp"
  "${obj}/gen/Telegram/moc/moc_introsignup.cpp"
  "${obj}/gen/Telegram/moc/moc_media_audio.cpp"
  "${obj}/gen/Telegram/moc/moc_media_audio_capture.cpp"
  "${obj}/gen/Telegram/moc/moc_media_audio_loaders.cpp"
  "${obj}/gen/Telegram/moc/moc_media_clip_reader.cpp"
  "${obj}/gen/Telegram/moc/moc_media_player_volume_controller.cpp"
  "${obj}/gen/Telegram/moc/moc_media_view_overlay_widget.cpp"
  "${obj}/gen/Telegram/moc/moc_connection.cpp"
  "${obj}/gen/Telegram/moc/moc_connection_abstract.cpp"
  "${obj}/gen/Telegram/moc/moc_dcenter.cpp"
  "${obj}/gen/Telegram/moc/moc_mtp_instance.cpp"
  "${obj}/gen/Telegram/moc/moc_session.cpp"
  "${obj}/gen/Telegram/moc/moc_file_utilities_linux.cpp"
  "${obj}/gen/Telegram/moc/moc_main_window_linux.cpp"
  "${obj}/gen/Telegram/moc/moc_profile_block_group_members.cpp"
  "${obj}/gen/Telegram/moc/moc_file_download.cpp"
  "${obj}/gen/Telegram/moc/moc_file_upload.cpp"
  "${obj}/gen/Telegram/moc/moc_localimageloader.cpp"
  "${obj}/gen/Telegram/moc/moc_localstorage.cpp"
  "${obj}/gen/Telegram/moc/moc_toast_manager.cpp"
  "${obj}/gen/Telegram/moc/moc_dropdown_menu.cpp"
  "${obj}/gen/Telegram/moc/moc_inner_dropdown.cpp"
  "${obj}/gen/Telegram/moc/moc_input_fields.cpp"
  "${obj}/gen/Telegram/moc/moc_labels.cpp"
  "${obj}/gen/Telegram/moc/moc_menu.cpp"
  "${obj}/gen/Telegram/moc/moc_scroll_area.cpp"
  "${obj}/gen/Telegram/moc/moc_abstract_button.cpp"
  "${obj}/gen/Telegram/moc/moc_countryinput.cpp"
  "${obj}/gen/Telegram/moc/moc_twidget.cpp"
  "${obj}/gen/Telegram/moc/moc_main_window.cpp"
  "${obj}/gen/Telegram/moc/moc_notifications_utilities.cpp"
  "${obj}/gen/Telegram/moc/moc_mainwidget.cpp"
  "${obj}/gen/Telegram/moc/moc_mainwindow.cpp"
  "../../Telegram/SourceFiles/stdafx.cpp"
  "${obj}/gen/styles/palette.cpp"
  "${obj}/gen/lang_auto.cpp"
  "${obj}/gen/numbers.cpp"
  "${obj}/gen/emoji.cpp"
  "${obj}/gen/emoji_suggestions_data.cpp"
  "${Telegram__qt_rcc_0_0}"
  "${Telegram__qt_rcc_1_0}"
  "${Telegram__qt_rcc_2_0}"
  "${Telegram__qt_rcc_3_0}"
  "${Telegram__qt_rcc_4_0}"
  "${Telegram__qt_rcc_5_0}"
  "${Telegram__qt_rcc_6_0}"
  "${Telegram__qt_rcc_7_0}"
  "${Telegram__qt_rcc_8_0}"
  "${Telegram__codegen_style_0_1}"
  "${Telegram__codegen_style_1_1}"
  "${Telegram__codegen_style_2_1}"
  "${Telegram__codegen_style_3_1}"
  "${Telegram__codegen_style_4_1}"
  "${Telegram__codegen_style_5_1}"
  "${Telegram__codegen_style_6_1}"
  "${Telegram__codegen_style_7_1}"
  "${Telegram__codegen_style_8_1}"
  "${Telegram__codegen_style_9_1}"
  "${Telegram__codegen_style_10_1}"
  "${Telegram__codegen_style_11_1}"
  "${Telegram__codegen_style_12_1}"
  "${Telegram__codegen_style_13_1}"
  "${Telegram__codegen_style_14_1}"
  "${Telegram__codegen_style_15_1}"
  "${Telegram__codegen_style_16_1}")
list(APPEND Telegram__other_srcs
  "../../Telegram/Resources/qrc/telegram.qrc"
  "../../Telegram/Resources/qrc/telegram_emoji_1.qrc"
  "../../Telegram/Resources/qrc/telegram_emoji_2.qrc"
  "../../Telegram/Resources/qrc/telegram_emoji_3.qrc"
  "../../Telegram/Resources/qrc/telegram_emoji_4.qrc"
  "../../Telegram/Resources/qrc/telegram_emoji_5.qrc"
  "../../Telegram/Resources/qrc/telegram_emoji_preview.qrc"
  "../../Telegram/Resources/qrc/telegram_sounds.qrc"
  "../../Telegram/Resources/qrc/telegram_linux.qrc"
  "../../Telegram/Resources/colors.palette"
  "../../Telegram/Resources/basic.style"
  "../../Telegram/SourceFiles/boxes/boxes.style"
  "../../Telegram/SourceFiles/calls/calls.style"
  "../../Telegram/SourceFiles/dialogs/dialogs.style"
  "../../Telegram/SourceFiles/export/view/export.style"
  "../../Telegram/SourceFiles/history/history.style"
  "../../Telegram/SourceFiles/info/info.style"
  "../../Telegram/SourceFiles/intro/intro.style"
  "../../Telegram/SourceFiles/media/view/mediaview.style"
  "../../Telegram/SourceFiles/media/player/media_player.style"
  "../../Telegram/SourceFiles/overview/overview.style"
  "../../Telegram/SourceFiles/passport/passport.style"
  "../../Telegram/SourceFiles/profile/profile.style"
  "../../Telegram/SourceFiles/settings/settings.style"
  "../../Telegram/SourceFiles/chat_helpers/chat_helpers.style"
  "../../Telegram/SourceFiles/ui/widgets/widgets.style"
  "../../Telegram/SourceFiles/window/window.style"
  "../../Telegram/SourceFiles/api/api_sending.h"
  "../../Telegram/SourceFiles/api/api_single_message_search.h"
  "../../Telegram/SourceFiles/boxes/peers/add_participants_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_contact_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_linked_chat_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_participant_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_participants_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_info_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_type_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_history_visibility_box.h"
  "../../Telegram/SourceFiles/boxes/peers/edit_peer_permissions_box.h"
  "../../Telegram/SourceFiles/boxes/about_box.h"
  "../../Telegram/SourceFiles/boxes/abstract_box.h"
  "../../Telegram/SourceFiles/boxes/add_contact_box.h"
  "../../Telegram/SourceFiles/boxes/auto_lock_box.h"
  "../../Telegram/SourceFiles/boxes/auto_download_box.h"
  "../../Telegram/SourceFiles/boxes/background_box.h"
  "../../Telegram/SourceFiles/boxes/background_preview_box.h"
  "../../Telegram/SourceFiles/boxes/calendar_box.h"
  "../../Telegram/SourceFiles/boxes/change_phone_box.h"
  "../../Telegram/SourceFiles/boxes/confirm_box.h"
  "../../Telegram/SourceFiles/boxes/confirm_phone_box.h"
  "../../Telegram/SourceFiles/boxes/connection_box.h"
  "../../Telegram/SourceFiles/boxes/create_poll_box.h"
  "../../Telegram/SourceFiles/boxes/download_path_box.h"
  "../../Telegram/SourceFiles/boxes/edit_caption_box.h"
  "../../Telegram/SourceFiles/boxes/edit_color_box.h"
  "../../Telegram/SourceFiles/boxes/edit_privacy_box.h"
  "../../Telegram/SourceFiles/boxes/generic_box.h"
  "../../Telegram/SourceFiles/boxes/language_box.h"
  "../../Telegram/SourceFiles/boxes/local_storage_box.h"
  "../../Telegram/SourceFiles/boxes/mute_settings_box.h"
  "../../Telegram/SourceFiles/boxes/peer_list_box.h"
  "../../Telegram/SourceFiles/boxes/peer_list_controllers.h"
  "../../Telegram/SourceFiles/boxes/passcode_box.h"
  "../../Telegram/SourceFiles/boxes/photo_crop_box.h"
  "../../Telegram/SourceFiles/boxes/rate_call_box.h"
  "../../Telegram/SourceFiles/boxes/report_box.h"
  "../../Telegram/SourceFiles/boxes/self_destruction_box.h"
  "../../Telegram/SourceFiles/boxes/send_files_box.h"
  "../../Telegram/SourceFiles/boxes/sessions_box.h"
  "../../Telegram/SourceFiles/boxes/share_box.h"
  "../../Telegram/SourceFiles/boxes/single_choice_box.h"
  "../../Telegram/SourceFiles/boxes/sticker_set_box.h"
  "../../Telegram/SourceFiles/boxes/stickers_box.h"
  "../../Telegram/SourceFiles/boxes/url_auth_box.h"
  "../../Telegram/SourceFiles/boxes/username_box.h"
  "../../Telegram/SourceFiles/calls/calls_box_controller.h"
  "../../Telegram/SourceFiles/calls/calls_call.h"
  "../../Telegram/SourceFiles/calls/calls_emoji_fingerprint.h"
  "../../Telegram/SourceFiles/calls/calls_instance.h"
  "../../Telegram/SourceFiles/calls/calls_panel.h"
  "../../Telegram/SourceFiles/calls/calls_top_bar.h"
  "../../Telegram/SourceFiles/chat_helpers/bot_keyboard.h"
  "../../Telegram/SourceFiles/chat_helpers/emoji_keywords.h"
  "../../Telegram/SourceFiles/chat_helpers/emoji_list_widget.h"
  "../../Telegram/SourceFiles/chat_helpers/emoji_sets_manager.h"
  "../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_helper.h"
  "../../Telegram/SourceFiles/chat_helpers/emoji_suggestions_widget.h"
  "../../Telegram/SourceFiles/chat_helpers/field_autocomplete.h"
  "../../Telegram/SourceFiles/chat_helpers/gifs_list_widget.h"
  "../../Telegram/SourceFiles/chat_helpers/message_field.h"
  "../../Telegram/SourceFiles/chat_helpers/stickers.h"
  "../../Telegram/SourceFiles/chat_helpers/stickers_emoji_pack.h"
  "../../Telegram/SourceFiles/chat_helpers/stickers_list_widget.h"
  "../../Telegram/SourceFiles/chat_helpers/tabbed_panel.h"
  "../../Telegram/SourceFiles/chat_helpers/tabbed_section.h"
  "../../Telegram/SourceFiles/chat_helpers/tabbed_selector.h"
  "../../Telegram/SourceFiles/core/application.h"
  "../../Telegram/SourceFiles/core/changelogs.h"
  "../../Telegram/SourceFiles/core/click_handler.h"
  "../../Telegram/SourceFiles/core/click_handler_types.h"
  "../../Telegram/SourceFiles/core/core_cloud_password.h"
  "../../Telegram/SourceFiles/core/crash_report_window.h"
  "../../Telegram/SourceFiles/core/crash_reports.h"
  "../../Telegram/SourceFiles/core/event_filter.h"
  "../../Telegram/SourceFiles/core/file_utilities.h"
  "../../Telegram/SourceFiles/core/launcher.h"
  "../../Telegram/SourceFiles/core/local_url_handlers.h"
  "../../Telegram/SourceFiles/core/main_queue_processor.h"
  "../../Telegram/SourceFiles/core/media_active_cache.h"
  "../../Telegram/SourceFiles/core/mime_type.h"
  "../../Telegram/SourceFiles/core/qt_signal_producer.h"
  "../../Telegram/SourceFiles/core/sandbox.h"
  "../../Telegram/SourceFiles/core/shortcuts.h"
  "../../Telegram/SourceFiles/core/update_checker.h"
  "../../Telegram/SourceFiles/core/utils.h"
  "../../Telegram/SourceFiles/core/version.h"
  "../../Telegram/SourceFiles/data/data_abstract_structure.h"
  "../../Telegram/SourceFiles/data/data_auto_download.h"
  "../../Telegram/SourceFiles/data/data_chat.h"
  "../../Telegram/SourceFiles/data/data_channel.h"
  "../../Telegram/SourceFiles/data/data_channel_admins.h"
  "../../Telegram/SourceFiles/data/data_countries.h"
  "../../Telegram/SourceFiles/data/data_document.h"
  "../../Telegram/SourceFiles/data/data_document_good_thumbnail.h"
  "../../Telegram/SourceFiles/data/data_drafts.h"
  "../../Telegram/SourceFiles/data/data_folder.h"
  "../../Telegram/SourceFiles/data/data_file_origin.h"
  "../../Telegram/SourceFiles/data/data_flags.h"
  "../../Telegram/SourceFiles/data/data_game.h"
  "../../Telegram/SourceFiles/data/data_groups.h"
  "../../Telegram/SourceFiles/data/data_location.h"
  "../../Telegram/SourceFiles/data/data_media_types.h"
  "../../Telegram/SourceFiles/data/data_messages.h"
  "../../Telegram/SourceFiles/data/data_notify_settings.h"
  "../../Telegram/SourceFiles/data/data_peer.h"
  "../../Telegram/SourceFiles/data/data_peer_values.h"
  "../../Telegram/SourceFiles/data/data_photo.h"
  "../../Telegram/SourceFiles/data/data_poll.h"
  "../../Telegram/SourceFiles/data/data_pts_waiter.h"
  "../../Telegram/SourceFiles/data/data_search_controller.h"
  "../../Telegram/SourceFiles/data/data_session.h"
  "../../Telegram/SourceFiles/data/data_shared_media.h"
  "../../Telegram/SourceFiles/data/data_sparse_ids.h"
  "../../Telegram/SourceFiles/data/data_types.h"
  "../../Telegram/SourceFiles/data/data_user.h"
  "../../Telegram/SourceFiles/data/data_user_photos.h"
  "../../Telegram/SourceFiles/data/data_wall_paper.h"
  "../../Telegram/SourceFiles/data/data_web_page.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_entry.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_indexed_list.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_inner_widget.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_key.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_layout.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_list.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_main_list.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_pinned_list.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_row.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_search_from_controllers.h"
  "../../Telegram/SourceFiles/dialogs/dialogs_widget.h"
  "../../Telegram/SourceFiles/export/view/export_view_content.h"
  "../../Telegram/SourceFiles/export/view/export_view_panel_controller.h"
  "../../Telegram/SourceFiles/export/view/export_view_progress.h"
  "../../Telegram/SourceFiles/export/view/export_view_settings.h"
  "../../Telegram/SourceFiles/export/view/export_view_top_bar.h"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_filter.h"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_inner.h"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_item.h"
  "../../Telegram/SourceFiles/history/admin_log/history_admin_log_section.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_call.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_contact.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_document.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_file.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_game.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_gif.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_invoice.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_large_emoji.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_location.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_media.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_media_common.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_media_grouped.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_media_unwrapped.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_photo.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_poll.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_sticker.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_video.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_wall_paper.h"
  "../../Telegram/SourceFiles/history/view/media/history_view_web_page.h"
  "../../Telegram/SourceFiles/history/view/history_view_contact_status.h"
  "../../Telegram/SourceFiles/history/view/history_view_context_menu.h"
  "../../Telegram/SourceFiles/history/view/history_view_cursor_state.h"
  "../../Telegram/SourceFiles/history/view/history_view_element.h"
  "../../Telegram/SourceFiles/history/view/history_view_list_widget.h"
  "../../Telegram/SourceFiles/history/view/history_view_message.h"
  "../../Telegram/SourceFiles/history/view/history_view_object.h"
  "../../Telegram/SourceFiles/history/view/history_view_service_message.h"
  "../../Telegram/SourceFiles/history/view/history_view_top_bar_widget.h"
  "../../Telegram/SourceFiles/history/history.h"
  "../../Telegram/SourceFiles/history/history_drag_area.h"
  "../../Telegram/SourceFiles/history/history_item.h"
  "../../Telegram/SourceFiles/history/history_item_components.h"
  "../../Telegram/SourceFiles/history/history_item_text.h"
  "../../Telegram/SourceFiles/history/history_inner_widget.h"
  "../../Telegram/SourceFiles/history/history_location_manager.h"
  "../../Telegram/SourceFiles/history/history_message.h"
  "../../Telegram/SourceFiles/history/history_service.h"
  "../../Telegram/SourceFiles/history/history_widget.h"
  "../../Telegram/SourceFiles/info/info_content_widget.h"
  "../../Telegram/SourceFiles/info/info_controller.h"
  "../../Telegram/SourceFiles/info/info_layer_widget.h"
  "../../Telegram/SourceFiles/info/info_memento.h"
  "../../Telegram/SourceFiles/info/info_section_widget.h"
  "../../Telegram/SourceFiles/info/info_top_bar.h"
  "../../Telegram/SourceFiles/info/info_wrap_widget.h"
  "../../Telegram/SourceFiles/info/common_groups/info_common_groups_inner_widget.h"
  "../../Telegram/SourceFiles/info/common_groups/info_common_groups_widget.h"
  "../../Telegram/SourceFiles/info/media/info_media_buttons.h"
  "../../Telegram/SourceFiles/info/media/info_media_empty_widget.h"
  "../../Telegram/SourceFiles/info/media/info_media_inner_widget.h"
  "../../Telegram/SourceFiles/info/media/info_media_list_widget.h"
  "../../Telegram/SourceFiles/info/media/info_media_widget.h"
  "../../Telegram/SourceFiles/info/members/info_members_widget.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_actions.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_button.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_cover.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_icon.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_inner_widget.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_members.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_members_controllers.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_text.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_values.h"
  "../../Telegram/SourceFiles/info/profile/info_profile_widget.h"
  "../../Telegram/SourceFiles/info/settings/info_settings_widget.h"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_layout_internal.h"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_layout_item.h"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_result.h"
  "../../Telegram/SourceFiles/inline_bots/inline_bot_send_data.h"
  "../../Telegram/SourceFiles/inline_bots/inline_results_widget.h"
  "../../Telegram/SourceFiles/intro/introwidget.h"
  "../../Telegram/SourceFiles/intro/introcode.h"
  "../../Telegram/SourceFiles/intro/introphone.h"
  "../../Telegram/SourceFiles/intro/intropwdcheck.h"
  "../../Telegram/SourceFiles/intro/introsignup.h"
  "../../Telegram/SourceFiles/intro/introstart.h"
  "../../Telegram/SourceFiles/lang/lang_cloud_manager.h"
  "../../Telegram/SourceFiles/lang/lang_file_parser.h"
  "../../Telegram/SourceFiles/lang/lang_hardcoded.h"
  "../../Telegram/SourceFiles/lang/lang_instance.h"
  "../../Telegram/SourceFiles/lang/lang_keys.h"
  "../../Telegram/SourceFiles/lang/lang_tag.h"
  "../../Telegram/SourceFiles/lang/lang_translator.h"
  "../../Telegram/SourceFiles/lang/lang_values.h"
  "../../Telegram/SourceFiles/main/main_account.h"
  "../../Telegram/SourceFiles/main/main_app_config.h"
  "../../Telegram/SourceFiles/main/main_session.h"
  "../../Telegram/SourceFiles/media/audio/media_audio.h"
  "../../Telegram/SourceFiles/media/audio/media_audio_capture.h"
  "../../Telegram/SourceFiles/media/audio/media_audio_ffmpeg_loader.h"
  "../../Telegram/SourceFiles/media/audio/media_audio_loader.h"
  "../../Telegram/SourceFiles/media/audio/media_audio_loaders.h"
  "../../Telegram/SourceFiles/media/audio/media_audio_track.h"
  "../../Telegram/SourceFiles/media/audio/media_child_ffmpeg_loader.h"
  "../../Telegram/SourceFiles/media/clip/media_clip_check_streaming.h"
  "../../Telegram/SourceFiles/media/clip/media_clip_ffmpeg.h"
  "../../Telegram/SourceFiles/media/clip/media_clip_implementation.h"
  "../../Telegram/SourceFiles/media/clip/media_clip_reader.h"
  "../../Telegram/SourceFiles/media/player/media_player_button.h"
  "../../Telegram/SourceFiles/media/player/media_player_float.h"
  "../../Telegram/SourceFiles/media/player/media_player_instance.h"
  "../../Telegram/SourceFiles/media/player/media_player_panel.h"
  "../../Telegram/SourceFiles/media/player/media_player_volume_controller.h"
  "../../Telegram/SourceFiles/media/player/media_player_widget.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_audio_track.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_common.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_file.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_file_delegate.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_loader.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_loader_local.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_loader_mtproto.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_player.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_reader.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_utility.h"
  "../../Telegram/SourceFiles/media/streaming/media_streaming_video_track.h"
  "../../Telegram/SourceFiles/media/view/media_view_playback_controls.h"
  "../../Telegram/SourceFiles/media/view/media_view_playback_progress.h"
  "../../Telegram/SourceFiles/media/view/media_view_group_thumbs.h"
  "../../Telegram/SourceFiles/media/view/media_view_overlay_widget.h"
  "../../Telegram/SourceFiles/mtproto/auth_key.h"
  "../../Telegram/SourceFiles/mtproto/concurrent_sender.h"
  "../../Telegram/SourceFiles/mtproto/config_loader.h"
  "../../Telegram/SourceFiles/mtproto/connection.h"
  "../../Telegram/SourceFiles/mtproto/connection_abstract.h"
  "../../Telegram/SourceFiles/mtproto/connection_http.h"
  "../../Telegram/SourceFiles/mtproto/connection_resolving.h"
  "../../Telegram/SourceFiles/mtproto/connection_tcp.h"
  "../../Telegram/SourceFiles/mtproto/core_types.h"
  "../../Telegram/SourceFiles/mtproto/dcenter.h"
  "../../Telegram/SourceFiles/mtproto/dc_options.h"
  "../../Telegram/SourceFiles/mtproto/dedicated_file_loader.h"
  "../../Telegram/SourceFiles/mtproto/facade.h"
  "../../Telegram/SourceFiles/mtproto/mtp_instance.h"
  "../../Telegram/SourceFiles/mtproto/rsa_public_key.h"
  "../../Telegram/SourceFiles/mtproto/rpc_sender.h"
  "../../Telegram/SourceFiles/mtproto/sender.h"
  "../../Telegram/SourceFiles/mtproto/session.h"
  "../../Telegram/SourceFiles/mtproto/special_config_request.h"
  "../../Telegram/SourceFiles/mtproto/type_utils.h"
  "../../Telegram/SourceFiles/overview/overview_layout.h"
  "../../Telegram/SourceFiles/passport/passport_encryption.h"
  "../../Telegram/SourceFiles/passport/passport_form_controller.h"
  "../../Telegram/SourceFiles/passport/passport_form_view_controller.h"
  "../../Telegram/SourceFiles/passport/passport_panel.h"
  "../../Telegram/SourceFiles/passport/passport_panel_controller.h"
  "../../Telegram/SourceFiles/passport/passport_panel_details_row.h"
  "../../Telegram/SourceFiles/passport/passport_panel_edit_contact.h"
  "../../Telegram/SourceFiles/passport/passport_panel_edit_document.h"
  "../../Telegram/SourceFiles/passport/passport_panel_edit_scans.h"
  "../../Telegram/SourceFiles/passport/passport_panel_form.h"
  "../../Telegram/SourceFiles/passport/passport_panel_password.h"
  "../../Telegram/SourceFiles/platform/linux/linux_desktop_environment.h"
  "../../Telegram/SourceFiles/platform/linux/linux_gdk_helper.h"
  "../../Telegram/SourceFiles/platform/linux/linux_libnotify.h"
  "../../Telegram/SourceFiles/platform/linux/linux_libs.h"
  "../../Telegram/SourceFiles/platform/linux/file_utilities_linux.h"
  "../../Telegram/SourceFiles/platform/linux/info_linux.h"
  "../../Telegram/SourceFiles/platform/linux/launcher_linux.h"
  "../../Telegram/SourceFiles/platform/linux/main_window_linux.h"
  "../../Telegram/SourceFiles/platform/linux/notifications_manager_linux.h"
  "../../Telegram/SourceFiles/platform/linux/specific_linux.h"
  "../../Telegram/SourceFiles/platform/platform_audio.h"
  "../../Telegram/SourceFiles/platform/platform_file_utilities.h"
  "../../Telegram/SourceFiles/platform/platform_info.h"
  "../../Telegram/SourceFiles/platform/platform_launcher.h"
  "../../Telegram/SourceFiles/platform/platform_main_window.h"
  "../../Telegram/SourceFiles/platform/platform_notifications_manager.h"
  "../../Telegram/SourceFiles/platform/platform_specific.h"
  "../../Telegram/SourceFiles/platform/platform_window_title.h"
  "../../Telegram/SourceFiles/profile/profile_back_button.h"
  "../../Telegram/SourceFiles/profile/profile_block_group_members.h"
  "../../Telegram/SourceFiles/profile/profile_block_peer_list.h"
  "../../Telegram/SourceFiles/profile/profile_block_widget.h"
  "../../Telegram/SourceFiles/profile/profile_cover_drop_area.h"
  "../../Telegram/SourceFiles/settings/settings_advanced.h"
  "../../Telegram/SourceFiles/settings/settings_chat.h"
  "../../Telegram/SourceFiles/settings/settings_calls.h"
  "../../Telegram/SourceFiles/settings/settings_codes.h"
  "../../Telegram/SourceFiles/settings/settings_common.h"
  "../../Telegram/SourceFiles/settings/settings_information.h"
  "../../Telegram/SourceFiles/settings/settings_intro.h"
  "../../Telegram/SourceFiles/settings/settings_main.h"
  "../../Telegram/SourceFiles/settings/settings_notifications.h"
  "../../Telegram/SourceFiles/settings/settings_privacy_controllers.h"
  "../../Telegram/SourceFiles/settings/settings_privacy_security.h"
  "../../Telegram/SourceFiles/storage/file_download.h"
  "../../Telegram/SourceFiles/storage/file_upload.h"
  "../../Telegram/SourceFiles/storage/localimageloader.h"
  "../../Telegram/SourceFiles/storage/localstorage.h"
  "../../Telegram/SourceFiles/storage/serialize_common.h"
  "../../Telegram/SourceFiles/storage/serialize_document.h"
  "../../Telegram/SourceFiles/storage/storage_facade.h"
  "../../Telegram/SourceFiles/storage/storage_media_prepare.h"
  "../../Telegram/SourceFiles/storage/storage_shared_media.h"
  "../../Telegram/SourceFiles/storage/storage_sparse_ids_list.h"
  "../../Telegram/SourceFiles/storage/storage_user_photos.h"
  "../../Telegram/SourceFiles/storage/streamed_file_downloader.h"
  "../../Telegram/SourceFiles/support/support_autocomplete.h"
  "../../Telegram/SourceFiles/support/support_common.h"
  "../../Telegram/SourceFiles/support/support_helper.h"
  "../../Telegram/SourceFiles/support/support_templates.h"
  "../../Telegram/SourceFiles/ui/effects/animations.h"
  "../../Telegram/SourceFiles/ui/effects/cross_animation.h"
  "../../Telegram/SourceFiles/ui/effects/fade_animation.h"
  "../../Telegram/SourceFiles/ui/effects/numbers_animation.h"
  "../../Telegram/SourceFiles/ui/effects/panel_animation.h"
  "../../Telegram/SourceFiles/ui/effects/radial_animation.h"
  "../../Telegram/SourceFiles/ui/effects/ripple_animation.h"
  "../../Telegram/SourceFiles/ui/effects/round_checkbox.h"
  "../../Telegram/SourceFiles/ui/effects/send_action_animations.h"
  "../../Telegram/SourceFiles/ui/effects/slide_animation.h"
  "../../Telegram/SourceFiles/ui/image/image.h"
  "../../Telegram/SourceFiles/ui/image/image_location.h"
  "../../Telegram/SourceFiles/ui/image/image_prepare.h"
  "../../Telegram/SourceFiles/ui/image/image_source.h"
  "../../Telegram/SourceFiles/ui/style/style_core.h"
  "../../Telegram/SourceFiles/ui/style/style_core_color.h"
  "../../Telegram/SourceFiles/ui/style/style_core_font.h"
  "../../Telegram/SourceFiles/ui/style/style_core_icon.h"
  "../../Telegram/SourceFiles/ui/style/style_core_types.h"
  "../../Telegram/SourceFiles/ui/text/text.h"
  "../../Telegram/SourceFiles/ui/text/text_block.h"
  "../../Telegram/SourceFiles/ui/text/text_entity.h"
  "../../Telegram/SourceFiles/ui/text/text_isolated_emoji.h"
  "../../Telegram/SourceFiles/ui/text/text_utilities.h"
  "../../Telegram/SourceFiles/ui/toast/toast.h"
  "../../Telegram/SourceFiles/ui/toast/toast_manager.h"
  "../../Telegram/SourceFiles/ui/toast/toast_widget.h"
  "../../Telegram/SourceFiles/ui/widgets/buttons.h"
  "../../Telegram/SourceFiles/ui/widgets/checkbox.h"
  "../../Telegram/SourceFiles/ui/widgets/continuous_sliders.h"
  "../../Telegram/SourceFiles/ui/widgets/discrete_sliders.h"
  "../../Telegram/SourceFiles/ui/widgets/dropdown_menu.h"
  "../../Telegram/SourceFiles/ui/widgets/inner_dropdown.h"
  "../../Telegram/SourceFiles/ui/widgets/input_fields.h"
  "../../Telegram/SourceFiles/ui/widgets/labels.h"
  "../../Telegram/SourceFiles/ui/widgets/level_meter.h"
  "../../Telegram/SourceFiles/ui/widgets/menu.h"
  "../../Telegram/SourceFiles/ui/widgets/multi_select.h"
  "../../Telegram/SourceFiles/ui/widgets/popup_menu.h"
  "../../Telegram/SourceFiles/ui/widgets/separate_panel.h"
  "../../Telegram/SourceFiles/ui/widgets/scroll_area.h"
  "../../Telegram/SourceFiles/ui/widgets/shadow.h"
  "../../Telegram/SourceFiles/ui/widgets/tooltip.h"
  "../../Telegram/SourceFiles/ui/wrap/fade_wrap.h"
  "../../Telegram/SourceFiles/ui/wrap/padding_wrap.h"
  "../../Telegram/SourceFiles/ui/wrap/slide_wrap.h"
  "../../Telegram/SourceFiles/ui/wrap/vertical_layout.h"
  "../../Telegram/SourceFiles/ui/wrap/wrap.h"
  "../../Telegram/SourceFiles/ui/abstract_button.h"
  "../../Telegram/SourceFiles/ui/animation.h"
  "../../Telegram/SourceFiles/ui/countryinput.h"
  "../../Telegram/SourceFiles/ui/emoji_config.h"
  "../../Telegram/SourceFiles/ui/empty_userpic.h"
  "../../Telegram/SourceFiles/ui/focus_persister.h"
  "../../Telegram/SourceFiles/ui/grouped_layout.h"
  "../../Telegram/SourceFiles/ui/resize_area.h"
  "../../Telegram/SourceFiles/ui/rp_widget.h"
  "../../Telegram/SourceFiles/ui/search_field_controller.h"
  "../../Telegram/SourceFiles/ui/special_buttons.h"
  "../../Telegram/SourceFiles/ui/text_options.h"
  "../../Telegram/SourceFiles/ui/twidget.h"
  "../../Telegram/SourceFiles/ui/unread_badge.h"
  "../../Telegram/SourceFiles/window/layer_widget.h"
  "../../Telegram/SourceFiles/window/main_window.h"
  "../../Telegram/SourceFiles/window/notifications_manager.h"
  "../../Telegram/SourceFiles/window/notifications_manager_default.h"
  "../../Telegram/SourceFiles/window/notifications_utilities.h"
  "../../Telegram/SourceFiles/window/section_memento.h"
  "../../Telegram/SourceFiles/window/section_widget.h"
  "../../Telegram/SourceFiles/window/window_connecting_widget.h"
  "../../Telegram/SourceFiles/window/window_controller.h"
  "../../Telegram/SourceFiles/window/window_history_hider.h"
  "../../Telegram/SourceFiles/window/window_lock_widgets.h"
  "../../Telegram/SourceFiles/window/window_main_menu.h"
  "../../Telegram/SourceFiles/window/window_outdated_bar.h"
  "../../Telegram/SourceFiles/window/window_peer_menu.h"
  "../../Telegram/SourceFiles/window/window_session_controller.h"
  "../../Telegram/SourceFiles/window/window_slide_animation.h"
  "../../Telegram/SourceFiles/window/window_title.h"
  "../../Telegram/SourceFiles/window/window_top_bar_wrap.h"
  "../../Telegram/SourceFiles/window/themes/window_theme.h"
  "../../Telegram/SourceFiles/window/themes/window_theme_editor.h"
  "../../Telegram/SourceFiles/window/themes/window_theme_editor_block.h"
  "../../Telegram/SourceFiles/window/themes/window_theme_preview.h"
  "../../Telegram/SourceFiles/window/themes/window_theme_warning.h"
  "../../Telegram/SourceFiles/apiwrap.h"
  "../../Telegram/SourceFiles/app.h"
  "../../Telegram/SourceFiles/config.h"
  "../../Telegram/SourceFiles/facades.h"
  "../../Telegram/SourceFiles/layout.h"
  "../../Telegram/SourceFiles/logs.h"
  "../../Telegram/SourceFiles/mainwidget.h"
  "../../Telegram/SourceFiles/mainwindow.h"
  "../../Telegram/SourceFiles/observer_peer.h"
  "../../Telegram/SourceFiles/settings.h"
  "../../Telegram/ThirdParty/emoji_suggestions/emoji_suggestions.h"
  "../../Telegram/ThirdParty/minizip/crypt.h"
  "../../Telegram/ThirdParty/minizip/ioapi.h"
  "../../Telegram/ThirdParty/minizip/zip.h"
  "../../Telegram/ThirdParty/minizip/unzip.h"
  "../../Telegram/gyp/telegram_sources.txt"
  "../../Telegram/Resources/langs/cloud_lang.strings"
  "../../Telegram/Resources/export_html/css/style.css"
  "../../Telegram/Resources/export_html/js/script.js"
  "../../Telegram/Resources/export_html/images/back.png"
  "../../Telegram/Resources/export_html/images/back@2x.png"
  "../../Telegram/SourceFiles/stdafx.h"
  "${obj}/gen/styles/palette.h"
  "${obj}/gen/lang_auto.h"
  "${obj}/gen/numbers.h"
  "${obj}/gen/emoji.h"
  "${obj}/gen/emoji_suggestions_data.h"
  "${Telegram__codegen_style_0_0}"
  "${Telegram__codegen_style_1_0}"
  "${Telegram__codegen_style_2_0}"
  "${Telegram__codegen_style_3_0}"
  "${Telegram__codegen_style_4_0}"
  "${Telegram__codegen_style_5_0}"
  "${Telegram__codegen_style_6_0}"
  "${Telegram__codegen_style_7_0}"
  "${Telegram__codegen_style_8_0}"
  "${Telegram__codegen_style_9_0}"
  "${Telegram__codegen_style_10_0}"
  "${Telegram__codegen_style_11_0}"
  "${Telegram__codegen_style_12_0}"
  "${Telegram__codegen_style_13_0}"
  "${Telegram__codegen_style_14_0}"
  "${Telegram__codegen_style_15_0}"
  "${Telegram__codegen_style_16_0}")
link_directories( /tdesktop/build/qt/lib
 /tdesktop/build/qt/plugins
 /tdesktop/build/qt/plugins/bearer
 /tdesktop/build/qt/plugins/platforms
 /tdesktop/build/qt/plugins/imageformats
 /usr/local/lib
 /tdesktop/build/ffmpeg/lib
 /tdesktop/build/openal-soft/lib
 /tdesktop/build/libva/lib
 /tdesktop/build/libvdpau/lib
 /tdesktop/build/breakpad/lib
 /tdesktop/build/qt/plugins/platforminputcontexts
 ../../../Libraries/crashpad/out/Debug
)
add_executable(Telegram ${Telegram__c_srcs} ${Telegram__cxx_srcs} ${Telegram__other_srcs})
set_target_properties(Telegram PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__update_dependent_styles PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__update_dependent_qrc PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__codegen_palette PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__codegen_lang PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__codegen_numbers PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__codegen_emoji PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__qt_moc PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__qt_rcc PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_target_properties(Telegram__codegen_style PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${Telegram__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(Telegram PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${builddir}")
set_target_properties(Telegram PROPERTIES PREFIX "")
set_target_properties(Telegram PROPERTIES RUNTIME_OUTPUT_NAME "Telegram")
set_target_properties(Telegram PROPERTIES SUFFIX "")
set_source_files_properties(${builddir}/Telegram PROPERTIES GENERATED "TRUE")
list(APPEND Telegram__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/SourceFiles"
  "${obj}/gen"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/breakpad/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/lzma/C"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/zlib"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/ffmpeg"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/openal-soft/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/opus/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/range-v3/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/minizip"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/SPMediaKeyTap"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/emoji_suggestions"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/GSL/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/variant/include"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/crl/src"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/xxHash"
  "/tdesktop/build/qt/include"
  "/tdesktop/build/qt/include/QtCore"
  "/tdesktop/build/qt/include/QtGui"
  "/tdesktop/build/qt/include/QtDBus"
  "/tdesktop/build/qt/include/QtCore/5.6.2"
  "/tdesktop/build/qt/include/QtGui/5.6.2"
  "/tdesktop/build/qt/include/QtCore/5.6.2/QtCore"
  "/tdesktop/build/qt/include/QtGui/5.6.2/QtGui"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/crashpad"
  "${CMAKE_CURRENT_LIST_DIR}/../../../Libraries/crashpad/third_party/mini_chromium/mini_chromium"
  "/usr/local/include"
  "/tdesktop/build/ffmpeg/include"
  "/tdesktop/build/openal-soft/include"
  "/tdesktop/build/breakpad/include/breakpad"
  "/usr/include/opus"
  "/tdesktop/build/range-v3/include"
  "/tdesktop/build/qt/mkspecs/linux-g++"
  "${CMAKE_CURRENT_LIST_DIR}/../../Telegram/ThirdParty/libtgvoip")
set_property(TARGET Telegram APPEND PROPERTY INCLUDE_DIRECTORIES ${Telegram__include_dirs})
set_target_properties(Telegram PROPERTIES COMPILE_DEFINITIONS "AL_LIBTYPE_STATIC;AL_ALEXT_PROTOTYPES;TGVOIP_USE_CXX11_LIB;XXH_INLINE_ALL;TDESKTOP_API_ID=17349;TDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb;NOMINMAX;QT_WIDGETS_LIB;QT_NETWORK_LIB;QT_GUI_LIB;QT_CORE_LIB;_REENTRANT;QT_STATICPLUGIN;QT_PLUGIN;Q_OS_LINUX64;_DEBUG;")
set_source_files_properties(${Telegram__c_srcs} PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=gnu11 -g ")
set_source_files_properties(${Telegram__cxx_srcs} PROPERTIES COMPILE_FLAGS "-pipe -Wall -Werror -W -fPIC -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-switch -Wno-comment -Wno-unused-but-set-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-attributes -Wno-error=class-memaccess -Wno-error=parentheses -std=c++1z -Wno-register -g -Wno-strict-overflow -Wno-maybe-uninitialized -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/dee-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -pthread -I/usr/include/libappindicator-0.1 -I/usr/include/libdbusmenu-glib-0.4 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 ")
set_target_properties(Telegram PROPERTIES LINK_FLAGS "-g -Wl,-wrap,aligned_alloc -Wl,-wrap,secure_getenv -Wl,-wrap,clock_gettime -Wl,--no-as-needed,-lrt -static-libstdc++ -pthread -rdynamic ")
set_target_properties(Telegram PROPERTIES XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK "YES")
set_target_properties(Telegram PROPERTIES XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
set_target_properties(Telegram PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "../SourceFiles/stdafx.h")
set_target_properties(Telegram PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-framework VideoToolbox -framework VideoDecodeAcceleration -framework AVFoundation -framework CoreMedia /usr/local/lib/libz.a /usr/local/lib/libopus.a /usr/local/lib/libopenal.a /usr/local/lib/libiconv.a /usr/local/lib/libavcodec.a /usr/local/lib/libavformat.a /usr/local/lib/libavutil.a /usr/local/lib/libswscale.a /usr/local/lib/libswresample.a -lbase -lcrashpad_client -lcrashpad_util ")
set_target_properties(Telegram PROPERTIES XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.tdesktop.TelegramDebug")
set_target_properties(Telegram PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
add_dependencies(Telegram__update_dependent_styles
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__update_dependent_qrc
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__codegen_palette
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__codegen_lang
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__codegen_numbers
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__codegen_emoji
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__qt_moc
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__qt_rcc
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram__codegen_style
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
)
add_dependencies(Telegram
  codegen_emoji
  codegen_lang
  codegen_numbers
  codegen_style
  tests
  Updater
  Telegram__update_dependent_styles
  Telegram__update_dependent_qrc
  Telegram__codegen_palette
  Telegram__codegen_lang
  Telegram__codegen_numbers
  Telegram__codegen_emoji
  Telegram__qt_moc
  Telegram__qt_rcc
  Telegram__codegen_style
)
target_link_libraries(Telegram
-Wl,--start-group
  libtgvoip
  crl
  lib_base
  lib_export
  lib_storage
  lib_lottie
  lib_ffmpeg
  lib_mtproto
  linux_glibc_wraps
  lib_scheme
  lib_rlottie
  lib_lz4
-Wl,--end-group
  "breakpad_client"
  "composeplatforminputcontextplugin"
  "ibusplatforminputcontextplugin"
  "fcitxplatforminputcontextplugin"
  "himeplatforminputcontextplugin"
  "nimfplatforminputcontextplugin"
  "liblzma.a"
  "libopenal.a"
  "libavformat.a"
  "libavcodec.a"
  "libswresample.a"
  "libswscale.a"
  "libavutil.a"
  "libopus.a"
  "libva-x11.a"
  "libva-drm.a"
  "libva.a"
  "libvdpau.a"
  "libdrm.a"
  "libz.a"
  "${builddir}/obj.target/liblinux_glibc_wraps.a"
  "/tdesktop/build/libxkbcommon/lib/libxkbcommon.a"
  "libqxcb.a"
  "libQt5XcbQpa.a"
  "libqconnmanbearer.a"
  "libqgenericbearer.a"
  "libqnmbearer.a"
  "libqwebp.a"
  "libQt5PrintSupport.a"
  "libQt5PlatformSupport.a"
  "libQt5Network.a"
  "libQt5Widgets.a"
  "libQt5Gui.a"
  "libqtharfbuzzng.a"
  "libQt5DBus.a"
  "libQt5Core.a"
  "libqtpcre.a"
  "libXi.a"
  "libXext.a"
  "libXfixes.a"
  "libSM.a"
  "libICE.a"
  "libfontconfig.a"
  "libexpat.a"
  "libfreetype.a"
  "libxcb-shm.a"
  "libxcb-xfixes.a"
  "libxcb-render.a"
  "libxcb-static.a"
  "-lssl"
  "-lcrypto"
  "-licuuc"
  "-licutu"
  "-licui18n"
  "-lxcb"
  "-lX11"
  "-lX11-xcb"
  "-ldbus-1"
  "-ldl"
  "-lgthread-2.0"
  "-lglib-2.0"
  "-lpthread"
)
include(${CMAKE_CURRENT_LIST_DIR}/../../Telegram/gyp/PrecompiledHeader.cmake)
add_precompiled_header(Telegram ../../Telegram/SourceFiles/stdafx.h)
unset(TOOLSET)
unset(TARGET)
