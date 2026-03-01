def install
    # 1. Install the script
    libexec.install "aicli.py"

    # 2. Create the shim but add a 'check and install' step
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      # Check if dependencies exist, if not, try to install them for the user
      python3 -c "import groq, questionary, rich" > /dev/null 2>&1 || {
        echo "Installing missing dependencies..."
        python3 -m pip install groq questionary rich
      }
      exec python3 "#{libexec}/aicli.py" "$@"
    EOS
  end
