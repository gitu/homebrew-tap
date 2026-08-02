cask "specquill" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "da0b8c8cf4862d1ee1d3da1019598c866d0278c180d387b300b19faee7dbc0e2",
         intel: "f6d771f31307f62a5560767af03db289c79e928741a6e063b992e9ed444f6ad8"

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
