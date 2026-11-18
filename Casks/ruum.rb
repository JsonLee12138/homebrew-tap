cask "ruum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"

  on_arm do
    sha256 "585546dbd172a99b7eae50ae412d09252261d2053ad2e6033ad78c2b7c7c0931"
  end
  on_intel do
    sha256 "a14fd8a7ff8f842f99006a3abbaed7cc8f27f8c6ad3425a46cc1cca17d7d56df"
  end

  url "https://github.com/JsonLee12138/Ruum/releases/download/v#{version}/ruum-#{version}-#{arch}-macos.dmg"
  name "ruum"
  desc "GPUI treemap explorer for disk usage"
  homepage "https://github.com/JsonLee12138/Ruum"

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
