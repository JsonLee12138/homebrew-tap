cask "ruum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.4"

  on_arm do
    sha256 "2bfaf25c436d3730b73b516c054265c7aa199fab6cfc00a1ed08e1a8cedb28b4"
  end
  on_intel do
    sha256 "745ea20fb02a6b8f13049af42ac556c4b356e8b596d5980b24560caf40a0bb5e"
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
