cask "ghostty@tip" do
  version "11478,1901cbf3340652ce04002586443ea635c713e5ce"
  sha256 "d74df640065014eef5d3013b193f0bbd8499bfd88d48d608b7eb58ac8bd7de03"

  url "https://tip.files.ghostty.org/#{version.csv.second}/Ghostty.dmg"
  name "Ghostty"
  desc "Terminal emulator that uses platform-native UI and GPU acceleration"
  homepage "https://ghostty.org/"

  livecheck do
    url "https://tip.files.ghostty.org/appcast.xml"
    regex(%r{/(\h+)/Ghostty\.dmg}i)
    strategy :sparkle do |item, regex|
      match = item.url&.match(regex)
      next if match.blank?

      "#{item.version},#{match[1]}"
    end
  end

  auto_updates true
  conflicts_with cask: "ghostty"
  depends_on macos: ">= :ventura"

  app "Ghostty.app"
  binary "#{appdir}/Ghostty.app/Contents/MacOS/ghostty"
  manpage "#{appdir}/Ghostty.app/Contents/Resources/man/man1/ghostty.1"
  manpage "#{appdir}/Ghostty.app/Contents/Resources/man/man5/ghostty.5"
  bash_completion "#{appdir}/Ghostty.app/Contents/Resources/bash-completion/completions/ghostty.bash"
  fish_completion "#{appdir}/Ghostty.app/Contents/Resources/fish/vendor_completions.d/ghostty.fish"
  zsh_completion "#{appdir}/Ghostty.app/Contents/Resources/zsh/site-functions/_ghostty"

  zap trash: [
    "~/.config/ghostty/",
    "~/Library/Application Support/com.mitchellh.ghostty",
    "~/Library/Caches/com.mitchellh.ghostty",
    "~/Library/HTTPStorages/com.mitchellh.ghostty",
    "~/Library/Preferences/com.mitchellh.ghostty.plist",
    "~/Library/Saved Application State/com.mitchellh.ghostty.savedState",
    "~/Library/WebKit/com.mitchellh.ghostty",
  ]
end
