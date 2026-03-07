cask "smartclip" do
  version "0.4.2"
  sha256 "326450a0ac53722dd7d202e3dcdf4c4e1bdd0f477ecb55dfd005f97b5a5957f6"

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
