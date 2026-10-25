cask "nettle" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "0338b9d09af3f3ee84943b1a3163aa3ff4834c9c9e8e0488e0634f2be6e4ffac",
         intel: "4a86653fcb84feef36a63195c427e0383930c106fe603ed0acec02edfdb38426"

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
