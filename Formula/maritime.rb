# Updated automatically for each release. Manual edits are overwritten.
class Maritime < Formula
  desc "Maritime command line client: provision, operate, and inspect AI agents on marit"
  homepage "https://maritime.sh/"
  version "2.2.3"

  on_macos do
    on_arm do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.3/maritime-2.2.3-darwin-arm64.tar.gz"
      sha256 "a32e4af05f91b4d223670cfac9b8549ca613c82f4782cbc5d49bfb9759dd8801"
    end
    on_intel do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.3/maritime-2.2.3-darwin-x64.tar.gz"
      sha256 "92533bda8eafb83ad7f07245c714f273318913dcab1856a30bebf49b26f6f13c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.3/maritime-2.2.3-linux-arm64.tar.gz"
      sha256 "cac73d9d354d39e94fafb3ad7d45fcd1bc4a5c0d93cc29ac6186b0d87e5ae7f6"
    end
    on_intel do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.3/maritime-2.2.3-linux-x64.tar.gz"
      sha256 "d6da170b3e5cb8a44d5ea9525dd7a024b2a7d386c0e6cd64eea1b73a648207ce"
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
