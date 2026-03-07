cask "smartclip" do
  version "0.4.3"
  sha256 "5175b9aac7e0171fd494abf26d8ebac3c026bdae557c116ecad1c7fcd79231bd"

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
