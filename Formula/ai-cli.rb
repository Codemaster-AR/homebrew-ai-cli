class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "969ff25d97fac53160c398771d77d826233045e9aed1b64f5edff9643a471825"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Simple test to see if it runs
    # Note: might need to mock input if it starts interactive mode
    system "#{bin}/ai-cli", "--help"
  end
end
