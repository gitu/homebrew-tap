cask "specquill" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "7e1c374e2fdc63931e9e10f49e0e5eb61016788e0a7c822b870c40a211acc87b",
         intel: "7b4d2d84ff3b85ea3eea2d5ebd454e6d0ab757798fd5298e38c143d4049622e2"

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
