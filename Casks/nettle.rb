cask "nettle" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "04f1b8440f2a17c395521a2d1c7fbfbd8015fc4f8deb28e3be57f3e954efdec1",
         intel: "e4d2d6479897462a171eab279aed823523afbe76f905828d5aca1a008090c012"

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
