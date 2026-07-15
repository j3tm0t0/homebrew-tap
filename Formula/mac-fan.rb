class MacFan < Formula
  desc "CLI fan controller for macOS (talks straight to AppleSMC)"
  homepage "https://github.com/j3tm0t0/mac-fan-cli"
  url "https://github.com/j3tm0t0/mac-fan-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1c8ef28b249f03378bed0f0ac95cb92c080f7206295bc03d5e0b12749dc88851"
  license "MIT"
  head "https://github.com/j3tm0t0/mac-fan-cli.git", branch: "main"

  depends_on :macos
  # Builds with plain `swiftc` from the Xcode Command Line Tools —
  # a full Xcode.app install is not required. `xcode-select --install`
  # is enough. Homebrew ensures CLT is present as a base requirement.

  def install
    system "make", "build"
    bin.install "build/mac-fan"
  end

  test do
    # `info` is read-only; safe to run in the sandbox.
    # It exits 0 even inside a VM without a real SMC (falls through the
    # error path), so just assert the binary runs and prints usage.
    assert_match "mac-fan", shell_output("#{bin}/mac-fan --help")
  end
end
