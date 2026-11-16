# JsonLee12138 Homebrew Tap

Official Homebrew Tap for macOS apps and developer tools maintained by [JsonLee12138](https://github.com/JsonLee12138).

## Available Casks

| Cask | Description | Upstream |
| --- | --- | --- |
| `ruum` | Fast cross-platform disk space analyzer & treemap explorer built in Rust with GPUI | [JsonLee12138/Ruum](https://github.com/JsonLee12138/Ruum) |

## Install

```sh
brew tap JsonLee12138/tap
brew install --cask ruum
```

Or install directly in one command:

```sh
brew install --cask JsonLee12138/tap/ruum
```

### Upgrade & Uninstall

```sh
brew upgrade --cask ruum
brew uninstall --cask ruum
```

### macOS Notes (Unsigned Builds & Permissions)

- If a release is not signed with an Apple Developer ID certificate, macOS Gatekeeper may quarantine the downloaded app. Clear the quarantine attribute once if needed:
  ```sh
  xattr -dr com.apple.quarantine /Applications/ruum.app
  ```
- Grant **Full Disk Access** in **System Settings > Privacy & Security** so `ruum` can measure protected folders (Mail, Messages, Safari, Trash).

## Automation

`Casks/ruum.rb` is automatically synced from [JsonLee12138/Ruum](https://github.com/JsonLee12138/Ruum/releases) via [`.github/workflows/sync.yml`](.github/workflows/sync.yml) (no cross-repo PAT required), and also supports instant updates from upstream releases when `HOMEBREW_TAP_TOKEN` is configured.
