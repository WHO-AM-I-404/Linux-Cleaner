# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - 2025-10-04

### 🎉 Major Release - Complete Rebranding & Enhancements

#### 🔄 Complete Rebranding
- ✅ **Complete rebrand to Linux Cleaner** - All legacy references removed
- ✅ Deleted legacy `translations-desktop-file/` folder with old branding
- ✅ Removed all legacy translation files (44 files)
- ✅ Updated all documentation and references to Linux Cleaner
- ✅ Fixed debian/changelog references

#### 🌍 Universal Debian Compatibility
- ✅ **Works on ALL Debian-based distributions** - No specific distro requirements
- ✅ APT package manager integration (universal for Debian family)
- ✅ Flatpak support (cross-distribution)
- ✅ Desktop file standards compliance (FreeDesktop.org)
- ✅ PolicyKit integration (pkexec) - works across all desktop environments
- ✅ Support for all major desktop environments

#### 📚 Complete Documentation Overhaul
- ✅ **Comprehensive README.md** with detailed user guides
- ✅ **Debug Guide** - How to troubleshoot errors, warnings, and issues
- ✅ **Complete Build Instructions** - Multiple methods for all skill levels
- ✅ **Installation Guide** - Step-by-step for all Debian distros
- ✅ **Uninstallation Guide** - Clean removal instructions
- ✅ **Usage Guide** - Detailed feature explanations
- ✅ **Make/Build/Install/Uninstall** - Complete workflow documentation

#### 🛠️ Technical Improvements
- ✅ Version bumped to 2.0.0 (major release)
- ✅ Cleaned legacy files and folders
- ✅ Updated build scripts to version 2.0.0
- ✅ Enhanced CMakeLists.txt configuration
- ✅ Comprehensive error handling documentation

#### 🐛 Debug & Troubleshooting
- ✅ Added detailed debugging guide in documentation
- ✅ LSP diagnostics support
- ✅ Build error troubleshooting
- ✅ Runtime error debugging
- ✅ Dependency verification methods
- ✅ Log file analysis guide

---

## [1.0.1] - 2025-10-04

### 🎉 Major Changes
- **Removed Authentication**: Application no longer requires authentication for easier usage
- **Modern GUI**: New design with Material Design blue theme (#2196F3)
- **Cleaner Interface**: License and Help buttons removed for simpler appearance

### ✨ New Features
- Embedded version in CMakeLists.txt (no external file dependencies)
- Easy build script for beginners (`build.sh`)
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
- All legacy references changed to "Linux Cleaner"
- Copyright updated to WHO-AM-I-404 in all files

---

## [1.0.0] - 2025-10-04

### 🚀 Initial Release
Initial release of Linux Cleaner

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
