class TidyViewer < Formula
  desc "CLI csv pretty printer"
  homepage "https://github.com/alexhallam/tv"
  url "https://github.com/alexhallam/tv/archive/refs/tags/1.5.2.tar.gz"
  sha256 "3f950c1d05cc7fd5806a49a3f10a9437290e2b24ddf8402ec04d54c63d1a60d5"
  license "Unlicense"

  livecheck do
    url "https://github.com/alexhallam/tv/releases?q=prerelease%3Afalse"
    regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+)(?:[._-]release)?["' >]}i)
    strategy :page_match
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "a19cf14db14c07f2ade52a99614d994acaac312c05c3143c60a6a5345f3a2896"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "42a42abecc4680536319b6bbbfba8ace4fd18d725e6a1c3bd1edc669a8877b64"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "8a17bbc8e7d2b76d5e4495ad8ee47176fb075a1353821a3be5a712c8213aff57"
    sha256 cellar: :any_skip_relocation, ventura:        "d3ba5ca8471a577a7c54ce300de86d77887e3ee366022588a58f5f89ef9d98c5"
    sha256 cellar: :any_skip_relocation, monterey:       "9e7ce7d415590691f06bad36b0d5270fb1bbad9ddfc046fc1f4f8c0473b0a593"
    sha256 cellar: :any_skip_relocation, big_sur:        "99d8e002b427e3a2a160faeda4e526115538431244faf52dd4bf041118347630"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b3058a55881b1a5874f31e848f613cee6f97f3891ff4091539323b4c189115fa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install_symlink "tidy-viewer" => "tv"
  end

  test do
    (testpath/"test.csv").write("first header,second header")
    assert_match "first header", shell_output("#{bin}/tv #{testpath}/test.csv")
  end
end
