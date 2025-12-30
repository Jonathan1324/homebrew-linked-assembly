class Lct < Formula
  desc "LCT is a toolset."
  homepage "https://github.com/Jonathan1324/lct"
  license "BSD-3-Clause"
  version "0.1.0-alpha.5"

  url "https://github.com/Jonathan1324/lct/archive/heads/main.tar.gz"
  sha256 "fa4114c6035ea616ebe337060a7f0af3c4d8403321a0f4576276b87fed5541a2"

  depends_on "gcc" => :build
  depends_on "make" => :build
  depends_on "rust" => :build
  depends_on "python@3.12" => :build

  def install
    system "cargo", "install", "cargo-license"

    system "python3", "-m", "ci.ci", "--no-test"

    libexec.install Dir["dist/*"]

    bin.install Dir["#{libexec}/bin/*"]
  end

  test do
    Dir["#{prefix}/bin/*"].each do |exe|
      system exe, "--version"
    end
  end
end
