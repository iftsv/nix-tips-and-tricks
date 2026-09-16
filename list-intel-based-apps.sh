for app in /Applications/*.app; do
  binary="$app/Contents/MacOS/$(defaults read "$app/Contents/Info" CFBundleExecutable 2>/dev/null)"
  if [[ -f "$binary" ]]; then
    arch=$(file "$binary")
    if [[ "$arch" == *"x86_64"* && "$arch" != *"arm64"* ]]; then
      echo "$app"
    fi
  fi
done
