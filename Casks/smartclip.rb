cask "smartclip" do
  version "0.5.1"
  sha256 "41d9e9814405c97641273f1c2d0c7e2fca0df282b25e521b18c67cfb0b592ccd"

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
