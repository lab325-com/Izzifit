args=(
  --credentials "$SRCROOT/Scripts/Localization/client_secret.json" \
  --platform "ios" \
  --spreadsheet "1Ej5yiRy9us6xaNxr1za9bMVWIC9HuPo0AGxOdQeltd8" \
  --formats-tab "goloc_formats" \
  --tab "mobile_localizations" \
  --key-column "key" \
  --resources "$SRCROOT/izzifit/Resources/Localization" \
  --default-localization "en" \
  --default-localization-file-path "$SRCROOT/izzifit/Resources/Localization/en.lproj/Localizable.strings" \
  --empty-localization-match "(^$|^[xX]$)"
)
if [ "${CONFIGURATION}" = "Release" ]; then
    args+=(--stop-on-missing)
fi

"$SRCROOT/Scripts/Localization/darwin_amd64" "${args[@]}"
