cask "testfully" do
  version "1.175.0,444"
  sha256 "b974c16678dd03169c77eb76c4093e8bb6ec3cbf93a8873d41bab9bcfd0ecf65"

  url "https://releases.testfully.io/desktop/build-#{version.csv.second}/Testfully.app.zip"
  name "Testfully"
  desc "Platform for API testing and monitoring"
  homepage "https://docs.testfully.io/"

  livecheck do
    url "https://docs.testfully.io/docs/download/"
    regex(%r{build[._-](\d+)/Testfully(\.app)?\.zip}i)
    strategy :page_match do |page, regex|
      version = page.match(/latest\s*version\s*\((\d+(?:\.\d+)+)\)/i)
      next if version.blank?

      build = page.match(regex)
      next if build.blank?

      "#{version[1]},#{build[1]}"
    end
  end

  depends_on macos: ">= :high_sierra"

  app "Testfully.app"

  zap trash: [
    "~/Library/Application Support/io.testfully.app",
    "~/Library/Caches/io.testfully.app",
    "~/Library/Logs/io.testfully.app",
    "~/Library/WebKit/io.testfully.app",
  ]
end
