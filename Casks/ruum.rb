cask "ruum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"

  on_arm do
    sha256 "d7a840d486dbf55dd9125bd2b1f12b4bf7f22c17eaaf3d81696f7e7eafddad67"
  end
  on_intel do
    sha256 "4d2debf54c841b20cc480625503f61e291debc42f766828dc99288472e4b7740"
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
