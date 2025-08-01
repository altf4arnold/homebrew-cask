cask "mirrordisplays" do
  version "1.2"
  sha256 "68b6b9a0bd79945d0e1239f308520a6cfd582fdde4dd061195de888b41643dd5"

  url "https://github.com/fcanas/mirror-displays/releases/download/v#{version}/MirrorDisplays.zip",
      verified: "github.com/fcanas/mirror-displays/"
  name "Mirror Displays"
  homepage "https://fabiancanas.com/open-source/mirror-displays"

  no_autobump! because: :requires_manual_review

  deprecate! date: "2024-07-27", because: :unmaintained
  disable! date: "2025-07-27", because: :unmaintained

  depends_on macos: ">= :high_sierra"

  app "MirrorDisplays.app"

  caveats do
    requires_rosetta
  end
end
