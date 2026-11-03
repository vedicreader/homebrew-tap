cask "abhyasa" do
  version "0.0.17"
  sha256 "d2c789f2e7f1015a10004e434b0c657fa6b1b9a9a15729ce833e28d73999e68e"

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
