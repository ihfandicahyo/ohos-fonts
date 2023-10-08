#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/88-ohos.sh
# During a LineageOS upgrade, this script backs up ohos,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/fonts.xml
fonts/HarmonyOS_Sans_Black.ttf
fonts/HarmonyOS_Sans_Black_Italic.ttf
fonts/HarmonyOS_Sans_Bold.ttf
fonts/HarmonyOS_Sans_Bold_Italic.ttf
fonts/HarmonyOS_Sans_Condensed_Black.ttf
fonts/HarmonyOS_Sans_Condensed_Black_Italic.ttf
fonts/HarmonyOS_Sans_Condensed_Bold.ttf
fonts/HarmonyOS_Sans_Condensed_Bold_Italic.ttf
fonts/HarmonyOS_Sans_Condensed_Light.ttf
fonts/HarmonyOS_Sans_Condensed_Light_Italic.ttf
fonts/HarmonyOS_Sans_Condensed_Medium.ttf
fonts/HarmonyOS_Sans_Condensed_Medium_Italic.ttf
fonts/HarmonyOS_Sans_Condensed_Regular.ttf
fonts/HarmonyOS_Sans_Condensed_Regular_Italic.ttf
fonts/HarmonyOS_Sans_Condensed_Thin.ttf
fonts/HarmonyOS_Sans_Condensed_Thin_Italic.ttf
fonts/HarmonyOS_Sans_Light.ttf
fonts/HarmonyOS_Sans_Light_Italic.ttf
fonts/HarmonyOS_Sans_Medium.ttf
fonts/HarmonyOS_Sans_Medium_Italic.ttf
fonts/HarmonyOS_Sans_Regular.ttf
fonts/HarmonyOS_Sans_Regular_Italic.ttf
fonts/HarmonyOS_Sans_Thin.ttf
fonts/HarmonyOS_Sans_Thin_Italic.ttf
fonts/RobotoFallback-VF.ttf
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
