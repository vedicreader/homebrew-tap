cask "sanketa" do
  version "0.2.6"
  sha256 "0236861ee48bdf8db9ab17339a0b1d85fe835336890d14c4ed37679f2950b2b3"

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
