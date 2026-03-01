class AiCli < Formula
  include Language::Python::Virtualenv

  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "a883e037aaa21cea316c6d46b2396d16df2144ec715261f21b99ea03032fd2ac"
  license "MIT"

  depends_on "python@3.12"

  # We use a single 'all-in-one' resource approach to simplify the install
  def install
    # 1. Create a virtualenv in the private libexec folder
    venv = virtualenv_create(libexec, "python3.12")
    
    # 2. Manually install the big 3 dependencies into that venv
    # This bypasses the need for individual resource blocks
    system libexec/"bin/pip", "install", "groq", "questionary", "rich"

    # 3. Install your script
    # Assuming your main file in the zip is named 'aicli.py' or 'main.py'
    # Change 'aicli.py' below if your file is named something else!
    libexec.install "aicli.py" 

    # 4. Create the 'ai-cli' executable that points to the venv
    (bin/"ai-cli").write_env_script libexec/"bin/python", "PYTHONPATH" => libexec,
      :args => [libexec/"aicli.py", "$@"]
  end

  test do
    system "#{bin}/ai-cli", "--help"
  end
end
