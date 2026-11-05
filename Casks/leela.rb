cask "leela" do
  version "0.1.19"
  sha256 "045cf7c1c4a704f2b65e2ff5a5d06358756a70f927da6f57410a16f4e1f4dcfa"

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
