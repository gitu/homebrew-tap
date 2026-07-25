cask "motivator" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "15a56fc28332b7cd253556fd5d218d54c4b90154a56fbf0cc93400799e926428",
         intel: "df40ae0e00703df25733cd46a6db4300c648a467bf40e9ee79644024f0a7fee2"

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
