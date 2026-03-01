class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "c9e204c416f21529fd147072119fba10fb3fd6f76e9f5e7d5d41e0ee1587b8cf"
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
