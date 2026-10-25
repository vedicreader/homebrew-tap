cask "sanketa" do
  version "0.2.2"
  sha256 "3f35ec076542765f2ea4fd501e3163954f137dd21bd35b133051c77fb044d423"

  url "https://github.com/vedicreader/sanketa/releases/download/v#{version}/Sanketa-#{version}.zip"
  name "Sanketa"
  desc "Floating panel that shows the keyboard shortcuts of the app in front"
  homepage "https://github.com/vedicreader/sanketa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Sanketa.app"

  uninstall quit: "dev.sanketa.Sanketa"

  zap trash: [
    "~/.config/sanketa",
    "~/Library/Application Support/Sanketa",
    "~/Library/Preferences/dev.sanketa.Sanketa.plist",
  ]
end
