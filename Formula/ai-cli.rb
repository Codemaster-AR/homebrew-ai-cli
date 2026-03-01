class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "a883e037aaa21cea316c6d46b2396d16df2144ec715261f21b99ea03032fd2ac"
  license "MIT"

  depends_on "python@3.12"

  # --- DEPENDENCIES FOR GROQ ---
  resource "groq" do
    url "https://files.pythonhosted.org/packages/source/g/groq/groq-0.18.0.tar.gz"
    sha256 "7c05b8a6144e30472856f677f50a894a4577884489a87114660e10e6a88b584b"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/source/h/httpx/httpx-0.28.1.tar.gz"
    sha256 "892095f9e8027734a7486e9f2918da57a9080646c10015525925e510842245b7"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/source/a/anyio/anyio-4.8.0.tar.gz"
    sha256 "b52d9213508127395015339239845330a103d3c7c49b6d929b31950e30402b1a"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/source/d/distro/distro-1.9.0.tar.gz"
    sha256 "2fa7aef3cbca2800212482c374341957f009ebf41fbbef8544e66c072551a141"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic/pydantic-2.10.6.tar.gz"
    sha256 "745812920251786968600f7220ec4e2e25d259e87900b9918bc257c2a7f50a41"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic_core/pydantic_core-2.27.2.tar.gz"
    sha256 "229f379658e3782b589417f73907c10b4d455428612140c946654e5883a48e89"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/source/s/sniffio/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c395246ac79d31acdc61f7344e4c56df9fd"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c3e552553906f751c5e4407ccdec09edc7fd2444f4d23a6b1fd57317"
  end

  # --- DEPENDENCIES FOR RICH ---
  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.9.4.tar.gz"
    sha256 "43959c13a4f451ca13bc62419ec6e159670086c5f7e7f7b3b3e20ec689a19616"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/source/m/markdown-it-py/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f61f5f92060f7f1d6925a1caed6ca889db546c18f85101da3f66c624449a61"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/source/P/Pygments/pygments-2.19.1.tar.gz"
    sha256 "612cedae4ad0e70ca27076fdd3936f45610d061ca209e995166795f13ee1c74d"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/source/m/mdurl/mdurl-0.1.2.tar.gz"
    sha256 "bb41dc03085006ff963892790999557a22497f6c6ef40f81d596464871e4860b"
  end

  # --- DEPENDENCIES FOR QUESTIONARY ---
  resource "questionary" do
    url "https://files.pythonhosted.org/packages/source/q/questionary/questionary-2.1.0.tar.gz"
    sha256 "076d5258e8055a45e998e94a108c353902364c781600f13524ee5900599c9c38"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/source/p/prompt_toolkit/prompt_toolkit-3.0.50.tar.gz"
    sha256 "666cc63236e7924d6229c9968472909403d6f76c5966348f95c029177a4a229a"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.13.tar.gz"
    sha256 "72da3238585a5cf78da3ac639ca31370edfa43d655a5af8ee0d48507567796a1"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/ai-cli", "--help"
  end
end
