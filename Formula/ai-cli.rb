class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "a883e037aaa21cea316c6d46b2396d16df2144ec715261f21b99ea03032fd2ac"
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
