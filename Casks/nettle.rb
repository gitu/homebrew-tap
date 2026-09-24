cask "nettle" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "7794d0835c8c8a19fa6d2980785cf643e7282cd614bfb4825e1f00f878137f7c",
         intel: "3db36f637dc67742ab12893f94de9c529df9ba9aff10546e1ebb821c3479c167"

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
