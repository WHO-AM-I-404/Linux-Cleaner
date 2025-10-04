# Linux Clean Up - Replit Setup

## 🔧 Replit Configuration

This project is configured to run in Replit environment with special setup for Qt6 and OpenGL.

### Build on Replit

#### Quick Build (Recommended)
```bash
./build.sh
```

#### Manual Build with Replit Environment
```bash
# Set OpenGL library path for NixOS
export CMAKE_PREFIX_PATH="/nix/store/7227amwg7k4sbl6mhglq17v5x5ki54ks-libglvnd-1.7.0:/nix/store/akn28bf4vh2q3p2czwkm37acmf33bvgd-libglvnd-1.7.0-dev:$CMAKE_PREFIX_PATH"

# Build
rm -rf build && mkdir build && cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --parallel
```

### Installed Dependencies

Replit environment already has:
- Qt6 Full package
- CMake 3.31+
- Ninja build system
- GCC 14.2+
- OpenGL libraries (libglvnd)
- Mesa
- Dpkg tools

### Running the Application

```bash
# In Replit terminal
./linux-cleaner
```

**Note**: This is a GUI desktop application. On Replit, you need X11 forwarding or VNC to display the GUI.

### Replit Troubleshooting

#### OpenGL Build Error
If you get OpenGL-related errors during build:
```bash
# Use build.sh which includes path fixes
./build.sh --clean
```

#### Permission Issues
```bash
chmod +x build.sh
chmod +x linux-cleaner
```

### Complete Documentation

See [README.md](README.md) for complete project documentation.

---

**Version**: 1.0.1  
**Environment**: Replit NixOS
