# Linux Clean Up

<div align="center">

![Linux Clean Up](images/linux-cleaner.png)

**Modern GUI Application for Linux System Cleanup & Maintenance**

[![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)](CHANGELOG.md)
[![License](https://img.shields.io/badge/license-GPL--3.0+-green.svg)](LICENSE)
[![Qt](https://img.shields.io/badge/Qt-6-brightgreen.svg)](https://www.qt.io/)
[![C++](https://img.shields.io/badge/C++-20-blue.svg)](https://isocpp.org/)

[Features](#-features) • [Installation](#-installation) • [Build](#-build-from-source) • [Usage](#-usage) • [Documentation](#-documentation)

</div>

---
<p align="center">
  <img src="images/logo.svg" width="120" alt="Linux Cleaner Logo">
</p>

---

## 📋 Description

**Linux Clean Up** is a modern GUI application built with Qt6 and C++20 to help you clean your Linux system easily and safely. This application provides various cleanup tools in one user-friendly interface.

### Why Linux Clean Up?

- 🎨 **Modern Interface**: Material Design with attractive blue colors
- 🚀 **Easy to Use**: No complex authentication, just run and use
- 🔒 **Safe**: Controlled and configurable cleanup operations
- 🌍 **Multi-Language**: Support for 40+ languages including Indonesian
- ⚡ **High Performance**: Built with C++20 and LTO optimization

---

## ✨ Features

### 🗑️ System Cleanup

| Feature | Description |
|---------|-------------|
| **APT Cache** | Remove package cache files (old/all) |
| **Trash** | Empty trash with age filtering |
| **System Logs** | Delete logs based on file age |
| **User Folders** | Clean cache & thumbnails |
| **Flatpak** | Remove unused runtimes |
| **Package Config** | Purge residual package configurations |

### 🛠️ Additional Tools

- ✂️ Remove unused WiFi drivers
- 🐧 Kernel management and removal
- 📚 System manuals language cleanup
- 📊 Integrated Disk Usage Analyzer

### ⏰ Automatic Scheduling

- ❌ No automatic cleanup
- 🔄 Cleanup on reboot
- 📅 Daily / Weekly / Monthly

---

## 🚀 Installation

### Method 1: Easy Install (Recommended)

```bash
# Build the application
./build.sh

# Install system-wide with icon
sudo ./install.sh
```

This will:
- ✅ Install executable to `/usr/bin/linux-cleaner`
- ✅ Install application icon from `images/` folder
- ✅ Create desktop entry (appears in application menu)
- ✅ Install documentation

### Method 2: From Debian Package

```bash
cd debs
sudo dpkg -i linux-cleaner_*.deb
sudo apt-get install -f  # Install dependencies if needed
```

### Method 3: Manual Install from Source

```bash
sudo cmake --install build
```

### Uninstall

To remove Linux Clean Up from your system:

```bash
sudo ./uninstall.sh
```

---

## 🔨 Build from Source

### Requirements

- **Qt6** (Core, Gui, Widgets, LinguistTools)
- **CMake** >= 3.16
- **Ninja** build system
- **GCC** >= 14 or **Clang** >= 14
- **OpenGL** libraries (libglvnd)

### Quick Build (Recommended)

```bash
./build.sh
```

This script will automatically:
- ✅ Configure CMake with Ninja
- ✅ Set OpenGL paths for compatibility
- ✅ Parallel compilation
- ✅ Generate `linux-cleaner` executable

Additional options:
```bash
./build.sh --clean    # Clean build
./build.sh --debug    # Debug build
./build.sh --debian   # Build Debian package
```

### Manual Build

#### 1. Clean Old Build (Optional)
```bash
rm -rf build
```

#### 2. Create Build Directory
```bash
mkdir build && cd build
```

#### 3. Configure with CMake
```bash
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
```

**Build Options:**
- `-DCMAKE_BUILD_TYPE=Release` → Production optimization
- `-DCMAKE_BUILD_TYPE=Debug` → Development build
- `-DUSE_CLANG=ON` → Use Clang compiler

#### 4. Compile
```bash
cmake --build . --parallel
```

#### 5. Install (Optional)
```bash
sudo cmake --install .
```

### Build Debian Package

```bash
./build.sh --debian
```

---

## 💻 Usage

### Running the Application

```bash
./linux-cleaner
```

Or after installation:

```bash
linux-cleaner
```

### Usage Tips

1. **Select Cleanup Operations**: Check boxes for desired operations
2. **Configure Parameters**: Set file age, selected user, etc.
3. **Set Scheduling**: Choose when automatic cleanup runs
4. **Click Apply**: Execute cleanup

> ⚠️ **Note**: Some operations require root privileges and will prompt for authentication automatically

---

## 📁 Project Structure

```
Linux-Cleaner/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── build.sh
├── install.sh
├── uninstall.sh
├── Makefile
├── com.linux-cleaner.policy
├── linux-cleaner.desktop
├── images/
│   ├── logo.svg
│   └── linux-cleaner.png
├── src/
│   ├── main.cpp
│   ├── mainwindow.cpp
│   ├── ...
│   └── CMakeLists.txt
└── translations/
    ├── *.ts
    └── *.qm
```

---

## 🌍 Language Support

Linux Clean Up supports **40+ languages**:

🇮🇩 Indonesian • 🇬🇧 English • 🇪🇸 Spanish • 🇫🇷 French • 🇩🇪 German • 🇮🇹 Italian • 🇵🇹 Portuguese • 🇨🇳 Chinese (Simplified/Traditional) • 🇯🇵 Japanese • 🇰🇷 Korean • 🇷🇺 Russian • 🇵🇱 Polish • 🇨🇿 Czech • And many more...

---

## 🐛 Troubleshooting

### Build Error: Qt6Gui not found

**Solution**: Ensure Qt6 and OpenGL libraries are installed

```bash
# Debian/Ubuntu
sudo apt install qt6-base-dev libgl-dev

# Arch Linux
sudo pacman -S qt6-base mesa
```

### Permission Denied

**Solution**: Ensure executable has correct permissions

```bash
chmod +x linux-cleaner
chmod +x build.sh
```

### Runtime Crash

**Solution**:
1. Rebuild: `./build.sh --clean`
2. Check dependencies: `ldd linux-cleaner`
3. Check logs: See terminal output

---

## 🤝 Contributing

Contributions are very welcome! To contribute:

1. Fork this repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

### Contribution Guidelines

- ✅ Follow existing coding style
- ✅ Ensure build succeeds
- ✅ Test functionality
- ✅ Update documentation if needed
- ✅ Write clear commit messages

---

## 📝 License

This program is free software licensed under **GNU General Public License v3.0 or later**.

```
Copyright (C) 2025 WHO-AM-I-404

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
```

See [LICENSE](LICENSE) file for complete details.

---

## 👨‍💻 Author

**WHO-AM-I-404**

- GitHub: [@WHO-AM-I-404](https://github.com/WHO-AM-I-404)
- Repository: [linux-cleaner](https://github.com/WHO-AM-I-404/linux-cleaner)

---

## 🔗 Links

- [Changelog](CHANGELOG.md) - Version history
- [Issues](https://github.com/WHO-AM-I-404/linux-cleaner/issues) - Report bugs or request features
- [Qt Documentation](https://doc.qt.io/qt-6/) - Qt6 documentation
- [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/) - CMake guide

---

## ⭐ Support

If you find this project useful, give it a ⭐ on GitHub!

---

<div align="center">

**Made with ❤️ using Qt6 and C++**

[⬆ Back to top](#linux-clean-up)

</div>
