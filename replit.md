# Linux Cleaner

## Project Overview

**Linux Cleaner** is a modern, user-friendly GUI application for system cleanup and maintenance on Linux systems. This is a complete rebrand from the original mx-cleanup project, now owned and maintained by WHO-AM-I-404.

## Project Information

- **Name**: Linux Cleaner
- **Version**: 1.0.0
- **Author**: WHO-AM-I-404
- **License**: GPL-3.0+
- **Language**: C++ with Qt6
- **Repository**: https://github.com/WHO-AM-I-404/linux-cleaner

## Architecture

### Technology Stack
- **Framework**: Qt6 (Core, Gui, Widgets)
- **Build System**: CMake 3.16+ with Ninja
- **Compiler**: GCC 14+ (primary) or Clang 14+
- **Graphics**: OpenGL via libglvnd
- **Desktop Environment**: VNC-based GUI for Replit

### Project Structure
```
linux-cleaner/
├── main.cpp              # Application entry point
├── mainwindow.{cpp,h,ui} # Main window implementation
├── about.{cpp,h}         # About dialog functionality
├── common.h              # Common utilities
├── CMakeLists.txt        # Build configuration
├── build.sh              # Build script with options
├── translations/         # Multi-language support
├── images/               # Application icons
├── help/                 # Documentation
├── debian/               # Debian packaging
└── scripts/              # Helper scripts and policies
```

### Key Features
1. **APT Cache Cleaning** - Remove old or all cached packages
2. **Trash Management** - Empty trash with age filtering
3. **System Logs Cleanup** - Delete logs by age
4. **User Folders Cleanup** - Clean cache and thumbnails
5. **Flatpak Management** - Remove unused runtimes
6. **Package Configuration Cleanup** - Purge residual configs
7. **Automated Scheduling** - Daily, weekly, monthly cleanup
8. **Additional Tools**:
   - Unused WiFi drivers removal
   - Kernel management
   - System manuals cleanup
   - Disk usage analyzer

## Build Instructions

### Quick Build
```bash
./build.sh
```

### Build Options
```bash
./build.sh --debug      # Debug build
./build.sh --clean      # Clean build
./build.sh --clang      # Use Clang compiler
./build.sh --debian     # Build Debian package
```

### Manual Build
```bash
mkdir build
CXX=g++ CC=gcc \
CMAKE_PREFIX_PATH="/path/to/libglvnd-dev:/path/to/libglvnd:$CMAKE_PREFIX_PATH" \
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DOpenGL_GL_PREFERENCE=GLVND
cmake --build build --parallel
```

### Build Output
- **Executable**: `linux-cleaner` (in project root)
- **Translations**: `build/linux-cleaner_*.qm`
- **Debian Package**: `debs/linux-cleaner_*.deb`

## Running the Application

### On Replit (VNC)
The application runs in a VNC environment on Replit:
```bash
# Workflow automatically starts VNC and the application
# Access via VNC viewer in the Replit interface
```

### On Local Linux System
```bash
./linux-cleaner
# Or after installation:
linux-cleaner
```

**Note**: Some operations require root privileges and will prompt for authentication.

## Development Notes

### Dependencies
- Qt6 Base (Core, Gui, Widgets, LinguistTools)
- CMake >= 3.16
- Ninja build system
- GCC or Clang C++ compiler
- OpenGL libraries (libglvnd)
- dpkg-parsechangelog (for version extraction)

### Build System Peculiarities
1. **OpenGL on NixOS**: Requires explicit CMAKE_PREFIX_PATH for libglvnd
2. **GCC vs Clang**: Use GCC for compatibility with Qt6 standard library
3. **Translation Files**: Automatically renamed from mx-cleanup_*.ts to linux-cleaner_*.ts
4. **Version Detection**: Extracted from debian/changelog via dpkg-parsechangelog

### Code Style
- Modern C++20
- Qt best practices
- Pedantic warnings enabled
- All warnings treated as errors
- Link-time optimization (LTO) in Release mode

## Rebranding Changes

Complete rebranding from mx-cleanup to Linux Cleaner by WHO-AM-I-404:
- ✅ All copyright headers updated
- ✅ Project name changed throughout codebase
- ✅ GUI labels and text modernized
- ✅ Translation files renamed
- ✅ Build system updated
- ✅ Debian packaging reconfigured
- ✅ Help documentation rewritten
- ✅ Policy files updated
- ✅ About dialog updated
- ✅ All MX Linux references removed

## Testing

### Build Verification
```bash
# Test compilation
./build.sh --clean

# Check for errors/warnings
cmake --build build 2>&1 | grep -i "error\|warning"

# Verify executable
file linux-cleaner
ldd linux-cleaner
```

### Functional Testing
1. Launch application
2. Test each cleanup option
3. Verify scheduling functionality
4. Check disk usage analyzer integration
5. Test help documentation display

## Deployment

### Debian Package
```bash
./build.sh --debian
sudo dpkg -i debs/linux-cleaner_*.deb
```

### Manual Installation
```bash
sudo cmake --install build
```

## Recent Changes (v1.0.0)

- Complete rebrand from mx-cleanup to Linux Cleaner
- New modern GUI design
- Updated all copyright to WHO-AM-I-404
- Comprehensive documentation
- Full GPL-3.0+ compliance
- Enhanced build system
- Multi-language support maintained
- Security improvements

## User Preferences

- **Build System**: CMake with Ninja (fast parallel builds)
- **Compiler**: GCC (best Qt6 compatibility)
- **Code Quality**: Pedantic warnings, all warnings as errors
- **Optimization**: LTO enabled for Release builds
- **Documentation**: Comprehensive inline and external docs

## Contributing

Contributions welcome! Please ensure:
1. Code follows project style
2. All warnings resolved
3. Build passes with `./build.sh`
4. Functionality tested
5. Documentation updated

## License

GNU General Public License v3.0 or later
Copyright (C) 2025 WHO-AM-I-404

See LICENSE file for full license text.
