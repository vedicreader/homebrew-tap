cask "leela" do
  version "1.2.3"
  sha256 "b845be2da9829f20edd9718343f1de92cb01abbda5181d175b9ae34c0cbcea37"

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
