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

## Abhyasa

Abhyasa is a tutor that asks you questions and makes you do the thinking. It keeps a map of what you know in your vault.

```sh
brew install --cask vedicreader/tap/abhyasa
```

To get a new version:

```sh
brew upgrade --cask abhyasa
```

Abhyasa needs macOS 26 on Apple Silicon. Apple notarized the app. The cask installs uv. On the first launch, uv gets Python and the abhyasa packages one time, so the first start takes a few minutes.

To remove the app, its settings and its Python environment:

```sh
brew uninstall --zap --cask abhyasa
```

The zap does not remove your vault (`~/.vishalakshi/vault.db`), because other tools use it too.
