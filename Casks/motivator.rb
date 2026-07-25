cask "motivator" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "54cf8666776d2aea4ed5b21fb4825035b4617d08521ff83e2d9a0f25911ec456",
         intel: "b9658e4da54161e78bda9521660dfb595410925fdb3ffc8743651fc91dcec13f"

  url "https://github.com/gitu/motivator/releases/download/v#{version}/motivator-#{arch}-macos.tar.gz"
  name "motivator"
  desc "Friend in the corner of your desktop - a talking photo-avatar widget"
  homepage "https://github.com/gitu/motivator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  binary "motivator"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/motivator"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/motivator",
  ]

  caveats <<~EOS
    motivator releases are not code-signed yet; the quarantine flag is
    cleared automatically after install. Run it from a terminal with:
      motivator
  EOS
end
