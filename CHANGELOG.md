# Changelog

All notable changes to this project will be documented in this file.

## [1.0.1] - 2025-10-04

### 🎉 Major Changes
- **Removed Authentication**: Application no longer requires authentication for easier usage
- **Modern GUI**: New design with Material Design blue theme (#2196F3)
- **Cleaner Interface**: License and Help buttons removed for simpler appearance

### ✨ New Features
- Embedded version in CMakeLists.txt (no external file dependencies)
- Easy build script for beginners (`quick-build.sh`)
- Complete and structured documentation

### 🎨 Design & UI
- Light gray background (#f5f5f5) for modern look
- GroupBox with rounded borders and blue titles
- Modern tab style with hover effects
- Material Design colored buttons with hover animations
- Updated window title: "Linux Clean Up - System Maintenance"

### 🔧 Build System Improvements
- No longer depends on dpkg-parsechangelog for versioning
- Version embedded directly in CMakeLists.txt
- OpenGL GLVND support for NixOS/Replit compatibility
- More user-friendly build scripts

### 📝 Documentation
- Complete build guide for beginners
- Comprehensive troubleshooting guide
- Detailed project structure explanation
- CHANGELOG.md for version tracking

### 🔄 Rebranding
- All "mx cleanup" references changed to "linux clean up"
- Copyright updated to WHO-AM-I-404 in all files

---

## [1.0.0] - 2025-10-04

### 🚀 Initial Release
Initial release of Linux Clean Up (rebranded from mx-cleanup)

### Main Features
- **APT Cache Cleanup**: Remove old or all package cache files
- **Trash Management**: Empty trash per-user or all users with age filtering
- **System Logs Cleanup**: Delete logs with age filtering
- **User Folders Cleanup**: Clean cache and thumbnails
- **Flatpak Management**: Remove unused runtimes
- **Package Configuration Cleanup**: Purge residual configurations from removed packages

### Additional Tools
- Remove unused WiFi drivers
- Kernel management and removal
- System manuals language cleanup
- Disk Usage Analyzer integration

### Scheduling
- No automatic cleanup
- Cleanup on reboot
- Scheduling: Daily, Weekly, Monthly

### Technical
- Framework: Qt6 (Core, Gui, Widgets)
- Build System: CMake 3.16+ with Ninja
- Compiler: GCC 14+ (primary) or Clang 14+
- License: GPL-3.0+
- Multi-language support (40+ languages)

### Security
- Privilege escalation with pkexec/gksu
- Safe file operations with confirmation
- Root user protection

### Performance
- Link-time optimization (LTO)
- Parallel build support
- Optimized for modern Linux systems

---

## Version Format

Format: `[MAJOR.MINOR.PATCH]`

- **MAJOR**: Breaking changes (not backward compatible)
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

## Change Categories

- **Added**: New features
- **Changed**: Changes to existing features
- **Deprecated**: Features that will be removed
- **Removed**: Removed features
- **Fixed**: Bug fixes
- **Security**: Security fixes
