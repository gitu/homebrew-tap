# gitu/homebrew-tap

Homebrew tap for [nettle](https://github.com/gitu/nettle),
[motivator](https://github.com/gitu/motivator) and friends.

```sh
brew install --cask gitu/tap/nettle
brew install --cask gitu/tap/motivator
```

nettle builds are not code-signed yet; on first launch either right-click ->
Open, or clear the quarantine flag:

```sh
xattr -dr com.apple.quarantine /Applications/nettle.app
```
