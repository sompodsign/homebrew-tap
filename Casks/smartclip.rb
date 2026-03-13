cask "smartclip" do
  version "0.4.3"
  sha256 "62f2737eb2208ad0dd1b72e15c9ed1a206d46fa5982d30384bd3f025a94bf18f"

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
