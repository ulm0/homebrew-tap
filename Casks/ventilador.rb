cask "ventilador" do
  version "1.1.0"
  sha256 "634bad230d0199041394e54bc8af7fe1a5e39e2305c36760fdb01754bcb3baa8"

  url "https://github.com/ulm0/ventilador/releases/download/v#{version}/Ventilador-#{version}.zip"
  name "Ventilador"
  desc "Fan control for Apple Silicon Macs"
  homepage "https://github.com/ulm0/ventilador"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Ventilador.app"

  # Stopping the helper returns any manually controlled fans to automatic before it exits.
  uninstall launchctl: "com.ulm0.ventilador.helper",
            quit:      "com.ulm0.ventilador"

  zap trash: [
    "~/Library/Application Support/Ventilador",
    "~/Library/Preferences/com.ulm0.ventilador.plist",
  ]
end
