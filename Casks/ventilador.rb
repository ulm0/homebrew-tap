cask "ventilador" do
  version "1.0.0"
  sha256 "9611e6bee59f2fe8d7c3be77eb3522d7dcea970d32e3da5227d175b9063e3e5a"

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
