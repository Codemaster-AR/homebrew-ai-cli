class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "a883e037aaa21cea316c6d46b2396d16df2144ec715261f21b99ea03032fd2ac"
  license "MIT"

  depends_on "python@3.12"

  # These are the dependencies ai-cli needs to actually run
  resource "groq" do
    url "https://files.pythonhosted.org/packages/49/0e/439735a2988f0bc2105151663f72166e5792942470557e4e16d40763941a/groq-0.18.0.tar.gz"
    sha256 "7c05b8a6144e30472856f677f50a894a4577884489a87114660e10e6a88b584b"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/60/7b/09c313a40465548695f2694b29f041be5e985b99859265f80b2d4234f9a0/anyio-4.8.0.tar.gz"
    sha256 "b52d9213508127395015339239845330a103d3c7c49b6d929b31950e30402b1a"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/14/23/9c26f634354c00490b8f36f6e52295624734563a562132d7515be0b28669/distro-1.9.0.tar.gz"
    sha256 "2fa7aef3cbca2800212482c374341957f009ebf41fbbef8544e66c072551a141"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/f7/33/74528f80ee05f88463c270d13a96773516598bc8392f9812f864e43f5247/httpx-0.28.1.tar.gz"
    sha256 "892095f9e8027734a7486e9f2918da57a9080646c10015525925e510842245b7"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/7d/53/78887ed66191b70231904797825d5761c56550979e8a715f5d1e8609804e/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c395246ac79d31acdc61f7344e4c56df9fd"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/ai-cli", "--help"
  end
end
