cask "abhyasa" do
  version "0.0.24"
  sha256 "26771e7e48fa105f6bd529ce3c33e3ae107345f0adb5e7873f4cca36432854d8"

  url "https://github.com/vedicreader/abhyasa/releases/download/mac-v#{version}/Abhyasa-#{version}.zip"
  name "Abhyasa"
  desc "Tutor that asks questions and makes you do the thinking"
  homepage "https://github.com/vedicreader/abhyasa"

  livecheck do
    url :url
    regex(/^mac-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe
  # the app gets Python and the abhyasa packages with uv on its first launch
  depends_on formula: "uv"

  app "Abhyasa.app"

  uninstall quit: "dev.vedicreader.abhyasa"

  # the vault (~/.vishalakshi/vault.db) belongs to all the vishalakshi tools, so zap keeps it
  zap trash: [
    "~/Library/Application Support/abhyasa",
    "~/Library/Caches/abhyasa",
    "~/Library/Preferences/dev.vedicreader.abhyasa.plist",
    "~/Library/WebKit/dev.vedicreader.abhyasa",
  ]
end
