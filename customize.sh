#!/system/bin/sh

# Magisk Module Template: customize.sh
# This script is executed during module installation

SKIPUNZIP=1

# Detect device architecture
ARCH=$(uname -m)

ui_print "- Detecting device architecture: $ARCH"

# Determine which binary to install
case "$ARCH" in
  aarch64|arm64)
    BINARY="xh_arm64"
    ui_print "- Installing ARM64 binary"
    ;;
  armv7l|armv8l|arm)
    BINARY="xh_arm"
    ui_print "- Installing ARMv7 binary"
    ;;
  x86_64)
    BINARY="xh_x64"
    ui_print "- Installing x86_64 binary"
    ;;
  i686|x86)
    BINARY="xh_x86"
    ui_print "- Installing x86 binary"
    ;;
  *)
    abort "! Unsupported architecture: $ARCH"
    ;;
esac

# Extract module files
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2

# Create system/bin directory
mkdir -p $MODPATH/system/bin

# Install the correct binary
ui_print "- Installing xh binary"
cp $MODPATH/binaries_all/$BINARY $MODPATH/system/bin/xh
chmod 755 $MODPATH/system/bin/xh

# Create xhs symlink for HTTPS by default
ui_print "- Creating xhs symlink for HTTPS"
cat > $MODPATH/system/bin/xhs << 'XHSEOF'
#!/system/bin/sh
exec /system/bin/xh --https "$@"
XHSEOF
chmod 755 $MODPATH/system/bin/xhs

# Clean up - remove all binaries to save space
ui_print "- Cleaning up unused binaries"
rm -rf $MODPATH/binaries_all

# Set proper permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755

ui_print "- Installation complete!"
ui_print "- Usage: xh [options] <url>"
ui_print "- HTTPS: xhs [options] <url>"
