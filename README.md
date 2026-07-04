# gitu/homebrew-tap

Homebrew tap for [nettle](https://github.com/gitu/nettle) and friends.

```sh
brew install --cask gitu/tap/nettle
```

nettle builds are not code-signed yet; on first launch either right-click ->
Open, or clear the quarantine flag:

```sh
xattr -dr com.apple.quarantine /Applications/nettle.app
```
