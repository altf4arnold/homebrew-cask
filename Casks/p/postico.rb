cask "postico" do
  version "2.1.1,9692"
  sha256 "e9736618ea8ab811da637303dc776da1348ff8d827ccb2a030ebc572fb0a6571"

  url "https://downloads.eggerapps.at/postico/postico-#{version.csv.second}.dmg"
  name "Postico"
  desc "GUI client for PostgreSQL databases"
  homepage "https://eggerapps.at/postico#{version.major}/"

  livecheck do
    url "https://releases.eggerapps.at/postico#{version.major}/appcast.xml?update_channel=2"
    strategy :sparkle
  end

  auto_updates true
  conflicts_with cask: "postico@1"
  depends_on macos: ">= :catalina"

  app "Postico #{version.major}.app"

  zap trash: [
    "~/Library/Application Scripts/at.eggerapps.Postico",
    "~/Library/Caches/at.eggerapps.Postico",
    "~/Library/Containers/at.eggerapps.Postico",
    "~/Library/Preferences/at.eggerapps.Postico.plist",
    "~/Library/Saved Application State/at.eggerapps.Postico.savedState",
  ]
end
