# Updated automatically for each release. Manual edits are overwritten.
class Maritime < Formula
  desc "maritime"
  homepage "https://github.com/maritime-sh/cli-v2"
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v1.0.3/maritime-1.0.3-darwin-arm64.tar.gz"
      sha256 "a2fbe95713682cacd5e957a78d18013b0ccd23d8d62c9ab4f8e3e34b825ea7b5"
    end
    on_intel do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v1.0.3/maritime-1.0.3-darwin-x64.tar.gz"
      sha256 "1bd419916c752015ea61576601ef2cc6d868a63869fa3594f34f152ee30eb6b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v1.0.3/maritime-1.0.3-linux-arm64.tar.gz"
      sha256 "823aaa412b4cc9e28f3b3642c927e8890f55e8ec645cc9f4986415d2d455e7fb"
    end
    on_intel do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v1.0.3/maritime-1.0.3-linux-x64.tar.gz"
      sha256 "971e3b0bf46d1b1aaf79d15cee422f8d472823b3fe7d29c1022592e040644ea3"
    end
  end

  def install
    libexec.install "maritime"
    env = {}
    if File.exist?("okibi-auth")
      libexec.install "okibi-auth"
      env[:MARITIME_AUTH_HELPER] = libexec/"okibi-auth"
    end
    (bin/"maritime").write_env_script libexec/"maritime", env
    pkgshare.install "skills" if File.directory?("skills")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maritime --version")
  end
end
