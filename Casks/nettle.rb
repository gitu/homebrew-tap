cask "nettle" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "97b2e9672eebacf0ca8723498a0a6a8289bc89cb85246b604cba9e6aacb1c3ae",
         intel: "82aef31568c04df6a86aeee1ec7aeb5f267e4753239fef6132bc463b6e69c8b2"

  url "https://github.com/gitu/nettle/releases/download/v#{version}/nettle_#{version}_#{arch}.dmg"
  name "nettle"
  desc "Resilient SSH client with live port discovery and pinned tunnels"
  homepage "https://github.com/gitu/nettle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "nettle.app"

  zap trash: [
    "~/Library/Application Support/dev.flo.nettle",
    "~/Library/Caches/dev.flo.nettle",
    "~/Library/Preferences/dev.flo.nettle.plist",
    "~/Library/Saved Application State/dev.flo.nettle.savedState",
    "~/Library/WebKit/dev.flo.nettle",
  ]

  caveats <<~EOS
    nettle releases are not code-signed yet. On first launch either
    right-click -> Open, or clear the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/nettle.app
  EOS
end
