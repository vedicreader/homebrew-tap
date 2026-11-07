cask "sanketa" do
  version "0.2.7"
  sha256 "981e575c63bb6615ba35a1734fb6d0820a12ad462d807a89e4b612768263d237"

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
