# Linux Cleaner

Modern GUI application for system cleanup and maintenance on Linux systems.

![Linux Cleaner](https://github.com/WHO-AM-I-404/linux-cleaner/assets/linux-cleaner-screenshot.png)

## Overview

Linux Cleaner is a powerful, user-friendly graphical tool designed to help you maintain your Linux system by safely removing unnecessary files and freeing up disk space.

## Features

- **APT Cache Cleaning** - Remove old or all cached package files
- **Trash Management** - Empty trash for selected user or all users with age filtering
- **System Logs Cleanup** - Delete old or all system logs
- **User Folders Cleanup** - Clean cache and thumbnails with age-based filtering
- **Flatpak Management** - Remove unused Flatpak runtimes
- **Package Configuration Cleanup** - Purge residual configurations from removed packages
- **Automated Scheduling** - Schedule cleanup tasks (reboot, daily, weekly, monthly)
- **Additional Tools**:
  - Remove unused WiFi drivers
  - Kernel management and removal
  - System manuals language cleanup
  - Integrated disk usage analyzer

## Building from Source

### Requirements

- CMake >= 3.16
- Qt6 (Core, Gui, Widgets)
- Ninja build system
- GCC or Clang compiler
- OpenGL libraries (libglvnd)

### Build Instructions

```bash
# Clone the repository
git clone https://github.com/WHO-AM-I-404/linux-cleaner.git
cd linux-cleaner

# Build using the provided script
./build.sh

# Or build manually
mkdir build
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel

# The executable will be: build/linux-cleaner
```

### Build Options

```bash
# Debug build
./build.sh --debug

# Clean build
./build.sh --clean

# Use Clang compiler
./build.sh --clang

# Build Debian package
./build.sh --debian
```

## Installation

### From Debian Package

```bash
cd debs
sudo dpkg -i linux-cleaner_*.deb
sudo apt-get install -f  # Install dependencies if needed
```

### From Source

```bash
sudo cmake --install build
```

## Usage

Launch Linux Cleaner from your application menu or run from terminal:

```bash
linux-cleaner
```

**Note**: Some cleanup operations require administrative privileges. The application will prompt for authentication when needed.

## Multi-Language Support

Linux Cleaner supports multiple languages including:
- English, Spanish, French, German, Italian, Portuguese
- Chinese (Simplified & Traditional), Japanese, Korean
- Russian, Polish, Czech, and many more

## License

Linux Cleaner is free software licensed under the GNU General Public License v3.0 or later.

Copyright (C) 2025 WHO-AM-I-404

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues on the GitHub repository.

## Author

**WHO-AM-I-404**

GitHub: https://github.com/WHO-AM-I-404/linux-cleaner
