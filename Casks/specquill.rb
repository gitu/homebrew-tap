cask "specquill" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.1"
  sha256 arm:   "c7eed2aa3bf8d652441e0b218dca6b3f1a4ee5fe0fda4e7e8cc4cc5526bb8b57",
         intel: "ba792ae4eed36463251ae1fb3cfbdc8731c0739f9fcf9c6c22c890e67a05613d"

  url "https://github.com/gitu/specquill/releases/download/v#{version}/specquill_v#{version}_darwin_#{arch}.tar.gz"
  name "specquill"
  desc "Git-native requirements engineering - markdown specs in your repo, served as an app"
  homepage "https://github.com/gitu/specquill"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  binary "specquill_v#{version}_darwin_#{arch}/specquill"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/specquill_v#{version}_darwin_#{arch}/specquill"],
                   must_succeed: false
  end

  caveats <<~EOS
    specquill releases are not code-signed yet; the quarantine flag is
    cleared automatically after install. Start the server with:
      specquill -config specquill.yml
  EOS
end
