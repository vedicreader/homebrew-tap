cask "sanketa" do
  version "0.2.5"
  sha256 "8529661610ad90aeebb2d655bf71fe65bab54ab92fcd6993f2c2a30adce615e5"

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
