# The Homebrew formula for gonogo. Lives in the tap ulm0/homebrew-tap as Formula/gonogo.rb; this copy is the template the
# release workflow (job `homebrew`) rewrites: it replaces only the `url` and `sha256` lines, so keep them one per line. The url is the
# `pnpm pack` tarball the same workflow attached to the GitHub Release (not the npm registry's, which can lag for minutes), and the
# sha256 is that file's. The values here are placeholders until the job writes the tap's copy.
class Gonogo < Formula
  desc "Self-hosted mission control for AI coding agents"
  homepage "https://gonogo.ulm0.com/"
  url "https://github.com/ulm0/gonogo/releases/download/v0.9.1/ulm0-gonogo-0.9.1.tgz"
  sha256 "da55cd723808ee857b135a62635752494ddb46eb4500ea9779e97f3b07235a0c"
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
