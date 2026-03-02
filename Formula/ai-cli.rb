class AiCli < Formula
  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "41eda09d532f4f3de2fb36a7f9567160d714db41f47bab5ef3a47972ef99ed48"
  license "MIT"

  # This ensures Homebrew installs Python 3.12
  depends_on "python@3.12"

  def install
    # Define the path to the Homebrew-installed python3.12
    python_exe = Formula["python@3.12"].opt_bin/"python3.12"

    # 1. Move the script to libexec
    libexec.install "aicli.py"

    # 2. Create the shim using the explicit Homebrew Python path
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      
      # Use the absolute path to the Homebrew Python version
      PYTHON_BIN="#{python_exe}"
      
      # Check for external dependencies
      $PYTHON_BIN -c "import groq, questionary, rich, httpx" > /dev/null 2>&1 || {
        echo "==> Missing dependencies detected. Installing groq, questionary, rich, and httpx..."
        $PYTHON_BIN -m pip install --upgrade groq questionary rich httpx
      }

      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec $PYTHON_BIN "#{libexec}/aicli.py" "$@"
    EOS

    chmod 0755, bin/"ai-cli"
  end

  test do
    # Verify the shim points to a valid python
    assert_predicate bin/"ai-cli", :exist?
  end
end
