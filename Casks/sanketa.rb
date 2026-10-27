cask "sanketa" do
  version "0.2.4"
  sha256 "2977727b6e199a66ba8fb8d33b327d0de75c5c3bef320f69e0bd51f9bd86a8c0"

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
