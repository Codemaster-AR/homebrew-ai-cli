class AiCli < Formula
  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "d5f77057d1c83cd3cc7f7b5827f32f997e582a6cbecc386348c1089c399c6c2d"
  license "MIT"

  depends_on "python@3.12"

  def install
    # 1. Define paths
    # We put the venv in libexec so it's hidden from the user but kept by Homebrew
    venv_path = libexec/"venv"
    python_exe = Formula["python@3.12"].opt_bin/"python3.12"

    # 2. Create the virtual environment
    system python_exe, "-m", "venv", venv_path

    # 3. Install dependencies INTO the venv during the brew install process
    # This happens once, so the user doesn't wait when they run the command later
    system "#{venv_path}/bin/pip", "install", "--upgrade", "pip"
    system "#{venv_path}/bin/pip", "install", "groq", "questionary", "rich", "httpx", "requests"

    # 4. Install your script into libexec
    libexec.install "aicli.py"

    # 5. Create a shim in bin/ that points to the venv's python
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      # Use the python inside the venv to run the script
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{venv_path}/bin/python3" "#{libexec}/aicli.py" "$@"
    EOS

    chmod 0755, bin/"ai-cli"
  end

  test do
    # Simple check to see if the executable exists and runs
    assert_predicate bin/"ai-cli", :exist?
    assert_predicate bin/"ai-cli", :executable?
  end
end
