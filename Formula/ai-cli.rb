class AiCli < Formula
  desc "A Terminal AI Agent running on Groq"
  homepage "https://github.com/Anay-Rustogi/ai-cli"
  url "https://github.com/codemaster-ar/ai-cli/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "a883e037aaa21cea316c6d46b2396d16df2144ec715261f21b99ea03032fd2ac"
  license "MIT"

  # We are NOT using virtualenv here to avoid the pip/sandbox errors
  def install
    # 1. Move your script to the cellars folder
    # IMPORTANT: Ensure "ai-cli.py" matches your filename in GitHub!
    libexec.install "ai-cli.py"

    # 2. Create a command in /opt/homebrew/bin/ai-cli
    # This runs your script using the system's python3
    (bin/"ai-cli").write <<~EOS
      #!/bin/bash
      exec python3 "#{libexec}/ai-cli.py" "$@"
    EOS
  end

  test do
    system "#{bin}/ai-cli", "--help"
  end
end
