cask "specquill" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.0"
  sha256 arm:   "cbe4c5c935e9f3aa6eda59ce90448f4b75b9671a24f885ee9114c22ef23882e3",
         intel: "6b1ebfaff33f79fe67b6bfb5c9338f09b4c0de1adce7c0632c1a25717a79d4b1"

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
