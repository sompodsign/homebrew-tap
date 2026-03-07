cask "capaccino" do
  version "1.0.2"
  sha256 "db693e9d5286f613326a01f85015463b6cd8c92d8bcd995a1c15744322bc9d5f"

  url "https://storage.googleapis.com/capaccino/Capaccino.dmg"
  name "Capaccino"
  desc "Text expansion for macOS — type less, say more"
  homepage "https://capaccino.net"

  depends_on macos: ">= :ventura"

  app "Capaccino.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "#{appdir}/Capaccino.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.capaccino.app.plist",
    "~/Library/Application Support/Capaccino",
    "~/Library/Caches/Capaccino",
  ]
end
