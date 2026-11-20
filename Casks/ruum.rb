cask "ruum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.3"

  on_arm do
    sha256 "8578a020d2c466df3a90e48cf333af74463a77e87c3b6561a17e9489201e783f"
  end
  on_intel do
    sha256 "a94327833bf09857bcd9a43401c86104d1a779a4a54e3b1ea3fd5150ca02cf52"
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
