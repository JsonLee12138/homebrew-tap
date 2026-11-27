cask "ruum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.5"

  on_arm do
    sha256 "1b6c88707bd6727c68599909276effda33ef40c785af53cf765b72c08bed1001"
  end
  on_intel do
    sha256 "b923d98a02941386242fa31e6ddd92cd2c6217d3628b2ff25e0ec7a27b34e3af"
  end

  url "https://github.com/JsonLee12138/Ruum/releases/download/v#{version}/ruum-#{version}-#{arch}-macos.dmg"
  name "ruum"
  desc "GPUI treemap explorer for disk usage"
  homepage "https://github.com/JsonLee12138/Ruum"

  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "ruum.app"
  binary "#{appdir}/ruum.app/Contents/MacOS/ruum"

  zap trash: [
    "~/Library/Application Support/ruum",
    "~/Library/Preferences/io.github.tobi.ruum.plist",
    "~/Library/Saved Application State/io.github.tobi.ruum.savedState",
  ]

  caveats <<~EOS
    ruum is not notarized with an Apple Developer ID in this release.
    If macOS blocks the app on first launch, remove the quarantine attribute:
      xattr -dr com.apple.quarantine "#{appdir}/ruum.app"
  EOS
end
