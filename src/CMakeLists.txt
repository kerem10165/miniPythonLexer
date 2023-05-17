
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})

file(GLOB H_FILES *.h)
file(GLOB SRC_FILES *.cpp)
file(GLOB HXX_FILES *.hxx)
file(GLOB HXX_FILES *.hpp)


find_package(FLEX)

flex_target(Scanner scan.l ${CMAKE_CURRENT_BINARY_DIR}/scanner.cpp)


add_library(parser
            STATIC
            ${FLEX_Scanner_OUTPUTS}
            ${H_FILES}
            ${SRC_FILES}
            ${HXX_FILES}
)
