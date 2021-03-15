class Zfp < Formula
  desc "This is zfp needed by carta_backend"
  homepage "https://github.com/LLNL/zfp"
  url "https://github.com/LLNL/zfp/releases/download/0.5.5/zfp-0.5.5.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  depends_on "cmake" => :build

  def install
    args = ["-DBUILD_EXAMPLES=OFF", "-DZFP_WITH_OPENMP=OFF"]
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    assert_match "all tests passed", shell_output("make test")
  end
end
