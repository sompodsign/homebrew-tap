cask "capaccino" do
  version :latest
  sha256 :no_check

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
