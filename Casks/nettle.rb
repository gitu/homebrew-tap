cask "nettle" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "cdc7c2e4bcf9343b31ff19b185c4d21d991e5aeb6c8eed369a09e3c0bc0ade56",
         intel: "4b88b0fffdaeebc4fb2ea74ee0e6dac56d9a3ce47c21cc42afe012aeda738708"

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
    nettle releases are not code-signed yet. macOS will quarantine the app;
    either right-click -> Open on first launch, or install with:
      brew install --cask --no-quarantine gitu/tap/nettle
  EOS
end
