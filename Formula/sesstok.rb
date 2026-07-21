class Sesstok < Formula
  desc "Get an AWS STS session token with MFA and update ~/.aws/credentials"
  homepage "https://github.com/moznion/sesstok"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/moznion/sesstok/releases/download/v1.2.1/sesstok_1.2.1_darwin_arm64.tar.gz"
      sha256 "2bfaedd31236b7337201009037112e50d4e921d05e8ab9d3397659938ca6cf0e"
    end
    on_intel do
      url "https://github.com/moznion/sesstok/releases/download/v1.2.1/sesstok_1.2.1_darwin_amd64.tar.gz"
      sha256 "2d0043994d44ef13e4adb6ce53aeb1c587deae94e922da21918b18fa77adc925"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moznion/sesstok/releases/download/v1.2.1/sesstok_1.2.1_linux_arm64.tar.gz"
      sha256 "ce246bad746db432d06cdba9fed31d77fff1779ece3422028afae1e808a51ea6"
    end
    on_intel do
      url "https://github.com/moznion/sesstok/releases/download/v1.2.1/sesstok_1.2.1_linux_amd64.tar.gz"
      sha256 "1429769518917c135da2b2d2a79bd0dcfebe7285d428988b4eafa71aec7c2362"
    end
  end

  def install
    bin.install "sesstok"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sesstok --version")
  end
end
