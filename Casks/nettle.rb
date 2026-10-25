cask "nettle" do
  version "0.6.3"

  name "nettle"
  desc "Resilient SSH client with live port discovery and pinned tunnels"
  homepage "https://github.com/gitu/nettle"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_macos do
    arch arm: "aarch64", intel: "x64"

    sha256 arm:   "071775508869bd92ae6d9830053cbe6dfa724ccca8d4b8e4977ca9da95b466b5",
           intel: "cff9dfb090adf7f0fbc9d1415d2fac3509682fa6d39342f3f31fbdce6a120ad5"

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

    sha256 "862238226fa2fefc687f4aefa934f0767e21d3b4b4a37353ec1ee1489ff8f778"

    url "https://github.com/gitu/nettle/releases/download/v#{version}/nettle_#{version}_amd64.AppImage"

    binary "nettle_#{version}_amd64.AppImage", target: "nettle"

    zap trash: [
      "~/.local/share/dev.flo.nettle",
      "~/.cache/dev.flo.nettle",
    ]
  end
end
