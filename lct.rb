class Lct < Formula
  desc "LCT is a toolset."
  homepage "https://github.com/Jonathan1324/lct"
  license "BSD-3-Clause"
  version "0.1.0-alpha.5-dec.2"

  url "https://github.com/Jonathan1324/lct/archive/refs/tags/v#{version}.tar.gz"
  sha256 "329071e2cf201b836f55ab64c55901f01c52e2977a91747f55157cad2e1168a2"

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
    Dir["#{bin}/*"].each do |exe|
      system exe, "--version"
    end
  end
end
