cask "ventilador" do
  version "1.0.1"
  sha256 "169fc62338505592d065fadd4295dc3a2c714c4a0f3d45fea274b876b3bf8ada"

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
