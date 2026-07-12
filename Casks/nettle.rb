cask "nettle" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "19604b42d49bb9704406f47cfcaad615ad7e94d98703b66ca06470255a4c8fd0",
         intel: "4d7b6ee76471dd4bbc9a85e93e1915ca03bd587e7eedc64bf149dd707450e89d"

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
