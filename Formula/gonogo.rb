# The Homebrew formula for gonogo. Lives in the tap ulm0/homebrew-tap as Formula/gonogo.rb; this copy is the template the
# release workflow (job `homebrew`) rewrites: it replaces only the `url` and `sha256` lines, so keep them one per line.
class Gonogo < Formula
  desc "Self-hosted mission control for AI coding agents"
  homepage "https://gonogo.ulm0.com/"
  url "https://registry.npmjs.org/@ulm0/gonogo/-/gonogo-0.7.0.tgz"
  sha256 "eebcdb341c732804af6575f3363d74cdda766c014ba397440ff42f5191caa000"
  license "MIT"

  # package.json needs node >= 24; Homebrew's `node` is that or newer. If a future node major breaks gonogo, pin node@24 here
  # and bump `revision`.
  depends_on "node"

  def install
    # std_npm_args installs into libexec in npm's global layout and ignores lifecycle scripts. The native part, node-pty,
    # comes as a prebuilt binary in an optional per-platform package, so nothing is compiled here.
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gonogo --version")
  end
end
