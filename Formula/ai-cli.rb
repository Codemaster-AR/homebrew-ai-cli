class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/Anay-Rustogi/ai-cli/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/ai-cli", "--version"
  end
end
