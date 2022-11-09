class Oak < Formula
  desc "Expressive, simple, dynamic programming language"
  homepage "https://oaklang.org/"
  url "https://github.com/thesephist/oak/archive/v0.3.tar.gz"
  sha256 "05bc1c09da8f8d199d169e5a5c5ab2f2923bad6fac624f497f5ea365f378e38a"
  license "MIT"
  head "https://github.com/thesephist/oak.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "2c258ac6aacad5e27decb196cb329fc4cb8339950fa110ee1540712872a0ddc4"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "cbae1b116dcccc5199d3af3e8deb66246c39be3afb5156209b814f83a946599a"
    sha256 cellar: :any_skip_relocation, monterey:       "538fdce9778c8c182d6c369356f02c0d8cd0ba120168eaa204d9ea5d6e423fe6"
    sha256 cellar: :any_skip_relocation, big_sur:        "50e687e3532068bd0948b8760e0bdcf136a6f357600ab1abc5c2089f0d372436"
    sha256 cellar: :any_skip_relocation, catalina:       "c206c1cb5f34b507830290b8e273cf65d2c76f08ce5f014a17fd8653a63cce0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c902712d736c06e8f065b2046ad172b66c7ae075a2ccdd3c19c859616577fe50"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_equal "Hello, World!\n14\n", shell_output("oak eval \"std.println('Hello, World!')\"")
  end
end
