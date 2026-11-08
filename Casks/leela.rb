cask "leela" do
  version "0.1.27"
  sha256 "1de099ccdeef54d87fdb2a5b677fd39249e421ff2f64b487b61099a01b3ad2a2"

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

  # Finder reads the file types an app opens (Open With) from LaunchServices; register again so a new type shows at once
  postflight_steps do
    run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
        args: ["-f", "{{appdir}}/Leela.app"], must_succeed: false
  end

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
