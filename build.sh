#!/bin/bash
# Build Script for Linux Clean Up
# Copyright (C) 2025 WHO-AM-I-404

set -e

echo "========================================="
echo " Linux Clean Up - Build Script"
echo " Version 1.0.1"
echo "========================================="
echo ""

# Default values
BUILD_DIR="build"
BUILD_TYPE="Release"
USE_CLANG=false
CLEAN=false
DEBIAN_BUILD=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--debug)
            BUILD_TYPE="Debug"
            shift
            ;;
        -c|--clang)
            USE_CLANG=true
            shift
            ;;
        --clean)
            CLEAN=true
            shift
            ;;
        --debian)
            DEBIAN_BUILD=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  -d, --debug     Build in Debug mode (default: Release)"
            echo "  -c, --clang     Use clang compiler"
            echo "  --clean         Clean build directory before building"
            echo "  --debian        Build Debian package"
            echo "  -h, --help      Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0              # Quick build (recommended)"
            echo "  $0 --clean      # Clean build"
            echo "  $0 --debug      # Debug build"
            echo "  $0 --debian     # Build Debian package"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Build Debian package
if [ "$DEBIAN_BUILD" = true ]; then
    echo "Building Debian package..."
    debuild -us -uc

    echo "Creating debs directory and moving debian artifacts..."
    mkdir -p debs
    mv ../*.deb debs/ 2>/dev/null || true
    mv ../*.changes debs/ 2>/dev/null || true  
    mv ../*.dsc debs/ 2>/dev/null || true
    mv ../*.tar.* debs/ 2>/dev/null || true
    mv ../*.buildinfo debs/ 2>/dev/null || true
    mv ../*build* debs/ 2>/dev/null || true

    echo "Cleaning build directory and debian artifacts..."
    rm -rf "$BUILD_DIR"
    rm -f debian/*.debhelper.log debian/*.substvars debian/files
    rm -rf debian/.debhelper/ debian/deb-installer/ obj-*/
    rm -f translations/*.qm version.h
    rm -f ../*build* ../*.buildinfo 2>/dev/null || true

    echo "Debian package build completed!"
    echo "Debian artifacts moved to debs/ directory"
    exit 0
fi

# Clean build directory if requested
if [ "$CLEAN" = true ]; then
    echo "Cleaning build directory and debian artifacts..."
    rm -rf "$BUILD_DIR"
    rm -f debian/*.debhelper.log debian/*.substvars debian/files
    rm -rf debian/.debhelper/ debian/deb-installer/ obj-*/
    rm -f translations/*.qm version.h
    rm -f ../*build* ../*.buildinfo 2>/dev/null || true
fi

# Create build directory
echo "Creating build directory..."
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Configure CMake with Unix Makefiles
echo ""
echo "Configuring CMake with Unix Makefiles generator..."
CMAKE_ARGS=(
    -G "Unix Makefiles"
    -DCMAKE_BUILD_TYPE="$BUILD_TYPE"
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
)

if [ "$USE_CLANG" = true ]; then
    CMAKE_ARGS+=(-DUSE_CLANG=ON)
    echo "Using clang compiler"
fi

# Set OpenGL library path for NixOS/Replit compatibility (optional)
CMAKE_PREFIX_PATH="/nix/store/7227amwg7k4sbl6mhglq17v5x5ki54ks-libglvnd-1.7.0:/nix/store/akn28bf4vh2q3p2czwkm37acmf33bvgd-libglvnd-1.7.0-dev:$CMAKE_PREFIX_PATH" \
cmake "${CMAKE_ARGS[@]}" ..

# Build the project
echo ""
echo "Building Linux Clean Up..."
echo "(Compiling with all CPU cores...)"
make -j"$(nproc)"

cd ..

echo ""
echo "========================================="
echo " ✓ Build completed successfully!"
echo "========================================="
echo ""
echo "Executable location: ./linux-cleaner"
echo "To run: ./linux-cleaner"
echo ""
