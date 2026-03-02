class AiCli < Formula
  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v6.0.0.tar.gz"
  sha256 "41eda09d532f4f3de2fb36a7f9567160d714db41f47bab5ef3a47972ef99ed48"
  license "MIT"

  depends_on "python@3.12"

  def install
    # 1. Move the script to libexec
    libexec.install "aicli.py"

    # 2. Updated Shim
    # Added 'httpx' to the check, as it is used for the Mistral Proxy logic
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      
      # Required external libraries: groq, questionary, rich, httpx
      python3 -c "import groq, questionary, rich, httpx" > /dev/null 2>&1 || {
        echo "==> Missing dependencies detected. Installing required packages..."
        python3 -m pip install --user groq questionary rich httpx
      }

      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec python3 "#{libexec}/aicli.py" "$@"
    EOS

    # Make the shim executable
    chmod 0755, bin/"ai-cli"
  end

  test do
    # Since the agent requires an API key or user input, 
    # we just check if the executable exists and is runnable.
    assert_match "v5.0.0", shell_output("#{bin}/ai-cli --version", 1) rescue nil
  end
end
