cask "motivator" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "56a76ef160a074bd81c9e0ff1d2e8d3d61f0ab8b9d5de445943106537ac05be8",
         intel: "6c60d3b01731d7c4a61d3ca82bc472552ae8d1b7b36bbb5d6e1f7a85ae3ef6d4"

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
