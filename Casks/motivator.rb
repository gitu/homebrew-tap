cask "motivator" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "889cb729c3598cb165da8a81198e9e72d6119d1a19a635ba83319572aeedec2d",
         intel: "26360572e11640596ff7a69fed41a6b465363f6ca180f48793b1bb86fd7dc2ee"

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
