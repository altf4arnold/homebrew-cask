cask "mountain" do
  version "1.6.6"
  sha256 :no_check

  url "https://appgineers.de/mountain/files/Mountain.zip"
  name "Mountain"
  desc "Display notifications when mounting/unmounting volumes"
  homepage "https://appgineers.de/mountain/"

  no_autobump! because: :requires_manual_review

  deprecate! date: "2025-03-31", because: :unmaintained

  app "Mountain.app"

  zap trash: [
    "/Library/LaunchDaemons/de.appgineers.Mountain.Helper.plist",
    "/Library/PrivilegedHelperTools/de.appgineers.Mountain.Helper",
    "~/Library/Application Support/Mountain",
    "~/Library/Preferences/de.appgineers.Mountain.plist",
  ]

  caveats do
    requires_rosetta
  end
end
