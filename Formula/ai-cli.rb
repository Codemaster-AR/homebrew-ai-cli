class AiCli < Formula
  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "41eda09d532f4f3de2fb36a7f9567160d714db41f47bab5ef3a47972ef99ed48"
  license "MIT"

  # Standard Python dependency
  depends_on "python@3.12"

  def install
    # 1. Move your script into the Homebrew cellar
    # IMPORTANT: Ensure "aicli.py" is the exact filename in your GitHub repo!
    libexec.install "aicli.py"

    # 2. Create the executable shim/wrapper
    # This wrapper checks for external libraries and installs them via pip if missing.
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      
      # Check for external dependencies (groq, questionary, rich)
      # Pathlib, os, sys, etc. are built-in and don't need checking.
      python3 -c "import groq, questionary, rich" > /dev/null 2>&1 || {
        echo "==> Missing dependencies detected. Installing groq, questionary, and rich..."
        python3 -m pip install --upgrade groq questionary rich
      }

      # Add the libexec folder to the Python Path so it can find your script
      export PYTHONPATH="#{libexec}:$PYTHONPATH"

      # Execute the script using the system's python3
      exec python3 "#{libexec}/aicli.py" "$@"
    EOS
  end

  test do
    # A simple test to ensure the shim was created successfully
    system "#{bin}/ai-cli", "--help"
  end
end
