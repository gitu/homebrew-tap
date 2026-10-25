cask "nettle" do
  version "0.6.4"

  name "nettle"
  desc "Resilient SSH client with live port discovery and pinned tunnels"
  homepage "https://github.com/gitu/nettle"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_macos do
    arch arm: "aarch64", intel: "x64"

    sha256 arm:   "82d32bbc700a8f296abc3c8d2b5e59d38d7596021d623616916a74f57a48b984",
           intel: "5b269658ce897b04f7d4cb55fff8f23355a283d182384f6f33c2e05bb9a6981e"

    url "https://github.com/gitu/nettle/releases/download/v#{version}/nettle_#{version}_#{arch}.dmg"

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

  on_linux do
    depends_on arch: :x86_64

    sha256 "b37ca73132c5fde0165e4783c435c6968818d49a4689afd2dae25671284652ca"

    url "https://github.com/gitu/nettle/releases/download/v#{version}/nettle_#{version}_amd64.AppImage"

    binary "nettle_#{version}_amd64.AppImage", target: "nettle"

    zap trash: [
      "~/.local/share/dev.flo.nettle",
      "~/.cache/dev.flo.nettle",
    ]
  end
end
