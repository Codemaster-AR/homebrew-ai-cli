class AiCli < Formula
  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v8.0.0.tar.gz"
  sha256 "25095f7c4c38e45b2ea4c9417b5efd535a359f690c9d245be329be0a8e24832f"
  license "MIT"

  depends_on "python@3.12"

  def install
    # 1. Define paths
    venv_path = libexec/"venv"
    python_exe = Formula["python@3.12"].opt_bin/"python3.12"

    # 2. Create the virtual environment
    system python_exe, "-m", "venv", venv_path

    # 3. Install dependencies INTO the venv
    # Added 'h2' to support httpx(http2=True)
    system "#{venv_path}/bin/pip", "install", "--upgrade", "pip"
    system "#{venv_path}/bin/pip", "install", "groq", "questionary", "rich", "httpx", "requests", "h2"

    # 4. Install your script into libexec
    libexec.install "aicli.py"

    # 5. Create a shim in bin/
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{venv_path}/bin/python3" "#{libexec}/aicli.py" "$@"
    EOS

    chmod 0755, bin/"ai-cli"
  end

  test do
    assert_predicate bin/"ai-cli", :exist?
    assert_predicate bin/"ai-cli", :executable?
  end
end
