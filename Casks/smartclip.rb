cask "smartclip" do
  version "0.4.2"
  sha256 "72c75cf334b992a10009c71eddb2e10d1c9d835a61ce0206a98cf97818ebfc73"

  url "https://storage.googleapis.com/capaccino/SmartClip_#{version}_aarch64.dmg"
  name "SmartClip"
  desc "Clipboard manager for macOS — text, images, search, and pinning"
  homepage "https://smartclip.app"

  depends_on macos: ">= :monterey"

  app "SmartClip.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "#{appdir}/SmartClip.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.smartclip.desktop",
    "~/Library/Caches/com.smartclip.desktop",
  ]
end
