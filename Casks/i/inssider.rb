cask "inssider" do
  version "0.0.4.5"
  sha256 "aae290a9e1c35db4b923ff6cf64332b1825ab82a848761e10debdddf3e3f9cfa"

  url "https://metageek.link/inssider-5-mac-release-folder/inSSIDer-#{version}.dmg",
      verified: "metageek.link/inssider-5-mac-release-folder/"
  name "inSSIDer"
  desc "Defeat slow wifi"
  homepage "https://www.metageek.com/products/inssider/"

  no_autobump! because: :requires_manual_review

  deprecate! date: "2025-03-02", because: :unmaintained

  depends_on macos: ">= :sierra"

  app "inSSIDer.app"

  caveats do
    requires_rosetta
  end
end
