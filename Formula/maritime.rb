# Updated automatically for each release. Manual edits are overwritten.
class Maritime < Formula
  desc "Maritime command line client: provision, operate, and inspect AI agents on marit"
  homepage "https://maritime.sh/"
  version "2.2.2"

  on_macos do
    on_arm do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.2/maritime-2.2.2-darwin-arm64.tar.gz"
      sha256 "440efece537d2187ffc98472cb228f8238dc9d670c5d52bf28f366fd7107ff69"
    end
    on_intel do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.2/maritime-2.2.2-darwin-x64.tar.gz"
      sha256 "3d37a58eca2207d6e4223b2a5da473d72d18fbbd5bd6e9a6935dc7dfcdf6eee0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.2/maritime-2.2.2-linux-arm64.tar.gz"
      sha256 "f3d332108113f7eab80472416207e028a02a9f081d9e9e673a9fb8e65e4354b0"
    end
    on_intel do
      url "https://github.com/maritime-sh/homebrew-tap/releases/download/maritime-v2.2.2/maritime-2.2.2-linux-x64.tar.gz"
      sha256 "785a154dc36bf158302c7523e06a4d0e515d360c8a44b19680417a90f9db1384"
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
