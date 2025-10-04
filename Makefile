# Linux Cleaner Makefile
# Copyright (C) 2025 WHO-AM-I-404

PREFIX=/usr
BINDIR=$(PREFIX)/bin
ICONDIR=$(PREFIX)/share/icons/hicolor
APPDIR=$(PREFIX)/share/applications
DOCDIR=$(PREFIX)/share/doc/linux-cleaner
POLKITDIR=$(PREFIX)/share/polkit-1/actions

all:
	@echo "To build: ./build.sh"
	@echo "To install: sudo make install"
	@echo "To uninstall: sudo make uninstall"

install:
	@echo "Installing Linux Cleaner..."
	install -Dm755 linux-cleaner $(BINDIR)/linux-cleaner
	install -Dm644 images/linux-cleaner.png $(ICONDIR)/256x256/apps/linux-cleaner.png
	install -Dm644 images/logo.svg $(ICONDIR)/scalable/apps/linux-cleaner.svg
	install -Dm644 linux-cleaner.desktop $(APPDIR)/linux-cleaner.desktop
	install -Dm644 com.linux-cleaner.policy $(POLKITDIR)/com.linux-cleaner.policy
	install -Dm644 README.md $(DOCDIR)/README.md
	install -Dm644 CHANGELOG.md $(DOCDIR)/CHANGELOG.md || true
	install -Dm644 LICENSE $(DOCDIR)/LICENSE || true
	@echo "✓ Installed successfully!"

uninstall:
	@echo "Uninstalling Linux Cleaner..."
	rm -f $(BINDIR)/linux-cleaner
	rm -f $(ICONDIR)/256x256/apps/linux-cleaner.png
	rm -f $(ICONDIR)/scalable/apps/linux-cleaner.svg
	rm -f $(APPDIR)/linux-cleaner.desktop
	rm -f $(POLKITDIR)/com.linux-cleaner.policy
	rm -rf $(DOCDIR)
	@echo "✓ Uninstalled successfully!"

clean:
	rm -rf build
	@echo "Build directory cleaned."
