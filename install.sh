SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

print_modname() {
  ui_print "==================================================="
  ui_print "                        xh                         "
  ui_print "---------------------------------------------------"
  ui_print "            Friendly and fast tool for             "
  ui_print "               sending HTTP requests               "
  ui_print "---------------------------------------------------"
  ui_print " https://github.com/ducaale/xh                     "
  ui_print " https://github.com/Magisk-Modules-Alt-Repo/xhhttp "
  ui_print "==================================================="
}

on_install() {
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  
  [ -d "$MODPATH/system/bin/" ] || mkdir -p "$MODPATH/system/bin/"
  ln -sf xh "$MODPATH/system/bin/xhs"
}

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm  $MODPATH/system/bin/xh  0  0  0755

}
