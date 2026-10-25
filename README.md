# vedicreader/homebrew-tap

Homebrew casks for apps by vedicreader.

## Sanketa

Sanketa shows the keyboard shortcuts of the app in front in a small floating panel.

```sh
brew install --cask vedicreader/tap/sanketa
```

To get a new version:

```sh
brew upgrade --cask sanketa
```

Sanketa needs macOS 26 on Apple Silicon. Apple notarized the app. When you open it for the first time, allow Accessibility.

To remove the app and its settings, packs, tips and on-device models:

```sh
brew uninstall --zap --cask sanketa
```
