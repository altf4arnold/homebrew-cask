cask "tailscale-app" do
  version "1.86.2"
  sha256 "f91999674765d5baff75162729cb4092847b482d21b9a44c2bdc47c5ac2162fc"

  url "https://pkgs.tailscale.com/stable/Tailscale-#{version}-macos.pkg"
  name "Tailscale"
  desc "Mesh VPN based on WireGuard"
  homepage "https://tailscale.com/"

  livecheck do
    url "https://pkgs.tailscale.com/stable/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  conflicts_with formula: "tailscale"
  depends_on macos: ">= :big_sur"

  pkg "Tailscale-#{version}-macos.pkg"
  # shim script (https://github.com/caskroom/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/tailscale.wrapper.sh"
  binary shimscript, target: "tailscale"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/Tailscale.app/Contents/MacOS/Tailscale' "$@"
    EOS
  end

  uninstall quit:       "io.tailscale.ipn.macsys",
            login_item: "Tailscale",
            pkgutil:    "com.tailscale.ipn.macsys"

  zap trash: [
    "/Library/Tailscale",
    "~/Library/Application Scripts/*.io.tailscale.ipn.macsys",
    "~/Library/Application Scripts/io.tailscale.ipn.macsys",
    "~/Library/Application Scripts/io.tailscale.ipn.macsys.login-item-helper",
    "~/Library/Application Scripts/io.tailscale.ipn.macsys.share-extension",
    "~/Library/Caches/io.tailscale.ipn.macsys",
    "~/Library/Containers/io.tailscale.ipn.macos.network-extension",
    "~/Library/Containers/io.tailscale.ipn.macsys",
    "~/Library/Containers/io.tailscale.ipn.macsys.login-item-helper",
    "~/Library/Containers/io.tailscale.ipn.macsys.share-extension",
    "~/Library/Containers/Tailscale",
    "~/Library/Group Containers/*.io.tailscale.ipn.macsys",
    "~/Library/HTTPStorages/io.tailscale.ipn.macsys",
    "~/Library/HTTPStorages/io.tailscale.ipn.macsys.binarycookies",
    "~/Library/Preferences/io.tailscale.ipn.macsys.plist",
  ]

  caveats do
    kext
    license "https://tailscale.com/terms"
  end
end
