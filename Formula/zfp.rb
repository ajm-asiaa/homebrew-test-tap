class Zfp < Formula
  desc "This is zfp used by carta_backend"
  homepage "https://github.com/LLNL/zfp"
  url "https://github.com/LLNL/zfp/releases/download/0.5.5/zfp-0.5.5.tar.gz"
  sha256 "fdf7b948bab1f4e5dccfe2c2048fd98c24e417ad8fb8a51ed3463d04147393c5"
  license "MIT"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-DBUILD_EXAMPLES=OFF",
                            "-DZFP_WITH_OPENMP=OFF", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    assert_match "all tests passed", shell_output("make test")
  end
end
