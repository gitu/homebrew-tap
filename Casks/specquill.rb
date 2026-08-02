cask "specquill" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.1"
  sha256 arm:   "e59fa341e221fc8bc1d51ae006e7986125b71cbdfe485a22caa6ab1872dd3a9e",
         intel: "3f4bddcdb330a84fd92cd49dbafc57a29bfb75fb509c17b3207a6c78a170f8e8"

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
