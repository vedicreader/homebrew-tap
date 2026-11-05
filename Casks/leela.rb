cask "leela" do
  version "0.1.21"
  sha256 "d8541cbd69374ebcd97bf1a9431abe4aba8987b2707afedca2e086c6b5f6cef6"

  url "https://github.com/vedicreader/leela/releases/download/#{version}/Leela-macOS.zip"
  name "Leela"
  desc "Editor for notebooks and code files with a coding agent"
  homepage "https://github.com/vedicreader/leela"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma
  # lessons and new project environments install their packages with uv
  depends_on formula: "uv"

  app "Leela.app"

  uninstall quit: "org.vedicreader.leela"

  # the vault (~/.vishalakshi) belongs to all the vishalakshi tools, so zap keeps it
  zap trash: [
    "~/.config/leela",
    "~/.local/share/leela",
    "~/Library/Caches/org.vedicreader.leela",
    "~/Library/HTTPStorages/org.vedicreader.leela",
    "~/Library/Preferences/org.vedicreader.leela.plist",
    "~/Library/Saved Application State/org.vedicreader.leela.savedState",
    "~/Library/WebKit/org.vedicreader.leela",
  ]
end
