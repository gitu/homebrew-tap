cask "motivator" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "8cf3ae1c04c9607ec2661b785b7a29d8de7c35974ed61228906aea4d5a8f4a53",
         intel: "7f278b027b3aea02c5c2ba849757c443bea30514281b3e022f9eedaf8c720afd"

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
